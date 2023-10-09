package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.repository.MemberMapper;
import com.spring.oneqtax.tax.domain.SpouseRelationVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpouseServiceImpl implements SpouseService{

    private final TaxMapper taxMapper;
    @Autowired
    private final MemberMapper memberMapper;
    @Autowired
    protected SpouseServiceImpl(TaxMapper taxMapper, MemberMapper memberMapper) {
        this.taxMapper = taxMapper;
        this.memberMapper = memberMapper;
    }


    @Override
    public void acceptFriendInvitation(int relationId) {
//        SpouseRelation relation = taxMapper.findByRelationId(relationId)
//                .orElseThrow(() -> new IllegalArgumentException("Invalid relationId"));
//        relation.setStatus("Y");
//        taxMapper.save(relationId);
    }

    @Override
    public void insertSpouseRelation(SpouseRelationVO spouseRelation) {
        taxMapper.insertSpouseRelation(spouseRelation);
    }

    public void acceptInvitation(int memberId) {
//        SpouseRelationVO spouseRelation = taxMapper.findByMemberId(memberId);
//        if(memberId != null) {
////            spouseRelation.setStatus("Y");
            taxMapper.updateStatusToY(memberId); // 이 부분은 실제로 어떻게 구현되었는지에 따라 다를 수 있습니다.
//        }
    }


    @Override
    public SpouseRelationVO fingMySpouse(int memberId) {
        return taxMapper.findMySpouse(memberId);
    }

    @Override
    public MemberVO getSpouseName(int spouseId) {
        return taxMapper.getSpouseName(spouseId);
    }

    @Override
    public void updateFriendRelation(SpouseRelationVO friendRelation) {

    }

    @Override
    public void deleteFriendRelation(int memberId) {

    }
}
