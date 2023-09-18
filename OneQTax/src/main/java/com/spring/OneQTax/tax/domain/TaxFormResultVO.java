package com.spring.oneqtax.tax.domain;

import lombok.Data;

// 연금보험료
@Data
public class TaxFormResultVO {
    /* 사용자가 설정한 총급여 */
    private int total_income2;
    /* 근로소득공제 */
    private int income_deduction; // 근로소득공제 총급여에 따라 달라짐
    private int income_amount; // 근로소득금액 총급여-근로소득공제

    /* 인적공제 */
    private int personal_deduction; // 인적공제
    private int basic_deduction; // 본인공제
    private int spouse_deduction; // 배우자공제
    private int children_deduction; // 자녀공제
    private int adopted_deduction; // 입양자녀공제
    private int directAnc_deduction; // 직계가족공제
    private int siblings_deduction; // 형제자매공제
    private int senior_deduction; // 경로우대공제
    private int disability_deduction;  // 장애인공제
    private int woman_deduction; // 부녀자공제
    private int singleParent_deduction; // 한부모공제


    /* 자녀관련 세액공제 */
    private int children_taxcredit;

    /* 연금보험료 소득공제*/
    private int pension_deduction; // 연금보험료(건강보험+고용보험+국민연금)
    private int health_insurance;
    private int employment_insurance;
    private int national_pension;
}
