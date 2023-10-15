package com.spring.oneqtax.naverSMS;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.spring.oneqtax.tax.domain.SpouseRelationVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestClientException;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class SmsController {

    private final SmsService smsService;
    private final TaxMapper taxMapper;

    @PostMapping("/send")
    public String sendSms(MessageDTO messageDto, Model model) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
        SmsResponseDTO response = smsService.sendSms(messageDto);
        model.addAttribute("response", response);
        return "transaction/result";
    }
}