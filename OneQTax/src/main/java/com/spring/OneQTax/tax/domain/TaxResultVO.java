package com.spring.oneqtax.tax.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class TaxResultVO {


    private int deduction_id;
    private int calculation_id;
    private int total_id;
    private double credit_deductible;
    private double credit_deduction;
    private double debit_deductible;
    private double debit_deduction;
    private double cash_deductible;
    private double cash_deduction;
    private double basic_deduction;
    private double additional_deduction;
    private double total_deduction;
    private double reducing_tax;
    private String result_date;
}