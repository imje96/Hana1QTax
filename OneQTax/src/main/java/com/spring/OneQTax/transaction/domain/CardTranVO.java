package com.spring.oneqtax.transaction.domain;

import lombok.Data;

@Data
public class CardTranVO {
    int transaction_id;
    int member_id;
    String card_number;
    String category;
    String store;
    String cardtrandate;
    String cardtrantime;
    int amount;
    String categoryBig;
    String finance_id;
    int totalAmount;
    int totalCount;
}
