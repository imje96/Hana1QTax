package com.spring.oneqtax.member.service;

import com.spring.oneqtax.member.domain.MemberVO;

import java.util.List;

public interface MemberService {

    MemberVO loginMember(String email, String password);

    MemberVO getMemberByEmail(String spouseEmail);
    public List<MemberVO> getAllMember();
//    Member selectNameOfMember(String email);
//    Member loginMember(HashMap<String, String> loginData);

//    public void join(MemberVO memberVO);

}
