package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TaxFormResultVO;
import com.spring.oneqtax.tax.domain.TotalInfoVO;
import com.spring.oneqtax.tax.domain.TotalTaxResultVO;

public interface TotalTaxService {

//        public TotalInfoVO updateTotalInfo(TotalInfoVO totalInfoVO, double totalIncome);

//    public TotalInfoVO getTotalInfoById(int member_id);
//

    public TotalTaxResultVO calculateTotalDeductions(TaxFormResultVO formResult, TotalInfoVO totalInfo);
}