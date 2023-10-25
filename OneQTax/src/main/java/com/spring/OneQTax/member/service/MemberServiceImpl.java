package com.spring.oneqtax.member.service;

import com.spring.oneqtax.member.repository.MemberMapper;
import com.spring.oneqtax.member.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    public MemberVO loginMember(String email, String password){
        return memberMapper.loginMember(email, password);

    }

    @Override
    public MemberVO getMemberByEmail(String spouseEmail) {
        return memberMapper.getMemberByEmail(spouseEmail);
    }

    @Override
    public List<MemberVO> getAllMember() {
        return memberMapper.getAllMember();
    }

}
