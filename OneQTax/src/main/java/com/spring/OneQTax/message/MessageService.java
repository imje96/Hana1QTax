package com.spring.oneqtax.message;

import net.nurigo.sdk.NurigoApp;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import java.util.ArrayList;
import java.util.List;

@Service
public class MessageService {

    @Value("${coolsms.api.key}")
    private String apiKey;

    @Value("${coolsms.api.secret}")
    private String apiSecret;

    @Value("${coolsms.from}")
    private String from;

    public void sendSMS(String phoneNumber) throws Exception {
        DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret, "https://api.coolsms.co.kr");
        Message message = new Message();
        message.setFrom("");
        message.setTo("");
        message.setText("카드 소득공제 금액은 ${소득공제금액}원 입니다. / 지금까지 아낀 세금은 ${아낀 세금} 원 입니다.");

        try {
            messageService.send(message);
        } catch (NurigoMessageNotReceivedException exception) {
            System.out.println(exception.getFailedMessageList());
            throw new Exception(exception.getMessage());
        } catch (Exception exception) {
            throw new Exception("Failed to send SMS");
        }
    }
}