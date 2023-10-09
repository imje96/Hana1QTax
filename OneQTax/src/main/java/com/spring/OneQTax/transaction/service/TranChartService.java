package com.spring.oneqtax.transaction.service;

import com.spring.oneqtax.transaction.domain.CardListVO;
import com.spring.oneqtax.transaction.domain.CardTranVO;
import com.spring.oneqtax.transaction.domain.HometaxTranVO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TranChartService {

    /* 회원별 보유카드 조회 */
    public List<CardListVO> getCardList(int memberId);

    /* 카드사별 한도 조회 */
    public List<CardListVO> getCardlimit(int memberId);

    /* 회원별 카드 전체내역 조회 */
    public List<CardTranVO> getCardTranByMemberId(int memberId);

    /* 카드별 조회 */
    public CardTranVO getCardTranByCardNo(String cardNumber);

    /* 금융사별 조회 */
    public CardTranVO getCardTranByFinance(int memberId, int financeId);

    /* 이번달 거래내역 조회 */
    public List<CardTranVO> getThisMonthTran(int memberId);

    /* 이번달 거래내역 조회(카드별) */
    public CardTranVO getThisMonthTranByNo(String cardNumber);

    /* 이번달 카드 총 사용금액 조회 */
    public CardTranVO getThisMonthTotalCard(int memberId);

    /* 이번달 카드&홈택스 총 사용금액 조회 */
    public CardTranVO getThisMonthTotalAmount(int memberId);

    /* 지난달 카드&홈택스 총 사용금액 조회 */
    public CardTranVO getLastMonthTotalAmount(int memberId);

    /* 지지난달 카드&홈택스 총 사용금액 조회 */
    public CardTranVO getBeforeMonthTotalAmount(int memberId);

    /* 이번달 카드별 총액 조회 */
    CardTranVO getThisMonthTotalByCard(String cardNumber);

    /* 이번달 카드별 총액 조회2 */
    List<CardTranVO> getThisMonthTotalByCard2(int memberId);
    /* 이번달 카드사별 총액 조회 */
    List<CardTranVO> getThisMonthTotalByBrand(int memberId);

    /* 업종별 사용금액 조회 */
    public List<CardTranVO> getCategoryAmount(int memberId);

    /* 이번달 업종별 사용금액 조회 */
    public List<CardTranVO> getThisMonthCategoryAmount(int memberId);

    /* 지난달 업종별 사용금액 조회 */
    public List<CardTranVO> getLastMonthCategoryAmount(int memberId);

    /* 지지난달 업종별 사용금액 조회 */
    public List<CardTranVO> getBeforeMonthCategoryAmount(int memberId);

    /* 홈택스 전체 내역 조회 */
    public List<HometaxTranVO> getHometaxTransaction(int memberId);

    /* 홈택스 전체 총액 조회 */
    public HometaxTranVO getHometaxSum(int memberId);

    /* 홈택스 내역 조회 */
    public List<HometaxTranVO> getHometaxThisMonth(int memberId);

    /* 홈택스 총액 조회 */
    public HometaxTranVO getHometaxTranByMemberId(int memberId);
}
