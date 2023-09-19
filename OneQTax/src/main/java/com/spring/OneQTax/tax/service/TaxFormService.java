package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.*;
import org.springframework.stereotype.Service;


public interface TaxFormService {
    public TotalInfoVO calculateForm(TaxFormVO form, CardTaxResultVO cardResult);

}
