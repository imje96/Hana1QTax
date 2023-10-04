package com.spring.oneqtax.transaction.controller;

import com.google.gson.Gson;
import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import com.spring.oneqtax.tax.domain.CardTaxResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;
import com.spring.oneqtax.tax.service.SpouseService;
import com.spring.oneqtax.tax.service.TaxFormService;
import com.spring.oneqtax.tax.service.TaxService;
import com.spring.oneqtax.tax.service.TotalTaxService;
import com.spring.oneqtax.transaction.domain.CardListVO;
import com.spring.oneqtax.transaction.domain.CardTranVO;
import com.spring.oneqtax.transaction.domain.HometaxTranVO;
import com.spring.oneqtax.transaction.service.TranChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TranController {

    @Autowired
    private TotalTaxService totalTaxService;
    @Autowired
    private TaxFormService taxFormService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private SpouseService spouseService;
    @Autowired
    private TaxService taxService;
    @Autowired
    private TranChartService tranChart;

    /* 대시보드 */
    @GetMapping("/tranDashboard")
    public String viewTranDashboard(HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // transaction 가져오기
        List<CardTranVO> categoryMonth = tranChart.getThisMonthCategoryAmount(memberId);
        CardTranVO thisMonthSpending = tranChart.getThisMonthTotalAmount(memberId);


        // 그래프를 위한 값
        model.addAttribute("categoryMonth", categoryMonth);
        model.addAttribute("thisMonthSpending", thisMonthSpending);

        return "transaction/transactionDashboard";
    }

    /* 카드 리스트 */
    @GetMapping("/cardList")
    public String viewCardList(HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // transaction 가져오기
        List<CardTranVO> cardTran = tranChart.getCardTranByMemberId(memberId);
        List<CardTranVO> thisTran = tranChart.getThisMonthTran(memberId);
        List<CardTranVO> categoryTran = tranChart.getCategoryAmount(memberId);
        List<CardTranVO> categoryMonth = tranChart.getThisMonthCategoryAmount(memberId);
        CardTranVO thisMonthSpending = tranChart.getThisMonthTotalAmount(memberId);


        // 그래프를 위한 값

        model.addAttribute("cardTran", cardTran);

        Gson gson = new Gson();
        String jsonThisTran = gson.toJson(thisTran);
        model.addAttribute("jsonThisTran", jsonThisTran);

//        model.addAttribute("thisTran", thisTran);
        model.addAttribute("categoryTran", categoryTran);
        model.addAttribute("categoryMonth", categoryMonth);
        model.addAttribute("thisMonthSpending", thisMonthSpending);

        return "transaction/cardList";
    }

    /* 카드 실적조회 */
    @GetMapping("/cardBenefits")
    public String viewCardBenefits(HttpSession session, Model model) {
        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        List<CardListVO> selectedCards = getSelectedCards(memberId); // 중복 제거하여 메소드 호출

        if (!selectedCards.isEmpty()) {
            String cardNumber = selectedCards.get(0).getCard_number();
            CardTranVO monthSpendingByNum = tranChart.getThisMonthTotalByCard(cardNumber);
            model.addAttribute("monthSpending", monthSpendingByNum);

            // 카드 선택한 것 가져오기
            String cardType = getCardTypeByCardNumber(cardNumber, selectedCards);

            String defaultBenefitMessage = generateBenefitMessage(monthSpendingByNum.getTotalAmount(), cardType);
            model.addAttribute("defaultBenefitMessage", defaultBenefitMessage);
        }

        // 그래프를 위한 값
        model.addAttribute("cardList", selectedCards);

        return "transaction/cardBenefits";
    }


    @PostMapping("/getMonthlyTotal")
    @ResponseBody
    public Map<String, Object> getMonthlyTotal(@RequestParam String cardNumber, HttpSession session) {
        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        int memberId = currentUser.getMember_id();

        List<CardListVO> selectedCards = getSelectedCards(memberId); // 중복 제거

        CardTranVO tran = tranChart.getThisMonthTotalByCard(cardNumber);
        long totalAmount = tran.getTotalAmount();

        // cardType 결정
        String cardType = getCardTypeByCardNumber(cardNumber, selectedCards);
        // 혜택 메시지 생성
        String benefitMessage = generateBenefitMessage(totalAmount, cardType);

        Map<String, Object> response = new HashMap<>();
        response.put("totalAmount", totalAmount);
        response.put("benefitMessage", benefitMessage);
        response.put("cardType", cardType);

        return response;
    }

    // 카드 선택 메서드
    private List<CardListVO> getSelectedCards(int memberId) {
        List<CardListVO> cardList = tranChart.getCardList(memberId);
        List<CardListVO> selectedCards = new ArrayList<>();
        if (cardList.size() > 1) {
            selectedCards.add(cardList.get(0));
            selectedCards.add(cardList.get(1));
        } else if (cardList.size() == 1) {
            selectedCards.add(cardList.get(0));
        }
        return selectedCards;
    }

    // 카드 선택 메서드 -> type으로 지정
    private String getCardTypeByCardNumber(String cardNumber, List<CardListVO> selectedCards) {
        if (selectedCards.get(0).getCard_number().equals(cardNumber)) {
            return "type1";
        } else if (selectedCards.size() > 1 && selectedCards.get(1).getCard_number().equals(cardNumber)) {
            return "type2";
        }
        return "unknown";
    }

    // 실적 계산하는 메서드 분리
//    private String generateBenefitMessage(long totalAmount) {
//        String benefitMessage = "";
//
//        if (totalAmount >= 600000) {
//            benefitMessage = "60만원 실적을 충족했어요.<br/> 최대 혜택을 누려보세요.";
//        } else if (totalAmount >= 300000) {
//            long diff = 600000 - totalAmount;
//            benefitMessage = "30만원 실적을 충족했어요.<br/> 60만원 실적 충족까지"+ "<span style=\"color: #e4003f;\">"+ diff + "</span>&nbsp;원<br/> 더 이용하고 더 많은 혜택을 받으세요.";
//        } else {
//            long diff = 300000 - totalAmount;
//            benefitMessage = "아직 실적을 충족하지 못했어요. <br/> 30만원 실적 충족까지 "+ "<span style=\"color: #e4003f;\">"+ diff + "</span>&nbsp;원<br/> 더 이용하고 30만원 실적 혜택을 받으세요.";
//        }
//
//        return benefitMessage;
//    }
    private String generateBenefitMessage(long totalAmount, String cardType) {
        String benefitMessage = "";

        if ("type1".equals(cardType)) {
            long diff1 = 400000 - totalAmount;
            long diff2 = 800000 - totalAmount;
            long diff3 = 1200000 - totalAmount;

            if (totalAmount >= 1200000) {
                benefitMessage = "축하드려요. 3구간 120만원 실적을 충족했어요.<br/> 최대 혜택을 누려보세요.";
            } else if (totalAmount >= 800000) {
                benefitMessage = "80만원 실적을 충족했어요.<br/>120만원 실적 충족까지 " + "<span style=\"color: #e4003f;\">" + diff3 + "</span>&nbsp;원<br/> 더 이용하고 더 많은 혜택을 받으세요.";
            } else if (totalAmount >= 400000) {
                benefitMessage = "40만원 실적을 충족했어요.<br/>80만원 실적 충족까지 " + "<span style=\"color: #e4003f;\">" + diff2 + "</span>&nbsp;원<br/> 더 이용하고 더 많은 혜택을 받으세요.";
            } else {
                benefitMessage = "아직 실적을 충족하지 못했어요. <br/>40만원 실적 충족까지 " + "<span style=\"color: #e4003f;\">" + diff1 + "</span>&nbsp;원<br/> 더 이용하고 40만원 실적 혜택을 받으세요.";
            }

        } else if ("type2".equals(cardType)) {
            if (totalAmount >= 600000) {
                benefitMessage = "60만원 실적을 충족했어요.<br/> 최대 혜택을 누려보세요.";
            } else if (totalAmount >= 300000) {
                long diff = 600000 - totalAmount;
                benefitMessage = "30만원 실적을 충족했어요.<br/> 60만원 실적 충족까지" + "<span style=\"color: #e4003f;\">" + diff + "</span>&nbsp;원<br/> 더 이용하고 더 많은 혜택을 받으세요.";
            } else {
                long diff = 300000 - totalAmount;
                benefitMessage = "아직 실적을 충족하지 못했어요. <br/> 30만원 실적 충족까지 " + "<span style=\"color: #e4003f;\">" + diff + "</span>&nbsp;원<br/> 더 이용하고 30만원 실적 혜택을 받으세요.";
            }
        }
        return benefitMessage;
    }


//    @GetMapping("/getTotalAmount")
//    public long getTotalAmount(@RequestParam String cardNumber) {
//        // 카드 번호를 기반으로 DB에서 카드의 사용 금액 가져오기
//        return tranChart.getThisMonthTotalByCard(cardNumber);
//    }

    /* 카드 사용내역 */
    @GetMapping("/transactionList")
    public String viewTransaction(HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // transaction 가져오기
        List<CardTranVO> cardTran = tranChart.getCardTranByMemberId(memberId);
//        CardTranVO financeTran = tranChart.getCardTranByFinance(memberId);
        List<CardTranVO> thisTran = tranChart.getThisMonthTran(memberId);
        List<CardTranVO> categoryTran = tranChart.getCategoryAmount(memberId);
        List<CardTranVO> categoryMonth = tranChart.getThisMonthCategoryAmount(memberId);
        CardTranVO thisMonthSpending = tranChart.getThisMonthTotalAmount(memberId);


        // 그래프를 위한 값

        model.addAttribute("cardTran", cardTran);

        Gson gson = new Gson();
        String jsonThisTran = gson.toJson(thisTran);
        model.addAttribute("jsonThisTran", jsonThisTran);

//        model.addAttribute("thisTran", thisTran);
        model.addAttribute("categoryTran", categoryTran);
        model.addAttribute("categoryMonth", categoryMonth);
        model.addAttribute("thisMonthSpending", thisMonthSpending);

        return "transaction/transactionList";
    }

    /* 카드 번호 암호화 */
    @RequestMapping("/getCardNumber")
    @ResponseBody
    public Map<String, Object> sendData(HttpSession session, Model model) {
        Map<String, Object> data = new HashMap<>();

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            data.put("error", "User is not logged in");
            return data;
        }
        int memberId = currentUser.getMember_id();

        // transaction 가져오기
        List<CardTranVO> thisTran = tranChart.getThisMonthTran(memberId);

        if (!thisTran.isEmpty()) {
            data.put("cardNumber", thisTran.get(2).getCard_number());
        }
        return data;
    }

    /* 현금영수증 사용내역 */
    @GetMapping("/hometaxList")
    public String hometaxList(HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // transaction 가져오기
        List<HometaxTranVO> hometaxTran = tranChart.getHometaxThisMonth(memberId);

        HometaxTranVO hometaxSum = tranChart.getHometaxSum(memberId);
        HometaxTranVO hometaxThisMonthSum = tranChart.getHometaxTranByMemberId(memberId);

        // 그래프를 위한 값
        model.addAttribute("cardTran", hometaxTran);

        Gson gson = new Gson();
        String jsonThisTran = gson.toJson(hometaxTran);
        model.addAttribute("jsonThisTran", jsonThisTran);
        model.addAttribute("hometaxSum", hometaxSum);
        model.addAttribute("hometaxThisMonthSum", hometaxThisMonthSum);

        return "transaction/hometaxList";
    }


    // 세션에서 member_id 가져오기
    private MemberVO getCurrentUser(HttpSession session) {
        return (MemberVO) session.getAttribute("currentUser");
    }
}