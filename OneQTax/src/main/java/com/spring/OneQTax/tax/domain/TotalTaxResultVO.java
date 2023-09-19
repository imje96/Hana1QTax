package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class TotalTaxResultVO {
    private int refund_id; // pk
    private int totalInfo_id; // fk
    /* 소득공제 */
    private int income_deduction; // 근로소득공제
    private int income_final; // 근로소득금액 = 총급여 - 근로소득공제
    private int personal_deduction;
    private int pension_deduction;
    private int housing_deduciton;
    private int card_deduction; // 카드등소득공제
    private int total_incomeDeduction; // 소득공제 통합

    /* 여기서부터 세액공제 */
    private int earned_taxcredit; // 근로세액공제
    private int children_taxcredit;
    private int irp_taxcredit;
    private int guarantee_taxcredit;
    private int medical_taxcredit;
    private int education_taxcredit;
    private int donation_taxcredit;
    private int rent_taxcredit;
    private int total_taxcredit; // 세액공제 통합=예상공제액
    private int tax_base; // 과세표준
    private int calculated_amount; // 산출세액
    private int determined_tax; // 결정세액
    private int prepayment_tax; // 기납부세액
    private int expected_tax; // 차감납부세액(납부예상세액) = 결정세액 - 기납부세액
    private int result_time;
}
