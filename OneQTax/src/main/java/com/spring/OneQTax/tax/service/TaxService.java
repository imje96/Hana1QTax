package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.DeductionResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;

public interface TaxService {

    TaxInfoVO getTaxInfoByMemberId(int memberId);
    public TransactionVO getTransactionByMemberId(int memberId);

    DeductionResultVO processDeductionForMember(int memberId);

    DeductionResultVO calculateDeduction(TaxInfoVO taxInfo, TransactionVO transaction);

    void insertDeductionResult(DeductionResultVO result, int memberId);

    DeductionResultVO getDeductionResult(int memberId);
}