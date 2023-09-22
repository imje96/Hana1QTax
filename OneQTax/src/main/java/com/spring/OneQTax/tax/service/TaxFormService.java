package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.*;


public interface TaxFormService {
    public TotalInfoVO calculateForm(TaxFormVO taxForm, CardTaxResultVO cardResult);

    void saveForm(TotalInfoVO totalInfo);
    TotalInfoVO updateForm(TaxFormVO taxForm, TotalInfoVO totalInfo, CardTaxResultVO cardResult);

//    void updateAndSaveForm(TotalInfoVO totalInfo);

    TotalInfoVO getTotalInfoByCalcId(int calculationId);

//    public TotalInfoVO calculateDetailDeduction(NewDetailVO newDetail, TotalInfoVO totalInfo);

  TotalTaxResultVO getTotalResultByTotalMemberId(int memberId);
}
