package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.*;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class TotalTaxServiceImpl implements TotalTaxService {

    private final TaxMapper taxMapper;

    @Autowired
    public TotalTaxServiceImpl(TaxMapper taxMapper) {
        this.taxMapper = taxMapper;
    }

    @Override
    public void saveResult(TotalTaxResultVO totalResult) {
        taxMapper.insertTaxResult(totalResult);
    }

    // 계산정보 조회하기
    @Override
    public TotalTaxResultVO getTotalResultByTotalInfoId(int totalInfoId) {
        TotalTaxResultVO totalResult = new TotalTaxResultVO();
        totalResult = taxMapper.getTotalResultByTotalInfoId(totalInfoId);
        return totalResult;
    }

    @Override
    public TotalInfoVO getTotalInfoByMemberId(int memberId){
        TotalInfoVO totalInfo = new TotalInfoVO();
        totalInfo = taxMapper.getTotalInfoByMemberId(memberId);
        return totalInfo;
    }



    @Override
    public TotalTaxResultVO calculateTotalDeductions(TotalInfoVO totalInfo, CardTaxResultVO cardResult) {
        TotalTaxResultVO totalResult = new TotalTaxResultVO();

        /* TaxFormResultVO에서 값 가져오기
         * 납입금액을 가져와서 계산 후 금액으로 사용할 것*/
        int totalInfo_id = totalInfo.getTotalInfo_id();

        int totalIncome = totalInfo.getTotal_income2();

        int income_deduction = totalInfo.getIncome_deduction();
        int income_final = totalInfo.getIncome_final();
        int personal_deduction = totalInfo.getPersonal_deduction();
        int pension_deduction = totalInfo.getPension_deduction();
        int other_pension = totalInfo.getOther_pension(); // 기타연금보험

        int housing_total = totalInfo.getHousing_total(); //
        int housing_loan = totalInfo.getHousing_loan();
        int housing_account1 = totalInfo.getHousing_account1();
        int housing_account2 = totalInfo.getHousing_account2();

        int card_deduction = (int)(cardResult.getTotal_deduction()); // 소득공제
        int credit_deduction = totalInfo.getCredit_deduction();
        int debit_deduction = totalInfo.getDebit_deduction();
        int cash_deduction = totalInfo.getCash_deduction();
        int basic_deduction = totalInfo.getBasic_deduction();
        int additional_deduction = totalInfo.getAdditional_deduction();


        /* 세액공제 */
        /* 만약 값이 Null이면 0으로 알아서 초기화 */
        int children_amount = totalInfo.getChildren_amount(); // 세액공제

        int irpPension_total = totalInfo.getIrpPension_total();
        int pension_amount = totalInfo.getPension_amount();
        int irp_amount = totalInfo.getIrp_amount();

        int guarantee_total = totalInfo.getGuarantee_total();
        int basic_guarantee = totalInfo.getBasic_guarantee();
        int disabled_guarantee = totalInfo.getDisabled_guarantee();

        int medical_total = totalInfo.getMedical_total(); // 의료비총합
        int medical_expense = totalInfo.getMedical_expense();
        int medical_expense2 = totalInfo.getMedical_expense2();
        int medical_expense3 = totalInfo.getMedical_expense3();
        int family_medical = totalInfo.getFamily_medical();

        int education_total = totalInfo.getEducation_total();
        int edu_expense = totalInfo.getEdu_expense();
        int children_edu = totalInfo.getChildren_edu();
        int univ_edu = totalInfo.getUniv_edu();
        int uniform_expense = totalInfo.getUniform_expense();

        int donation_total = totalInfo.getDonation_total();
        int donation1 = totalInfo.getDonation1();
        int donation2 = totalInfo.getDonation2();
        int donation3 = totalInfo.getDonation3();
        int religionEct_donation = totalInfo.getReligionEct_donation();
        int religion_donation = totalInfo.getReligion_donation();

        int rent_total = totalInfo.getRent_total();

        int determined_tax = totalInfo.getDetermined_tax();
        int prepayment_tax = totalInfo.getPrepayment_tax();
        int expected_tax = totalInfo.getExpected_tax();
        String result_time = totalInfo.getResult_time();

        /* totalInfo_id 넣기 */
        totalResult.setTotalInfo_id(totalInfo_id);
        /* 근로소득 공제 */
        totalResult.setIncome_deduction(income_deduction); // 근로소득공제
        totalResult.setIncome_final(income_final); // 근로소득금액

        /* 인적공제 */
        totalResult.setPersonal_deduction(personal_deduction);
        /* 자녀 관련 세액공제 */
        totalResult.setChildren_taxcredit(children_amount);

        /* 연금보험료 계산 */
        totalResult.setPension_deduction(pension_deduction + other_pension);

        /* 주택공제 */
        int calcHousing = 0;
        if (totalIncome <= 70000000) {
            int housing_calc = (int) Math.floor(housing_total * 0.4);
            calcHousing = Math.min(housing_calc, 4000000);
        } else {
            calcHousing = 0;
        }
        totalResult.setHousing_deduction(calcHousing);

        /* 카드 등 공제 */
        totalResult.setCard_deduction(card_deduction);

        /* 추가소득 */
        // 일단 생략

        /* 소득공제 통합 */
        int total_incomeDeduction = personal_deduction + pension_deduction + calcHousing + card_deduction;
        totalResult.setTotal_incomeDeduction(total_incomeDeduction);


        /* 자녀 관련 세액공제 */
        totalResult.setChildren_taxcredit(children_amount);

        /* 연금계좌 */
        int calcIrpTax = 0;
        // 1) 연금저축보험 최대 600만원
        int calcPension = (pension_amount > 6000000) ? 6000000 : pension_amount;

        // 2) IRP 최대 900만원, 하지만 전체 (연금저축보험 + IRP) 합은 700만원을 넘을 수 없다.
        int remainingAmount = 15000000 - calcPension;
        int calcIrp = (irp_amount > remainingAmount) ? remainingAmount : irp_amount;

        // 3) 합산금액 700만원(총급여액 5천5백만원 초과자는 13.2%)
        int totalEligible = calcPension + calcIrp;
        calcIrpTax = (totalIncome > 55000000) ? (int) Math.floor(totalEligible * 0.132) : (int) Math.floor(totalEligible * 0.165);

        totalResult.setIrp_taxcredit(calcIrpTax);

        /* 보장성보험 */
        int calcGuarantee = Math.min((basic_guarantee + disabled_guarantee), 2000000);
        totalResult.setGuarantee_taxcredit(calcGuarantee);

        /* 의료비 */
        int minimumLimit = 0; // 의료비 최저한도 의료비 사용액이 연봉의 3%를 초과해야함
        int calcMedical = 0; // 본인 의료비 계산
        int calcMedical2 = 0; // 난임시술비 계산
        int calcMedical3 = 0; // 미숙아,선천이상아 계산
        int calcFamily = 0; // 부양가족 계산
        int calcMedicalTaxCredit = 0; // 세액공제액 계산

        calcMedical = (int) Math.floor(totalInfo.getMedical_expense() * 0.15);
        calcMedical2 = (int) Math.floor(totalInfo.getMedical_expense2() * 0.3);
        calcMedical3 = (int) Math.floor(totalInfo.getMedical_expense3() * 0.2);
        if (family_medical > 7000000) {
            calcFamily = (int) Math.floor(7000000 * 0.15);
        } else {
            calcFamily = (int) Math.floor(family_medical * 0.15);
        }

        // 세액공제액 = 공제대상금액 - 최저한도
        minimumLimit = (int) Math.floor(totalIncome * 0.03);
        System.out.println(minimumLimit);
        int calcMedicalTotal = calcMedical + calcMedical2 + calcMedical3 + calcFamily; // 공제대상금액
        totalInfo.setMedical_total(calcMedicalTotal);
        totalResult.setMedical_taxcredit(calcMedicalTotal);

        /* 교육비 */
        // 교육비 공제대상금액 * 15%
        int calcEdu = 0; // 본인교육비는 제한없이 100%
        int calcChildren = 0; // 미취학 아동 교육비는 1명당 300만원까지
        int calcUniv = 0; // 대학생 교육비는 1명당 900만원까지
        int calcUniform = 0;  // 교복구입비 1명당 50만원까지

        education_total = edu_expense + children_edu + univ_edu + uniform_expense;
        calcEdu = (int) Math.floor(education_total * 0.15);
        totalResult.setEducation_taxcredit(calcEdu);


        /* 기부금 */
        int calcDonation1 = 0;
        int calcDonation2 = 0;
        int calcDonation3 = 0;
        int calcReligion = 0;
        int calcEctReligion = 0;
        int calcDonationTaxcredit = 0;
        int tempDon1 = donation1 - 100000;
        int tempDon2 = Math.min(income_final, donation2);

        if (donation1 <= 100000) {
            calcDonation1 = (int) Math.floor(donation1 * (100 / 110));
        } else if (donation1 <= 30000000) {
            calcDonation1 = (int) Math.floor(100000 * (100 / 110)) + (int) Math.floor(Math.min(income_final, tempDon1) * 0.15);
        } else {
            calcDonation1 = (int) Math.floor(100000 * (100 / 110)) + (int) Math.floor(Math.min(income_final, tempDon1) * 0.25);
        }

        if (donation2 <= 100000) {
            calcDonation2 = (int) Math.floor(tempDon2 * 0.2);
        } else {
            calcDonation2 = (int) Math.floor(tempDon2 * 0.35);
        }

        int tempDon3 = (int) Math.min((income_final - calcDonation1 - calcDonation2) * 0.3, donation3);
        if (donation3 <= 100000) {
            calcDonation3 = (int) Math.floor(tempDon3 * 0.2);
        } else {
            calcDonation3 = (int) Math.floor(tempDon3 * 0.35);
        }

        int tempDon4 = (int) Math.min((income_final - calcDonation1 - calcDonation2 - calcDonation3) * 0.3, religionEct_donation);
        if (religionEct_donation <= 100000) {
            calcEctReligion = (int) Math.floor(tempDon4 * 0.2);
        } else {
            calcEctReligion = (int) Math.floor(tempDon4 * 0.35);
        }

        int tempDon5 = (int) Math.min((income_final - calcDonation1 - calcDonation2 - calcDonation3) * 0.1, religion_donation);
        if (religion_donation <= 100000) {
            calcReligion = (int) Math.floor(tempDon5 * 0.2);
        } else {
            calcReligion = (int) Math.floor(tempDon5 * 0.35);
        }

        calcDonationTaxcredit = calcDonation1 + calcDonation2 + calcDonation3 + calcReligion + calcEctReligion;

        totalResult.setDonation_taxcredit(calcDonationTaxcredit);

        /* 월세 */
        // (필수)연봉 7천만원 이하, 5500만원 초과: 15%, 연봉 5500만원 이하: 17%, 750만원 한도
        int calcRent = 0; //  월세공제액

        if (rent_total > 7500000) {
            if (totalIncome <= 55000000) {
                calcRent = (int) Math.floor(7500000 * 0.17);
            } else if (totalIncome <= 70000000) {
                calcRent = (int) Math.floor(7500000 * 0.15);
            }
        } else {
            if (totalIncome <= 55000000) {
                calcRent = (int) Math.floor(rent_total * 0.17);
            } else if (totalIncome <= 70000000) {
                calcRent = (int) Math.floor(rent_total * 0.15);
            }
        }
        totalResult.setRent_taxcredit(calcRent);


        // 계산하기
        // 과세표준 = 근로소득금액 - 소득공제총합
        // 산출세액 = 과세표준 * 기본세율
        // 결정세액 = 산출세액 - 세액공제통합
        // 차감납부세액 = 결정세액 - 기납부세액

        /* 과세표준 */
        int taxbase = income_final - total_incomeDeduction; // 과세표준
        totalResult.setTax_base(taxbase);
        int calculated_amount = 0; //총산출세액

        if (taxbase <= 14000000) {
            calculated_amount = (int) Math.floor(taxbase * 0.06);
        } else if (taxbase <= 50000000) {
            calculated_amount = (int) Math.floor(840000 + (taxbase - 14000000) * 0.15);
        } else if (taxbase <= 88000000) {
            calculated_amount = (int) Math.floor(6240000 + (taxbase - 50000000) * 0.24);
        } else if (taxbase <= 150000000) {
            calculated_amount = (int) Math.floor(15360000 + (taxbase - 88000000) * 0.35);
        } else if (taxbase <= 300000000) {
            calculated_amount = (int) Math.floor(37060000 + (taxbase - 150000000) * 0.38);
        } else if (taxbase <= 500000000) {
            calculated_amount = (int) Math.floor(94060000 + (taxbase - 300000000) * 0.40);
        } else if (taxbase <= 1000000000) {
            calculated_amount = (int) Math.floor(174060000 + (taxbase - 500000000) * 0.42);
        } else {
            calculated_amount = (int) Math.floor(384060000 + (taxbase - 1000000000) * 0.45);
        }

        /* 산출세액 */
        totalResult.setCalculated_amount(calculated_amount);

        /* 근로세액공제 */
        int earned_taxcredit = 0; // 산출세액 -> 근로소득만 잇는 경우는 근로소득 전액
        int calcEarned = 0;
        int finalCalc = 0; // 공제한도까지 고려한 금액
        int temp = 0;
        if (calculated_amount <= 1300000) {
            earned_taxcredit = (int) Math.floor(calculated_amount * 0.55);
        } else {
            earned_taxcredit = (int) Math.floor(calculated_amount * 0.3 + 325000);
        }
        // 한도 계산
        // 74만원
        if (totalIncome <= 3300000) {
            finalCalc = Math.min(earned_taxcredit, 740000);
        }
        // Max[74만원-(총급여액-3,300만원)×8/1,000, 66만원]
        else if (totalIncome <= 43000000) {
            temp = (int) (740000 - (totalIncome - 33000000) * 0.008);
            calcEarned = Math.max(temp, 660000);
            finalCalc = Math.min(earned_taxcredit, calcEarned);
        }
        // 66만원
        else if (totalIncome <= 70000000) {
            finalCalc = Math.min(earned_taxcredit, 660000);
        }
        // Max[74만원-(총급여액-3,300만원)×8/1,000, 66만원]
        else if (totalIncome <= 70320000) {
            temp = (int) (740000 - (totalIncome - 33000000) * 0.008);
            calcEarned = Math.max(temp, 660000);
            finalCalc = Math.min(earned_taxcredit, calcEarned);
        }
        // 50만원
        else {
            finalCalc = Math.min(earned_taxcredit, 500000);
        }

        totalResult.setEarned_taxcredit(finalCalc);

        /* 세액공제 통합 */
        int total_taxCredit = children_amount + calcIrpTax + calcGuarantee + calcMedicalTotal + calcEdu
                + calcDonationTaxcredit + calcRent + finalCalc;
        totalResult.setTotal_taxcredit(total_taxCredit);

        System.out.println("66만원 행방 :" + finalCalc);

        /* 결정세액 */
        determined_tax = Math.max(calculated_amount - total_taxCredit, 0); // 결정세액
        totalResult.setDetermined_tax(determined_tax);
        /* 기납부세액 */
        totalResult.setPrepayment_tax(prepayment_tax);
        /* 차감납부세액 */
        expected_tax = determined_tax-prepayment_tax; // 차감납부세액(환급금)
        totalResult.setExpected_tax(expected_tax);

        return totalResult;
    }
}