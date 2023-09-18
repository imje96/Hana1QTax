package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.CardTaxResultVO;
import com.spring.oneqtax.tax.domain.TaxFormResultVO;
import com.spring.oneqtax.tax.domain.TotalInfoVO;
import com.spring.oneqtax.tax.domain.TotalTaxResultVO;

public interface TotalTaxService {

//        public TotalInfoVO updateTotalInfo(TotalInfoVO totalInfoVO, double totalIncome);

//    public TotalInfoVO getTotalInfoById(int member_id);
//
    // 기타 세부항목 계산
    public TotalTaxResultVO calculateTotalDeductions(TotalInfoVO totalInfo, CardTaxResultVO cardResult);

    // 최종계산
//    public TotalTaxResultVO calculateFinalDeudctions(TotalTaxResultVO totalResult);
}