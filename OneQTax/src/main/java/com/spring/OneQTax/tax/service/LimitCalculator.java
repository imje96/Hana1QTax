//package com.spring.oneqtax.tax.service;
//
//import com.spring.oneqtax.tax.domain.TaxInfoVO;
//import org.jetbrains.annotations.NotNull;
//
//import java.math.BigDecimal;
//
//public class LimitCalculator {
//    public void calculateLimits(TaxInfoVO taxInfo) {
//        long totalIncome = taxInfo.getTotal_income();
//        long basicLimit = calculateBasicLimit(totalIncome);
//        long additionalLimit = calculateAdditionalLimit(totalIncome);
//        taxInfo.setBasic_limit(basicLimit);
//        taxInfo.setAdditional_limit(additionalLimit);
//    }
//
//    private BigDecimal calculateBasicLimit(long totalIncome) {
//        if (totalIncome.compareTo(new long("15000000")) < 0) {
//            return new BigDecimal(Math.round(totalIncome.doubleValue() * 0.2));
//        } else if (totalIncome.compareTo(new BigDecimal("70000000")) <= 0) {
//            return new BigDecimal("3000000");
//        } else if (totalIncome.compareTo(new BigDecimal("120000000")) <= 0) {
//            return new BigDecimal("2500000");
//        } else {
//            return new BigDecimal("2000000");
//        }
//    }
//
//    private BigDecimal calculateAdditionalLimit(BigDecimal totalIncome) {
//        if (totalIncome.compareTo(new BigDecimal("15000000")) < 0) {
//            return new BigDecimal("3000000");
//        } else {
//            return new BigDecimal("2000000");
//        }
//    }
//
//}
////
////    public void calculateLimits(@NotNull TaxInfoVO taxInfo) {
////        BigDecimal totalIncome = taxInfo.getTotal_income();
////
////        BigDecimal basicLimit;
////        BigDecimal additionalLimit;
////
////        if (totalIncome < 15000000) {
////            basicLimit = totalIncome * 0.2;
////            additionalLimit = 3000000;
////        } else if (totalIncome <= 70000000) {
////            basicLimit = 3000000;
////            additionalLimit = 3000000;
////        } else if (totalIncome <= 120000000) {
////            basicLimit = 2500000;
////            additionalLimit = 2000000;
////        } else {
////            basicLimit = 2000000;
////            additionalLimit = 2000000;
////        }
////
////        taxInfo.setBasic_limit(basicLimit);
////        taxInfo.setAdditional_limit(additionalLimit);
////    }
//
