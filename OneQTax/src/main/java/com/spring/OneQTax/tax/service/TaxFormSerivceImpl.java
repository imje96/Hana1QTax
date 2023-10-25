package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.*;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaxFormSerivceImpl implements TaxFormService {

    private final TaxMapper taxMapper;

    @Autowired
    public TaxFormSerivceImpl(TaxMapper taxMapper) {
        this.taxMapper = taxMapper;
    }


    @Override
    public TotalInfoVO calculateForm(TotalInfoVO totalInfo, TaxFormVO taxForm, CardTaxResultVO cardResult) {

        int totalIncome = totalInfo.getTotal_income2();

        if (taxForm != null) {
            if (taxForm.getTotalIncome() != 0) {
                totalIncome = taxForm.getTotalIncome();
            }

            totalInfo.setTotal_income2(totalIncome);

            // 근로소득공제 계산해서 넣기
            totalInfo.setIncome_deduction(calculateIncomeDeduction(taxForm, totalInfo));

            // 근로소득금액
            totalInfo.setIncome_final(totalIncome - calculateIncomeDeduction(taxForm, totalInfo));

            // 인적공제 계산하기
            int personalDeduction = calculatePersonalDeduction(taxForm, totalInfo);

            // 추가공제항목
            totalInfo.setPersonal_deduction(personalDeduction);
            totalInfo.setChildren_amount(calculateChildTaxCredit(taxForm));
            totalInfo.setPension_deduction(calculatePensionDeduction(taxForm, totalInfo));
        } else {
            totalInfo.setTotal_income2(totalIncome);
        }


        // 카드 금액
        totalInfo.setCard_deduction((int) cardResult.getTotal_deduction());
        totalInfo.setCredit_deduction((int) cardResult.getCredit_deduction());
        totalInfo.setDebit_deduction((int) cardResult.getDebit_deduction());
        totalInfo.setCash_deduction((int) cardResult.getCash_deduction());
        totalInfo.setBasic_deduction((int) cardResult.getBasic_deduction());
        totalInfo.setAdditional_deduction((int) cardResult.getAdditional_deduction());

        // calculationId 저장
        totalInfo.setCalculation_id(cardResult.getCalculation_id());
        return totalInfo;
    }

    // 첫번째 계산 정보 저장
    @Override
    public void saveForm(TotalInfoVO totalInfo) {
        taxMapper.insertTotalInfo(totalInfo);
    }

    // 업데이트하고 db에 저장하기
    @Override
    public TotalInfoVO updateForm(TotalInfoVO totalInfo, BigDTO bigDTO, CardTaxResultVO cardResult) {
        // 초기 계산 실행
        TaxFormVO taxForm = bigDTO.getTaxFormVO();
        FPensionVO pensionVO = bigDTO.getPensionVO();
        FHousingVO housingVO = bigDTO.getHousingVO();
        FGuaranteeVO guaranteeVO = bigDTO.getGuaranteeVO();
        FMedicalVO medicalVO = bigDTO.getMedicalVO();
        FEduVO eduVO = bigDTO.getEduVO();
        FDonationVO donationVO = bigDTO.getDonationVO();
        FRentVO rentVO = bigDTO.getRentVO();
        PreTaxVO preTaxVO = bigDTO.getPreTaxVO();

        totalInfo = calculateForm(totalInfo, taxForm, cardResult);
        System.out.println("calculateForm 실행:" + totalInfo);

        // detail 항목 계산 실행
        totalInfo = calculateDetailDeduction(taxForm, pensionVO, housingVO, guaranteeVO, medicalVO, eduVO, donationVO, rentVO, preTaxVO, totalInfo);
        System.out.println("calculateDetailDeduction 실행: " + totalInfo);
        taxMapper.updateTotalInfo(totalInfo);
        return totalInfo;
    }


    // 계산정보 조회하기
    @Override
    public TotalInfoVO getTotalInfoByCalcId(int calculationId) {
        TotalInfoVO totalInfo = new TotalInfoVO();
        totalInfo = taxMapper.getTotalInfoByCalcId(calculationId);
        return totalInfo;
    }

    // 전체 결과 memberId로 조회
    @Override
    public TotalTaxResultVO getTotalResultByTotalMemberId(int memberId) {
        TotalTaxResultVO totalResult = new TotalTaxResultVO();
        totalResult = taxMapper.getTotalResultByTotalMemberId(memberId);
        return totalResult;
    }


    // 인적소득공제 계산하기
    private int calculatePersonalDeduction(TaxFormVO taxForm, TotalInfoVO totalInfo) {
        int totalDeduction = 0;

        int basic = 1500000;
        totalInfo.setTaxpayer_deduction(basic);
        totalDeduction += basic;

        int spouseDeduction = "yes".equalsIgnoreCase(taxForm.getSpouseDeduction()) ? 1500000 : 0;
        if (spouseDeduction != 0) {
            totalInfo.setSpouse_deduction(spouseDeduction);
            totalDeduction += spouseDeduction;
        }

        if (taxForm.getChild() != 0) {
            int childDeduction = taxForm.getChild() * 1500000;
            totalInfo.setChildren_deduction(childDeduction);
            totalDeduction += childDeduction;
        }

        if (taxForm.getAdoptedChild() != 0) {
            int adoptedDeduction = taxForm.getAdoptedChild() * 1500000;
            totalInfo.setAdopted_deduction(adoptedDeduction);
            totalDeduction += adoptedDeduction;
        }

        if (taxForm.getSiblings() != 0) {
            int siblingsDeduction = taxForm.getSiblings() * 1500000;
            totalInfo.setSiblings_deduction(siblingsDeduction);
            totalDeduction += siblingsDeduction;
        }

        if (taxForm.getDirectAncestor() != 0) {
            int directAncestorDeduction = taxForm.getDirectAncestor() * 1500000;
            totalInfo.setDirectAnc_deduction(directAncestorDeduction);
            totalDeduction += directAncestorDeduction;
        }

        if (taxForm.getSenior() != 0) {
            int seniorDeduction = taxForm.getSenior() * 1000000;
            totalInfo.setSenior_deduction(seniorDeduction);
            totalDeduction += seniorDeduction;
        }

        if (taxForm.getSenior() != 0) {
            int disabilityDeduction = taxForm.getDisability() * 2000000;
            totalInfo.setDisability_deduction(disabilityDeduction);
            totalDeduction += disabilityDeduction;
        }

        int womanDeduction = "yes".equalsIgnoreCase(taxForm.getWomanDeduction()) ? 1000000 : 0;
        if (womanDeduction != 0) {
            totalInfo.setWoman_deduction(womanDeduction);
            totalDeduction += womanDeduction;
        }
        int singleParentDeduction = "yes".equalsIgnoreCase(taxForm.getSingleParent()) ? 1000000 : 0;
        if (singleParentDeduction != 0) {
            totalInfo.setSingleParent_deduction(singleParentDeduction);
            totalDeduction += singleParentDeduction;
        }
        return totalDeduction;
    }

    // 자녀관련 세액공제 계산하기
    private int calculateChildTaxCredit(TaxFormVO taxForm) {
        int childrenTaxCredit = 0;
        int child = taxForm.getChild() - taxForm.getAdoptedChild(); // form 객체에서 child 값을 가져옴
        int adoptedChild = taxForm.getAdoptedChild();
        if (taxForm.getAdoptedChild() != 0) {
            // 입양자녀 세액공제
            switch (adoptedChild) {
                case 0:
                    childrenTaxCredit += 0;
                    break;
                case 1:
                    childrenTaxCredit += 300000;
                    break;
                case 2:
                    childrenTaxCredit += 500000;
                    break;
                default:
                    childrenTaxCredit += 800000 + (adoptedChild - 2) * 700000;
                    break;
            }
        }
        if (taxForm.getChild() != 0) {
            // 20세 미만 자녀 세액공제
            switch (child) {
                case 1:
                    childrenTaxCredit += 150000;
                    break;
                case 2:
                    childrenTaxCredit += 300000;
                    break;
                case 3:
                    childrenTaxCredit += 600000;
                    break;
                case 4:
                    childrenTaxCredit += 900000;
                    break;
                case 5:
                    childrenTaxCredit += 1200000;
                    break;
                case 6:
                    childrenTaxCredit += 1500000;
                    break;
            }
        }
        // 입양자녀 + 20세미만 자녀
        return (int) Math.floor(childrenTaxCredit);
    }

    // 근로소득공제 계산하기
    private int calculateIncomeDeduction(TaxFormVO taxForm, TotalInfoVO totalInfo) {
        int income_deduction = 0;
        int totalIncome;
        if (taxForm != null && taxForm.getTotalIncome() != 0) {
            totalIncome = taxForm.getTotalIncome();
        } else {
            totalIncome = totalInfo.getTotal_income2();
        }


        if (totalIncome <= 5000000) {
            income_deduction = (int) Math.floor(totalIncome * 0.7);
        } else if (totalIncome <= 15000000) {
            income_deduction = (int) Math.floor((totalIncome - 5000000) * 0.4 + 3500000);
        } else if (totalIncome <= 45000000) {
            income_deduction = (int) Math.floor((totalIncome - 15000000) * 0.15 + 7500000);
        } else if (totalIncome <= 100000000) {
            income_deduction = (int) Math.floor((totalIncome - 45000000) * 0.05 + 12000000);
        } else {
            income_deduction = (int) Math.floor((totalIncome - 100000000) * 0.02 + 14750000);
        }
        return income_deduction;
    }

    // 연금보험료 소득공제
    private int calculatePensionDeduction(TaxFormVO taxForm, TotalInfoVO totalInfo) {
        int totalIncome;
        if (taxForm != null && taxForm.getTotalIncome() != 0) {
            totalIncome = taxForm.getTotalIncome();
        } else {
            totalIncome = totalInfo.getTotal_income2();
        }

        final double HEALTH_INSURANCE_RATE = 0.04;
        final double EMPLOYMENT_INSURANCE_RATE = 0.009;
        final double NATIONAL_PENSION_RATE = 0.045;

//        if (taxForm.getTotalIncome() != 0) {
        int health_insurance = (int) Math.floor(totalIncome * HEALTH_INSURANCE_RATE);
        totalInfo.setHealth_insurance(health_insurance);
        totalInfo.setHealth_insurance(health_insurance);
        int employment_insurance = (int) Math.floor(totalIncome * EMPLOYMENT_INSURANCE_RATE);
        totalInfo.setEmployment_insurance(employment_insurance);
        int national_pension = (int) Math.floor(totalIncome * NATIONAL_PENSION_RATE);
        totalInfo.setNational_pension(national_pension);
//            int other_pension = taxForm.getOther_pension();
//            totalInfo.setOther_pension(other_pension);
        return health_insurance + employment_insurance + national_pension;

    }

    // detail 옵션항목 추가(update용)
    private TotalInfoVO calculateDetailDeduction(TaxFormVO taxForm, FPensionVO pensionVO, FHousingVO housingVO,
                                                 FGuaranteeVO guaranteeVO, FMedicalVO medicalVO,
                                                 FEduVO eduVO, FDonationVO donationVO, FRentVO rentVO, PreTaxVO preTaxVO,
                                                 TotalInfoVO totalInfo) {
        // 기납부세액 저장
        if (preTaxVO != null) {
            int prepayment_tax = preTaxVO.getPrepayment_tax();
            totalInfo.setPrepayment_tax(prepayment_tax);
        }
        /* 주택 관련 총납입액 */
        if (housingVO != null) {
            totalInfo.setHousing_loan(housingVO.getHousing_loan());
            totalInfo.setHousing_account1(housingVO.getHousing_account1());
            totalInfo.setHousing_account2(housingVO.getHousing_account2());
            int CalcHousingTotal = housingVO.getHousing_loan() + housingVO.getHousing_account1() + housingVO.getHousing_account2();
            totalInfo.setHousing_total(CalcHousingTotal);
        }
        /* 여기서부터 세액공제 납입액 */

        /* 연금관련 총납입액 */
        if (pensionVO != null) {
            totalInfo.setPension_amount(pensionVO.getPension_amount());
            totalInfo.setIrp_amount(pensionVO.getIrp_amount());
            int calcIrpPension = pensionVO.getPension_amount() + pensionVO.getIrp_amount();
            totalInfo.setIrpPension_total(calcIrpPension);
        }

        /* 보장성보험 총납입액 */
        if (guaranteeVO != null) {
            totalInfo.setBasic_guarantee(guaranteeVO.getBasic_guarantee());
            totalInfo.setDisabled_guarantee(guaranteeVO.getDisabled_guarantee());
            int calcGuaranteeTotal = guaranteeVO.getBasic_guarantee() + guaranteeVO.getDisabled_guarantee();
            totalInfo.setGuarantee_total(calcGuaranteeTotal);
        }

        /* 의료비 총납입액 */
        if (medicalVO != null) {
            totalInfo.setMedical_expense(medicalVO.getMedical_expense());
            totalInfo.setMedical_expense2(medicalVO.getMedical_expense2());
            totalInfo.setMedical_expense3(medicalVO.getMedical_expense3());
            totalInfo.setFamily_medical(medicalVO.getFamily_medical());
            int calcMediTotal = medicalVO.getMedical_expense() + medicalVO.getMedical_expense2() + medicalVO.getMedical_expense3()
                    + medicalVO.getFamily_medical();
            totalInfo.setMedical_total(calcMediTotal);
        }

        /* 교육비 총납입액 */
        if (eduVO != null) {
            totalInfo.setEdu_expense(eduVO.getEdu_expense());
            totalInfo.setChildren_edu(eduVO.getChildren_edu());
            totalInfo.setUniv_edu(eduVO.getUniv_edu());
            totalInfo.setUniform_expense(eduVO.getUniform_expense());
            int calcEduTotal = eduVO.getEdu_expense() + eduVO.getChildren_edu() + eduVO.getUniv_edu() + eduVO.getUniform_expense();
            totalInfo.setEducation_total(calcEduTotal);
        }

        /* 기부금 총납입액 */
        if (donationVO != null) {
            totalInfo.setDonation1(donationVO.getDonation1());
            totalInfo.setDonation2(donationVO.getDonation2());
            totalInfo.setDonation3(donationVO.getDonation3());
            totalInfo.setReligionEct_donation(donationVO.getReligionEct_donation());
            totalInfo.setReligion_donation(donationVO.getReligion_donation());
            int calcDon = donationVO.getDonation1() + donationVO.getDonation2() + donationVO.getDonation3() + donationVO.getReligionEct_donation()
                    + donationVO.getReligion_donation();
            totalInfo.setDonation_total(calcDon);
        }

        /* 월세 총납입액 */
        if (rentVO != null) {
            totalInfo.setRent_total(rentVO.getRent_total());
        }

        return totalInfo;
    }

}