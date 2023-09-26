package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class FHousingVO {    /* 주택 관련 총납입액(계산X) */

    private int housing_loan;  // 주택차입금원리금상환액
    private int housing_account1; // 청약저축 납입액
    private int housing_account2; // 주택청약종합저축 납입액
}
