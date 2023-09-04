package com.spring.oneqtax.tax.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class DeductionResultVO {
    private int deduction_id;
    private int calculation_id;
    private int credit_deduction;

}
