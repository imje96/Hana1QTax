package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.tax.domain.SpouseRelationVO;
import org.springframework.beans.factory.annotation.Autowired;

public interface SpouseService {

    // 초대 수락
    public void acceptFriendInvitation(int relationId);

    // 생성 (Create)
    public void insertSpouseRelation(SpouseRelationVO spouseRelation);

    public void acceptInvitation(int memberId);

    // 조회 (Read)
    public SpouseRelationVO fingMySpouse(int memberId);
    public MemberVO getSpouseName(int spouseId);

//    public SpouseRelation getFriendRelation(int memberId);

    // 수정 (Update)
    public void updateFriendRelation(SpouseRelationVO friendRelation);
    // 삭제 (Delete)
    public void deleteFriendRelation(int memberId);
}