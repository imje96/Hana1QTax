package com.spring.oneqtax.transaction.repository;

import com.spring.oneqtax.tax.domain.TaxInfoVO;
import com.spring.oneqtax.transaction.domain.CardListVO;
import com.spring.oneqtax.transaction.domain.CardTranVO;
import com.spring.oneqtax.transaction.domain.HometaxTranVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TranMapper {

    /* 회원별 보유카드 조회 */
    List<CardListVO> getCardList(int memberId);

    /* 카드사별 한도 조회 */
    List<CardListVO> getCardlimit(int memberId);

    /* 회원별 카드 전체내역 조회 */
    List<CardTranVO> getCardTranByMemberId(int memberId);

    /* 카드별 조회 */
    CardTranVO getCardTranByCardNo(String cardNumber);

    /* 금융사별 조회 */
    CardTranVO getCardTranByFinance(int memberId, int financeId);

    /* 이번달 거래내역 조회 */
    List<CardTranVO> getThisMonthTran(int memberId);

    /* 이번달 거래내역 조회(카드별) */
    CardTranVO getThisMonthTranByNo(String cardNumber);

    /* 이번달 카드 총 사용금액 조회 */
    CardTranVO getThisMonthTotalCard(int memberId);

    /* 이번달 카드&홈택스 총 사용금액 조회 */
    CardTranVO getThisMonthTotalAmount(int memberId);

    /* 지난달 카드&홈택스 총 사용금액 조회 */
    CardTranVO getLastMonthTotalAmount(int memberId);

    /* 지난달 카드&홈택스 총 사용금액 조회 */
    CardTranVO getBeforeMonthTotalAmount(int memberId);

    /* 이번달 카드별 총액 조회 */
    CardTranVO getThisMonthTotalByCard(String cardNumber);

    /* 이번달 카드별 총액 조회_카드별 그룹화 */
    List<CardTranVO> getThisMonthTotalByCard2(int memberId);

    /* 이번달 카드사별 총액 조회 */
    List<CardTranVO> getThisMonthTotalByBrand(int memberId);

    /* 업종별 사용금액 조회 */
    List<CardTranVO> getCategoryAmount(int memberId);

    /* 이번달 업종별 사용금액 조회 */
    List<CardTranVO> getThisMonthCategoryAmount(int memberId);

    /* 지난달 업종별 사용금액 조회 */
    List<CardTranVO> getLastMonthCategoryAmount(int memberId);

    /* 지지난달 업종별 사용금액 조회 */
    List<CardTranVO> getBeforeMonthCategoryAmount(int memberId);

    /* 홈택스 전체 내역 조회 */
    List<HometaxTranVO> getHometaxTransaction(int memberId);

    /* 홈택스 전체 총액 조회 */
    HometaxTranVO getHometaxSum(int memberId);

    /* 홈택스 이번달 내역 조회 */
    List<HometaxTranVO> getHometaxThisMonth(int memberId);

    /* 홈택스 이번달 총액 조회 */
    HometaxTranVO getHometaxTranByMemberId(int memberId);
}
