package com.spring.OneQTax.tax.model.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class TaxInfoDTO {
    private int memberId;
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

    @Override
    public String toString() {
        return "TaxInfoDTO{" +
                "memberId=" + memberId +
                ", totalIncome=" + totalIncome +
                ", creditTotal=" + creditTotal +
                ", debitTotal=" + debitTotal +
                ", cashTotal=" + cashTotal +
                ", cultureTotal=" + cultureTotal +
                ", marketTotal=" + marketTotal +
                ", transportTotal=" + transportTotal +
                ", minimumAmount=" + minimumAmount +
                ", basicLimit=" + basicLimit +
                ", additionalLimit=" + additionalLimit +
                '}';
    }
}