package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TaxFormVO;
import com.spring.oneqtax.tax.domain.TotalTaxResultVO;
import org.springframework.stereotype.Service;

@Service
public class TaxFormSerivceImpl implements TaxFormService {


    public TotalTaxResultVO calculateDeductions(TaxFormVO form) {
        TotalTaxResultVO result = new TotalTaxResultVO();

        // 인적공제(소득공제) 계산
        int personalIncomeDeduction = calculatePersonalIncomeDeduction(form);
        result.setPersonal_deduction(personalIncomeDeduction);

        // 자녀공제(세액공제) 계산
        int ChildTaxCredit = calculateChildTaxCredit(form);
        result.setChildren_taxcredit(ChildTaxCredit);
        return result;
    }

    // 인적소득공제
    private int calculatePersonalIncomeDeduction(TaxFormVO form) {
        int total = 0;


        total += "yes".equalsIgnoreCase(form.getSpouseDeduction()) ? 1500000 : 0;
        total += form.getChild() * 1500000;
        total += form.getSiblings() * 1500000;
        total += form.getDirectAncestor() * 1500000;
        total += form.getSenior() * 1000000;
        total += form.getDisability() * 2000000;
        total += "yes".equalsIgnoreCase(form.getWomanDeduction()) ? 1000000 : 0;
        total += "yes".equalsIgnoreCase(form.getSingleParent()) ? 1000000 : 0;
        total = (int) Math.floor(total);

        return total;
    }

    // 자녀관련 세액공제
    private int calculateChildTaxCredit(TaxFormVO form) {
        int total2 = 0;
        int child = form.getChild(); // form 객체에서 child 값을 가져옴

        // 입양자녀 세액공제
        total2 += form.getAdoptedChild() * 1500000;

        // 20세 미만 자녀 세액공제
        switch(child) {
            case 1: total2 += 150000; break;
            case 2: total2 += 300000; break;
            case 3: total2 += 600000; break;
            case 4: total2 += 900000; break;
            case 5: total2 += 1200000; break;
            case 6: total2 += 1500000; break;
        }
        // 입양자녀 + 20세미만 자녀
        total2 = (int) Math.floor(total2);
        return total2;
    }

}