package com.spring.OneQTax.member.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class Member {
    private int memberId;
    private String name;
    private int indentityNumber;
    private String sex;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String regDate;

    // 기본생성자
    public Member(){
    }
}
