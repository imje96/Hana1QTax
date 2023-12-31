package com.spring.oneqtax.tax.repository;

import com.spring.oneqtax.member.domain.MemberVO;
import com.spring.oneqtax.tax.domain.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TaxMapper {

//    List<TaxInfoVO> getAllTaxInfo();

    TaxInfoVO getTaxInfoByMemberId(int memberId);

    TransactionVO getTransactionByMemberId(int memberId);

    // 공제계산결과를 저장
    void insertDeductionResult(CardTaxResultVO result);

    // 저장된 공제계산결과를 출력  // 연말정산에서 카드소득공제 계산결과 가져오기
    CardTaxResultVO getDeductionResult(int memberId);



    //  연말정산 계산 전 항목 조회
    TotalInfoVO getTotalInfoByCalcId(int calculationId);

    TotalInfoVO getTotalInfoByMemberId(int memberId);
    // 연말정산 계산 전 항목 저장
    void insertTotalInfo(TotalInfoVO totalInfoVO);
    // 연말정산 계산 전 항목 업데이트
    void updateTotalInfo(TotalInfoVO totalInfo);
    // 연말정산 계산 후 항목 저장
    void insertTaxResult(TotalTaxResultVO totalResult);
    // 연말정산 계산결과 조회
    TotalTaxResultVO getTotalResultByTotalInfoId(int totalInfoId);

    TotalTaxResultVO getTotalResultByTotalMemberId(int memberId);

    /* 우리집 돈관리 */

    SpouseRelationVO findMySpouse(int memberId);
    // 배우자 이름 가져오기
    MemberVO getSpouseName(int spouseId);

    List<SpouseRelationVO> getSpouseRealtionStatus(int memberId);
    List<SpouseRelationVO> selectSpouseRelationsById(int id);
    void save(int relationId);

    void insertSpouseRelation(SpouseRelationVO spouseRelation);
    SpouseRelationVO selectSpouseRelationById(int memberId);
    void updateStatusToY(int memberId);
    void deleteSpouseRelationById(int memberId);

}
