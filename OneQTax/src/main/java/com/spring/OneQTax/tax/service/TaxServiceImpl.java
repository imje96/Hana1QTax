package com.spring.oneqtax.tax.service;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.member.repository.MemberMapper;
import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.tax.repository.TaxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaxServiceImpl implements TaxService {


    @Autowired
    private TaxMapper taxMapper;



    @Override
    public TaxInfoVO getTaxInfoByMemberId(int member_id){
        System.out.println("서비스: " + member_id);
        return taxMapper.getTaxInfoByMemberId(member_id);
    }

}
