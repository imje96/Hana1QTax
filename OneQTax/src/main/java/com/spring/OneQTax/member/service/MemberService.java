package com.spring.oneqtax.member.service;

import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;

public interface MemberService {

    public MemberVO login(LoginVO loginVO);

    public void join(MemberVO memberVO);

}
