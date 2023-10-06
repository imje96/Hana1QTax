package com.spring.oneqtax.naverSMS;

import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
@Setter
@Builder
public class SmsResponseDTO {
    private String requestId;
    private LocalDateTime requestTime;
    private String statusCode;
    private String statusName;
    private String smsConfirmNum;
}