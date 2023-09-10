package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.DeductionResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;

public interface TaxService {

    TaxInfoVO getTaxInfoByMemberId(int member_id);
    TransactionVO getTransactionByMemberId(int member_id);


    DeductionResultVO processDeductionForMember(int memberId);

    DeductionResultVO calculateDeduction(TaxInfoVO taxInfo, TransactionVO transaction);

    void insertDeductionResult(DeductionResultVO result);

    DeductionResultVO getDeductionResult(int calculationId);
}
