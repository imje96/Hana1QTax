package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.service.MemberService;
import com.spring.oneqtax.naverSMS.MessageDTO;
import com.spring.oneqtax.naverSMS.SmsResponseDTO;
import com.spring.oneqtax.tax.domain.CardTaxResultVO;
import com.spring.oneqtax.transaction.controller.TranController;
import com.spring.oneqtax.transaction.domain.CardListVO;
import com.spring.oneqtax.transaction.domain.CardTranVO;
import com.spring.oneqtax.transaction.service.TranChartService;
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
    @Autowired
    private TranChartService tranChart;
    @Autowired
    private TranController tranController; // YourController는 위 메서드들을 가진 컨트롤러의 이름이라 가정합니다.
    @Autowired
    private com.spring.oneqtax.naverSMS.SmsService smsService;

    public MySchedulerService(MemberService memberService, TaxService taxService, TranChartService tranChart, com.spring.oneqtax.naverSMS.SmsService smsService) {
        this.memberService = memberService;
        this.taxService = taxService;
        this.tranChart = tranChart;

        this.smsService = smsService;
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

//        @Scheduled(fixedRate = 60000)
    @Scheduled(cron = "0 0 12 * * ?")  // 매일 정오에 실행
    public void sendScheduledSms() {
        // 모든 회원 가져오기
//        List<MemberVO> allMembers = memberService.getAllMember();

        int memberId = 24;
        List<CardListVO> selectedCards = tranChart.getCardList(memberId);

//            for (CardListVO card : selectedCards) {
        String cardNumber = selectedCards.get(1).getCard_number();
        CardTranVO tran = tranChart.getThisMonthTotalByCard(cardNumber);
        long totalAmount = tran.getTotalAmount();
        String cardType = getCardTypeByCardNumber(cardNumber, selectedCards);
        String benefitMessage = generateBenefitMessage(totalAmount, cardType);

        long threshold1 = (long)(0.8 * 300000);
        long threshold2 = (long)(0.8 * 600000);
        long threshold3 = (long)(0.8 * 1200000);

        // 80% 달성 메시지만 전송하기 위한 로직
        if ( (totalAmount >= threshold3 && totalAmount < 1200000) ||
                (totalAmount >= threshold2 && totalAmount < 600000) ||
                (totalAmount >= threshold1 && totalAmount < 300000) ) {
            MessageDTO messageDto = new MessageDTO();
            messageDto.setTo("01027653402");
            messageDto.setContent(benefitMessage);

            try {
                SmsResponseDTO response = smsService.sendSms(messageDto);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }



    private String getCardTypeByCardNumber(String cardNumber, List<CardListVO> selectedCards) {
        if (selectedCards.get(0).getCard_number().equals(cardNumber)) {
            return "type1";
        } else if (selectedCards.size() > 1 && selectedCards.get(1).getCard_number().equals(cardNumber)) {
            return "type2";
        }
        return "unknown";
    }

    private String generateBenefitMessage(long totalAmount, String cardType) {
        String benefitMessage = "";
        int memberId = 23;
        List<CardListVO> selectedCards = tranChart.getCardList(memberId);
        String cardName = selectedCards.get(0).getCard_name();

        if ("type1".equals(cardType)) {
            long diff1 = 400000 - totalAmount;
            long diff2 = 800000 - totalAmount;
            long diff3 = 1200000 - totalAmount;

            if (totalAmount >= 1200000) {
                benefitMessage = "축하드려요. 120만원 실적을 충족했어요. 최대 혜택을 누려보세요.";
            } else if (totalAmount >= 800000) {
                benefitMessage = "지금까지 80만원 실적을 충족했어요." + diff3 + "원 더 이용하고 120만원 실적 혜택을 받으세요.";
            } else if (totalAmount >= 400000) {
                benefitMessage = "지금까지 40만원 실적을 충족했어요." + diff2 + "원 더 이용하고 80만원 실적 혜택을 받으세요.";
            } else {
                benefitMessage = "아직 실적을 충족하지 못했어요." + diff1 + "원 더 이용하고" + "40만원 실적 혜택을 받으세요."
                        + "더 현명하게 자산관리하는 방법!"
                        + "하나원큐택스에서 혜택과 함께 아낄 수 있는 세금도 확인해 보세요. ";
            }

        } else if ("type2".equals(cardType)) {
            if (totalAmount >= 600000) {
                benefitMessage = "지금까지 60만원 실적을 충족했어요. 최대 혜택을 누려보세요." + '\n' + "더 현명하게 자산관리하는 방법! " + '\n'
                        + "하나원큐택스에서 혜택과 함께 아낄 수 있는 세금도 확인해 보세요. ";
            } else if (totalAmount >= 300000) {
                long diff = 600000 - totalAmount;
                benefitMessage = "지금까지 30만원 실적을 충족했어요." + '\n' + diff + "원 더 이용하고 60만원 실적 혜택을 받으세요." + '\n' + "더 현명하게 자산관리하는 방법! " + '\n'
                        + "하나원큐택스에서 혜택과 함께 아낄 수 있는 세금도 확인해 보세요. ";
            } else {
                long diff = 300000 - totalAmount;
                benefitMessage = "곧 " + cardName + "카드의 실적을 충족할 수 있어요. " + '\n' + diff + "원 더 이용하고 40만원 실적 혜택을 받으세요." + '\n'  + '\n'  + "더 현명하게 자산관리하는 방법! " + '\n'
                        + "하나원큐택스에서 혜택과 함께 아낄 수 있는 세금도 확인해 보세요. ";
            }
        }
        return benefitMessage;
    }

}
