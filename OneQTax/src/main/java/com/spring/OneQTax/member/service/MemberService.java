package com.spring.oneqtax.member.service;

import com.spring.oneqtax.member.domain.MemberVO;

public interface MemberService {

    MemberVO loginMember(String email, String password);

    MemberVO getMemberByEmail(String email);
//    public List<Member> getAllMember();
//    Member selectNameOfMember(String email);
//    Member loginMember(HashMap<String, String> loginData);

//    public void join(MemberVO memberVO);

}
