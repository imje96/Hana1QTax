package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.tax.domain.SpouseRelationVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpouseServiceImpl implements SpouseService{

    private final TaxMapper taxMapper;

    @Autowired
    protected SpouseServiceImpl(TaxMapper taxMapper) {
        this.taxMapper = taxMapper;
    }

    @Override
    public void acceptFriendInvitation(int relationId) {
//        SpouseRelation relation = taxMapper.findByRelationId(relationId)
//                .orElseThrow(() -> new IllegalArgumentException("Invalid relationId"));
//        relation.setStatus("Y");
//        taxMapper.save(relationId);
    }

    @Override
    public void addSpouse(SpouseRelationVO spouseRelation) {

    }

    @Override
    public SpouseRelationVO getFriendRelation(int memberId) {
        return null;
    }

    @Override
    public void updateFriendRelation(SpouseRelationVO friendRelation) {

    }

    @Override
    public void deleteFriendRelation(int memberId) {

    }
}
