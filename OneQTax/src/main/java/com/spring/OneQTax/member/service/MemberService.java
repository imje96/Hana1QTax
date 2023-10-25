package com.spring.oneqtax.member.service;

import com.spring.oneqtax.member.domain.MemberVO;

import java.util.List;

public interface MemberService {

    MemberVO loginMember(String email, String password);

    MemberVO getMemberByEmail(String spouseEmail);
    public List<MemberVO> getAllMember();


}
