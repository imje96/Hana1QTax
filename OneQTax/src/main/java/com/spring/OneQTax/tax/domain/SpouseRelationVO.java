package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class SpouseRelationVO {
    int relation_id;
    int member_id;
    int spouse_id;
    String status;
    String added_time;

}
