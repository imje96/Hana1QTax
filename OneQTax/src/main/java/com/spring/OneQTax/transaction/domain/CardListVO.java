package com.spring.oneqtax.transaction.domain;

import lombok.Data;

@Data
public class CardListVO {
    String card_number;
    int member_id;
    int cvc;
    int card_password;
    String card_period;
    String card_id;
    String card_type;
    String card_name;
    String finance_id;
}
