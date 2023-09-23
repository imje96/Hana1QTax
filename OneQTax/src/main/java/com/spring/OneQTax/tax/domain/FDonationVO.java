package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class FDonationVO {
    /* 기부금 총납입액 */
//    private int donation_total;
    private int donation1; // 정치자금기부금
    private int donation2; // 법정기부금
    private int donation3; // 우리사주조합기부금
    private int religionEct_donation; // 지정기부금 종교기부금외
    private int religion_donation; // 지정기부금 종교기부금
}
