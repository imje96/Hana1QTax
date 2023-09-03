package com.spring.oneqtax.member.model.dao;

import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;

public interface MemberDAO {
    public MemberVO login(LoginVO loginVO);

    public MemberVO join(MemberVO memberVO);
}
