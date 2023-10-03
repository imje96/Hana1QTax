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
import com.spring.oneqtax.transaction.domain.CardTranVO;
import com.spring.oneqtax.transaction.domain.HometaxTranVO;
import com.spring.oneqtax.transaction.service.TranChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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

    @GetMapping("/tranDashboard")
    public String viewTranDashboard(HttpSession session, Model model){

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // transaction 가져오기
//        CardTranVO totalTran = tranChart.getCardTranByMemberId(memberId);
//        CardTranVO categoryTran = tranChart.getCategoryAmount(memberId);
        List<CardTranVO> categoryMonth = tranChart.getThisMonthCategoryAmount(memberId);
        CardTranVO thisMonthSpending = tranChart.getThisMonthTotalAmount(memberId);



        // 그래프를 위한 값

//        model.addAttribute("totalTran", totalTran);
//        model.addAttribute("categoryTran", categoryTran);
        model.addAttribute("categoryMonth", categoryMonth);
        model.addAttribute("thisMonthSpending", thisMonthSpending);

        return "transaction/transactionDashboard";
    }

    @GetMapping("/transactionList")
    public String viewTransaction(HttpSession session, Model model){

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
        List<CardTranVO> thisTran =  tranChart.getThisMonthTran(memberId);
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

    @RequestMapping("/getCardNumber")
    @ResponseBody
    public Map<String, Object> sendData(HttpSession session, Model model){
        Map<String, Object> data = new HashMap<>();

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            data.put("error", "User is not logged in");
            return data;
        }
        int memberId = currentUser.getMember_id();

        // transaction 가져오기
        List<CardTranVO> thisTran =  tranChart.getThisMonthTran(memberId);

        if(!thisTran.isEmpty()) {
            data.put("cardNumber", thisTran.get(2).getCard_number());
        }
        return data;
    }

    @GetMapping("/hometaxList")
    public String hometaxList(HttpSession session, Model model){

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();

        // transaction 가져오기
        List<HometaxTranVO> hometaxTran = tranChart.getHometaxTransaction(memberId);

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

    /* 카드 리스트 */
    @GetMapping("/cardList")
    public String viewCardList(HttpSession session, Model model){

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
            List<CardTranVO> thisTran =  tranChart.getThisMonthTran(memberId);
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


    // 세션에서 member_id 가져오기
    private MemberVO getCurrentUser(HttpSession session) {
        return (MemberVO) session.getAttribute("currentUser");
    }
}
