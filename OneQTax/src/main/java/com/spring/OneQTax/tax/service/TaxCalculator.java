//package com.spring.oneqtax.tax.service;
//
//import com.spring.oneqtax.tax.domain.DeductionResultVO;
//import com.spring.oneqtax.tax.domain.TaxInfoVO;
//import com.spring.oneqtax.tax.domain.TransactionVO;
//import com.spring.oneqtax.tax.repository.TaxMapper;
//import org.jetbrains.annotations.NotNull;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.math.BigDecimal;
//
//@Service
//public class TaxCalculator implements TaxService {
//
//    private final TaxMapper taxMapper;
//
//
//    @Autowired
//    public TaxCalculator(TaxMapper taxMapper) {
//        this.taxMapper = taxMapper;
//    }
//
//    public TaxInfoVO getTaxInfoByMemberId(int member_id) {
//        return taxMapper.getTaxInfoByMemberId(member_id);
//    }
//
//    public TransactionVO getTransactionByMemberId(int member_id) {
//        return taxMapper.getTransactionByMemberId(member_id);
//    }
//
//
//    @Override
//    public DeductionResultVO  calculateAdditionalDeduction(int member_id) {
//        TaxInfoVO taxInfo = taxMapper.getTaxInfoByMemberId(member_id);
//        TransactionVO transaction = taxMapper.getTransactionByMemberId(member_id);
//
//        double creditDeductible = 0, debitDeductible = 0, cashDeductible = 0;
//        double creditDeduction = 0;
//        double debitDeduction = 0;
//        double cashDeduction = 0;
//        double basicDeduction = 0;
//        double additionalDeduction = 0;
//        double totalDeduction = 0;
//        double reducing_tax = 0;
//
//        // 합산금액
//        double creditTotal = transaction.getCredit_total();
//        double debitTotal = transaction.getDebit_total();
//        double cashTotal = transaction.getCash_total();
//        double cultureTotal = transaction.getCulture_total();
//        double marketTotal = transaction.getMarket_total();
//        double transportTotal = transaction.getTransport_total();
//
//        // 공제전 계산금액
//        double totalIncome = taxInfo.getTotal_income();
//        double minimumAmount = taxInfo.getMinimum_amount();
//        double deduction_rate = taxInfo.getDeduction_rate();
//        double basicLimit = taxInfo.getBasic_limit();
//        double additionalLimit = taxInfo.getAdditional_limit();
//
//        // 전체 공제가능액
//        double totalDeductible = creditTotal * 0.15 + (debitTotal + cashTotal + cultureTotal) * 0.3 + ((marketTotal + transportTotal) * 0.4);
//        // 공제 제외액
//        double except1 = minimumAmount * 0.15;
//        double except2 =  creditTotal * 0.15 + (minimumAmount - creditTotal) * 0.3;
//        double except3 = creditTotal * 0.15 + (debitTotal + cashTotal + cultureTotal) * 0.3 + (minimumAmount - creditTotal - debitTotal - cashTotal - cultureTotal) * 0.4;
//
//        // 추가공제가능액(additional deductible) 계산
//        double result1 = 0;
//        double result2 = 0;
//        double result3 = 0;
//
//        // 공제가능액 result 계산
//
////        result 1)
//        result1 = (creditTotal)*0.15+(debitTotal+cashTotal+cultureTotal)*0.3+(marketTotal+transportTotal)*0.4 - minimumAmount*0.15;
//
////        result 2)
//        result2 = (debitTotal+cashTotal+cultureTotal)*0.3+(marketTotal+transportTotal)*0.4 - (minimumAmount-creditTotal)*0.3;
//
////        result 3)
//        result3 = (marketTotal+transportTotal)*0.4 - ((minimumAmount-creditTotal-debitTotal-cashTotal-cultureTotal))*0.4;
//
//
//
//        result1 = totalDeductible - except1;
//        if (result1 < 0) {
//            result1 = 0;
//        }
//        result2 = totalDeductible - except2;
//        if (result2 < 0) {
//            result2 = 0;
//        }
//        result3 = totalDeductible - except3;
//        if (result3 < 0) {
//            result3 = 0;
//        }
//
//        // 추가 공제액 계산 로직
//        double tempMin;
//        if (totalIncome <= 70000000) {
//            if (minimumAmount <= creditTotal + debitTotal + cashTotal) {
//                additionalDeduction = Math.min((cultureTotal * 0.3 + marketTotal * 0.4 + transportTotal * 0.4), additionalLimit);
//            } else if (creditTotal + debitTotal + cashTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + cultureTotal) {
//                tempMin = Math.min(result2, (cultureTotal * 0.3 + marketTotal * 0.4 + transportTotal * 0.4));
//                additionalDeduction = Math.min(tempMin, additionalLimit);
//            } else if (creditTotal + debitTotal + cashTotal + cultureTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + cultureTotal + marketTotal + transportTotal) {
//                tempMin = Math.min(result3, (cultureTotal * 0.3 + marketTotal * 0.4 + transportTotal * 0.4));
//                additionalDeduction = Math.min(tempMin, additionalLimit);
//            }
//        } else {
//            if (minimumAmount <= creditTotal + debitTotal + cashTotal) {
//                additionalDeduction = Math.min((cultureTotal * 0.3 + marketTotal * 0.4 + transportTotal * 0.4), additionalLimit);
//            } else if (creditTotal + debitTotal + cashTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + cultureTotal) {
//                tempMin = Math.min(result2, (marketTotal * 0.4 + transportTotal * 0.4));
//                additionalDeduction = Math.min(tempMin, additionalLimit);
//            } else if (creditTotal + debitTotal + cashTotal + cultureTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + cultureTotal + marketTotal + transportTotal) {
//                tempMin = Math.min(result3, (marketTotal * 0.4 + transportTotal * 0.4));
//                additionalDeduction = Math.min(tempMin, additionalLimit);
//            }
//        }
//
//
//
//
//        // 기본공제액
//        if (creditTotal >= minimumAmount) {
//            creditDeductible = creditTotal - minimumAmount;
//            debitDeductible = debitTotal;
//            cashDeductible = cashTotal;
//
//            creditDeduction = Math.min(creditDeductible * 0.15, basicLimit);
//            debitDeduction = Math.min(debitDeductible * 0.3, basicLimit - creditDeduction);
//            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit - creditDeduction - debitDeduction);
//
//            basicDeduction = creditDeduction + debitDeduction + cashDeduction;
//
//        } else if (minimumAmount <= (creditTotal + debitTotal)) {
//            creditDeductible = 0;
//            debitDeductible = (debitTotal + creditTotal) - minimumAmount;
//            cashDeductible = cashTotal;
//
//            creditDeduction = Math.min(creditTotal * 0.15, basicLimit);
//            debitDeduction = Math.min(debitDeductible * 0.3, basicLimit - creditDeduction);
//            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit - creditDeduction - debitDeduction);
//
//            basicDeduction = creditDeduction + debitDeduction + cashDeduction;
//
//        } else if (creditTotal + debitTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal) {
//            creditDeductible = 0;
//            debitDeductible = 0;
//            cashDeductible = (creditTotal + debitTotal + cashTotal) - minimumAmount;
//
//            creditDeduction = Math.min(creditTotal * 0.15, basicLimit);
//            debitDeduction = Math.min(debitTotal * 0.3, basicLimit - creditDeduction);
//            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit - creditDeduction - debitDeduction);
//
//            basicDeduction = creditDeduction + debitDeduction + cashDeduction;
//        }
//
//        totalDeduction = basicDeduction+ additionalDeduction;
//        reducing_tax = totalDeduction * deduction_rate;
//
//        DeductionResultVO resultVO = new DeductionResultVO();
//
//
//        resultVO.setCredit_deductible(creditDeductible);
//        resultVO.setCredit_deduction(creditDeduction);
//        resultVO.setDebit_deductible(debitDeductible);
//        resultVO.setDebit_deduction(debitDeduction);
//        resultVO.setCash_deductible(cashDeductible);
//        resultVO.setCash_deduction(cashDeduction);
//        resultVO.setBasic_deduction(basicDeduction);
//        resultVO.setAdditional_deduction(additionalDeduction);
//        resultVO.setTotal_deduction(totalDeduction);
//        return resultVO;
//    }
//
//}
