package com.spring.oneqtax.naverSMS;


import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestClientException;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

//@Controller
@RestController
@RequiredArgsConstructor
public class SmsController {
//
    @Autowired
    private final SmsService smsService;
//
//    @GetMapping("/send")
//    public String getSmsPage() {
//        return "transaction/sendSms";
//    }

    @PostMapping("/send")
    public String sendSms(MessageDTO messageDto, Model model) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
        SmsResponseDTO response = smsService.sendSms(messageDto);
        model.addAttribute("response", response);
        return "transaction/result";
    }


//    @PostMapping("/sms/sendUser")
//    public ResponseEntity<SmsResponseDTO> test(@RequestBody Request request, HttpServletRequest sessionRequest) throws NoSuchAlgorithmException, URISyntaxException, UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
//        System.out.println("sms 컨틀롤러 들어옴");
//
//        SmsResponseDTO data = smsService.sendSms(request.getRecipientPhoneNumber(), request.getContent());
//        System.out.println("data"+request.getOauthNum());
//        HttpSession session = sessionRequest.getSession();
//        session.setAttribute("oauthNum",request.getOauthNum());
//        return ResponseEntity.ok().body(data);
//    }


//    @PostMapping("/sms/verify")
//    public String smsVerify(@RequestBody SmsResponseDTO smsResponseDto,HttpServletRequest sessionRequest) {
//        HttpSession session = sessionRequest.getSession();
//        String oauthNum=(String)session.getAttribute("oauthNum");
//        String userResponseOuathNum=smsResponseDto.getSmsConfirmNum();
//        if (smsService.verifyOauth(oauthNum,userResponseOuathNum)){
//            return "본인인증성공";
//        }
//        else{
//            return "본인인증실패";
//        }
//    }
}