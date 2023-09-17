package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TotalInfoVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public interface TotalTaxService {

        public TotalInfoVO updateTotalInfo(TotalInfoVO totalInfoVO, double totalIncome);

        public TotalInfoVO getTotalInfoById(int member_id);
    }

