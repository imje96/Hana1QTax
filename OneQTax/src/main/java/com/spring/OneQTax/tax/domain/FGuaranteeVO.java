package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class FGuaranteeVO {
    /* 보장성보험 총납입액 */
    private int guarantee_total;
    private int basic_guarantee; // 일반 보장성보험
    private int disabled_guarantee; // 장애인 보장성보험
}
