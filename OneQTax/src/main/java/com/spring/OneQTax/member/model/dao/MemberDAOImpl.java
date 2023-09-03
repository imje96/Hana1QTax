package com.spring.oneqtax.member.model.dao;

import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public MemberVO login(LoginVO loginVO) {

        MemberVO memberVO = sqlSessionTemplate.selectOne("oneqtax.member.model.dao.MemberDAO.loginMember", loginVO);
        return memberVO;
    }

    @Override
    public MemberVO join(MemberVO memberVO) {
        MemberVO memberVO2 = sqlSessionTemplate.selectOne("oneqtax.member.dao.MemberDAO.join", memberVO);
        return memberVO2;
    }
}
