package com.spring.oneqtax.tax.repository;

import com.spring.oneqtax.tax.domain.DeductionResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TaxMapper {

//    List<TaxInfoVO> getAllTaxInfo();

    TaxInfoVO getTaxInfoByMemberId(int member_id);

    TransactionVO getTransactionByMemberId(int member_id);

    // 공제계산결과를 저장
    void insertDeductionResult(DeductionResultVO result);

    // 저장된 공제계산결과를 출력
    DeductionResultVO getDeductionResult(int calculationId);
}
