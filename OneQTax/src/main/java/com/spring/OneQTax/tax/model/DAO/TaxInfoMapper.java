package com.spring.OneQTax.tax.model.DAO;

import com.spring.OneQTax.tax.model.DTO.TaxInfoDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TaxInfoMapper {
    TaxInfoDTO getTaxInfoById(int id);
}
