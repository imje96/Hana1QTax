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
    public CardListVO getCardList(int memberId) {
        return tranMapper.getCardList(memberId);
    }

    @Override
    public CardTranVO getCardTranByMemberId(int memberId) {
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
    public CardTranVO getThisMonthTran(int memberId) {
        return tranMapper.getThisMonthTran(memberId);
    }

    @Override
    public CardTranVO getThisMonthTranByNo(String cardNumber) {
        return tranMapper.getThisMonthTranByNo(cardNumber);
    }

    @Override
    public CardTranVO getThisMonthTotalAmount(int memberId) {
        return tranMapper.getThisMonthTotalAmount(memberId);
    }

    @Override
    public CardTranVO getCategoryAmount(int memberId) {
        return tranMapper.getCategoryAmount(memberId);
    }

    @Override
    public List<CardTranVO> getThisMonthCategoryAmount(int memberId) {
        return tranMapper.getThisMonthCategoryAmount(memberId);
    }

    @Override
    public HometaxTranVO getHometaxTranByMemberId(int memberId) {
        return tranMapper.getHometaxTranByMemberId(memberId);
    }
}


