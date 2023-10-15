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

//    @Scheduled(fixedRate = 60000)
//    @Scheduled(cron = "0 0 12 * * ?")  // 매일 정오에 실행
//    public void sendScheduledSms() {
//        // 모든 회원 가져오기
//        List<MemberVO> allMembers = memberService.getAllMember();
//
//        int memberId = 23;
//            List<CardListVO> selectedCards = tranChart.getCardList(memberId);
//
//            for (CardListVO card : selectedCards) {
//                String cardNumber = card.getCard_number();
//                CardTranVO tran = tranChart.getThisMonthTotalByCard(cardNumber);
//                long totalAmount = tran.getTotalAmount();
//                String cardType = getCardTypeByCardNumber(cardNumber, selectedCards);
//                String benefitMessage = generateBenefitMessage(totalAmount, cardType);
//
//                // 80% 달성 메시지만 전송하기 위한 로직
//                if (benefitMessage.contains("80%") || benefitMessage.contains("30만원")) {
//                    MessageDTO messageDto = new MessageDTO();
//                    messageDto.setTo("01027653402");
//                    messageDto.setContent(benefitMessage);
//                    // 필요한 다른 정보들도 설정하기
//
//                    try {
//                        SmsResponseDTO response = smsService.sendSms(messageDto);
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//        }
//
//    private String getCardTypeByCardNumber(String cardNumber, List<CardListVO> selectedCards) {
//        if (selectedCards.get(0).getCard_number().equals(cardNumber)) {
//            return "type1";
//        } else if (selectedCards.size() > 1 && selectedCards.get(1).getCard_number().equals(cardNumber)) {
//            return "type2";
//        }
//        return "unknown";
//    }
//
//    private String generateBenefitMessage(long totalAmount, String cardType) {
//        String benefitMessage = "";
//
//        if ("type1".equals(cardType)) {
//            long diff1 = 400000 - totalAmount;
//            long diff2 = 800000 - totalAmount;
//            long diff3 = 1200000 - totalAmount;
//
//            if (totalAmount >= 1200000) {
//                benefitMessage = "축하드려요. <span style=\"color: #0c716b;\">120만원 </span> 실적을 충족했어요.<br/> 최대 혜택을 누려보세요.";
//            } else if (totalAmount >= 800000) {
//                benefitMessage = "<span style=\"color: #0c716b;\">80만원 </span> 실적을 충족했어요.<br/>" + "<span style=\"color: #e4003f;\">" + diff3 + "</span>&nbsp;원 더 이용하고<br/>" +
//                        " <span style=\"color: #0c716b;\">120만원</span> 실적 혜택을 받으세요.";
//            } else if (totalAmount >= 400000) {
//                benefitMessage = "<span style=\"color: #0c716b;\">40만원 </span> 실적을 충족했어요.<br/>" + "<span style=\"color: #e4003f;\">" + diff2 + "</span>&nbsp;원<br/> 더 이용하고<br/>" +
//                        " <span style=\"color: #0c716b;\">80만원</span> 실적 혜택을 받으세요.";
//            } else {
//                benefitMessage = "아직 실적을 충족하지 못했어요." + "<span style=\"color: #e4003f;\">" + diff1 + "</span>&nbsp;원<br/> 더 이용하고<br/>" +
//                        " <span style=\"color: #0c716b;\">40만원</span> 실적 혜택을 받으세요.";
//            }
//
//        } else if ("type2".equals(cardType)) {
//            if (totalAmount >= 600000) {
//                benefitMessage = "<span style=\"color: #0c716b;\">60만원 </span> 실적을 충족했어요.<br/> 최대 혜택을 누려보세요.";
//            } else if (totalAmount >= 300000) {
//                long diff = 600000 - totalAmount;
//                benefitMessage = "<span style=\"color: #0c716b;\">30만원 </span> 실적을 충족했어요.<br/>" + "<span style=\"color: #e4003f;\">" + diff + "</span>&nbsp;원<br/> 더 이용하고<br/>" +
//                        " <span style=\"color: #0c716b;\">60만원</span> 실적 혜택을 받으세요.";
//            } else {
//                long diff = 300000 - totalAmount;
//                benefitMessage = "아직 실적을 충족하지 못했어요. <br/>" + "<span style=\"color: #e4003f;\">" + diff + "</span>&nbsp;원 더 이용하고<br/>" +
//                        " <span style=\"color: #0c716b;\">30만원</span> 실적 혜택을 받으세요.";
//            }
//        }
//        return benefitMessage;
//    }

}
