package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.SpouseRelationVO;
import org.springframework.beans.factory.annotation.Autowired;

public interface SpouseService {

    // 초대 수락
    public void acceptFriendInvitation(int relationId);

    // 생성 (Create)
    public void addSpouse(SpouseRelationVO spouseRelation);

    // 조회 (Read)
    public SpouseRelationVO getFriendRelation(int memberId);

//    public SpouseRelation getFriendRelation(int memberId);

    // 수정 (Update)
    public void updateFriendRelation(SpouseRelationVO friendRelation);
    // 삭제 (Delete)
    public void deleteFriendRelation(int memberId);
}