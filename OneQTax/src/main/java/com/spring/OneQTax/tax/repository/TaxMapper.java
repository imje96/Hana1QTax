package com.spring.oneqtax.tax.repository;

import com.spring.oneqtax.tax.domain.TaxInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TaxMapper {

//    List<TaxInfoVO> getAllTaxInfo();

    TaxInfoVO getTaxInfoByMemberId(int member_id);
}
