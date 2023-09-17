package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class TaxFormVO {
    // STEP 1 Fields
    private double totalIncome;

    // STEP 2 Fields
    private String spouseDeduction;
    private int child;
    private int adoptedChild;

    // STEP 3 Fields
    private int directAncestor;
    private int siblings;
    private int senior;
    private int disability;
    private String womanDeduction;
    private String singleParent;
}
