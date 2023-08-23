package com.spring.OneQTax.member.model.dao;

import com.spring.OneQTax.member.model.dto.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface MemberMapper {
    List<MemberDTO> getAllMemberList();
    Member selectNameOfMember(String memberId);
    puMember loginMember(HashMap<String, String> loginData);

    void insertMember(Member member);

    void updateMmeber(Member member);

    void deleteMember(String eamil);
}
