package com.spring.oneqtax.tax.controller;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;
import com.spring.oneqtax.tax.service.TaxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;

@Controller
public class TaxController {

    private final TaxService taxService;

    @Autowired
    public TaxController(TaxService taxService) {
        this.taxService = taxService;
    }

    @GetMapping("/taxInfo")
    public String calculation(HttpSession session, Model model){

        MemberVO currentUser = (MemberVO) session.getAttribute("currentUser");

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }

        System.out.println(currentUser);

        int member_id = currentUser.getMember_id();
        System.out.println("id " + member_id);

        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(member_id);
        TransactionVO transactionVO = taxService.getTransactionByMemberId(member_id);

        System.out.println("서비스결과 (컨트롤러) : " + taxInfoVO);
        System.out.println("서비스결과2 (컨트롤러) : " + transactionVO);

        model.addAttribute("taxInfo", taxInfoVO);
        model.addAttribute("transaction", transactionVO);

        return "tax/taxInfo";
    }

   // @GetMapping("/taxInfo")
    public String getTaxInfo(HttpSession session, Model model) {

        MemberVO currentUser = (MemberVO) session.getAttribute("currentUser");
        System.out.println(currentUser);


        int member_id = currentUser.getMember_id();
        System.out.println("id " + member_id);
        TaxInfoVO taxInfo = taxService.getTaxInfoByMemberId(member_id);

        System.out.println("서비스 결과 (컨트롤러): " + taxInfo);
        // 모델에 데이터를 추가하여 뷰에서 사용할 수 있도록 함
        model.addAttribute("taxInfo", taxInfo);

        // TODO: TaxService를 호출하여 계산 수행
//        taxService.performCalculation(taxInfoList);

        // 뷰 이름 반환
        return "tax/taxInfo";
    }

    // 다른 핸들러 메서드 등 필요한 코드 추가
}

