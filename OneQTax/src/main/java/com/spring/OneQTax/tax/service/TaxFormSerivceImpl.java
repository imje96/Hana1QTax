package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TaxFormResultVO;
import com.spring.oneqtax.tax.domain.TaxFormVO;
import org.springframework.stereotype.Service;

@Service
public class TaxFormSerivceImpl implements TaxFormService {


    public TaxFormResultVO calculatePersonalDeductions(TaxFormVO form) {
        TaxFormResultVO formResult = new TaxFormResultVO();

        // 사용자가 설정한 총급여2 추가
        formResult.setTotal_income2(form.getTotalIncome());
        // 인적공제(소득공제) 계산
        int personalIncomeDeduction = calculatePersonalIncomeDeduction(form);
        formResult.setPersonal_deduction(personalIncomeDeduction);

        // 자녀공제(세액공제) 계산
        int ChildTaxCredit = calculateChildTaxCredit(form);
        formResult.setChildren_taxcredit(ChildTaxCredit);

        // 근로소득공제 계산
        int IncomeDeduction = calculateIncomeDeduction(form);
        formResult.setIncome_deduction(IncomeDeduction);

        return formResult;
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

    // 근로소득공제
    private int calculateIncomeDeduction(TaxFormVO form) {
        int total3 = 0;
        int totalIncome = form.getTotalIncome();

        if (totalIncome <= 5000000) {
            total3 = (int) Math.floor(totalIncome * 0.7);
        } else if (totalIncome <= 15000000) {
            total3 = (int)Math.floor((totalIncome - 5000000) * 0.4 + 3500000);
        } else if (totalIncome <= 45000000) {
            total3 = (int)Math.floor((totalIncome - 15000000) * 0.15 + 7500000);
        } else if (totalIncome <= 100000000) {
            total3 = (int)Math.floor((totalIncome - 45000000) * 0.05 + 12000000);
        } else {
            total3 = (int)Math.floor((totalIncome - 100000000) * 0.02 + 14750000);
        }

        return total3;
    }
}

