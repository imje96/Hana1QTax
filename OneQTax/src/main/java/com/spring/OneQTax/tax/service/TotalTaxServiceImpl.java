package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TaxFormResultVO;
import com.spring.oneqtax.tax.domain.TaxFormVO;
import com.spring.oneqtax.tax.domain.TotalInfoVO;
import com.spring.oneqtax.tax.domain.TotalTaxResultVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class TotalTaxServiceImpl implements TotalTaxService {

    @Autowired
    private TaxMapper mapper;

//    public TotalInfoVO getTotalInfoById(int memberId) {
//
//        return mapper.selectTotalInfoById(memberId);
//    }

//    public TotalInfoVO updateTotalInfo(TotalInfoVO totalInfoVO, double totalIncome) {
//        totalInfoVO.setHealth_insurance(totalIncome * 0.04);
//        totalInfoVO.setEmployment_insurance(totalIncome * 0.009);
//        totalInfoVO.setNational_pension(totalIncome * 0.045);
//        // 추가 계산 로직을 필요에 따라 추가
//
//        mapper.updateTotalInfo(totalInfoVO);
//
//        return totalInfoVO;
//    }

    public TotalTaxResultVO calculateTotalDeductions(TaxFormResultVO formResult, TotalInfoVO totalInfo) {
        TotalTaxResultVO totalResult = new TotalTaxResultVO();

        /* TaxFormResultVO에서 값 가져오기
         * 납입금액을 가져와서 계산 후 금액으로 사용할 것*/
        int totalIncome = formResult.getTotal_income2();

        int income_deduction = formResult.getIncome_deduction();
        int personal_deduction = formResult.getPersonal_deduction();
        int children_taxcredit = formResult.getChildren_taxcredit(); // 세액공제
        /* 만약 값이 Null이면 0으로 알아서 초기화 */
        int pension_deduction = 0; // 연금보험료공제
        int health_insurance = 0;
        int employment_insurance = 0;
        int national_pension = 0;

        int housing_deduciton = totalInfo.getHousing_deduciton(); //
        int rent = totalInfo.getRent();
        int housing_account1 = totalInfo.getHousing_account1();
        int housing_account2 = totalInfo.getHousing_account2();

        int card_deduction = totalInfo.getCard_deduction(); // 소득공제

        /* 세액공제 */
        int irp_taxcredit = totalInfo.getIrp_taxcredit();
        int pension_account = totalInfo.getPension_account();
        int irp_account = totalInfo.getIrp_account();

        int guarantee_taxcredit = totalInfo.getGuarantee_taxcredit();
        int basic_guarantee = totalInfo.getBasic_guarantee();
        int disabled_guarantee = totalInfo.getDisabled_guarantee();

        int medical_taxcredit = totalInfo.getMedical_taxcredit();
        int medical_expense = totalInfo.getMedical_expense();
        int medical_expense2 = totalInfo.getMedical_expense2();
        int medical_expense3 = totalInfo.getMedical_expense3();
        int medical_expense4 = totalInfo.getMedical_expense4();

        int education_taxcredit = totalInfo.getEducation_taxcredit();
        int edu_expense = totalInfo.getEdu_expense();
        int children_edu = totalInfo.getChildren_edu();
        int univ_edu = totalInfo.getUniv_edu();
        int uniform_expense = totalInfo.getUniform_expense();

        int donation_taxcredit = totalInfo.getDonation_taxcredit();
        int donation1 = totalInfo.getDonation1();
        int donation2 = totalInfo.getDonation2();

        int rent_taxcredit = totalInfo.getRent_taxcredit();

        int possible_taxcredit = totalInfo.getPossible_taxcredit();
        int expectation_taxcredit = totalInfo.getExpectation_taxcredit();
        int determined_tax = 0;
        int prepayment_tax = totalInfo.getPrepayment_tax();
        int expected_tax = 0;
        int result_time = totalInfo.getResult_time();

        totalResult.setIncome_deduction(income_deduction);
        totalResult.setPersonal_deduction(personal_deduction);
        totalResult.setChildren_taxcredit(children_taxcredit);

        /* 연금보험료 계산 */
        int calcHealth = 0;
        int calcEmployment = 0;
        int calcNationalp = 0;

        calcHealth = (int) Math.floor(totalIncome * 0.0545);
        calcEmployment = (int) Math.floor(totalIncome * 0.009);
        calcNationalp = (int) Math.floor(totalIncome * 0.045);
        pension_deduction = calcHealth + calcEmployment + calcNationalp;
        totalResult.setPension_deduction(pension_deduction);

        /* 주택공제 */
        int calcHousing = 0;

        if (totalIncome <= 70000000) {
            int housing_calc = (int) Math.floor((rent + housing_account1 + housing_account2) * 0.4);
            calcHousing = Math.min(housing_calc, 4000000);
        } else {
            calcHousing = 0;
        }
        int calculatedHousing;
        totalResult.setHousing_deduciton(calcHousing);

        /* 카드공제 */
        //일단 생략

        /* 추가소득 */

        /* 연금계좌 */

        // 연금저축보험 최대 400만원
        if (pension_account > 4000000) {
            irp_taxcredit = (int) Math.floor((4000000 + irp_account) * 0.15);
        } else {
            irp_taxcredit = (int) Math.floor((pension_account + irp_account) * 0.15);
        }
        // irp 최대 700만원
        if (irp_account > 7000000) {
            irp_taxcredit = (int) Math.floor(7000000 * 0.15);
        } else {
            irp_taxcredit = (int) Math.floor((pension_account + irp_account) * 0.15);
        }
        irp_taxcredit = pension_account + irp_account;

        // 토탈 700만원
        if (pension_account + irp_account > 7000000){
            irp_taxcredit = (int) Math.floor(7000000 * 0.15);
        } else {
            irp_taxcredit = (int) Math.floor((pension_account + irp_account) * 0.15);
        }
        totalResult.setIrp_taxcredit(irp_taxcredit);

        /* 보장성보험 */
        guarantee_taxcredit = Math.min((basic_guarantee+disabled_guarantee),2000000);
        totalResult.setGuarantee_taxcredit(guarantee_taxcredit);

        /* 의료비 */

        /* 교육비 */
        int calcEdu = 0;
        int calcChildren = 0;
        int calcUniv = 0;
        int calcUniform = 0;

//        education_taxcredit = edu_expense + children_edu + univ_edu + uniform_expense;
//        if(education_taxcredit > 4000000){
//            calcEdu =  (int) Math.floor(4000000 * 0.15);
//        }else {
//            calcEdu = (int) Math.floor((education_taxcredit) * 0.15);
//        } education_taxcredit =

//        15% 400만원까지
        /* 기부금 */
//        *15% 200만원까지
        /* 월세 */
//        *17%


        return totalResult;
    }
}