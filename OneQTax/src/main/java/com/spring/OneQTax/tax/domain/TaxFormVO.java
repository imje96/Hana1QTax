package com.spring.oneqtax.tax.domain;

import lombok.Data;

// 연말정산 폼으로 받은 변수
@Data
public class TaxFormVO {
    // STEP 1 Fields
    private int totalIncome;

    // STEP 2 Fields
    private String spouseDeduction; // 배우자공제
    private int child; // 20세미만 자녀공제 소득공제 & 세액공제
    private int adoptedChild; // 입양자녀공제 세액공제만

    // STEP 3 Fields
    private int directAncestor; // 직계가족공제
    private int siblings; // 형제자매공제
    private int senior; // 경로우대
    private int disability; // 장애인공제
    private String womanDeduction; // 부녀자공제
    private String singleParent; // 한부모공제
}
