package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TotalInfoVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class TotalTaxServiceImpl implements TotalTaxService {

    @Autowired
    private TaxMapper mapper;
    public TotalInfoVO getTotalInfoById(int memberId) {

        return mapper.selectTotalInfoById(memberId);
    }

    public TotalInfoVO updateTotalInfo(TotalInfoVO totalInfoVO, double totalIncome) {
        totalInfoVO.setHealth_insurance(totalIncome * 0.04);
        totalInfoVO.setEmployment_insurance(totalIncome * 0.009);
        totalInfoVO.setNational_pension(totalIncome * 0.045);
        // 추가 계산 로직을 필요에 따라 추가

        mapper.updateTotalInfo(totalInfoVO);

        return totalInfoVO;
    }
}
