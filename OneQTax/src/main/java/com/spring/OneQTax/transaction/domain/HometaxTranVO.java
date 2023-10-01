package com.spring.oneqtax.transaction.domain;

import lombok.Data;

@Data
public class HometaxTranVO {
    int transaction_id;
    int member_id;
    String category;
    String store;
    String trandate;
    String trantime;
    int amount;
}
