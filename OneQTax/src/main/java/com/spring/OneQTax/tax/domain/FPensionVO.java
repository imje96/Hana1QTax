package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class FPensionVO {
    /* 연금관련 총납입액 */
//    private int irpPension_total;
    private int pension_amount; // 연금저축 납입액(퇴직연금미포함)
    private int irp_amount; // 개인형퇴직연금(irp) 납입액(퇴직연금포함)
}
