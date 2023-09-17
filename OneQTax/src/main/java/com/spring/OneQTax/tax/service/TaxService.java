package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.CardTaxResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;

public interface TaxService {

    TaxInfoVO getTaxInfoByMemberId(int memberId);
    public TransactionVO getTransactionByMemberId(int memberId);

    CardTaxResultVO processDeductionForMember(int memberId);

    CardTaxResultVO calculateDeduction(TaxInfoVO taxInfo, TransactionVO transaction);

    void insertDeductionResult(CardTaxResultVO result, int memberId);

    CardTaxResultVO getDeductionResult(int memberId);
}
