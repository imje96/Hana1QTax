package com.spring.oneqtax.tax.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.tax.domain.*;
import com.spring.oneqtax.tax.service.TaxFormService;
import com.spring.oneqtax.tax.service.TaxService;
import com.spring.oneqtax.tax.service.TotalTaxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class TaxController {

    @Autowired
    private TotalTaxService totalTaxService;
    @Autowired
    private TaxFormService taxFormService;
//    @Autowired
//    private TotalTaxService totalTaxService;
    private final TaxService taxService;
    // ObjectMapper 인스턴스 생성
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    public TaxController(TaxService taxService) {
        this.taxService = taxService;
    }


    @GetMapping("/taxInfo")
    public String calculation(HttpSession session, Model model) {

        MemberVO currentUser = (MemberVO) session.getAttribute("currentUser");

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }

        System.out.println(currentUser);

        int memberId = currentUser.getMember_id();
        System.out.println("id " + memberId);

        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
        TransactionVO transactionVO = taxService.getTransactionByMemberId(memberId);

        session.setAttribute("CurrentTaxInfo", taxInfoVO);


        System.out.println("서비스결과 (컨트롤러) : " + taxInfoVO);
        System.out.println("서비스결과2 (컨트롤러) : " + transactionVO);

        model.addAttribute("taxInfo", taxInfoVO);
        model.addAttribute("transaction", transactionVO);

        return "tax/taxInfo";
    }


    // 소득공제 안내 페이지 taxMain으로 이동
    @GetMapping("/taxMain")
    public String taxMain(HttpSession session, Model model) {

        MemberVO currentUser = (MemberVO) session.getAttribute("currentUser");

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }

        return "tax/taxMain";
    }

    // 가장 최근의 계산결과 가져오기
    @GetMapping("/getLatestDeductionResult")
    public String getLatestDeductionResult(HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // total_income 가져오기
        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
        double totalIncome = taxInfoVO.getTotal_income();

        TransactionVO transaction = taxService.getTransactionByMemberId(memberId);
        CardTaxResultVO result = taxService.getDeductionResult(memberId);

        // Transform the VO objects
//        DeductionResultVO2 transformedTransaction = transformTransaction(transaction);
//        DeductionResultVO2 transformedResult = transformDeductionResult(result);
//

//        추가
        double total1 = (totalIncome > 70000000) ? 4500000 : 6000000;
        double total2 = (totalIncome > 70000000) ? 2500000 : 3000000;

        // 각 항목의 퍼센트를 계산
        double totalDeductions = result.getCredit_deduction() + result.getDebit_deduction() + result.getCash_deduction() + result.getAdditional_deduction();
        double remain_deduction1 = total1 - totalDeductions; // 나머지 금액 계산
        double remain_deduction2 = total2 - result.getBasic_deduction();

        // 그래프를 위한 값

        model.addAttribute("total", (int) total1);
        model.addAttribute("basicTotal", (int) total2);
        model.addAttribute("remainingDeduction", (int) remain_deduction1);
        model.addAttribute("remainingDeduction2", (int) remain_deduction2);

        model.addAttribute("credit_deductible", (int) result.getCredit_deductible());
        model.addAttribute("credit_deduction", (int) result.getCredit_deduction());
        model.addAttribute("debit_deductible", (int) result.getDebit_deductible());
        model.addAttribute("debit_deduction", (int) result.getDebit_deduction());
        model.addAttribute("cash_deductible", (int) result.getCash_deductible());
        model.addAttribute("cash_deduction", (int) result.getCash_deduction());
        model.addAttribute("basic_deduction", (int) result.getBasic_deduction());
        model.addAttribute("additional_deduction", (int) result.getAdditional_deduction());
        model.addAttribute("total_deduction", (int) result.getTotal_deduction());
        model.addAttribute("reducing_tax", (int) result.getReducing_tax());
        model.addAttribute("deduction_date", result.getResult_date());

        model.addAttribute("credit_total", (int) transaction.getCredit_total());
        model.addAttribute("debit_total", (int) transaction.getDebit_total());
        model.addAttribute("cash_total", (int) transaction.getCash_total());
        model.addAttribute("culture_total", (int) transaction.getCulture_total());
        model.addAttribute("market_total", (int) transaction.getMarket_total());
        model.addAttribute("transport_total", (int) transaction.getTransport_total());


        System.out.println("서비스 결과 (컨트롤러): " + result);
        // 모델에 데이터를 추가하여 뷰에서 사용할 수 있도록 함
        model.addAttribute("result", result);
        model.addAttribute("transaction", transaction);
//        return  "tax/taxResult";
        return "tax/taxResult";
    }

    // 공제 계산하기
    @PostMapping("/calculateAndInsertDeduction")
    public ResponseEntity<CardTaxResultVO> calculateAndInsertDeduction(HttpSession session) {
        // member_id 먼저 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED); // 401 Unauthorized 응답
        }

        int memberId = currentUser.getMember_id();


        // calculateDeduction(taxInfo, transaction) 대신 processDeductionForMember(memberId) 호출
        CardTaxResultVO result = taxService.processDeductionForMember(memberId);


        if (result == null) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    // 소비 문턱넘기기 페이지로 이동
    @GetMapping("/taxThreshold")
    public String taxThreshold(HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // total_income 가져오기
        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
        double totalIncome = taxInfoVO.getTotal_income();

        TransactionVO transaction = taxService.getTransactionByMemberId(memberId);
        CardTaxResultVO result = taxService.getDeductionResult(memberId);

        // 기본항목 총합 & 추가항목 총합
        double basicTotal = transaction.getCredit_total() + transaction.getDebit_total() + transaction.getCash_total();
        double additionalTotal = transaction.getCulture_total() + transaction.getMarket_total() + transaction.getTransport_total();
        double transactionTotal = basicTotal + additionalTotal;
        double remainingThreshold = taxInfoVO.getMinimum_amount() - basicTotal;

        // 그래프를 위한 값

        model.addAttribute("credit_total", (int) transaction.getCredit_total());
        model.addAttribute("debit_total", (int) transaction.getDebit_total());
        model.addAttribute("cash_total", (int) transaction.getCash_total());
        model.addAttribute("culture_total", (int) transaction.getCulture_total());
        model.addAttribute("market_total", (int) transaction.getMarket_total());
        model.addAttribute("transport_total", (int) transaction.getTransport_total());
        // 최저사용액
        model.addAttribute("minimum_amount", (int) taxInfoVO.getMinimum_amount());
        model.addAttribute("basicTotal", (int) basicTotal);
        model.addAttribute("additionalTotal", (int) additionalTotal);
        model.addAttribute("transactionTotal", (int) transactionTotal);
        model.addAttribute("remainingThreshold", (int) remainingThreshold);


        model.addAttribute("result", result);
        model.addAttribute("transaction", transaction);

        return "tax/taxThreshold";
    }

    // 세션에서 member_id 가져오기
    private MemberVO getCurrentUser(HttpSession session) {
        return (MemberVO) session.getAttribute("currentUser");
    }

    // 연말정산 계산
    @GetMapping("/taxRefund")
    public String taxRefund(HttpSession session, Model model) {
        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // total_income 가져오기
        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
        double totalIncome = taxInfoVO.getTotal_income();

//        TotalInfoVO totalInfoVO = totalTaxService.getTotalInfoById(memberId);

        model.addAttribute("totalIncome", totalIncome);
//        model.addAttribute("info", totalInfoVO);
        return "tax/taxRefund";
    }

    @GetMapping("/taxCalculator")
    public String taxCalculator(HttpSession session, Model model) {
        return "tax/taxCalculator";
    }

