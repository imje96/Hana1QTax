package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TaxInfoVO;

public interface TaxService {

    TaxInfoVO getTaxInfoByMemberId(int member_id);
}
