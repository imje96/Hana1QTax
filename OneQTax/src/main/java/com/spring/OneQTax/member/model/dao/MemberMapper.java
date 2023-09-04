package com.spring.oneqtax.member.model.dao;

import com.spring.oneqtax.member.model.vo.LoginVO;
import com.spring.oneqtax.member.model.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;

@Mapper
public interface MemberMapper {
//    @Param("password") 제외
    MemberVO loginMember( String email, String password);
//    List<Member> getAllMember();
//    Member selectNameOfMember(String email);
//    Member loginMember(HashMap<String, String> loginData);
//    public MemberVO loginMember(LoginVO loginVO);

//    public MemberVO join(MemberVO memberVO);
}
