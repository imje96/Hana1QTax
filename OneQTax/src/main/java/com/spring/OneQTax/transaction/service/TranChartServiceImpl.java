package com.spring.oneqtax.transaction.service;

import com.spring.oneqtax.transaction.domain.CardListVO;
import com.spring.oneqtax.transaction.domain.CardTranVO;
import com.spring.oneqtax.transaction.domain.HometaxTranVO;
import com.spring.oneqtax.transaction.repository.TranMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TranChartServiceImpl  implements TranChartService{

    @Autowired
    private TranMapper tranMapper;

    @Override
    public List<CardListVO> getCardList(int memberId) {
        return tranMapper.getCardList(memberId);
    }

    @Override
    public List<CardListVO> getCardlimit(int memberId) {
        return tranMapper.getCardlimit(memberId);
    }
    @Override
    public List<CardTranVO> getCardTranByMemberId(int memberId) {
        return tranMapper.getCardTranByMemberId(memberId);
    }

    @Override
    public CardTranVO getCardTranByCardNo(String cardNumber) {
        return tranMapper.getCardTranByCardNo(cardNumber);
    }

    @Override
    public CardTranVO getCardTranByFinance(int memberId, int financeId) {
        return tranMapper.getCardTranByFinance(memberId, financeId);
    }

    @Override
    public List<CardTranVO> getThisMonthTran(int memberId) {
        return tranMapper.getThisMonthTran(memberId);
    }

    @Override
    public CardTranVO getThisMonthTranByNo(String cardNumber) {
        return tranMapper.getThisMonthTranByNo(cardNumber);
    }

    @Override
    public CardTranVO getThisMonthTotalByCard(String cardNumber){
        return tranMapper.getThisMonthTotalByCard(cardNumber);
    }

    @Override
    public List<CardTranVO> getThisMonthTotalByCard2(int memberId){
        return tranMapper.getThisMonthTotalByCard2(memberId);
    }

    @Override
    public List<CardTranVO> getThisMonthTotalByBrand(int memberId){
        return tranMapper.getThisMonthTotalByBrand(memberId);
    }

    @Override
    public CardTranVO getThisMonthTotalCard(int memberId) {
        return tranMapper.getThisMonthTotalCard(memberId);
    }
    @Override
    public CardTranVO getThisMonthTotalAmount(int memberId) {
        return tranMapper.getThisMonthTotalAmount(memberId);
    }

    @Override
    public List<CardTranVO> getCategoryAmount(int memberId) {
        return tranMapper.getCategoryAmount(memberId);
    }

    @Override
    public List<CardTranVO> getThisMonthCategoryAmount(int memberId) {
        return tranMapper.getThisMonthCategoryAmount(memberId);
    }

    /* 홈택스 전체 내역 조회 */
    @Override
    public List<HometaxTranVO> getHometaxTransaction(int memberId){
        return tranMapper.getHometaxTransaction(memberId);
    }

    /* 홈택스 전체 총액 조회 */
    @Override
    public HometaxTranVO getHometaxSum(int memberId){
        return tranMapper.getHometaxSum(memberId);
    }
    @Override
    public List<HometaxTranVO> getHometaxThisMonth(int memberId){
        return tranMapper.getHometaxThisMonth(memberId);
    }
    @Override
    public HometaxTranVO getHometaxTranByMemberId(int memberId) {
        return tranMapper.getHometaxTranByMemberId(memberId);
    }
}


