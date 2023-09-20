package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.*;


public interface TaxFormService {
    public TotalInfoVO calculateForm(TaxFormVO form, CardTaxResultVO cardResult);

//    public TotalInfoVO calculateDetailDeduction(NewDetailVO newDetail, TotalInfoVO totalInfo);

}
