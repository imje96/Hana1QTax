package com.spring.oneqtax.recommendation.controller;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.recommendation.service.RecommendService;
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

    // 세션에서 member_id 가져오기
    private MemberVO getCurrentUser(HttpSession session) {
        return (MemberVO) session.getAttribute("currentUser");
    }
}

