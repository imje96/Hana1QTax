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
    private double culture_total;
    private double market_total;
    private double transport_total;
}


