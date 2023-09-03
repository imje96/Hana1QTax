package com.spring.oneqtax.member.controller;

import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@SessionAttributes("currentUser")
@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/login")
    public String login(Model model) {
        // 로그인을 위한 빈 객체 설정
        LoginVO loginVO = new LoginVO();
        // 모델에 loginVO 객체를 추가해 View에서 사용 가능하게 합니다.
        model.addAttribute(loginVO);
        return "member/login";

    }

    // 로그인 프로세스 처리
    @PostMapping("/login")
    public String loginProcess(LoginVO loginVO, Errors errors, Model model, HttpServletRequest request, HttpSession session) {
        // 에러가 있는 경우 (예: 유효성 검사 실패)
        if (errors.hasErrors()) {
            // 로그인 폼으로 다시 돌아갑니다.
            return "member/login";
        } else {
            // DB에서 사용자 정보를 가져옵니다.
            MemberVO memberVO = memberService.login(loginVO);
            // 사용자 정보가 없는 경우
            if (memberVO == null) {
                System.err.println("email/password가 틀렸습니다. ");
                model.addAttribute("msg", "email과 password를 다시 확인하세요.");
                return "member/login";
            } else {
                System.out.println("Login이 완료되었습니다" + memberVO);
                // 사용자 정보를 세션에 저장합니다.
                model.addAttribute("currentUser", memberVO);

                // 로그인 전 원래 방문하려던 페이지를 가져옵니다.
                String dest = (String) session.getAttribute("dest");
                session.removeAttribute("dest");

                if (dest == null) {
                    // 원래 방문하려던 페이지가 없으면 메인 페이지로 돌아갑니다.
                    return "redirect:/";
                } else {
                    // 원래 방문하려던 페이지로 리다이렉트합니다.
                    return "redirect:" + dest;
                }
            }
        }
    }
}

