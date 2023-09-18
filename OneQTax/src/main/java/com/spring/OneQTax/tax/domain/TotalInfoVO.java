package com.spring.oneqtax.tax.domain;

import lombok.Data;

// 옵션 항목들 포함
@Data
public class TotalInfoVO {
    /* 사용자가 설정한 총급여 */
    private int total_income2;
    private int income_deduction; // 근로소득공제
    private int income_amount; // 근로소득금액 총급여-근로소득공제

    /* 인적공제 */
    private int personal_deduction; // 인적공제
    private int basic_deduction; // 본인공제
    private int spouse_deduction; // 배우자공제
    private int children_deduction; // 자녀공제
    private int adopted_deduction; // 입양자녀공제
    private int directAnc_deduction; // 직계가족공제
    private int siblings_deduction; // 형제자매공제
    private int senior_deduction; // 경로우대공제
    private int disability_deduction;  // 장애인공제
    private int woman_deduction; // 부녀자공제
    private int singleParent_deduction; // 한부모공제

    /* 연금보험 관련 총납입액 */
    private int pension_deduction;
    private int health_insurance; // 건강보험공제
    private int employment_insurance; // 고용보험공제
    private int national_pension; // 국민연금공제
    /* 주택 관련 총납입액 */
    private int housing_deduction;
    private int rent;             // 주택차입금원리금상환액
    private int housing_account1; // 청약저축
    private int housing_account2; // 주택청약종합저축
    /* 카드 등 소득공제 */
    private int card_deduction; // 카드등 소득공제(계산완료)

    /* 여기서부터 세액공제 납입액 */
//    private int earned_taxcredit; // 근로세액공제 -> 산출세액이 계산된 뒤에 나오는 값이라 해당 VO에 넣으면 안됨
    /* 자녀 세액공제 */
    private int children_taxcredit; // (계산완료)
    /* 연금관련 총납입액 */
    private int irp_taxcredit;
    private int pension_account; // 연금저축 납입액(퇴직연금미포함)
    private int irp_account; // 개인형퇴직연금(irp) 납입액(퇴직연금포함)
    /* 보장성보험 총납입액 */
    private int guarantee_taxcredit;
    private int basic_guarantee; // 일반 보장성보험
    private int disabled_guarantee; // 장애인 보장성보험
    /* 의료비 총납입액 */
    private int medical_taxcredit;
    private int medical_expense; // 본인의료비(본인, 장애인, 만65세 이상자(1957.12.31.이전출생자), 건강보험산정특례자 의료비)
    private int medical_expense2; // 난임시술비
    private int medical_expense3; // 미숙아.선천이상아 의료비
    private int family_medical; // 부양가족 의료비
    /* 교육비 총납입액 */
    private int education_taxcredit;
    private int edu_expense;  // 본인교육비
    private int children_edu; // 20세 미만 자녀교육비
    private int univ_edu;     // 대학생 자녀교육비
    private int uniform_expense; // 교복구입비
    /* 기부금 총납입액 */
    private int donation_taxcredit;
    private int donation1; // 정치자금기부금
    private int donation2; // 법정기부금
    private int donation3; // 우리사주조합기부금
    private int religionEct_donation; // 지정기부금 종교기부금외
    private int religion_donation; // 지정기부금 종교기부금
    /* 월세 총납입액 */
    private int rent_taxcredit;

    /* 세액 */
    private int determined_tax; // 결정세액
    private int prepayment_tax; // 기납부세액
    private int expected_tax; // 차감납부세액
    private int result_time;
}
