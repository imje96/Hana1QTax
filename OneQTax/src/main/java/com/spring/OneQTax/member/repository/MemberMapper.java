package com.spring.oneqtax.member.repository;

import com.spring.oneqtax.member.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
//    @Param("password") 제외
    MemberVO loginMember(@Param("email") String email, @Param("password") String password);

    /* 우리집 돈관리 */
    MemberVO getMemberByEmail(String email);

//    List<Member> getAllMember();
//    Member selectNameOfMember(String email);
//    Member loginMember(HashMap<String, String> loginData);
//    public MemberVO loginMember(LoginVO loginVO);

//    public MemberVO join(MemberVO memberVO);
}
