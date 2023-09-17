package com.spring.oneqtax.tax.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

// 소득공제 계산을 위한 엔터티
@Data

public class TaxInfoVO {
    private int calculation_id;
    private int member_id;
    private double total_income;
    private double minimum_amount;
    private double deduction_rate;
    private double basic_limit;
    private double additional_limit;
}
