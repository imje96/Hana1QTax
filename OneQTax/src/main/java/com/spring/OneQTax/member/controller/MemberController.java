package com.spring.oneqtax.member.controller;

import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import com.spring.oneqtax.member.service.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.lang.reflect.Member;
import java.util.HashMap;


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

