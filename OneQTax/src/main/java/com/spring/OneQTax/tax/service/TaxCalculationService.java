package com.spring.OneQTax.tax.service;

import com.spring.OneQTax.tax.model.DAO.TaxInfoMapper;
import com.spring.OneQTax.tax.model.DTO.TaxInfoDTO;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaxCalculationService {

    private final TaxInfoMapper taxInfoMapper;

    @Autowired
    public TaxCalculationService(TaxInfoMapper taxInfoMapper) {
        this.taxInfoMapper = taxInfoMapper;
    }

    public TaxInfoDTO getIaxInfoById(int id) {
        return taxInfoMapper.getTaxInfoById(id);
    }

    public void calculateLimits(@NotNull TaxInfoDTO taxInfoDTO) {
        int totalIncome = taxInfoDTO.getTotalIncome();

        int basicLimit;
        int additionalLimit;

        if (totalIncome < 15000000) {
            basicLimit = (int) Math.round(totalIncome * 0.2);
            additionalLimit = 3000000;
        } else if (totalIncome <= 70000000) {
            basicLimit = 3000000;
            additionalLimit = 3000000;
        } else if (totalIncome <= 120000000) {
            basicLimit = 2500000;
            additionalLimit = 2000000;
        } else {
            basicLimit = 2000000;
            additionalLimit = 2000000;
        }

        taxInfoDTO.setBasicLimit(basicLimit);
        taxInfoDTO.setAdditionalLimit(additionalLimit);
    }

    // 추가공제액 계산
    public double calculateAdditionalDeduction(int id) {
        TaxInfoDTO taxInfo = taxInfoMapper.getTaxInfoById(id);

        int creditTotal = taxInfo.getCreditTotal();
        int debitTotal = taxInfo.getDebitTotal();
        int cashTotal = taxInfo.getCashTotal();
        int cultureTotal = taxInfo.getCultureTotal();
        int marketTotal = taxInfo.getMarketTotal();
        int transportTotal = taxInfo.getTransportTotal();
        int totalIncome = taxInfo.getTotalIncome();
        int minimumAmount = taxInfo.getMinimumAmount();
        int additionalLimit = taxInfo.getAdditionalLimit();

        double totalDeductible = (creditTotal) * 0.15 + (debitTotal + cashTotal + cultureTotal) * 0.3 + (marketTotal + transportTotal) * 0.4;
        double except1 = minimumAmount * 0.15;
        double except2 = creditTotal * 0.15 + (minimumAmount - creditTotal) * 0.3;
        double except3 = creditTotal * 0.15 + (debitTotal + cashTotal + cultureTotal) * 0.3 + (minimumAmount - creditTotal - debitTotal - cashTotal - cultureTotal) * 0.4;

        double result1 = totalDeductible - except1;
        if (result1 < 0) {
            result1 = 0;
        }
        double result2 = totalDeductible - except2;
        if (result2 < 0) {
            result2 = 0;
        }
        double result3 = totalDeductible - except3;
        if (result3 < 0) {
            result3 = 0;
        }

        // 추가 공제액 계산 로직
        double additionalDeduction = 0;
        double tempMin;
        if (totalIncome <= 70000000) {
            if (minimumAmount <= creditTotal + debitTotal + cashTotal) {
                additionalDeduction = Math.min((cultureTotal * 0.3 + marketTotal * 0.4 + transportTotal * 0.4), additionalLimit);
            } else if (creditTotal + debitTotal + cashTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + cultureTotal) {
                tempMin = Math.min(result2, (cultureTotal * 0.3 + marketTotal * 0.4 + transportTotal * 0.4));
                additionalDeduction = Math.min(tempMin, additionalLimit);
            } else if (creditTotal + debitTotal + cashTotal + cultureTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + cultureTotal + marketTotal + transportTotal) {
                tempMin = Math.min(result3, (cultureTotal * 0.3 + marketTotal * 0.4 + transportTotal * 0.4));
                additionalDeduction = Math.min(tempMin, additionalLimit);
            }
        } else {
            if (minimumAmount <= creditTotal + debitTotal + cashTotal) {
                additionalDeduction = Math.min((cultureTotal * 0.3 + marketTotal * 0.4 + transportTotal * 0.4), additionalLimit);
            } else if (creditTotal + debitTotal + cashTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + cultureTotal) {
                tempMin = Math.min(result2, (marketTotal * 0.4 + transportTotal * 0.4));
                additionalDeduction = Math.min(tempMin, additionalLimit);
            } else if (creditTotal + debitTotal + cashTotal + cultureTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + cultureTotal + marketTotal + transportTotal) {
                tempMin = Math.min(result3, (marketTotal * 0.4 + transportTotal * 0.4));
                additionalDeduction = Math.min(tempMin, additionalLimit);
            }
        }

        return additionalDeduction;
    }

    // 기본 공제액 계산 로직
    public double calculateBasicDeduction(int id) {
        TaxInfoDTO taxInfo = taxInfoMapper.getTaxInfoById(id);

        int creditTotal = taxInfo.getCreditTotal();
        int debitTotal = taxInfo.getDebitTotal();
        int cashTotal = taxInfo.getCashTotal();
        int minimumAmount = taxInfo.getMinimumAmount();
        int basicLimit = taxInfo.getAdditionalLimit(); // Assuming 'basicLimit' is equivalent to 'additionalLimit'.

        double creditDeductible, debitDeductible, cashDeductible;
        double creditDeduction;
        double debitDeduction;
        double cashDeduction;
        double basicDeduction = 0;

        if (minimumAmount <= creditTotal) {
            creditDeductible = creditTotal - minimumAmount;
            debitDeductible = debitTotal;
            cashDeductible = cashTotal;

            creditDeduction = Math.min(creditDeductible * 0.15, basicLimit);
            debitDeduction = Math.min(debitDeductible * 0.3, basicLimit - creditDeduction);
            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit - creditDeduction - debitDeduction);

            basicDeduction = creditDeduction + debitDeduction + cashDeduction;

        } else if (minimumAmount <= creditTotal + debitTotal) {
            creditDeductible = 0;
            debitDeductible = (debitTotal + creditTotal) - minimumAmount;
            cashDeductible = cashTotal;

            creditDeduction = Math.min(creditTotal * 0.15, basicLimit);
            debitDeduction = Math.min(debitDeductible * 0.3, basicLimit - creditDeduction);
            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit - creditDeduction - debitDeduction);

            basicDeduction = creditDeduction + debitDeduction + cashDeduction;

        } else if (creditTotal + debitTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal) {
            creditDeductible = 0;
            debitDeductible = 0;
            cashDeductible = (creditTotal + debitTotal + cashTotal) - minimumAmount;

            creditDeduction = Math.min(creditTotal * 0.15, basicLimit);
            debitDeduction = Math.min(debitTotal * 0.3, basicLimit - creditDeduction);
            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit - creditDeduction - debitDeduction);

            basicDeduction = creditDeduction + debitDeduction + cashDeduction;
        }
        // Based on your code, 2-2 and 3 cases involve 'result2' and 'result3' which are not defined in the basic deduction logic.
        // Therefore, I've excluded them from this method.

        return basicDeduction;
    }

}



