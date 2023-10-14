package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import com.spring.oneqtax.tax.domain.CardTaxResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MySchedulerService {

    @Autowired
    private final MemberService memberService;
    @Autowired
    private final TaxService taxService;

    public MySchedulerService(MemberService memberService, TaxService taxService) {
        this.memberService = memberService;
        this.taxService = taxService;

    }

    @Scheduled(cron = "0 00 7 * * *")// 매일 아침 7시에 계산 실행
    public void executeTask() {
        // 회원 정보 가져오기
        List<MemberVO> members = memberService.getAllMember();

        // 각 회원에 대한 작업 수행
        for (MemberVO member : members) {
            int memberId = member.getMember_id(); // 또는 다른 방법으로 memberId를 가져옴
            CardTaxResultVO result = taxService.processDeductionForMember(memberId);
            if (result != null) {
                System.out.println("멤버 ID" + memberId + " 처리 성공");
            }
        }
    }
}