package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.repository.MemberMapper;
import com.spring.oneqtax.tax.domain.SpouseRelationVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpouseServiceImpl implements SpouseService {

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
    }

    @Override
    public void insertSpouseRelation(SpouseRelationVO spouseRelation) {
        taxMapper.insertSpouseRelation(spouseRelation);
    }

    public void acceptInvitation(int memberId) {
        taxMapper.updateStatusToY(memberId);
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
    public List<SpouseRelationVO> getSpouseRealtionStatus(int memberId) {
        return taxMapper.getSpouseRealtionStatus(memberId);
    }

    @Override
    public void updateFriendRelation(SpouseRelationVO friendRelation) {

    }

    @Override
    public void deleteFriendRelation(int memberId) {

    }
}
