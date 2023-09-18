package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.TaxFormResultVO;
import com.spring.oneqtax.tax.domain.TaxFormVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TotalInfoVO;
import org.springframework.stereotype.Service;

@Service
public class TaxFormSerivceImpl implements TaxFormService {


    public TotalInfoVO calculateForm(TaxFormVO form) {
        TotalInfoVO totalInfo = new TotalInfoVO();

        int totalIncome = form.getTotalIncome();

        totalInfo.setTotal_income2(totalIncome);
        // 근로소득공제
        totalInfo.setIncome_deduction(calculateIncomeDeduction(form));
        // 근로소득금액
        totalInfo.setIncome_amount(totalIncome-calculateIncomeDeduction(form));

        int personalIncomeDeduction = calculateAndSetPersonalIncomeDeduction(form, totalInfo);
        totalInfo.setPersonal_deduction(personalIncomeDeduction);

        totalInfo.setChildren_taxcredit(calculateChildTaxCredit(form));

        totalInfo.setPension_deduction(calculatePensionDeduction(form));
        totalInfo.setHealth_insurance((int) Math.floor(totalIncome * 0.04));
        totalInfo.setEmployment_insurance((int) Math.floor(totalIncome * 0.009));
        totalInfo.setNational_pension((int) Math.floor(totalIncome * 0.045));

        return totalInfo;
    }


    // 인적소득공제
    private int calculateAndSetPersonalIncomeDeduction(TaxFormVO form, TotalInfoVO totalInfo) {
        int totalDeduction = 0;

        int basic = 1500000;
        totalInfo.setBasic_deduction(basic);
//        totalInfo
        totalDeduction += basic;

        int spouseDeduction = "yes".equalsIgnoreCase(form.getSpouseDeduction()) ? 1500000 : 0;
        totalInfo.setSpouse_deduction(spouseDeduction);
        totalDeduction += spouseDeduction;

        int childDeduction = form.getChild() * 1500000;
        totalInfo.setChildren_deduction(childDeduction);
        totalDeduction += childDeduction;

        int siblingsDeduction = form.getSiblings() * 1500000;
        totalInfo.setSiblings_deduction(siblingsDeduction);
        totalDeduction += siblingsDeduction;

        int directAncestorDeduction = form.getDirectAncestor() * 1500000;
        totalInfo.setDirectAnc_deduction(directAncestorDeduction);
        totalDeduction += directAncestorDeduction;

        int seniorDeduction = form.getSenior() * 1000000;
        totalInfo.setSenior_deduction(seniorDeduction);
        totalDeduction += seniorDeduction;

        int disabilityDeduction = form.getDisability() * 2000000;
        totalInfo.setDisability_deduction(disabilityDeduction);
        totalDeduction += disabilityDeduction;

        int womanDeduction = "yes".equalsIgnoreCase(form.getWomanDeduction()) ? 1000000 : 0;
        totalInfo.setWoman_deduction(womanDeduction);
        totalDeduction += womanDeduction;

        int singleParentDeduction = "yes".equalsIgnoreCase(form.getSingleParent()) ? 1000000 : 0;
        totalInfo.setSingleParent_deduction(singleParentDeduction);
        totalDeduction += singleParentDeduction;

        return totalDeduction;
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
        return (int) Math.floor(total2);
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

    // 연금보험료 소득공제
    private int calculatePensionDeduction(TaxFormVO form){
        int totalIncome = form.getTotalIncome();

        return (int) Math.floor(totalIncome * 0.04) +
                (int) Math.floor(totalIncome * 0.009) +
                (int) Math.floor(totalIncome * 0.045);
    }
}

