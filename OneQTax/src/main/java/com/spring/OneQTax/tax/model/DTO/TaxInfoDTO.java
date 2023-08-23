package com.spring.OneQTax.tax.model.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TaxInfoDTO {
    private int totalIncome;
    private int creditTotal;
    private int debitTotal;
    private int cashTotal;
    private int cultureTotal;
    private int marketTotal;
    private int transportTotal;
    private int minimumAmount;

    private int basicLimit;

    private int additionalLimit;

    public void setTotalIncome(int totalIncome) {
        this.totalIncome = totalIncome;
        // totalIncome이 설정될 때 minimumAmount도 계산하여 저장
        this.minimumAmount = (int) (totalIncome * 0.25);
    }

    public int getMinimumAmount() {
        return minimumAmount;
    }

}