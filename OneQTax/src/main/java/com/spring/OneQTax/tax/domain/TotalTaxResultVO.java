package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class TotalTaxResultVO {
    private int refund_id;
//    private int calculation_id;
    /* 소득공제 */
    private int income_deduction; // 근로소득공제
    private int personal_deduction;
    private int pension_deduction;
    private int housing_deduciton;
    private int card_deduction; // 카드등소득공제
    /* 여기서부터 세액공제 */
    private int children_taxcredit;
    private int irp_taxcredit;
    private int guarantee_taxcredit;
    private int medical_taxcredit;
    private int donation_taxcredit;
    private int education_taxcredit;
    private int rental_taxcredit;
    private int possible_taxcredit;
    private int expectation_taxcredit;
    private int determined_tax;
    private int prepayment_tax;
    private int expected_tax;
    private int result_time;
}
