package com.spring.oneqtax.member.repository;

import com.spring.oneqtax.member.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberMapper {
//    @Param("password") 제외
    MemberVO loginMember(@Param("email") String email, @Param("password") String password);

    /* 우리집 돈관리 */
    MemberVO getMemberByEmail(String spouseEmail);

    List<MemberVO> getAllMember();

}
