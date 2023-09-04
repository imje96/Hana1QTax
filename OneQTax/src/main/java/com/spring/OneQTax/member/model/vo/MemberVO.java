package com.spring.oneqtax.member.model.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter

public class MemberVO {

    private int member_id;
    private String name;
    private String indentification_nm;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String reg_date;

    @Override
    public String toString() {
        return "memberVO{" +
                "member_id=" + member_id +
                ", name='" + name + '\'' +
                ", indentification_nm='" + indentification_nm + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", regDate='" + reg_date + '\'' +
                '}';
    }
}
