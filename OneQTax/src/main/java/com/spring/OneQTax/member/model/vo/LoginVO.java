package com.spring.oneqtax.member.model.vo;

import javax.validation.constraints.NotBlank;

public class LoginVO {

    @NotBlank(message = "email은 필수입니다.")
    private String email;

    @NotBlank(message = "password는 필수입니다.")
    private String password;

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
}
