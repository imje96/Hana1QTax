package com.spring.oneqtax.naverSMS;

import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Request {
    private String recipientPhoneNumber;
    private String title;
    private String content;
    private String oauthNum;

}