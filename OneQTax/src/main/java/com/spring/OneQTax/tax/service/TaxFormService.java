package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TaxFormResultVO;
import com.spring.oneqtax.tax.domain.TaxFormVO;
import com.spring.oneqtax.tax.domain.TotalTaxResultVO;
import org.springframework.stereotype.Service;


public interface TaxFormService {
    public TaxFormResultVO calculatePersonalDeductions(TaxFormVO taxFormVO);

}
