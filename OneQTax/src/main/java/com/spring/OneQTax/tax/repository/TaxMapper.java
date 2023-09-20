package com.spring.oneqtax.tax.repository;

import com.spring.oneqtax.tax.domain.CardTaxResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TotalInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TaxMapper {

//    List<TaxInfoVO> getAllTaxInfo();

    TaxInfoVO getTaxInfoByMemberId(int memberId);

    TransactionVO getTransactionByMemberId(int memberId);

    // 공제계산결과를 저장
    void insertDeductionResult(CardTaxResultVO result);

    // 저장된 공제계산결과를 출력  // 연말정산에서 카드소득공제 계산결과 가져오기
    CardTaxResultVO getDeductionResult(int memberId);



    // 전체 연말정산 중 연금보험 조회 및 업데이트
    TotalInfoVO selectTotalInfoById(int memberId);

    void updateTotalInfo(TotalInfoVO totalInfo);
}
