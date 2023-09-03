package com.spring.oneqtax.member.service;

import com.spring.oneqtax.member.model.dao.MemberDAOImpl;
import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAOImpl memberDAO;

    @Override
    public MemberVO login(LoginVO loginVO) {

        return memberDAO.login(loginVO);
    }

    @Override
    public void join(MemberVO memberVO) {
        memberDAO.join(memberVO);
    }
}
