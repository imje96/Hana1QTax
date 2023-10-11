package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class FMedicalVO {
    /* 의료비 총납입액 */
    private int medical_total;
    private int medical_expense; // 본인의료비(본인, 장애인, 만65세 이상자(1957.12.31.이전출생자), 건강보험산정특례자 의료비)
    private int medical_expense2; // 난임시술비
    private int medical_expense3; // 미숙아.선천이상아 의료비
    private int family_medical; // 부양가족 의료비
}