//    @PostMapping(value = "/update", consumes = "application/json", produces = "application/json")
//    public ResponseEntity<?> updateTotalInfo(@RequestBody Map<String, Object> requestData, HttpSession session) {
//        MemberVO currentUser = getCurrentUser(session);
//
//        // 세션에서 사용자를 찾을 수 없으면 로그인 정보 없음을 JSON으로 반환
//        if (currentUser == null) {
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", "User not logged in."));
//        }
//
//        try {
//            // requestData에서 totalInfoVO를 추출하고 TotalInfoVO 객체로 변환
//
//            int memberId = currentUser.getMember_id();
//            TotalInfoVO totalInfoVO = objectMapper.convertValue(requestData.get("totalInfoVO"), TotalInfoVO.class);
//            TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
//            double totalIncome = taxInfoVO.getTotal_income();
//            // requestData에서 totalIncome을 추출하고 double로 변환
//            totalIncome = Double.parseDouble(requestData.get("totalIncome").toString());
//
//            // taxInfoVO에서 calculation_id 가져와서 totalInfoVO에 설정
//            totalInfoVO.setCalculation_id(taxInfoVO.getCalculation_id());
//
//            // updateTotalInfo 메서드를 호출하여 정보를 업데이트
//            // updateTotalInfo 메서드를 호출하여 정보를 업데이트
//            TotalInfoVO updatedVo = totalTaxService.updateTotalInfo(totalInfoVO, totalIncome);
//
//            // 성공적인 응답과 함께 updatedVo 객체 반환
//            return ResponseEntity.ok(Map.of("message", "Update Successful!", "updatedVo", updatedVo, "redirectURL", "/tax/taxRefund"));
//
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", e.getMessage()));
//        }
//    }



