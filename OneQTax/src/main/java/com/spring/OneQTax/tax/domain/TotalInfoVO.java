package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class TotalInfoVO {
    private int income_deduction; // 근로소득공제
    private int personal_deduction; // 기존의 값 받아옴

    private int pension_deduction;
    private int health_insurance; // 건강보험공제
    private int employment_insurance; // 고용보험공제
    private int national_pension; // 국민연금공제

    private int housing_deduciton;
    private int rent;             // 주택차입금원리금상환액
    private int housing_account1; // 청약저축
    private int housing_account2; // 주택청약종합저축

    private int card_deduction; // 카드등 소득공제

    /* 여기서부터 세액공제 납입액 */
    private int children_taxcredit; // 기존의 값 받아옴

    private int irp_taxcredit; // 개인연금 공제액
    private int pension_account; // 연금저축 납입액(퇴직연금미포함)
    private int irp_account; // 개인형퇴직연금(irp) 납입액(퇴직연금포함)

    private int guarantee_taxcredit; // 보장성보험 공제액
    private int basic_guarantee; // 일반 보장성보험
    private int disabled_guarantee; // 장애인 보장성보험

    private int medical_taxcredit; // 의료비 공제액
    private int medical_expense; // 본인의료비
    private int medical_expense2; // 난임시술비
    private int medical_expense3; // 미숙아.선천이상아 의료비
    private int medical_expense4; // 부양가족 의료비

    private int education_taxcredit; // 교육비 공제액
    private int edu_expense;
    private int children_edu;
    private int univ_edu;
    private int uniform_expense;

    private int donation_taxcredit; // 기부금 공제액
    private int donation1; // 종교기부금외
    private int donation2; // 종교기부금

    private int rent_taxcredit; // 월세 납입액


    private int possible_taxcredit;
    private int expectation_taxcredit;
//    private int determined_tax;
    private int prepayment_tax;
//    private int expected_tax;
    private int result_time;
}
