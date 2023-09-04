package com.spring.oneqtax.tax.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.bind.annotation.SessionAttributes;

//@Data
@Getter
@Setter
public class TransactionVO {
    private int member_id;
    private String calc_date;
    private int credit_total;
    private int debit_total;
    private int cash_total;
    private int culture_card;
    private int market_card;
    private int transport_card;
}
