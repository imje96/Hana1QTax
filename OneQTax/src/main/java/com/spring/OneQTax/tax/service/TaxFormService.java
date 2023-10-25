package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.*;


public interface TaxFormService {
    public TotalInfoVO calculateForm(TotalInfoVO totalInfo, TaxFormVO taxForm, CardTaxResultVO cardResult);

    void saveForm(TotalInfoVO totalInfo);

    TotalInfoVO updateForm(TotalInfoVO totalInfo, BigDTO bigDTO, CardTaxResultVO cardResult);

    TotalInfoVO getTotalInfoByCalcId(int calculationId);

    TotalTaxResultVO getTotalResultByTotalMemberId(int memberId);
}
