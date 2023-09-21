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
    public TotalInfoVO calculateForm(TaxFormVO taxForm, CardTaxResultVO cardResult) {
        TotalInfoVO totalInfo = new TotalInfoVO();

        int totalIncome = taxForm.getTotalIncome();

        totalInfo.setTotal_income2(totalIncome);
        // 근로소득공제 계산해서 넣기
        totalInfo.setIncome_deduction(calculateIncomeDeduction(taxForm));
        // 근로소득금액
        totalInfo.setIncome_final(totalIncome - calculateIncomeDeduction(taxForm));
        // 인적공제 계산하기
        int personalIncomeDeduction = calculatePersonalIncomeDeduction(taxForm, totalInfo);
        // 추가공제항목
        totalInfo.setPersonal_deduction(personalIncomeDeduction);
        totalInfo.setChildren_amount(calculateChildTaxCredit(taxForm));
        totalInfo.setPension_deduction(calculatePensionDeduction(taxForm, totalInfo));

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
    public void saveForm(TotalInfoVO totalInfo){
        taxMapper.insertTotalInfo(totalInfo);
    }
    // 업데이트 하기
    @Override
    public TotalInfoVO updateForm(TaxFormVO taxForm, TotalInfoVO totalInfo, CardTaxResultVO cardResult) {
        // 초기 계산 실행
        calculateForm(taxForm, cardResult);
        // detail 항목 계산 실행
        calculateDetailDeduction(taxForm, totalInfo);

        return totalInfo;
    }
    // 두번째 계산 정보 저장(업데이트)
    @Override
    public void updateAndSaveForm(TotalInfoVO totalInfo) {
        taxMapper.updateTotalInfo(totalInfo);
    }

    // 계산정보 조회하기
    @Override
    public TotalInfoVO getTotalInfoByCalcId(int calculationId){
        TotalInfoVO totalInfo = new TotalInfoVO();
        totalInfo =  taxMapper.getTotalInfoByCalcId(calculationId);
        return totalInfo;
    }

    // 인적소득공제 계산하기
    private int calculatePersonalIncomeDeduction(TaxFormVO taxForm, TotalInfoVO totalInfo) {
        int totalDeduction = 0;

        int basic = 1500000;
        totalInfo.setTaxpayer_deduction(basic);
        totalDeduction += basic;

        int spouseDeduction = "yes".equalsIgnoreCase(taxForm.getSpouseDeduction()) ? 1500000 : 0;
        totalInfo.setSpouse_deduction(spouseDeduction);
        totalDeduction += spouseDeduction;

        int childDeduction = taxForm.getChild() * 1500000;
        totalInfo.setChildren_deduction(childDeduction);
        totalDeduction += childDeduction;

        int siblingsDeduction = taxForm.getSiblings() * 1500000;
        totalInfo.setSiblings_deduction(siblingsDeduction);
        totalDeduction += siblingsDeduction;

        int directAncestorDeduction = taxForm.getDirectAncestor() * 1500000;
        totalInfo.setDirectAnc_deduction(directAncestorDeduction);
        totalDeduction += directAncestorDeduction;

        int seniorDeduction = taxForm.getSenior() * 1000000;
        totalInfo.setSenior_deduction(seniorDeduction);
        totalDeduction += seniorDeduction;

        int disabilityDeduction = taxForm.getDisability() * 2000000;
        totalInfo.setDisability_deduction(disabilityDeduction);
        totalDeduction += disabilityDeduction;

        int womanDeduction = "yes".equalsIgnoreCase(taxForm.getWomanDeduction()) ? 1000000 : 0;
        totalInfo.setWoman_deduction(womanDeduction);
        totalDeduction += womanDeduction;

        int singleParentDeduction = "yes".equalsIgnoreCase(taxForm.getSingleParent()) ? 1000000 : 0;
        totalInfo.setSingleParent_deduction(singleParentDeduction);
        totalDeduction += singleParentDeduction;

        return totalDeduction;
    }

    // 자녀관련 세액공제 계산하기
    private int calculateChildTaxCredit(TaxFormVO taxForm) {
        int childrenTaxCredit = 0;
        int child = taxForm.getChild(); // form 객체에서 child 값을 가져옴

        // 입양자녀 세액공제
        childrenTaxCredit += taxForm.getAdoptedChild() * 1500000;

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
        // 입양자녀 + 20세미만 자녀
        return (int) Math.floor(childrenTaxCredit);
    }

    // 근로소득공제 계산하기
    private int calculateIncomeDeduction(TaxFormVO taxForm) {
        int income_deduction = 0;
        int totalIncome = taxForm.getTotalIncome();

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
        int totalIncome = taxForm.getTotalIncome();
        int health_insurance = (int) Math.floor(totalIncome * 0.04);
        totalInfo.setHealth_insurance(health_insurance);
        int employment_insurance = (int) Math.floor(totalIncome * 0.009);
        totalInfo.setEmployment_insurance(employment_insurance);
        int national_pension = (int) Math.floor(totalIncome * 0.045);
        totalInfo.setNational_pension(national_pension);
        int other_pension = taxForm.getOther_pension();
        totalInfo.setOther_pension(other_pension);

        return health_insurance + employment_insurance + national_pension + other_pension;
    }

    // detail 옵션항목 추가(update용)
    private TotalInfoVO calculateDetailDeduction(TaxFormVO taxForm, TotalInfoVO totalInfo) {
        /* 주택 관련 총납입액 */
        totalInfo.setHousing_loan(taxForm.getHousing_loan());
        totalInfo.setHousing_account1(taxForm.getHousing_account1());
        totalInfo.setHousing_account2(taxForm.getHousing_account2());
        int CalcHousingTotal = taxForm.getHousing_loan() + taxForm.getHousing_account1() + taxForm.getHousing_account2();
        totalInfo.setHousing_total(CalcHousingTotal);

        /* 여기서부터 세액공제 납입액 */
        /* 자녀 세액공제 */
        totalInfo.setChildren_amount(taxForm.getChildren_amount());
        /* 연금관련 총납입액 */
        totalInfo.setPension_deduction(taxForm.getPension_deduction());
        totalInfo.setIrp_amount(taxForm.getIrp_amount());
        int calcIrpPension = taxForm.getPension_deduction() + taxForm.getIrp_amount();
        totalInfo.setIrpPension_total(calcIrpPension);
        /* 보장성보험 총납입액 */
        totalInfo.setBasic_guarantee(taxForm.getBasic_guarantee());
        totalInfo.setDisabled_guarantee(taxForm.getDisabled_guarantee());
        int calcGuaranteeTotal = taxForm.getBasic_guarantee() + taxForm.getDisabled_guarantee();
        totalInfo.setGuarantee_total(calcGuaranteeTotal);

        /* 의료비 총납입액 */
        totalInfo.setMedical_expense(taxForm.getMedical_expense());
        totalInfo.setMedical_expense2(taxForm.getMedical_expense2());
        totalInfo.setMedical_expense3(taxForm.getMedical_expense3());
        totalInfo.setFamily_medical(taxForm.getFamily_medical());
        int calcMediTotal = taxForm.getMedical_expense() + taxForm.getMedical_expense2() + taxForm.getMedical_expense3() + taxForm.getFamily_medical();
        totalInfo.setMedical_total(calcMediTotal);

        /* 교육비 총납입액 */
        totalInfo.setEdu_expense(taxForm.getEdu_expense());
        totalInfo.setChildren_edu(taxForm.getChildren_edu());
        totalInfo.setUniv_edu(taxForm.getUniv_edu());
        totalInfo.setUniform_expense(taxForm.getUniform_expense());
        int calcEduTotal = taxForm.getEdu_expense() + taxForm.getChildren_edu() + taxForm.getUniv_edu() + taxForm.getUniform_expense();
        totalInfo.setEducation_total(calcEduTotal);

        /* 기부금 총납입액 */
        totalInfo.setDonation1(taxForm.getDonation1());
        totalInfo.setDonation2(taxForm.getDonation2());
        totalInfo.setDonation3(taxForm.getDonation3());
        totalInfo.setReligionEct_donation(taxForm.getReligionEct_donation());
        totalInfo.setReligion_donation(taxForm.getReligion_donation());
        int calcDon = taxForm.getDonation1() + taxForm.getDonation2() + taxForm.getDonation3() + taxForm.getReligionEct_donation() + taxForm.getReligion_donation();
        totalInfo.setDonation_total(calcDon);

        /* 월세 총납입액 */
        totalInfo.setRent_total(taxForm.getRent_total());


        return totalInfo;
    }

}

