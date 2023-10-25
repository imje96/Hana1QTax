package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.CardTaxResultVO;
import com.spring.oneqtax.tax.domain.TotalInfoVO;
import com.spring.oneqtax.tax.domain.TotalTaxResultVO;

public interface TotalTaxService {

    // 기타 세부항목 계산
    public TotalTaxResultVO calculateTotalDeductions(TotalInfoVO totalInfo, CardTaxResultVO cardResult);

    // 계산결과 저장
    void saveResult(TotalTaxResultVO totalResult);
    // 계산결과 조회
    TotalTaxResultVO getTotalResultByTotalInfoId(int totalInfoId);
    // 계산사전정보 조회
    TotalInfoVO getTotalInfoByMemberId(int memberId);
}