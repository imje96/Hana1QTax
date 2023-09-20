package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.*;
import org.springframework.stereotype.Service;

@Service
public class TaxFormSerivceImpl implements TaxFormService {


    public TotalInfoVO calculateForm(TaxFormVO form, CardTaxResultVO cardResult) {
        TotalInfoVO totalInfo = new TotalInfoVO();

        int totalIncome = form.getTotalIncome();

        totalInfo.setTotal_income2(totalIncome);
        // 근로소득공제 계산해서 넣기
        totalInfo.setIncome_deduction(calculateIncomeDeduction(form));
        // 근로소득금액
        totalInfo.setIncome_final(totalIncome - calculateIncomeDeduction(form));
        // 인적공제 계산하기
        int personalIncomeDeduction = calculatePersonalIncomeDeduction(form, totalInfo);
        // 추가공제항목
        totalInfo.setPersonal_deduction(personalIncomeDeduction);
        totalInfo.setChildren_amount(calculateChildTaxCredit(form));
        totalInfo.setPension_deduction(calculatePensionDeduction(form));


        // 카드 금액
        totalInfo.setCard_deduction((int) cardResult.getTotal_deduction());
        totalInfo.setCredit_deduction((int) cardResult.getCredit_deduction());
        totalInfo.setDebit_deduction((int) cardResult.getDebit_deduction());
        totalInfo.setCash_deduction((int) cardResult.getCash_deduction());
        totalInfo.setBasic_deduction((int) cardResult.getBasic_deduction());
        totalInfo.setAdditional_deduction((int) cardResult.getAdditional_deduction());
//
//        TotalInfoVO calculateDetailDeduction(newDetail, totalInfo);

        return totalInfo;
    }


    // 인적소득공제
    private int calculatePersonalIncomeDeduction(TaxFormVO form, TotalInfoVO totalInfo) {
        int totalDeduction = 0;

        int basic = 1500000;
        totalInfo.setTaxpayer_deduction(basic);
        totalDeduction += basic;

        int spouseDeduction = "yes".equalsIgnoreCase(form.getSpouseDeduction()) ? 1500000 : 0;
        totalInfo.setSpouse_deduction(spouseDeduction);
        totalDeduction += spouseDeduction;

        int childDeduction = form.getChild() * 1500000;
        totalInfo.setChildren_deduction(childDeduction);
        totalDeduction += childDeduction;

        int siblingsDeduction = form.getSiblings() * 1500000;
        totalInfo.setSiblings_deduction(siblingsDeduction);
        totalDeduction += siblingsDeduction;

        int directAncestorDeduction = form.getDirectAncestor() * 1500000;
        totalInfo.setDirectAnc_deduction(directAncestorDeduction);
        totalDeduction += directAncestorDeduction;

        int seniorDeduction = form.getSenior() * 1000000;
        totalInfo.setSenior_deduction(seniorDeduction);
        totalDeduction += seniorDeduction;

        int disabilityDeduction = form.getDisability() * 2000000;
        totalInfo.setDisability_deduction(disabilityDeduction);
        totalDeduction += disabilityDeduction;

        int womanDeduction = "yes".equalsIgnoreCase(form.getWomanDeduction()) ? 1000000 : 0;
        totalInfo.setWoman_deduction(womanDeduction);
        totalDeduction += womanDeduction;

        int singleParentDeduction = "yes".equalsIgnoreCase(form.getSingleParent()) ? 1000000 : 0;
        totalInfo.setSingleParent_deduction(singleParentDeduction);
        totalDeduction += singleParentDeduction;

        return totalDeduction;
    }

    // 자녀관련 세액공제
    private int calculateChildTaxCredit(TaxFormVO form) {
        int total2 = 0;
        int child = form.getChild(); // form 객체에서 child 값을 가져옴

        // 입양자녀 세액공제
        total2 += form.getAdoptedChild() * 1500000;

        // 20세 미만 자녀 세액공제
        switch (child) {
            case 1:
                total2 += 150000;
                break;
            case 2:
                total2 += 300000;
                break;
            case 3:
                total2 += 600000;
                break;
            case 4:
                total2 += 900000;
                break;
            case 5:
                total2 += 1200000;
                break;
            case 6:
                total2 += 1500000;
                break;
        }
        // 입양자녀 + 20세미만 자녀
        return (int) Math.floor(total2);
    }

    // 근로소득공제
    private int calculateIncomeDeduction(TaxFormVO form) {
        int total3 = 0;
        int totalIncome = form.getTotalIncome();

        if (totalIncome <= 5000000) {
            total3 = (int) Math.floor(totalIncome * 0.7);
        } else if (totalIncome <= 15000000) {
            total3 = (int) Math.floor((totalIncome - 5000000) * 0.4 + 3500000);
        } else if (totalIncome <= 45000000) {
            total3 = (int) Math.floor((totalIncome - 15000000) * 0.15 + 7500000);
        } else if (totalIncome <= 100000000) {
            total3 = (int) Math.floor((totalIncome - 45000000) * 0.05 + 12000000);
        } else {
            total3 = (int) Math.floor((totalIncome - 100000000) * 0.02 + 14750000);
        }

        return total3;
    }

