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

//    @PostMapping("/login")
//    public String loginProcess(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
//        MemberVO memberVO = memberService.loginMember(email, password);
//        session.setAttribute("currentUser", memberVO);
//        return "redirect:/";
//    }
@PostMapping("/login")
public String loginProcess(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
    MemberVO memberVO = memberService.loginMember(email, password);

    // 로그인 실패 처리
    if (memberVO == null) {
        // 로그인 실패 관련 메시지나 처리를 여기에 추가하면 됩니다.
        return "login"; // 로그인 페이지로 리다이렉트 또는 포워드 (에러 메시지와 함께)
    }

    // 로그인 성공
    session.setAttribute("currentUser", memberVO);

    // dest 세션 값이 있는지 확인하고, 있으면 해당 페이지로 리다이렉트
    String dest = (String) session.getAttribute("dest");
    if (dest != null) {
        session.removeAttribute("dest");
        return "redirect:" + dest;
    }

    return "redirect:/"; // 기본 페이지로 리다이렉트
}



    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    //    메인으로 이동
    @GetMapping("/main")
    public String main() {
        return "redirect:/";
    }

}