//    @PostMapping("/update")
//    public String updateTotalInfo(TotalInfoVO totalInfoVO, Model model, HttpSession session){
//        MemberVO currentUser = getCurrentUser(session);
//        int memberId = currentUser.getMember_id();
//        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
//        double totalIncome = taxInfoVO.getTotal_income();
//        double calculation_id = taxInfoVO.getCalculation_id();
//
//        TotalInfoVO updatedVo = totalTaxService.updateTotalInfo(totalInfoVO, totalIncome);
//
//        model.addAttribute("totalIncome", totalIncome);
//        model.addAttribute("calculation_id", calculation_id);
//        return "/tax/taxRefund";
//    }

    @GetMapping("/taxTest") // form step1~3 호출
    public String taxTest(HttpSession session, Model model){
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // total_income 가져오기
        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
        double totalIncome = taxInfoVO.getTotal_income();

//        TotalInfoVO totalInfoVO = totalTaxService.getTotalInfoById(memberId);
        model.addAttribute("totalIncome", (int)totalIncome);
        return "tax/taxTest";
    }

    @PostMapping("/testResult") // form 제출 시 결과 처리
    public String testResult(@ModelAttribute TaxFormVO taxForm, TotalInfoVO totalInfo, CardTaxResultVO cardResult, HttpSession session, Model model) {
        // taxForm 객체를 사용하여 폼 데이터에 액세스
//        System.out.println("Total Income: " + taxForm.getTotalIncome());
//        System.out.println("Spouse Deduction: " + taxForm.getSpouseDeduction());
//        System.out.println("Child: " + taxForm.getChild());
//        System.out.println("Adopted Child: " + taxForm.getAdoptedChild());
//        System.out.println("Direct Ancestor: " + taxForm.getDirectAncestor());
//        System.out.println("Siblings: " + taxForm.getSiblings());
//        System.out.println("Senior: " + taxForm.getSenior());
//        System.out.println("Disability: " + taxForm.getDisability());
//        System.out.println("Woman Deduction: " + taxForm.getWomanDeduction());
//        System.out.println("Single Parent: " + taxForm.getSingleParent());

        // 서비스를 호출하여 계산 로직 처리
//        TotalTaxResultVO totalResult = taxFormService.calculatePersonalDeductions(taxForm);
        TaxFormResultVO formResult = taxFormService.calculatePersonalDeductions(taxForm);

        // 1차 옵션항목들 계산
        TotalTaxResultVO totalResult = totalTaxService.calculateTotalDeductions(formResult, totalInfo, cardResult);
        // 2차 최종 계산
        totalResult = totalTaxService.calculateFinalDeudctions(totalResult);

        // 결과를 세션 혹은 Model에 저장하여 view에 전달
        session.setAttribute("formResult", formResult); // 세션에 저장하는 경우
        model.addAttribute("formResult", formResult);   // Model에 추가하는 경우 (JSP 등에서 사용)
        model.addAttribute("totalResult", totalResult);

        return "tax/testResult";
    }



}