    // 연금보험료 소득공제
    private int calculatePensionDeduction(TaxFormVO form) {
        TotalInfoVO totalInfo = new TotalInfoVO();
        int totalIncome = form.getTotalIncome();
        int health_insurance = (int) Math.floor(totalIncome * 0.04);
        totalInfo.setHealth_insurance(health_insurance);
        int employment_insurance = (int) Math.floor(totalIncome * 0.009);
        totalInfo.setEmployment_insurance(employment_insurance);
        int national_pension = (int) Math.floor(totalIncome * 0.045);
        totalInfo.setNational_pension (national_pension);

        return health_insurance + employment_insurance + national_pension;
    }

    // detail 옵션항목 추가
    public TotalInfoVO calculateDetailDeduction(TaxFormVO taxForm, NewDetailVO newDetail, TotalInfoVO totalInfo) {
        /* 연금보험 관련 총납입액 */
        totalInfo.setPension_deduction(newDetail.getPension_deduction());
        totalInfo.setHealth_insurance(newDetail.getHealth_insurance());
        totalInfo.setNational_pension(newDetail.getNational_pension());
        totalInfo.setOther_pension(newDetail.getOther_pension());
        int CalcPensionDeduction = newDetail.getPension_deduction()+newDetail.getHealth_insurance()+newDetail.getNational_pension()+newDetail.getOther_pension();
        totalInfo.setPension_deduction(CalcPensionDeduction);

        /* 주택 관련 총납입액 */
        totalInfo.setHousing_loan(newDetail.getHousing_loan());
        totalInfo.setHousing_account1(newDetail.getHousing_account1());
        totalInfo.setHousing_account2(newDetail.getHousing_account2());
        int CalcHousingTotal = newDetail.getHousing_loan()+newDetail.getHousing_account1()+newDetail.getHousing_account2();
        totalInfo.setHousing_total(CalcHousingTotal);

        /* 여기서부터 세액공제 납입액 */
        /* 자녀 세액공제 */
        totalInfo.setChildren_amount(newDetail.getChildren_amount());
        /* 연금관련 총납입액 */
        totalInfo.setPension_deduction(newDetail.getPension_deduction());
        totalInfo.setIrp_amount(newDetail.getIrp_amount());
        int calcIrpPension = newDetail.getPension_deduction() + newDetail.getIrp_amount();
        totalInfo.setIrpPension_total(calcIrpPension);
        /* 보장성보험 총납입액 */
        totalInfo.setBasic_guarantee(newDetail.getBasic_guarantee());
        totalInfo.setDisabled_guarantee(newDetail.getDisabled_guarantee());
        int calcGuaranteeTotal = newDetail.getBasic_guarantee() + newDetail.getDisabled_guarantee();
        totalInfo.setGuarantee_total(calcGuaranteeTotal);

        /* 의료비 총납입액 */
        totalInfo.setMedical_expense(newDetail.getMedical_expense());
        totalInfo.setMedical_expense2(newDetail.getMedical_expense2());
        totalInfo.setMedical_expense3(newDetail.getMedical_expense3());
        totalInfo.setFamily_medical(newDetail.getFamily_medical());
        int calcMediTotal = newDetail.getMedical_expense() + newDetail.getMedical_expense2()
                + newDetail.getMedical_expense3() + newDetail.getFamily_medical();
        totalInfo.setMedical_total(calcMediTotal);

        /* 교육비 총납입액 */
        totalInfo.setEdu_expense(newDetail.getEdu_expense());
        totalInfo.setChildren_edu(newDetail.getChildren_edu());
        totalInfo.setUniv_edu(newDetail.getUniv_edu());
        totalInfo.setUniform_expense(newDetail.getUniform_expense());
        int calcEduTotal = newDetail.getEdu_expense() + newDetail.getChildren_edu() + newDetail.getUniv_edu()
                + newDetail.getUniform_expense();
        totalInfo.setEducation_total(calcEduTotal);

        /* 기부금 총납입액 */
        totalInfo.setDonation1(newDetail.getDonation1());
        totalInfo.setDonation2(newDetail.getDonation2());
        totalInfo.setDonation3(newDetail.getDonation3());
        totalInfo.setReligionEct_donation(newDetail.getReligionEct_donation());
        totalInfo.setReligion_donation(newDetail.getReligion_donation());
        int calcDon = newDetail.getDonation1() + newDetail.getDonation2() + newDetail.getDonation3()
                + newDetail.getReligionEct_donation() + newDetail.getReligion_donation();
        totalInfo.setDonation_total(calcDon);

        /* 월세 총납입액 */
        totalInfo.setRent_total(newDetail.getRent_total());


        return totalInfo;
    }

}

