package com.spring.oneqtax.tax.domain;

import lombok.Data;
//import lombok.Getter;
//import lombok.Setter;

@Data
//@Setter
//@Getter
public class TotalInfoVO {
    public int totalcalc_id;
    public int calculation_id;
    // 초기 금액 연봉에 따라 달라짐
    public double health_insurance;
    public double employment_insurance;
    public double national_pension;
    // 초기 금액 0
    public double private_pension;
    public double other_pension;
    public double total_pension;
}
