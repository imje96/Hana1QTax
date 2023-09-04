package com.spring.oneqtax.tax.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class TaxInfoVO {
    private String calculation_id;
    private int member_id;
    private int total_income;
    private int minimun_amount;
    private int deduction_rate;
    private int basic_limit;
    private int additional_limit;
}
