package com.spring.oneqtax.recommendation.controller;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.recommendation.service.RecommendService;
import com.spring.oneqtax.transaction.domain.CardTranVO;
import com.spring.oneqtax.transaction.service.TranChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RecommendController {

    @Autowired
    private RecommendService recommService;

    @Autowired
    private TranChartService tranChart;

    /* 소득공제 카드추천*/
    @GetMapping("/recommCard1")
    public String recommedCard1(HttpSession session, Model model) {
        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();
        String name = currentUser.getName();


        model.addAttribute("name", name);


        return "recommendation/recommend1";
    }

    /* 일반 카드추천*/
    @GetMapping("/recommCard2")
    public String recommedCard2(HttpSession session, Model model) {
        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();
        String name = currentUser.getName();

        // 이번 달~ 지난/지지난 달 사용금액 가져오기
        List<CardTranVO> categoryMonth = tranChart.getThisMonthCategoryAmount(memberId);
        List<CardTranVO> categoryLastMonth = tranChart.getLastMonthCategoryAmount(memberId);
        List<CardTranVO> categoryBeforeMonth = tranChart.getBeforeMonthCategoryAmount(memberId);

        CardTranVO thisMonthSpending = tranChart.getThisMonthTotalAmount(memberId);
        CardTranVO lastMonthSpending = tranChart.getLastMonthTotalAmount(memberId);
        CardTranVO beforeMonthSpending = tranChart.getBeforeMonthTotalAmount(memberId);


        // 그래프를 위한 값
        model.addAttribute("categoryMonth", categoryMonth);
        model.addAttribute("categoryLastMonth", categoryLastMonth);
        model.addAttribute("categoryBeforeMonth", categoryBeforeMonth);

        model.addAttribute("thisMonthSpending", thisMonthSpending);
        model.addAttribute("lastMonthSpending", lastMonthSpending);
        model.addAttribute("beforeMonthSpending", beforeMonthSpending);
        model.addAttribute("name", name);


        return "recommendation/recommend2";
    }




    /* 종합결과*/
    @GetMapping("/recommedResult")
    public String recommedResult(HttpSession session, Model model) {
        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }
        int memberId = currentUser.getMember_id();
        String name = currentUser.getName();


        model.addAttribute("name", name);


        return "recommendation/recommedResult";
    }



    // 세션에서 member_id 가져오기
    private MemberVO getCurrentUser(HttpSession session) {
        return (MemberVO) session.getAttribute("currentUser");
    }
}

