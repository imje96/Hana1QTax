package com.spring.oneqtax.member.service;

import com.spring.oneqtax.member.model.dao.MemberMapper;
import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    public MemberVO loginMember(String email, String password){
        return memberMapper.loginMember(email, password);

    }


//    @Override
//    public List<Member> getAllMember() {
//        return MemberMapper.getAllMember();
//    }
//    @Override
//    public Member selectNameOfMember(String email) {
//        return MemberMapper.selectNameOfMember(email);
//    }
//    @Override
//    public Member loginMember(HashMap<String, String> loginData) {
//        return MemberMapper.loginMember(loginData);
//    }
//    @Override
//    public MemberVO loginMember(LoginVO loginVO) {
//
//        return memberDAO.loginMember(loginVO);
//    }

//    @Override
//    public void join(MemberVO memberVO) {
//        memberDAO.join(memberVO);
//    }
}
