package com.spring.oneqtax.tax.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Data
@Getter
@Setter
public class TaxInfoVO {
    private int calculation_id;
    private int member_id;
    private BigDecimal total_income;
    private BigDecimal minimum_amount;
    private BigDecimal deduction_rate;
    private BigDecimal basic_limit;
    private BigDecimal additional_limit;
}
