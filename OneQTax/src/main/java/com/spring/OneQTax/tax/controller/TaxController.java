package com.spring.oneqtax.tax.controller;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import com.spring.oneqtax.tax.domain.DeductionResultVO;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.domain.TransactionVO;
import com.spring.oneqtax.tax.service.TaxService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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

        int memberId = currentUser.getMember_id();
        System.out.println("id " + memberId);

        TaxInfoVO taxInfoVO = taxService.getTaxInfoByMemberId(memberId);
        TransactionVO transactionVO = taxService.getTransactionByMemberId(memberId);

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

    // taxMain으로 이동
    @GetMapping("/taxMain")
    public  String taxMain(HttpSession session, Model model) {

        MemberVO currentUser = (MemberVO) session.getAttribute("currentUser");

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }

        return  "tax/taxMain";
    }

    // 가장 최근의 계산결과 가져오기
    @GetMapping("/getLatestDeductionResult")
    public String getLatestDeductionResult(HttpSession session, Model model) {

        // memberId 가져오기
        MemberVO currentUser = getCurrentUser(session);
        int memberId = currentUser.getMember_id();

        if (currentUser == null) {
            // 리다이렉트나 에러 메시지 처리
            return "redirect:/login";
        }

        DeductionResultVO result = taxService.getDeductionResult(memberId);

        System.out.println("서비스 결과 (컨트롤러): " + result);
        // 모델에 데이터를 추가하여 뷰에서 사용할 수 있도록 함
        model.addAttribute("result", result);
        return  "tax/taxResult";
    }

    // 공제 계산하기
    @PostMapping("/calculateAndInsertDeduction")
    public ResponseEntity<DeductionResultVO> calculateAndInsertDeduction(HttpSession session) {
       // member_id 먼저 가져오기
        MemberVO currentUser = getCurrentUser(session);

        if (currentUser == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED); // 401 Unauthorized 응답
        }

        int memberId = currentUser.getMember_id();



        // calculateDeduction(taxInfo, transaction) 대신 processDeductionForMember(memberId) 호출
        DeductionResultVO result = taxService.processDeductionForMember(memberId);


        if (result == null) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    // 세션에서 member_id 가져오기
    private MemberVO getCurrentUser(HttpSession session) {
        return (MemberVO) session.getAttribute("currentUser");
    }
}

