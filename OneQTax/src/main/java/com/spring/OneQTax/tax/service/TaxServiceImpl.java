package com.spring.oneqtax.tax.service;


import com.spring.oneqtax.tax.domain.CardTaxResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaxServiceImpl implements TaxService {


    @Autowired
    private TaxMapper taxMapper;


    @Override
    public TaxInfoVO getTaxInfoByMemberId(int memberId) {
        System.out.println("서비스: " + memberId);
        return taxMapper.getTaxInfoByMemberId(memberId);
    }

    @Override
    public TransactionVO getTransactionByMemberId(int memberId) {
        System.out.println("서비스2: " + memberId);
        return taxMapper.getTransactionByMemberId(memberId);
    }

    @Override
    public CardTaxResultVO processDeductionForMember(int memberId) {
        // TaxInfoVO와 TransactionVO 호출이 누락되어 있어서 다시 추가합니다.
        TaxInfoVO taxInfoVO = taxMapper.getTaxInfoByMemberId(memberId);
        TransactionVO transactionVO = taxMapper.getTransactionByMemberId(memberId);

        try {


            // 기존에 계산한 정보를 가져오는 로직
            CardTaxResultVO existingResult = getDeductionResult(taxInfoVO.getCalculation_id());

            if (existingResult != null) {
                return existingResult;  // 기존의 결과를 반환
            } else {

                // 없을 경우 계산 로직 수행
                CardTaxResultVO result = calculateDeduction(taxInfoVO, transactionVO);

                // 결과를 데이터베이스에 저장
                insertDeductionResult(result, memberId);

                // 저장된 결과를 반환 (또는 저장 당시의 객체를 반환)
                return result;
            }
        } catch (Exception e){
            // 오류를 무시
            e.printStackTrace(); // 또는 로깅 등의 오류 처리
            return null; // 또는 다른 값 또는 예외 처리 로직에 따라 반환
        }
    }


    @Override
    public CardTaxResultVO calculateDeduction(@NotNull TaxInfoVO taxInfo, TransactionVO transaction) {
//        TaxInfoVO taxInfo = taxMapper.getTaxInfoByMemberId(memberId);
//        TransactionVO transaction = taxMapper.getTransactionByMemberId(memberId);

        // 합산금액

        double creditTotal = transaction.getCredit_total();
        double debitTotal = transaction.getDebit_total();
        double cashTotal = transaction.getCash_total();
        double cultureTotal1 = transaction.getCulture_total1();
        double cultureTotal2 = transaction.getCulture_total2();
        double marketTotal1 = transaction.getMarket_total1();
        double marketTotal2 = transaction.getMarket_total2();
        double transportTotal = transaction.getTransport_total();

        // 공제전 계산금액
        double totalIncome = taxInfo.getTotal_income();
        double minimumAmount = taxInfo.getMinimum_amount();
        double deduction_rate = taxInfo.getDeduction_rate();
        double basicLimit = taxInfo.getBasic_limit();
        double additionalLimit = taxInfo.getAdditional_limit();

        // ResultVO에 넣을 변수 초기화
        double creditDeductible = 0;
        double debitDeductible = 0;
        double cashDeductible = 0;
        double creditDeduction = 0;
        double debitDeduction = 0;
        double cashDeduction = 0;
        double basicDeduction = 0;
        double additionalDeduction = 0;
        double totalDeduction = 0;
        double reducing_tax = 0; // 아끼는 세금

        // 임시 추가공제액 계산을 위한 변수 -> ResultVO 추가 여부 미정
        double cultureDeduction = 0;
        double marketDeduction = 0;
        double transportDeduction = 0;

        // 연봉이 7천만원 초과이면 도서문화비 제외
        if (totalIncome > 70000000) {
            cultureTotal1 = 0;
            cultureTotal2 = 0;
        }

        // 전체 공제가능액
        double totalDeductible = creditTotal * 0.15 + (debitTotal + cashTotal + cultureTotal1) * 0.3 + (cultureTotal2 + marketTotal1) * 0.4  + marketTotal2 * 0.5 + transportTotal * 0.8;
        // 공제 제외액
        double except1 = minimumAmount * 0.15;
        double except2 = creditTotal * 0.15 + (minimumAmount - creditTotal) * 0.3;
        double except3 = creditTotal * 0.15 + (debitTotal + cashTotal + (cultureTotal1+cultureTotal2)) * 0.3 +  (minimumAmount - creditTotal - debitTotal - cashTotal - (cultureTotal1+cultureTotal2)) * 0.4;

        // 추가공제가능액(additional deductible) 계산
        double result1 = 0;
        double result2 = 0;
        double result3 = 0;

        // 공제가능금액 result 계산

        //  result 1 : 신용카드금액 >= 최저사용금액
        result1 = totalDeductible - except1;
        //  result 2 : 신용카드 + 체크카드+ 현금영수증 + 도서문화 >= 최저사용금액
        result2 = totalDeductible - except2;
        //  result 3 : 신용카드 + 체크카드+ 현금영수증 + 도서문화 + 전통시장 + 대중교통 >= 최저사용금액
        result3 = totalDeductible - except3;
        // 임시 계산 tempD = 공제가능금액-공제한도 = result1 - basicLimit
        double tempD1 = result1 - basicLimit;
        double tempD2 = result2 - basicLimit;
        double tempD3 = result3 - basicLimit;
        // 만약 tempD 가 음수이면 0으로 초기화
        if (tempD1 < 0){
            tempD1 = 0;
        }
        if (tempD2 < 0){
            tempD2 = 0;
        }
        if (tempD3 < 0){
            tempD3 = 0;
        }
        // Math.min 을 위한 변수. 3가지 이상을 비교해야 할 때, 앞 에 두 개 비교-> tempMin에 저장 + tempMin과 나머지로 다시 비교
        double tempMin = 0;

        // 기본 공제액 & 추가 공제액 계산 1~3번은 기본공제액 각 항목별로 계산 가능, 4~5번은 각 항목별로 계산 불가

        // 1) 신용카드 사용금액이 최저사용금액(총급여*25%)을 넘길 때,

        if (creditTotal >= minimumAmount) {
            creditDeductible = creditTotal - minimumAmount;
            debitDeductible = debitTotal;
            cashDeductible = cashTotal;

            creditDeduction = Math.min(creditDeductible * 0.15, basicLimit);
            debitDeduction = Math.min(debitDeductible * 0.3, basicLimit - creditDeduction);
            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit - creditDeduction - debitDeduction);

            basicDeduction = creditDeduction + debitDeduction + cashDeduction;

            // 추가공제액 연봉이 7천만원 이하 -> additionalLimit이 300
            // 추가공제액 연봉이 7천만원 초과 -> additionalLimit이 200 (db에 저장됨)

            cultureDeduction = Math.min((cultureTotal1 * 0.3 + cultureTotal2 * 0.4), additionalLimit);
            marketDeduction = Math.min((marketTotal1 * 0.4 + marketTotal2 * 0.5), additionalLimit - cultureDeduction);
            transportDeduction = Math.min(transportTotal * 0.8, additionalLimit - cultureDeduction - marketDeduction);

            additionalDeduction = cultureDeduction + marketDeduction + transportDeduction;

            // 2) 신용카드+체크카드 합산금액이 최저사용금액을 넘길 때
        } else if (minimumAmount <= (creditTotal + debitTotal)) {
            creditDeductible = 0;
            debitDeductible = debitTotal - minimumAmount;
            cashDeductible = cashTotal;

            creditDeduction = 0;
            debitDeduction = Math.min(debitDeductible * 0.3, basicLimit);
            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit - debitDeduction);

            basicDeduction = creditDeduction + debitDeduction + cashDeduction;

            // 추가공제액 계산
            cultureDeduction = Math.min((cultureTotal1 * 0.3 + cultureTotal2 * 0.4), additionalLimit);
            marketDeduction = Math.min(debitTotal * 0.4, additionalLimit - cultureDeduction);
            transportDeduction = Math.min(cashTotal * 0.8, additionalLimit - cultureDeduction - marketDeduction);

            additionalDeduction = cultureDeduction + marketDeduction + transportDeduction;

            // 3) 기본공제(신카+체카+현금영수증) 항목 합산금액이 최저사용금액을 넘길 때
        } else if (creditTotal + debitTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal) {
            creditDeductible = 0;
            debitDeductible = 0;
            cashDeductible = cashTotal - minimumAmount;

            creditDeduction = 0;
            debitDeduction = 0;
            cashDeduction = Math.min(cashDeductible * 0.3, basicLimit);

            basicDeduction = creditDeduction + debitDeduction + cashDeduction;

            // 추가공제액 계산
            cultureDeduction = Math.min((cultureTotal1 * 0.3 + cultureTotal2 * 0.4), additionalLimit);
            marketDeduction = Math.min(debitTotal * 0.4, additionalLimit - cultureDeduction);
            transportDeduction = Math.min(cashTotal * 0.8, additionalLimit - cultureDeduction - marketDeduction);

            additionalDeduction = cultureDeduction + marketDeduction + transportDeduction;

            // 4) 기본공제 항목 + 도서문화 항목 합산금액이 최저사용금액을 넘길 때 (항목별 계산 불가)
        } else if (creditTotal + debitTotal + cashTotal < minimumAmount && minimumAmount <= creditTotal + debitTotal + cashTotal + (cultureTotal1 + cultureTotal2)) {
            creditDeductible = 0;
            debitDeductible = 0;
            cashDeductible = 0;

            basicDeduction = Math.min(result2, basicLimit);

            // 추가공제액 계산
            tempMin = Math.min(tempD2, (cultureTotal1 * 0.3 + (cultureTotal2 + marketTotal1) * 0.4 + marketTotal2 * 0.5 + transportTotal * 0.8));
            additionalDeduction = Math.min(tempMin, additionalLimit);

            // 5) 모든 항목을 다 합친 금액이 최저사용금액을 넘길 때 (항목별 계산불가)
        } else {
            creditDeductible = 0;
            debitDeductible = 0;
            cashDeductible = 0;

            basicDeduction = Math.min(result3, basicLimit);

            // 추가공제액 계산
            tempMin = Math.min(tempD3, (cultureTotal1 * 0.3 + (cultureTotal2 + marketTotal1) * 0.4 + marketTotal2 * 0.5 + transportTotal * 0.8));
            additionalDeduction = Math.min(tempMin, additionalLimit);
        }

        // 전체 공제금액
        totalDeduction = basicDeduction + additionalDeduction;
        // 아끼는 세금 = 전체공제금액 * 세금공제율
        reducing_tax = totalDeduction * deduction_rate;

        CardTaxResultVO resultVO = new CardTaxResultVO();

        totalDeduction = (totalDeduction <= 0) ? 0 : totalDeduction;
        reducing_tax = (reducing_tax <= 0) ? 0 : reducing_tax;

        resultVO.setCalculation_id(taxInfo.getCalculation_id());  // 이 부분 추가
        resultVO.setCredit_deductible(creditDeductible);
        resultVO.setCredit_deduction(creditDeduction);
        resultVO.setDebit_deductible(debitDeductible);
        resultVO.setDebit_deduction(debitDeduction);
        resultVO.setCash_deductible(cashDeductible);
        resultVO.setCash_deduction(cashDeduction);
        resultVO.setBasic_deduction(basicDeduction);
        resultVO.setAdditional_deduction(additionalDeduction);
        resultVO.setTotal_deduction(totalDeduction);
        resultVO.setReducing_tax(reducing_tax);
        return resultVO;
    }




    public void insertDeductionResult(CardTaxResultVO result, int memberId) {
        // TransactionVO에서 total_id를 가져오기
        TaxInfoVO taxInfoVO = taxMapper.getTaxInfoByMemberId(memberId);
        TransactionVO transactionVO = taxMapper.getTransactionByMemberId(memberId);

        if (transactionVO != null) {
            result.setCalculation_id(taxInfoVO.getCalculation_id());
            result.setTotal_id(transactionVO.getTotal_id());
        }
        // DeductionResultVO를 데이터베이스에 저장
        taxMapper.insertDeductionResult(result);
    }

    @Override
    public CardTaxResultVO getDeductionResult(int memberId) {
        return taxMapper.getDeductionResult(memberId);
    }
}
