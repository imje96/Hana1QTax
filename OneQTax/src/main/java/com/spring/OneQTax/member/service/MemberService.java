package com.spring.oneqtax.member.service;

import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;

public interface MemberService {

    MemberVO loginMember(String email, String password);
//    public List<Member> getAllMember();
//    Member selectNameOfMember(String email);
//    Member loginMember(HashMap<String, String> loginData);

//    public void join(MemberVO memberVO);

}
