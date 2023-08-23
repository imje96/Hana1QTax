package com.spring.OneQTax.member.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Member {
    private memberId;
    private name;
    private indentityNumber;
    private sex;
    private email;
    private password;
    private phone;
    private address;
    private regDate;

    // 기본생성자
    public Member(){
    }
}
