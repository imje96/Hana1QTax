package com.spring.oneqtax.transaction.service;

import com.spring.oneqtax.transaction.domain.CardListVO;
import com.spring.oneqtax.transaction.domain.CardTranVO;
import com.spring.oneqtax.transaction.domain.HometaxTranVO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TranChartService {

    /* 회원별 보유카드 조회 */
    public CardListVO getCardList(int memberId);

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

    /* 이번달 총 사용금액 조회 */
    public CardTranVO getThisMonthTotalAmount(int memberId);

    /* 업종별 사용금액 조회 */
    public List<CardTranVO> getCategoryAmount(int memberId);

    /* 이번달 업종별 사용금액 조회 */
    public List<CardTranVO> getThisMonthCategoryAmount(int memberId);

    /* 홈택스 내역 조회 */
    public HometaxTranVO getHometaxTranByMemberId(int memberId);
}
