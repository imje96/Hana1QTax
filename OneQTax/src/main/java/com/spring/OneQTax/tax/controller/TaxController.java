package com.spring.oneqtax.tax.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import com.spring.oneqtax.naverSMS.SmsService;
import com.spring.oneqtax.tax.domain.*;
import com.spring.oneqtax.tax.service.SpouseService;
import com.spring.oneqtax.tax.service.TaxFormService;
import com.spring.oneqtax.tax.service.TaxService;
import com.spring.oneqtax.tax.service.TotalTaxService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class TaxController {

    @Autowired
    private TotalTaxService totalTaxService;
    @Autowired
    private TaxFormService taxFormService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private SpouseService spouseService;
    @Autowired
    private SmsService smsService;



    @Autowired
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
        double minimumAmount = taxInfoVO.getMinimum_amount();

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

        model.addAttribute("minimumAmount", (int)minimumAmount);

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
//       여기
        model.addAttribute("total_deduction", (int) result.getTotal_deduction());
        model.addAttribute("reducing_tax", (int) result.getReducing_tax());
        model.addAttribute("deduction_date", result.getResult_date());

        model.addAttribute("credit_total", (int) transaction.getCredit_total());
        model.addAttribute("debit_total", (int) transaction.getDebit_total());
        model.addAttribute("cash_total", (int) transaction.getCash_total());
        model.addAttribute("culture_total", (int) (transaction.getCulture_total1()+transaction.getCulture_total2()));
        model.addAttribute("market_total", (int) (transaction.getMarket_total1()+transaction.getMarket_total2()));
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
    public String calculateAndInsertDeduction(HttpSession session, RedirectAttributes redirectAttributes) {
        // member_id 먼저 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 로그인이 되어있지 않으면 로그인 페이지로 리디렉션
            return "redirect:/login"; // 로그인 페이지 URL로 리디렉션
        }

        int memberId = currentUser.getMember_id();

        // calculateDeduction(taxInfo, transaction) 대신 processDeductionForMember(memberId) 호출
        CardTaxResultVO result = taxService.processDeductionForMember(memberId);

        if (result == null) {
            // 오류 발생 시 오류 페이지로 리디렉션
            return "redirect:/error"; // 오류 페이지 URL로 리디렉션
        }

        // 다른 JSP 페이지로 리디렉션
        return "tax/taxInfo"; // 이동하려는 JSP 페이지 URL로 리디렉션
    }

    // 스케줄링으로 매일 카드소득공제 계산을 실행하기

    // 새로고침으로 공제 계산하기
    @GetMapping("/calculateAndInsertDeduction")
    public String calculateAndInsertDeduction2(HttpSession session, RedirectAttributes redirectAttributes) {
        // member_id 먼저 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 로그인이 되어있지 않으면 로그인 페이지로 리디렉션
            return "redirect:/login"; // 로그인 페이지 URL로 리디렉션
        }

        int memberId = currentUser.getMember_id();

        // calculateDeduction(taxInfo, transaction) 대신 processDeductionForMember(memberId) 호출
        CardTaxResultVO result = taxService.processDeductionForMember(memberId);

        if (result == null) {
            // 오류 발생 시 오류 페이지로 리디렉션
            return "redirect:/error"; // 오류 페이지 URL로 리디렉션
        }

        // 다른 JSP 페이지로 리디렉션
        return "redirect:/getLatestDeductionResult"; // taxResult 컨트롤러로 이동
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
        double additionalTotal = transaction.getCulture_total1() + transaction.getCulture_total2() + transaction.getMarket_total1() + transaction.getMarket_total2() + transaction.getTransport_total();
        double transactionTotal = basicTotal + additionalTotal;
        double remainingThreshold = taxInfoVO.getMinimum_amount() - basicTotal;

        // 그래프를 위한 값

        model.addAttribute("credit_total", (int) transaction.getCredit_total());
        model.addAttribute("debit_total", (int) transaction.getDebit_total());
        model.addAttribute("cash_total", (int) transaction.getCash_total());
        model.addAttribute("culture_total", (int) (transaction.getCulture_total1()+transaction.getCulture_total2()));
        model.addAttribute("market_total", (int) (transaction.getMarket_total1() + transaction.getMarket_total2()));
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
        return "simulationResult";
    }

    @GetMapping("/taxCalculator")
    public String taxCalculator(HttpSession session, Model model) {
        return "tax/taxCalculator";
    }

    @GetMapping("/simulationMain")
    public String simulaitonMain(HttpSession session, Model model){
        return "tax/simulationMain";
    }


    @PostMapping("/updateDetail")
    @ResponseBody
    public Map<String, Object> updateTotalInfo(@RequestBody BigDTO bigDTO,
                                               TransactionVO transaction,
                                               CardTaxResultVO cardResult,
                                               Model model, HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        MemberVO currentUser = getCurrentUser(session);
        if (currentUser == null) {
            response.put("status", "failure");
            response.put("message", "Not authenticated");
            return response;
        }

        int memberId = currentUser.getMember_id();

        TotalTaxResultVO totalResult = taxFormService.getTotalResultByTotalMemberId(memberId);

        int totalInfoId = totalResult.getTotalInfo_id();

        TotalInfoVO totalInfo = totalTaxService.getTotalInfoByMemberId(memberId);

        System.out.println("아이디값 확인1: " + totalInfoId);
        totalInfo.setTotalInfo_id(totalInfoId);
        System.out.println("아이디값 확인2:" + totalInfo.getTotalInfo_id());
        totalInfo = taxFormService.updateForm(totalInfo, bigDTO, cardResult);
        System.out.println("컨트롤러 update 호출 후: "+totalInfo);



        response.put("status", "success");
        return response;
    }
    // 세부항목 저장 후 2차 계산
    @PostMapping("/saveDetail")
    public String saveTotalInfo(Model model, HttpSession session) {
        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // 기존에 totalInfo를 조회하기
        TotalInfoVO totalInfo = totalTaxService.getTotalInfoByMemberId(memberId);

        CardTaxResultVO cardResult = taxService.getDeductionResult(memberId);
        TransactionVO transaction = taxService.getTransactionByMemberId(memberId);

        System.out.println("테스트 카드소득공제:" +cardResult);
        // 2차 계산
        TotalTaxResultVO totalResult = totalTaxService.calculateTotalDeductions(totalInfo, cardResult);

        System.out.println("2차 계산:"+ totalResult);
        int totalBenefit = totalResult.getTotal_incomeDeduction() + totalResult.getTotal_taxcredit();
        int totalTransaction = (int) (transaction.getCredit_total() + transaction.getDebit_total() + transaction.getCash_total()
                + transaction.getCulture_total1() + transaction.getCulture_total2() + transaction.getMarket_total1() + transaction.getMarket_total2() + transaction.getTransport_total());
        int totalInfo_id = totalResult.getTotalInfo_id();

        totalResult.setTotalInfo_id(totalInfo_id);

        // 계산결과 DB에 저장하기
        totalTaxService.saveResult(totalResult);

        int total_deduction = (int) (totalResult.getCard_deduction());

        // 결과를 세션 혹은 Model에 저장하여 view에 전달
        session.setAttribute("totalResult", totalResult);
        model.addAttribute("totalInfo", totalInfo);   // Model에 추가하는 경우 (JSP 등에서 사용)
        model.addAttribute("cardResult", cardResult);   // Model에 추가하는 경우 (JSP 등에서 사용)
        model.addAttribute("totalResult", totalResult);
        model.addAttribute("totalBenefit", totalBenefit);
        model.addAttribute("transaction", transaction);
        model.addAttribute("totalTransaction", totalTransaction);
        model.addAttribute("total_deduction", (int) cardResult.getTotal_deduction());
        System.out.println(totalResult.getMedical_taxcredit());
        return "tax/simulationResult";
    }


    @GetMapping("/taxSimulation") // form step1~3 호출
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
        return "tax/taxSimulation";
    }

    @PostMapping("/taxSimulation") // form 제출 시 결과 처리
    public String testResult(@ModelAttribute BigDTO bigDTO, TotalInfoVO totalInfo, CardTaxResultVO cardResult, TransactionVO transaction, HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        TaxFormVO taxForm = bigDTO.getTaxFormVO();
        FPensionVO pensionVO = bigDTO.getPensionVO();
        FGuaranteeVO guaranteeVO = bigDTO.getGuaranteeVO();
        FMedicalVO medicalVO = bigDTO.getMedicalVO();

        // total_income 가져오기
        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
        transaction = taxService.getTransactionByMemberId(memberId);
        // 카드소득공제 결과 가져오기

        cardResult = taxService.getDeductionResult(memberId);
        int calculationId = cardResult.getCalculation_id();

//        if (taxForm != null) { // taxForm 정보가 있다면
        // 서비스를 호출하여 계산 로직 처리
        totalInfo = taxFormService.calculateForm(totalInfo, taxForm, cardResult);
        // 계산정보 DB에 저장하기
        taxFormService.saveForm(totalInfo);
//        } else { // taxForm 정보가 없다면
//            totalInfo = taxFormService.getTotalInfoByCalcId(calculationId);
//        }

        // totalInfo 조회하기
        totalInfo = taxFormService.getTotalInfoByCalcId(calculationId);
        // 2차 계산
        TotalTaxResultVO totalResult = totalTaxService.calculateTotalDeductions(totalInfo, cardResult);

        int totalBenefit = totalResult.getTotal_incomeDeduction() + totalResult.getTotal_taxcredit();
        int totalTransaction = (int) (transaction.getCredit_total()+transaction.getDebit_total()+transaction.getCash_total()
                        +transaction.getCulture_total1()+transaction.getCulture_total2()+transaction.getMarket_total1()+transaction.getMarket_total2()+transaction.getTransport_total());
        int totalInfo_id = totalResult.getTotalInfo_id();
        int marketTotal = (int) (transaction.getMarket_total1() + transaction.getMarket_total2());
        int cultureTotal = (int) (transaction.getCulture_total1() + transaction.getCulture_total2());


        totalResult.setTotalInfo_id(totalInfo_id);
        // 계산결과 DB에 저장하기
        totalTaxService.saveResult(totalResult);

        // 결과를 세션 혹은 Model에 저장하여 view에 전달
        session.setAttribute("totalInfo", totalInfo); // 세션에 저장하는 경우
        model.addAttribute("totalInfo", totalInfo);   // Model에 추가하는 경우 (JSP 등에서 사용)
        model.addAttribute("cardResult", cardResult);   // Model에 추가하는 경우 (JSP 등에서 사용)
        model.addAttribute("totalResult", totalResult);
        model.addAttribute("totalBenefit", totalBenefit);
        model.addAttribute("transaction", transaction);
        model.addAttribute("marketTotal", marketTotal);
        model.addAttribute("cultureTotal", cultureTotal);
        model.addAttribute("totalTransaction", totalTransaction);
        model.addAttribute("total_deduction", (int) cardResult.getTotal_deduction());
        return "tax/simulationResult";
    }

