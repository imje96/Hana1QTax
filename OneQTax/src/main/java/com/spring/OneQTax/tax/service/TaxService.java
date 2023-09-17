package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TaxResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;

public interface TaxService {

    TaxInfoVO getTaxInfoByMemberId(int memberId);
    public TransactionVO getTransactionByMemberId(int memberId);

    TaxResultVO processDeductionForMember(int memberId);

    TaxResultVO calculateDeduction(TaxInfoVO taxInfo, TransactionVO transaction);

    void insertDeductionResult(TaxResultVO result, int memberId);

    TaxResultVO getDeductionResult(int memberId);
}
