package com.spring.oneqtax.member.model.vo;

import lombok.Data;

@Data
public class MemberVO {

    private int member_id;
    private String name;
    private String indentification_nm;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String reg_date;

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIndentification_nm() {
        return indentification_nm;
    }

    public void setIndentification_nm(String indentification_nm) {
        this.indentification_nm = indentification_nm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

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
