package com.spring.oneqtax.member.controller;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


//@SessionAttributes("currentUser")
@Controller
public class MemberController {

    private final MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @RequestMapping("/")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
    }

    @GetMapping("/login")
    public String loginForm(Model model) {

        return "member/login";
    }

    @PostMapping("/login")
    public String loginProcess(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
        MemberVO memberVO = memberService.loginMember(email, password);
        session.setAttribute("currentUser", memberVO);
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}