// 시뮬레이션 결과만 보기 임시창
    @GetMapping("/simulationResult")
    public String viewSimulationResult(){

        return "tax/simulationDetail";
    }

    @PostMapping("/simulationResult")
    public String viewSimulationResult(HttpSession session, Model model){
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // 세션에서 totalInfo 객체를 가져옴

        CardTaxResultVO cardResult = taxService.getDeductionResult(memberId);
        TransactionVO transaction = taxService.getTransactionByMemberId(memberId);

        TotalTaxResultVO totalResult = taxFormService.getTotalResultByTotalMemberId(memberId);
        TotalInfoVO totalInfo = totalTaxService.getTotalInfoByMemberId(memberId);


        int totalBenefit = totalResult.getTotal_incomeDeduction() + totalResult.getTotal_taxcredit();
        int totalTransaction = (int) (transaction.getCredit_total()+transaction.getDebit_total()+transaction.getCash_total()
                +transaction.getCulture_total1()+transaction.getCulture_total2()+transaction.getMarket_total1()+transaction.getMarket_total2()+transaction.getTransport_total());
        int totalInfo_id = totalResult.getTotalInfo_id();
        int medical_minimum = (int) (totalInfo.getTotal_income2() * 0.03);

        totalResult.setTotalInfo_id(totalInfo_id);
        // 계산결과 DB에 저장하기
        totalTaxService.saveResult(totalResult);

        // 결과를 세션 혹은 Model에 저장하여 view에 전달
        session.setAttribute("totalResult", totalResult);
        model.addAttribute("totalInfo", totalInfo);   // Model에 추가하는 경우 (JSP 등에서 사용)
        model.addAttribute("cardResult", cardResult);   // Model에 추가하는 경우 (JSP 등에서 사용)
        model.addAttribute("totalResult", totalResult);
        model.addAttribute("totalBenefit", totalBenefit);
        model.addAttribute("transaction", transaction);
        model.addAttribute("totalTransaction", totalTransaction);
        model.addAttribute("total_deduction", (int) cardResult.getTotal_deduction());
        model.addAttribute("medical_minimum", medical_minimum);

        return "tax/simulationResult";
    }


    /* 배우자 공제 공유 기능 */

    @GetMapping("/spouseAdd")
    public String addFriendForm() {
        return "tax/spouseInvite";
    }

    @PostMapping("/spouseInvite")
    public String addFriend(@RequestParam String spouseEmail, HttpSession session, RedirectAttributes redirectAttributes) {
        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }

        MemberVO spouse = memberService.getMemberByEmail(spouseEmail);
        if (spouse == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "찾으시는 회원이 조회되지 않습니다.");
            return "redirect:/spouseAdd";
        }

        SpouseRelationVO spouseRelation = new SpouseRelationVO();
        spouseRelation.setMember_id(currentUser.getMember_id());
        spouseRelation.setSpouse_id(spouse.getMember_id());
        spouseRelation.setStatus("N");

        spouseService.insertSpouseRelation(spouseRelation);
        redirectAttributes.addFlashAttribute("successMessage", "Friend request sent successfully.");

        return "tax/spouseInvite";
    }

    @RestController
    @RequestMapping("/accept")
    public class AcceptController {


        @GetMapping("/getMemberId")
        public ResponseEntity<Map<String, Integer>> getMemberId(HttpSession session) {
            Map<String, Integer> response = new HashMap<>();

            MemberVO currentUser = getCurrentUser(session);
            int memberId = currentUser.getMember_id();

            response.put("memberId", memberId);
            return new ResponseEntity<>(response, HttpStatus.OK);
        }
    }

    @PostMapping("/confirmInvitation/{memberId}")
    public ResponseEntity<String> confirmInvitation(@PathVariable int memberId) {
        try {
            spouseService.acceptInvitation(memberId);

            // 초대를 수락한 후에 문자 메시지를 보내는 로직을 호출
            smsService.checkRelationStatus(memberId);
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } catch(Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Failure", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }



//    @RestController
//    @RequestMapping("/accept")
//    public class AcceptController {

//        @GetMapping("/{memberId}")
//        public ResponseEntity<String> acceptInvitation(@PathVariable int memberId) {
//            try {
//                spouseService.acceptInvitation(memberId);
//                return new ResponseEntity<>("Success", HttpStatus.OK);
//            } catch (Exception e) {
//                e.printStackTrace(); // 오류 메시지를 로그에 출력
//                return new ResponseEntity<>("Failure", HttpStatus.BAD_REQUEST);
//            }
//        }
//
//        @GetMapping("/getMemberId")
//        public ResponseEntity<Map<String, Integer>> getMemberId(HttpSession session) {
//            Map<String, Integer> response = new HashMap<>();
//
//            MemberVO currentUser = getCurrentUser(session);
//            int memberId = currentUser.getMember_id();
//
//            response.put("memberId", memberId);
//            return new ResponseEntity<>(response, HttpStatus.OK);
//        }
//    }
@Controller
@RequestMapping("/accept")
public class AcceptController2 {

    @GetMapping("/{memberId}")
    public String acceptInvitation(HttpSession session, HttpServletRequest request, Model model) {
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            session.setAttribute("dest", request.getRequestURI());
            return "redirect:/login";
        }

        // 로그인 성공 후 원래 방문하려던 페이지로 리다이렉트
        String dest = (String) session.getAttribute("dest");
        if (dest != null) {
            session.removeAttribute("dest");
            return "redirect:" + dest;
        }

        String name = currentUser.getName();
        int memberId = currentUser.getMember_id();

        SpouseRelationVO spouseInfo = spouseService.fingMySpouse(memberId);
        int spouseId = spouseInfo.getSpouse_id();
        MemberVO spouseInfo2 = spouseService.getSpouseName(spouseId);
        String spouseName = spouseInfo2.getName();

        model.addAttribute("name", spouseName);
        model.addAttribute("memberId", memberId);

        return "tax/spouseInvitation";
    }
}

//    @Controller
//    @RequestMapping("/accept")
//    public class AcceptController2 {
//
//        @GetMapping("/{memberId}")
//        public String acceptInvitation(HttpSession session, Model model) {
//            MemberVO currentUser = getCurrentUser(session);
//
//            if (currentUser == null) {
//                // 리다이렉트나 에러 메시지 처리
//                return "redirect:/login";
//            }
//            String name = currentUser.getName();
//            int memberId = currentUser.getMember_id();
//
//            SpouseRelationVO spouseInfo = spouseService.fingMySpouse(memberId);
//            int spouseId = spouseInfo.getSpouse_id();
//            MemberVO spouseInfo2 = spouseService.getSpouseName(spouseId);
//            String spouseName = spouseInfo2.getName();
//
//            model.addAttribute("name", spouseName);
//            model.addAttribute("memberId", memberId);
//            return "tax/spouseInvitation";
//        }
//    }


    @GetMapping("/spouseResult")
    public String getSpouseResult(HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();


        // 배우자 정보 가져오기
        SpouseRelationVO spouseInfo = spouseService.fingMySpouse(memberId);
        int spouseId = spouseInfo.getSpouse_id();
        MemberVO spouseInfo2 = spouseService.getSpouseName(spouseId);
        String spouseName = spouseInfo2.getName();

        model.addAttribute("spouseId",spouseId);
        model.addAttribute("spouseName",spouseName);

        // 본인 total_income 가져오기
        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
        double totalIncome = taxInfoVO.getTotal_income();
        double minimumAmount = taxInfoVO.getMinimum_amount();

        TransactionVO transaction = taxService.getTransactionByMemberId(memberId);
        CardTaxResultVO result = taxService.getDeductionResult(memberId);

        // 배우자 total_income 가져오기
        TaxInfoVO taxInfoVO2 = taxService.getTaxInfoByMemberId(spouseId);
        double totalIncome2 = taxInfoVO2.getTotal_income();
        double minimumAmount2 = taxInfoVO2.getMinimum_amount();

        TransactionVO transaction2 = taxService.getTransactionByMemberId(spouseId);
        CardTaxResultVO result2 = taxService.getDeductionResult(spouseId);


//        추가
        double total1 = (totalIncome > 70000000) ? 4500000 : 6000000;
        double total2 = (totalIncome > 70000000) ? 2500000 : 3000000;

        double total3 = (totalIncome2 > 70000000) ? 4500000 : 6000000;
        double total4 = (totalIncome2 > 70000000) ? 2500000 : 3000000;

        // 각 항목의 퍼센트를 계산
        double totalDeductions = result.getCredit_deduction() + result.getDebit_deduction() + result.getCash_deduction() + result.getAdditional_deduction();
        double remain_deduction1 = total1 - totalDeductions; // 나머지 금액 계산
        double remain_deduction2 = total2 - result.getBasic_deduction();

        double totalDeductions2 = result2.getCredit_deduction() + result2.getDebit_deduction() + result2.getCash_deduction() + result2.getAdditional_deduction();
        double remain_deduction3 = total3 - totalDeductions2; // 나머지 금액 계산
        double remain_deduction4 = total4 - result2.getBasic_deduction();

        // 그래프를 위한 값

        model.addAttribute("minimumAmount", (int)minimumAmount);

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
        model.addAttribute("culture_total", (int) (transaction.getCulture_total1()+transaction.getCulture_total2()));
        model.addAttribute("market_total", (int) (transaction.getMarket_total1()+transaction.getMarket_total2()));
        model.addAttribute("transport_total", (int) transaction.getTransport_total());
        // 배우자 그래프를 위한 값

        model.addAttribute("minimumAmount2", (int)minimumAmount2);

        model.addAttribute("total2", (int) total3);
        model.addAttribute("basicTotal2", (int) total4);
        model.addAttribute("remainingDeduction3", (int) remain_deduction3);
        model.addAttribute("remainingDeduction4", (int) remain_deduction4);

        model.addAttribute("credit_deductible2", (int) result2.getCredit_deductible());
        model.addAttribute("credit_deduction2", (int) result2.getCredit_deduction());
        model.addAttribute("debit_deductible2", (int) result2.getDebit_deductible());
        model.addAttribute("debit_deduction2", (int) result2.getDebit_deduction());
        model.addAttribute("cash_deductible2", (int) result2.getCash_deductible());
        model.addAttribute("cash_deduction2", (int) result2.getCash_deduction());
        model.addAttribute("basic_deduction2", (int) result2.getBasic_deduction());
        model.addAttribute("additional_deduction2", (int) result2.getAdditional_deduction());
        model.addAttribute("total_deduction2", (int) result2.getTotal_deduction());
        model.addAttribute("reducing_tax2", (int) result2.getReducing_tax());
        model.addAttribute("deduction_date2", result2.getResult_date());

        model.addAttribute("credit_total2", (int) transaction2.getCredit_total());
        model.addAttribute("debit_total2", (int) transaction2.getDebit_total());
        model.addAttribute("cash_total2", (int) transaction2.getCash_total());
        model.addAttribute("culture_total2", (int) (transaction2.getCulture_total1()+transaction2.getCulture_total2()));
        model.addAttribute("market_total2", (int) (transaction2.getMarket_total1()+transaction2.getMarket_total2()));
        model.addAttribute("transport_total2", (int) transaction2.getTransport_total());

        System.out.println("서비스 결과 (컨트롤러): " + result);
        // 모델에 데이터를 추가하여 뷰에서 사용할 수 있도록 함
        model.addAttribute("result", result);
        model.addAttribute("transaction", transaction);
//        return  "tax/taxResult";
        return "tax/spouseResult";
    }




    @GetMapping("/spouseAgreement")
    public String groupAgreement() throws Exception {
        return "tax/spouseAdd";
    }
//    초대장 받은 페이지 임시
    @GetMapping("/getSpouseInvitation")
    public String spouseInvitation() throws Exception{
        return "tax/spouseInvitation";
    }

    @GetMapping("/spouseDeductionDetail")
    public String groupAccountDetail() throws Exception {
        return "tax/spouseDeductionDetail";
    }
    @GetMapping("/openedAccount")
    public String openedAccount() throws Exception {
        return "tax/openedAccount";
    }
//    @GetMapping("/spouseInvite")
//    public String groupInvite() throws Exception {
//        return "/tax/spouseInvite";
//    }

    @GetMapping("/myspouse/{memberId}")
    public String myspouse(@PathVariable int memberId, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        session.setAttribute("memberId",memberId);
        return "tax/myspouse";
    }

    @GetMapping("/groupStatement")
    public String groupStatement() throws Exception {
        return "/group/groupStatement";
    }




    //임시 추가
    @GetMapping("/dashboard")
    public String viewDashboard(HttpSession session, Model model){

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
        double minimumAmount = taxInfoVO.getMinimum_amount();

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

        model.addAttribute("minimumAmount", (int)minimumAmount);

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
        model.addAttribute("culture_total", (int) (transaction.getCulture_total1()+transaction.getCulture_total2()));
        model.addAttribute("market_total", (int) (transaction.getMarket_total1()+transaction.getMarket_total2()));
        model.addAttribute("transport_total", (int) transaction.getTransport_total());


        System.out.println("서비스 결과 (컨트롤러): " + result);
        // 모델에 데이터를 추가하여 뷰에서 사용할 수 있도록 함
        model.addAttribute("result", result);
        model.addAttribute("transaction", transaction);

        return "dashboard";
    }

    @GetMapping("/report")
    public String viewReport(){

        return "transaction/report";
    }

    // 하나은행 IRP 페이지로 이동
    @GetMapping("/redirectToHanaIrp")
    public String redirectToHanaIrp() {
        return "redirect:https://pension.kebhana.com/rpc/hhom/kr/rpc08220601.do";
    }

}