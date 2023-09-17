package com.spring.oneqtax.tax.domain;

import lombok.Data;

// 연금보험료
@Data
public class TaxFormResultVO {
    /* 사용자가 설정한 총급여 */
    private int total_income2;
    /* 근로소득공제 */
    private int income_deduction; // 총급여에 따라 달라짐

    /* 인적공제 */
    private int personal_deduction; // 인적공제

    /* 자녀관련 세액공제 */
    private int children_taxcredit;


}
