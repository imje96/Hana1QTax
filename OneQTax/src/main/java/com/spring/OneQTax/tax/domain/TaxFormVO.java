package com.spring.oneqtax.tax.domain;

import lombok.Data;

// 연말정산 폼으로 받은 변수
@Data
public class TaxFormVO {
    // STEP 1 Fields
    private int totalIncome;
    // 추가한 코드
    private int calculation_id; // fk
    //    private int total_income2;
    private int income_deduction; // 근로소득공제
    private int income_final; // 근로소득금액 총급여-근로소득공제

    // STEP 2 Fields
    private String spouseDeduction; // 배우자공제
    private int child; // 20세미만 자녀공제 소득공제 & 세액공제
    private int adoptedChild; // 입양자녀공제 세액공제만

    // STEP 3 Fields
    private int directAncestor; // 직계가족공제
    private int siblings; // 형제자매공제
    private int senior; // 경로우대
    private int disability; // 장애인공제
    private String womanDeduction;
    private String singleParent; //한부모공제

    // 추가한 코드
    private int personal_deduction; // 인적공제

    /* 자녀 세액공제 */
    private int children_amount; // (계산완료)


}