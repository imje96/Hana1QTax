package com.spring.oneqtax.tax.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.math.BigDecimal;

// 거래내역
@Data

public class TransactionVO {
    private int total_id;
    private int member_id;
    private String calc_date;
    private double credit_total;
    private double debit_total;
    private double cash_total;
    private double culture_total1;
    private double culture_total2;
    private double market_total1;
    private double market_total2;
    private double transport_total;
}


