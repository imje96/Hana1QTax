<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>HanaOneTax</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <%--    common.css--%>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/main.css" rel="stylesheet">
    <link href="../../../resources/css/taxRefund.css" rel="stylesheet">

    <%--    chartjs 추가--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="../../../resources/js/main.js"></script>

    <link href="../../../resources/css/tax.css" rel="stylesheet">

    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>
</head>


<style>
    #progress-bar-container li {
        list-style: none;
        float: left;
        width: 50%;
        text-align: center;
        color: #aaa;
        text-transform: uppercase;
        font-size: 11px;
        cursor: pointer;
        font-weight: 700;
        transition: all ease 0.2s;
        vertical-align: bottom;
        height: 60px;
        position: relative;
    }

    .copy-text {
        padding: 10px 30px;
        background: #f8f2ce;
        border-radius: 10px;
        font-size: 21px;
        line-height: 1.7em;
        text-align: center;
    }

    .flex-container h5 {
        color: #4f4949;
        background: #cfe6e6;
    }

    /*  인적공제부분 버튼  */
    .choice-button input[type=radio] + label {
        display: inline-block;
        color: #05413d;
        padding: 5px 15px;
        width: 180px;
        height: 30px;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        font-size: 18px;
        cursor: pointer;
        background-color: #e9eeed;
        transition: background-color 0.3s, transform 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin-right: 10px;
    }

    .detailBtn {
        display: inline-block;
        color: #05413d;
        padding: 7px;
        width: 150px;
        border: none;
        border-radius: 7px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        cursor: pointer;
        background-color: #fdd0e4;
        /*margin-left: 425px;*/
        transition: background-color 0.3s, transform 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .detailBtn:hover {
        background-color: #fa63a5;
        /* hover 시 배경색 변경 */
        transform: scale(1.05);
        /* hover 시 약간 확대되는 효과 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        /* hover 시 그림자 약간 강화 */
    }

    /* 납부할 세금 창 */
    .info-item5 {
        border: 1px solid #f6f3f3;
        border-radius: 10px;
        margin-bottom: 10px;
        width: 700px;
        padding: 10px 25px;
        font-size: 26px;
        text-align: center;
        background: #00857e;
        line-height: 2.7;
        color: #FFFFFF;
        display: flex;
        justify-content: space-evenly;
    }

    .info-item {
        margin-left: 50px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    /* 연금보험료 모달 */
    .modal-amount-money-variable {
        text-align: right;
    }

    /*  색 변화   */
    .yellow-background {
        background-color: #fbcfe3 !important
    }

    .total-amount-box {
        padding: 15px 25px;
        border: 1px solid #ebf1f1;
        margin: 0 25px 8px 25px;
        font-size: 18px;
        border-radius: 15px;
        width: 300px;
        background: #e6ecea;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

</style>

<body>

<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>


<section class="main">

    <div class="aside" style="width: 20%; float: left; font-family: 'Noto Sans KR', sans-serif !important">
        <br/>
        <br/>
        <br/>
        <div style="padding-left: 30px;">
            <h3 style="color: #065859; margin-bottom: 15px;">연말정산 플래너</h3>
            <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/simulationMain"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 안내</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxSimulation"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 시뮬레이션</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/simulationResult" style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">연말정산 결과</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/spouseAgreement"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">우리집 돈관리 초대하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/spouseResult" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">우리집 돈관리 리포트</div>
            </a>
        </div>
    </div>
    <div class="container1">
        <div class="progress-wrapper">
            <div id="progress-bar-container">
                <ul>
                    <li class="step step01 active" data-step="1">
                        <div class="step-inner">결과</div>
                    </li>
                    <li class="step step02" data-step="2">
                        <div class="step-inner">상세내용</div>
                    </li>

                </ul>
                <div id="line">
                    <div id="line-progress"></div>
                </div>

                <form id="multiStepForm" method="post" action="/saveDetail">
                    <div id="progress-content-section">
                        <!-- Step 1 Content -->
                        <fieldset class="section-content step1 active" data-step="1">
                            <%--                            <legend>STEP 1: 가족구성 정보</legend>--%>
                            <h3>✔ 연말정산 결과</h3>
                            <br/>

                            <div class="info-item5">
                                <div class="info-item">
                                    <c:choose>
                                        <c:when test="${totalResult.expected_tax >= 0}">
                                            <h4><span style="color: #ff7cf1; font-size: 32px">💸납부</span>할 세금 :
                                                <td class="text-right">
                                                    <fmt:formatNumber value="${totalResult.expected_tax}"
                                                                      groupingUsed="true"/>원
                                                </td>
                                            </h4>
                                        </c:when>
                                        <c:otherwise>
                                            <h4><span style="color: #ffb900; font-size:32px;">💰환급</span>받을 세금 :
                                                <td class="text-right">
                                                    <fmt:formatNumber value="${-totalResult.expected_tax}"
                                                                      groupingUsed="true"/>원
                                                </td>
                                            </h4>
                                        </c:otherwise>
                                    </c:choose>
                                    <h4><span style="color:#ffb900;">혜택</span>받는 공제액 :<fmt:formatNumber
                                            value="${totalBenefit}"
                                            groupingUsed="true"/>원
                                    </h4>
                                </div>

                                <c:choose>
                                    <c:when test="${totalResult.expected_tax >= 0}">
                                        <img src="../../../resources/img/cryingCharacter.png" height="200px">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="../../../resources/img/smileCharacter.png" height="200px">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <c:choose>
                                <c:when test="${totalResult.expected_tax >= 0}">
                                    <div class="info-item2"><h3>추가로 공제받을 수 있는 항목이 있는지 확인해보세요💸</h3></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="info-item2"><h3>축하드려요!! 환급을 받을 수 있어요💰</h3></div>
                                </c:otherwise>
                            </c:choose>

                            <br/>
                            <div class="copy-text">
                                납부할 세금이 <span style="font-weight: bold">+(양수)</span>이면 세금을 <span
                                    style="font-weight: bold; color: #1c736f">납부</span>해야하며,<br/>
                                <span style="font-weight: bold; margin-left: 126px">-(음수)</span>이면 세금을 <span
                                    style="font-weight: bold; color: #1c736f">환급</span>받습니다.
                            </div>
                            <br/><br/>
                            <div class="flex-container">
                                <h3>계산 결과 확인하기</h3>
                            </div>
                            <br/>
                            <table class="table-tax">
                                <thead>
                                <tr>
                                    <th class="text-left">항목</th>
                                    <th class="text-left">금액</th>

                                </tr>
                                </thead>
                                <tbody class="table-hover">
                                <tr>
                                    <td class="text-left">1) <span style="color: black; font-weight: 600">근로소득금액</span>
                                    </td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.income_final}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp(-) 소득공제</td>
                                    <td class="text-right"><fmt:formatNumber
                                            value="${totalResult.total_incomeDeduction}" groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">3) <span
                                            style="color: black; font-weight: 600"> (=) 과세표준</span></td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.tax_base}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbspx 기본세율</td>
                                </tr>
                                <tr>
                                    <td class="text-left">4) <span
                                            style="color: black; font-weight: 600"> (=) 산출세액</span></td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.calculated_amount}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp(-) 세액공제</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.total_taxcredit}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">5) <span
                                            style="color: black; font-weight: 600"> (=) 결정세액</span></td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.determined_tax}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp(-) 기납부세액</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.prepayment_tax}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp6) <span
                                            style="color: black; font-weight: 600"> (=) 납부예상세금</span></td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.expected_tax}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                    <br/>

                                </tr>
                                </tbody>
                            </table>

                            <br><br>
                            <div class="flex-container">
                                <button type="button" class="next-button">추가항목 입력</button>
                            </div>
                        </fieldset>


                        <!-- Step 2 Content -->
                        <!-- 모달창 -->
                        <fieldset class="section-content step2" data-step="2">
                            <h3>&nbsp;&nbsp;&nbsp;&nbsp;✔ 상세보기</h3><br/>
                            <div class="copy-text">
                                <span style="font-size: 27px">  <h5>아직 늦지 않았어요, 추가로 환급 받기 🍯TIP</h5></span>
                                IRP로 최대 약 118만원 환급 받기 👉

                                <a href="/redirectToHanaIrp">
                                    <span style="font-weight: bold; border-radius: 10px;background: #fbcfe3; padding: 5px"> 자세히 알아보기</span></a>
                                <br/>
                                <span style="font-size: 22px; font-weight: bold">[연금계좌]</span> 박스를 눌러 세액공제 금액을 확인해보세요
                                <%--                                <span style="font-weight: bold; margin-left: 126px">-(음수)</span>이면 세금을 <span--%>
                                <%--                                    style="font-weight: bold; color: #1c736f">환급</span>받습니다.--%>
                            </div>

                            <div class="content-text">
                                <label for="totalIncome">이미 납부한 세금 :&nbsp;&nbsp;</label>
                                <input type="text" name="repayment_tax_view" id="prepayment_tax_view"
                                       oninput="addCommaToNumber(this)" data-hidden-id="prepayment_tax"
                                       value="<fmt:formatNumber value="${totalInfo.prepayment_tax}" groupingUsed="true"/>">
                                &nbsp;원
                                <input type="hidden" id="prepayment_tax" name="prepayment_tax"
                                       value="${totalInfo.prepayment_tax}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="button" id="saveButton0" class="update-button" value="저장">
                            </div>
                            <br/>
                            <div class="flex-container"><h5> 🔔 박스를 선택하여 세부 공제 항목을 업데이트 해주세요</h5></div>
                            <br/>
                            <div class="flex-container">
                                <div class="flex-column">
                                    <div class="subheading"><h4>소득공제</h4></div>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal1">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 인적사항</h4>
                                                <br/>
                                                소득 공제 금액 :
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1><fmt:formatNumber value="${totalResult.personal_deduction}"
                                                                          groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal2">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 근로소득</h4>
                                                <br/>
                                                소득 공제 금액 :
                                            </div>
                                            <div class="more">
                                                <span> </span>
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1><fmt:formatNumber value="${totalResult.income_deduction}"
                                                                          groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal3">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 연금보험료</h4>
                                                <br/>
                                                소득 공제 금액 :
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1><fmt:formatNumber value="${totalResult.pension_deduction}"
                                                                          groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal4">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 주택자금/저축</h4>
                                                <br/>
                                                소득 공제 금액:
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1 id="outsideDeductionAmount"><fmt:formatNumber
                                                            value="${totalResult.housing_deduction}"
                                                            groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal5">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 신용카드 등</h4>
                                                <br/>
                                                소득 공제 금액:
                                            </div>
                                            <div class="more">
                                                <span> </span>
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1><fmt:formatNumber value="${total_deduction}"
                                                                          groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal6">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 추가소득</h4>
                                                <br/>
                                                소득 공제 금액:
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1>0원</p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                </div>
                                <div class="flex-column">
                                    <div class="subheading"><h4>세액공제</h4></div>
<%--                                    <div class="total-amount-box modal-trigger" data-target="detailsModal7">--%>
                                    <div class="total-amount-box modal-trigger
    <c:if test="${totalResult.irp_taxcredit == 0}">yellow-background</c:if>"
                                         data-target="detailsModal7">


                                    <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 연금계좌</h4>
                                                <br/>
                                                세액 공제 금액:
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1 id=outsideIrpPensionDeduction><fmt:formatNumber
                                                            value="${totalResult.irp_taxcredit}"
                                                            groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal8">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">0%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 보장성보험</h4>
                                                <br/>
                                                세액 공제 금액:
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1><fmt:formatNumber value="${totalResult.guarantee_taxcredit}"
                                                                          groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal9">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 의료비</h4>
                                                <br/>
                                                세액 공제 금액:
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1 id="outsideMedicalDeduction"><fmt:formatNumber
                                                            value="${totalResult.medical_taxcredit}"
                                                            groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal10">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 교육비</h4>
                                                <br/>
                                                세액 공제 금액:
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1 id="outsideEduDeduction"><fmt:formatNumber
                                                            value="${totalResult.education_taxcredit}"
                                                            groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal11">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 기부금</h4>
                                                <br/>
                                                소득 공제 금액:
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1><fmt:formatNumber value="${totalResult.donation_taxcredit}"
                                                                          groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="total-amount-box modal-trigger" data-target="detailsModal12">
                                        <!-- id="showModal" 추가 -->
                                        <%--                                <div class="percent">90%달성</div>--%>
                                        <div class="total-text-box">
                                            <div class="total-text">
                                                <h4>• 월세</h4>
                                                <br/>
                                                세액 공제 금액:
                                            </div>
                                            <div class="more">
                                                <div class="textalign-right1">&gt&gt</div>
                                                <br/>
                                                <div class="textalign-right2">
                                                    <p1><fmt:formatNumber value="${totalResult.rent_taxcredit}"
                                                                          groupingUsed="true"/>원
                                                    </p1>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <%--                            <div class="flex-container">--%>
                            <%--                                <button type="button" class="prev-button" data-step="3">이전</button>--%>
                            <%--                                <button type="submit" class="submit-button" id="deductionCalc">계산하기</button>--%>
                            <%--                            </div>--%>

                            <form id="deductionForm" method="post" action="yourActionURL">
                                <div class="flex-container">
                                    <button type="button" class="prev-button" data-step="3">이전</button>
                                    <button type="submit" class="submit-button" id="deductionCalc">계산하기</button>
                                </div>
                            </form>

                        </fieldset>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<%-- 여기서부터 모달창--%>
<%-- 1번 모달창--%>
<div class="modal_simulation" id="detailsModal1">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <%--        <form class="updateForm" action="/update" method="post">--%>
        <h3>인적사항</h3>
        <p>기준일시 : ${totalInfo.result_time}</p>
        <p>인적 공제를 위한 부양가족 수 및 특별공제 항목을 입력해주세요.</p>
        <br/>

        <div class="modal-amount-box">
            <div class="modal-amount-text">
                <h5>소득 공제 금액</h5>
            </div>
            <div class="modal-amount-money">
                <p2><fmt:formatNumber value="${totalResult.personal_deduction}" groupingUsed="true"/>원</p2>
            </div>
        </div>
        <hr>
        <div class="modal-amount-box">
            <div class="modal-amount-text">
                <br/>
                <label for="totalIncome">총급여:</label>
                <input type="text" name="totalIncome_view" id="totalIncome_view" oninput="addCommaToNumber(this)"
                       data-hidden-id="totalIncome"
                       value="<fmt:formatNumber value="${totalInfo.total_income2}" groupingUsed="true"/>">
                원
                <input type="hidden" id="totalIncome" name="totalIncome" value="${totalInfo.total_income2}"><br/>


                <label>배우자 공제 유/무:</label>
                <div class="choice-button">
                    <input type="radio" id="spouseDeduction_yes" name="spouseDeduction" value="yes">
                    <label for="spouseDeduction_yes">O</label>
                    <input type="radio" id="spouseDeduction_no" name="spouseDeduction" value="no">
                    <label for="spouseDeduction_no">X</label>
                </div>
                <label for="child">만 20세 이하 자녀 수(세액공제):</label><br/>
                <select name="child" id="child" class="content-dropdown">
                    <option value="0">0명</option>
                    <option value="1">1명</option>
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                    <option value="5">5명</option>
                    <option value="6">6명</option>
                </select>
                <p>거주자와 생계를 같이하는 연간 소득금액 합계액 100만원 이하인 부양가족</p>
                <label for="adoptedChild">출산/입양 자녀 수(세액공제):</label><br/>
                <select name="adoptedChild" id="adoptedChild"
                        class="content-dropdown">
                    <option value="0">0명</option>
                    <option value="1">1명</option>
                    <foption value="2">2명</foption>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                    <option value="5">5명</option>
                    <option value="6">6명</option>
                </select>
                <p>연말정산 적용기간에 출산하거나 입양신고 자녀</p>
                <label for="directAncestor">직계존속 수:</label><br/>
                <select name="directAncestor" id="directAncestor"
                        class="content-dropdown">
                    <option value="0">0명</option>
                    <option value="1">1명</option>
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                    <option value="5">5명</option>
                    <option value="6">6명</option>
                </select>
                <p>거주자와 생계를 같이하는 연간 소득금액 합계액 100만원 이하인 부양가족</p>
                <label for="siblings">형제/자매 수:</label><br/>
                <select name="siblings" id="siblings" class="content-dropdown">
                    <option value="0">0명</option>
                    <option value="1">1명</option>
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                    <option value="5">5명</option>
                    <option value="6">6명</option>
                </select>
                <p>연말정산 적용기간에 출산하거나 입양신고 자녀</p>
                <label for="senior">경로자 수:</label><br/>
                <select name="senior" id="senior" class="content-dropdown">
                    <option value="0">0명</option>
                    <option value="1">1명</option>
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                    <option value="5">5명</option>
                    <option value="6">6명</option>
                </select><br/>
                <label for="disability">장애인 수:</label><br/>
                <select name="disability" id="disability" class="content-dropdown">
                    <option value="0">0명</option>
                    <option value="1">1명</option>
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                    <option value="5">5명</option>
                    <option value="6">6명</option>
                </select><br/>
                <label>부녀자 여부:</label>
                <div class="choice-button">
                    <input type="radio" id="woman_yes" name="womanDeduction" value="yes">
                    <label for="woman_yes">O</label>
                    <input type="radio" id="woman_no" name="womanDeduction" value="no">
                    <label for="woman_no">X</label>
                </div>
                <label>한부모 여부:</label>
                <div class="choice-button">
                    <input type="radio" id="singleParent_yes" name="singleParent" value="yes">
                    <label for="singleParent_yes">O</label>
                    <input type="radio" id="singleParent_no" name="singleParent" value="no">
                    <label for="singleParent_no">X</label>
                </div>
                <div class="modal-amount-explanation">
                    <p2>부양가족 공제?</p2>
                    <br/>
                    <p> &#183; 거주자와 생계를 같이하는 연간 소득금액 합계액 1000만원 이하(근로소득만 있는 경우 총 급여 500만원<br/> 이하)인
                        부양가족에 대하여 1명당 1,500,000원 기본공제</p>
                    <p> &#183; 부양가족이 기본공제대상에 포함되기 위해서는 일반적으로 나이 제한을 적용받으나, 소득세법에 따른 <br/>장애인에
                        해당하는 경우 나이제한을 적용받지 아니함</p>
                    <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p>
                </div>
                <div class="flex-container">
                    <input type="button" id="saveButton1" class="update-button" value="저장">
                </div>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
            </div>
        </div>
    </div>
</div>
<%-- 2번 모달창--%>
<div class="modal_simulation" id="detailsModal2">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>근로소득</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>근로소득 공제금액을 확인하고, 실제 근로소득 금액을 입력해 정확한 정보를 확인해보세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>소득 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <p2><fmt:formatNumber value="${totalResult.income_deduction}" groupingUsed="true"/>원</p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>
                    <p2>총급여 :</p2>
                    <br/>
                    <p2>(-) 근로소득공제 :</p2>
                    <br/>
                    <p2>(=) 근로소득금액 :</p2>
                    <br/>

                </div>
                <div class="modal-amount-money-variable">
                    <p2><fmt:formatNumber value="${totalInfo.total_income2}" groupingUsed="true"/>원</p2>
                    <br/>
                    <p2><fmt:formatNumber value="${totalResult.income_deduction}" groupingUsed="true"/>원</p2>
                    <br/>
                    <p2><fmt:formatNumber value="${totalResult.income_final}" groupingUsed="true"/>원</p2>
                    <br/>
                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>근로소득금액?</p2>
                <br/>
                <p> &#183; 내가 번 근로소득에도 세금이 붙어요. 근로소득세는 국방이나 교육, 공공시설 관리와 같은 나라를 운영하는데 필요한 비용으로 사용돼요. </p>
                <p> &#183; 근로소득세에는 사업체에 고용되어 근로를 제공한 대가로 받은 모든 현금과 현물을 의미합니다. 근로소득에는 임금, 상여금 및 수당, 수수료 및 봉사료, 수익 분배금, 연차
                    및 유급휴가 등 비근무시간의 보수가 포함됩니다.</p>
            </div>
        </form>
    </div>
</div>
<%-- 3번 모달창 --%>
<div class="modal_simulation" id="detailsModal3">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <%--        <form class="updateForm" action="/updateDetail" method="post">--%>
        <h3>연금보험료</h3>
        <p>기준일시 : ${totalInfo.result_time}</p>
        <p>근로자 4대 보험 이외 개인연금저축 납입현황을 확인해주세요.</p>
        <br/>

        <div class="modal-amount-box">
            <div class="modal-amount-text">
                <h5>총 납입액</h5>
                <h5>소득 공제 금액</h5>
            </div>
            <div class="modal-amount-money">
                    <span id="totalPension"><fmt:formatNumber value="${totalInfo.pension_deduction}"
                                                              groupingUsed="true"/>원</span><br/>
                <p2><fmt:formatNumber value="${totalResult.pension_deduction}" groupingUsed="true"/>원</p2>
            </div>
        </div>
        <hr>
        <div class="modal-amount-box">
            <div class="modal-amount-text">

                <p2>건강보험료 납입공제 :</p2>
                <br/>
                <p2>고용보험료 납입공제 :</p2>
                <br/>
                <p2>국민연금 납입공제 :</p2>
                <br/>
                <%--                    <label for="healthInsurance">건강보험료 납입공제 :</label><br/>--%>
                <%--                    <label for="employmentInsurance">고용보험료 납입공제 :</label><br/>--%>
                <%--                    <label for="nationalPension">국민연금 납입공제 :</label><br/>--%>
                <label for="other_pension">기타연금 납입공제 :</label><br/>


            </div>
            <div class="modal-amount-money-variable">
                <div class="modal-amount-money-variable">
                    <p2><fmt:formatNumber value="${totalInfo.health_insurance}" groupingUsed="true"/>원</p2>
                    <br/>
                    <%--                    <input type="text" name="healthInsurance_view" id="healthInsurance_view" oninput="addCommaToNumber(this)"--%>
                    <%--                           data-hidden-id="healthInsurance" value="<fmt:formatNumber value="${totalInfo.health_insurance}" groupingUsed="true"/>">원<br/>--%>
                    <%--                    <input type="hidden" id="healthInsurance" name="healthInsurance" value="${totalInfo.health_insurance}">--%>
                    <p2><fmt:formatNumber value="${totalInfo.employment_insurance}" groupingUsed="true"/>원</p2>
                    <br/>

                    <%--                    <input type="text" name="employmentInsurance_view" id="employmentInsurance_view" oninput="addCommaToNumber(this)"--%>
                    <%--                           data-hidden-id="employmentInsurance" value="<fmt:formatNumber value="${totalInfo.employment_insurance}" groupingUsed="true"/>">원<br/>--%>
                    <%--                    <input type="hidden" id="employmentInsurance" name="employmentInsurance" value="${totalInfo.employment_insurance}">--%>
                    <%--                    --%>
                    <p2><fmt:formatNumber value="${totalInfo.national_pension}" groupingUsed="true"/>원</p2>
                    <br/>

                    <%--                    <input type="text" name="nationalPension_view" id="nationalPension_view" oninput="addCommaToNumber(this)"--%>
                    <%--                           data-hidden-id="nationalPension" value="<fmt:formatNumber value="${totalInfo.national_pension}" groupingUsed="true"/>">원<br/>--%>
                    <%--                    <input type="hidden" id="nationalPension" name="nationalPension" value="${totalInfo.national_pension}">--%>
                    <input type="text" name="otherPension_view" id="otherPension_view" oninput="addCommaToNumber(this)"
                           data-hidden-id="other_pension"
                           value="<fmt:formatNumber value="${totalInfo.other_pension}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="other_pension" name="other_pension" value="${totalInfo.other_pension}">
                    <%--                    <input type="text" id="otherPension" name="national_pension" oninput="addCommaToNumber(this)"--%>
                    <%--                           value="<fmt:formatNumber value="${totalInfo.other_pension}" groupingUsed="true"/>">원<br/>--%>
                </div>
            </div>
        </div>
        <div class="modal-amount-explanation">
            <p2>기타 납입연금?</p2>
            <br/>
            <p> &#183; 공무원 연금, 군인연금, 사립학교 교직원 연금, 별정 우체국 연금 등 납입한 연금보험료 공제</p>
        </div>
        <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p>

        <div class="flex-container">
            <input type="button" id="saveButton2" class="update-button" value="저장">
        </div>
        </form>
    </div>
</div>
<%-- 4번 모달창 --%>
<div class="modal_simulation" id="detailsModal4">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>주택자금/주택마련저축</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>주택임차차입금 및 청약저축금액을 직접 입력해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>소득 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="totalHousing"><fmt:formatNumber value="${totalInfo.housing_total}"
                                                              groupingUsed="true"/>원</span><br/>
                    <p2 id="deductionAmount"><fmt:formatNumber value="${totalResult.housing_deduction}"
                                                               groupingUsed="true"/>원
                    </p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>
                    <label for="housing_loan">주택임차 차입금 원리금 상환액 :</label><br/>

                    <label for="housing_account1">청약저축 납입액 :</label><br/>

                    <label for="housing_account2">주택청약종합저축 :</label><br/>


                </div>
                <div class="modal-amount-money-variable">

                    <input type="text" name="housing_loan_view" id="housing_loan_view" oninput="addCommaToNumber(this)"
                           data-hidden-id="housing_loan"
                           value="<fmt:formatNumber value="${totalInfo.housing_loan}" groupingUsed="true"/>">원
                    <input type="hidden" id="housing_loan" name="housing_loan" value="${totalInfo.housing_loan}"><br/>

                    <input type="text" name="housing_account1_view" id="housing_account1_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="housing_account1"
                           value="<fmt:formatNumber value="${totalInfo.housing_account1}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="housing_account1" name="housing_account1"
                           value="${totalInfo.housing_account1}">
                    <input type="text" name="housing_account2_view" id="housing_account2_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="housing_account2"
                           value="<fmt:formatNumber value="${totalInfo.housing_account2}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="housing_account2" name="housing_account2"
                           value="${totalInfo.housing_account2}">
                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>주택임차 차입금?</p2>
                <br/>
                <p> &#183; 과세기간 종료일 현재 무주택 세대의 세대주(세대주가 주택관련 공제를 받지 않는 경우 세대원도 가능)로서 근로소득이 있는 자</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p>
            <div class="flex-container">
                <input type="button" id="saveButton3" class="update-button" value="저장">
            </div>
        </form>
    </div>
</div>
<%-- 5번 모달창 --%>
<div class="modal_simulation" id="detailsModal5">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>신용카드 및 체크카드/현금 소득공제</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>카드 등 소비 소득공제를 확인해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>소득 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="totalCard"><fmt:formatNumber value="${totalTransaction}"
                                                           groupingUsed="true"/>원</span><br/>
                    <p2><fmt:formatNumber value="${total_deduction}" groupingUsed="true"/>원</p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>
                    <label for="creditTotal">신용카드 사용액 :</label><br/>
                    <label for="debitTotal">체크카드 사용액 :</label><br/>
                    <label for="cashTotal">현금영수증 사용액 :</label><br/>
                    <label for="transportTotal">대중교통 사용분 :</label><br/>
                    <label for="marketTotal">전통시장 사용분 :</label><br/>
                    <label for="cultureTotal">도서공연문화 사용분 :</label><br/>


                </div>
                <div class="modal-amount-money-variable">
                    <input type="text" id="creditTotal" name="creditTotal" oninput="addCommaToNumber(this)"
                           value="<fmt:formatNumber value="${transaction.credit_total}" groupingUsed="true"/>">원<br/>
                    <input type="text" id="debitTotal" name="debitTotal" oninput="addCommaToNumber(this)"
                           value="<fmt:formatNumber value="${transaction.debit_total}" groupingUsed="true"/>">원<br/>
                    <input type="text" id="cashTotal" name="cashTotal" oninput="addCommaToNumber(this)"
                           value="<fmt:formatNumber value="${transaction.cash_total}" groupingUsed="true"/>">원<br/>
                    <input type="text" id="transportTotal" name="transportTotal" oninput="addCommaToNumber(this)"
                           value="<fmt:formatNumber value="${transaction.transport_total}" groupingUsed="true"/>">원<br/>
                    <input type="text" id="marketTotal" name="marketTotal" oninput="addCommaToNumber(this)"
                           value="<fmt:formatNumber value="${transaction.market_total}" groupingUsed="true"/>">원<br/>
                    <input type="text" id="cultureTotal" name="cultureTotal" oninput="addCommaToNumber(this)"
                           value="<fmt:formatNumber value="${transaction.culture_total}" groupingUsed="true"/>">원<br/>
                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>신용카드</p2>
                <br/>
                <p> &#183; 신용카드를 사용하여 그 대가를 지급하는 금액</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p>
            <div class="flex-container">
                <input type="button" class="update-button" value="저장">
            </div>
        </form>
    </div>
</div>
<%-- 6번 모달창 --%>
<div class="modal_simulation" id="detailsModal6">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>추가소득</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>추가 소득 공제 대상 금액을 입력해 주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>세액 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="additional_deduction"><fmt:formatNumber value="${totalInfo.additional_deduction}"
                                                                      groupingUsed="true"/>원</span><br/>
                    <p2 id="additionalDeduction"><fmt:formatNumber value="${totalResult.additional_deduction}"
                                                                   groupingUsed="true"/>원
                    </p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>
                    <label for="medical_expense">소기업/소상공인 공재부금 :</label><br/>
                    <label for="medical_expense2">우리사주 출연금 :</label><br/>
                    <label for="medical_expense3">투자조합출자 공제 :</label><br/>
                    <label for="family_medical">기타 소득공제 대상금액 :</label><br/>
                </div>
                <div class="modal-amount-money-variable">

                    <input type="text" name="additional_deduction_view" id="additional_deductione_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="additional_deduction"
                           value="0">원<br/>


                    <input type="text" name="additional_deduction2_view" id="additional_deduction2_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="additional_deduction2"
                           value="0">원<br/>


                    <input type="text" name="medical_expense3_view" id="additional_deduction3_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="additional_deduction3"
                           value="0">원<br/>

                    <input type="text" name="additional_deduction4_view" id="additional_deduction4_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="additional_deduction4"
                           value="0">원<br/>

                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>소기업/소상공인 공제부금(노랑우산공제)?</p2>
                <br/>
                <p> &#183; 거주자가 중소기업현동조합법 제 115조에 따른 소기업/소상공인 공제에 가입하여 해당 과세기간에 납부하는 공제부금 </p>
                <p2>투자조합출자 공제?</p2>
                <br/>
                <p> &#183; 출자일 또는 투자일이 속하는 과세연도의 소득금액에서 공제</p>
                <p2>우리사주출연금?</p2>
                <br/>
                <p> &#183; 우리사주조합원이 자사주를 취득하기 ㅜ이하여 우리사주조합에 출자하는 경우 400만원 한도 공제</p>
                <p2>기타 소득공제 대상금액?</p2>
                <br/>
                <p> &#183; 고용유지 중소기업 근로자 소득공제, 목돈 안드는 전세 이자 상환액 공제, 장기집합 투자 증권저축 등 추가 소득공제 금액</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p><br/>
            <div class="flex-container">
                <input type="button" id="saveButton6" class="update-button" value="저장">
            </div>
        </form>
    </div>
</div>
<%-- 7번 모달창 --%>
<div class="modal_simulation" id="detailsModal7">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>연금계좌</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>연금저축계좌 및 퇴직연금계좌 납입액을 직접 입력해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>세액 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="irpPension_total"><fmt:formatNumber value="${totalInfo.irpPension_total}"
                                                                  groupingUsed="true"/>원</span><br/>
                    <p2 id="irpPensionDeduction"><fmt:formatNumber value="${totalResult.irp_taxcredit}"
                                                                   groupingUsed="true"/>원
                    </p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>
                    <label for="pension_amount">연금저축계좌(퇴직연금 미포함) :</label><br/>

                    <label for="irp_amount">연금계좌(IRP)(퇴직연금 포함) :</label><br/>

                    <label for="irp_amount">ISA계좌 :</label><br/>

                </div>
                <div class="modal-amount-money-variable">

                    <input type="text" name="pension_amount_view" id="pension_amount_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="pension_amount"
                           value="<fmt:formatNumber value="${totalInfo.pension_amount}" groupingUsed="true"/>">원
                    <input type="hidden" id="pension_amount" name="pension_amount"
                           value="${totalInfo.pension_amount}"><br/>

                    <input type="text" name="irp_amount_view" id="irp_amount_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="irp_amount"
                           value="<fmt:formatNumber value="${totalInfo.irp_amount}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="irp_amount" name="irp_amount"
                           value="${totalInfo.irp_amount}">

                    <input type="text" name="irp_amount_view" id="isa_amount_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="isa_amount"
                           value="0">원<br/>

                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>연금저축 납입액?</p2>
                <br/>
                <p> &#183; 근로자 본인 명의로 2001.1.1 이후에 연금저축에 가입하여 해당 과세기간에 납입한 금액</p>
                <p2>퇴직연금 납입액?</p2>
                <br/>
                <p> &#183; 확정기여형(DC형) 퇴직연금제도 또는 개인형퇴직연금(IRP) 제도에 근로자가 부담하는 부담금(확정기여형 퇴직연금 등 회사부담액 제외)</p>
                <p2>ISA 만기 추가 납입액</p2>
                <br/>
                <p> &#183; 개인종합자산관리계좌(ISA) 만기 시 혜당 계좌 잔액의 전부 또는 일부를 연금계좌로 납입한 금액</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p><br/>
            <div class="flex-container">
                <input type="button" id="saveButton7" class="update-button" value="저장">
            </div>
        </form>
    </div>
</div>
<%-- 8번 모달창 --%>
<div class="modal_simulation" id="detailsModal8">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>보장성 보험</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>보장성 보험 납입액을 입력해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>세액 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="guarantee_total"><fmt:formatNumber value="${totalInfo.guarantee_total}"
                                                                 groupingUsed="true"/>원</span><br/>
                    <p2 id="guaranteeDeduction"><fmt:formatNumber value="${totalResult.guarantee_taxcredit}"
                                                                  groupingUsed="true"/>원
                    </p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>
                    <label for="basic_guarantee">보장성 보험 :</label><br/>
                    <label for="disabled_guarantee">장애인 보장성 보험 :</label><br/>
                </div>
                <div class="modal-amount-money-variable">

                    <input type="text" name="basic_guarantee_view" id="basic_guarantee_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="basic_guarantee"
                           value="<fmt:formatNumber value="${totalInfo.basic_guarantee}" groupingUsed="true"/>">원
                    <input type="hidden" id="basic_guarantee" name="medical_expense"
                           value="${totalInfo.basic_guarantee}"><br/>

                    <input type="text" name="disabled_guarantee_view" id="disabled_guarantee_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="disabled_guarantee"
                           value="<fmt:formatNumber value="${totalInfo.disabled_guarantee}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="disabled_guarantee" name="disabled_guarantee"
                           value="${totalInfo.disabled_guarantee}">

                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>보장성 보험?</p2>
                <br/>
                <p> &#183; 기본 공제 대상자를 피보험자로 하는 보자엉 조험(장애인 전용 보장성 보험 제외)의 보험료 납입액 </p>
                <p2>장애인 보장성 보험?</p2>
                <br/>
                <p> &#183; 기본공제 대상자 중 장애인을 피보함자 도는 수익자로 하는 장애인 전용 보험의 보험료(보험계약 또는 보험료 납입 영수증에 장애인 전용보험으로 표시된 것을 말함)</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p><br/>
            <div class="flex-container">
                <input type="button" id="saveButton8" class="update-button" value="저장">
            </div>
        </form>
    </div>
</div>
<%-- 9번 모달창 --%>
<div class="modal_simulation" id="detailsModal9">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>의료비</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>의료비로 사용한 세액공제대상 금액을 입력해주세요.</p>
            <span style="color: #af0332"><h5> * 의료비 세액공제는 총급여액의 3%를 초과한 금액에 대해서 공제가능합니다.</h5></span>
            <span style="color: #af0332">  <h5>(나의 의료비 공제 시작 금액 :  <fmt:formatNumber
                    value="${totalInfo.total_income2*0.03}"
                    groupingUsed="true"/>원)</h5></span><br/>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>세액 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="medical_total"><fmt:formatNumber value="${totalInfo.medical_total}"
                                                               groupingUsed="true"/>원</span><br/>
                    <p2 id="medicalDeduction"><fmt:formatNumber value="${totalResult.medical_taxcredit}"
                                                                groupingUsed="true"/>원
                    </p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>
                    <label for="medical_expense">본인 의료비 :</label><br/>
                    <label for="medical_expense2">난임시술비 :</label><br/>
                    <label for="medical_expense3">미숙아.선천이상자 의료비 :</label><br/>
                    <label for="family_medical">부양가족 의료비 :</label><br/>
                </div>
                <div class="modal-amount-money-variable">

                    <input type="text" name="medical_expense_view" id="medical_expense_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="medical_expense"
                           value="<fmt:formatNumber value="${totalInfo.medical_expense}" groupingUsed="true"/>">원
                    <input type="hidden" id="medical_expense" name="medical_expense"
                           value="${totalInfo.medical_expense}"><br/>

                    <input type="text" name="medical_expense2_view" id="medical_expense2_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="medical_expense2"
                           value="<fmt:formatNumber value="${totalInfo.medical_expense2}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="medical_expense2" name="medical_expense2"
                           value="${totalInfo.medical_expense2}">

                    <input type="text" name="medical_expense3_view" id="medical_expense3_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="medical_expense3"
                           value="<fmt:formatNumber value="${totalInfo.medical_expense3}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="medical_expense3" name="medical_expense3"
                           value="${totalInfo.medical_expense3}">

                    <input type="text" name="family_medical_view" id="family_medical_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="family_medical"
                           value="<fmt:formatNumber value="${totalInfo.family_medical}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="family_medical" name="family_medical"
                           value="${totalInfo.family_medical}">

                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>난임시술비?</p2>
                <br/>
                <p> &#183; 난임시술비란 [국민건강보험 요양급여의 기준에 관한 규칙] 별표 2 제 4호 라목에 따른 보조생식술(체내&#183;체외 인공수정 포함)에 소요된 비용 </p>
                <p2>공제대상 제외?</p2>
                <br/>
                <p> &#183; 보험회사, 국민건강보험공단 등에서 보전받은 의료비 공제대상 제외</p>
                <p> &#183; 미용&#183;성형수술비용 및 건강증진 의약품 구입비용공제대상 제외</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p><br/>
            <div class="flex-container">
                <input type="button" id="saveButton9" class="update-button" value="저장">
            </div>
        </form>
    </div>
</div>
<%-- 10번 모달창 --%>
<div class="modal_simulation" id="detailsModal10">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>교육비</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>교육비로 사용한 세액공제대상 금액을 입력해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>세액 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="education_total"><fmt:formatNumber value="${totalInfo.education_total}"
                                                                 groupingUsed="true"/>원</span><br/>
                    <p2 id="educationDeduction"><fmt:formatNumber value="${totalResult.education_taxcredit}"
                                                                  groupingUsed="true"/>원
                    </p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>

                    <label for="edu_expense">본인 교육비 :</label><br/>
                    <label for="children_edu">20세 미만 자녀교육비 :</label><br/>
                    <label for="univ_edu">대학생 자녀교육비 :</label><br/>
                    <label for="uniform_expense">교복구입비 :</label><br/>
                </div>
                <div class="modal-amount-money-variable">

                    <input type="text" name="edu_expense_view" id="edu_expense_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="edu_expense"
                           value="<fmt:formatNumber value="${totalInfo.medical_expense}" groupingUsed="true"/>">원
                    <input type="hidden" id="edu_expense" name="edu_expense"
                           value="${totalInfo.edu_expense}"><br/>

                    <input type="text" name="children_edu_view" id="children_edu_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="children_edu"
                           value="<fmt:formatNumber value="${totalInfo.children_edu}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="children_edu" name="children_edu"
                           value="${totalInfo.children_edu}">

                    <input type="text" name="univ_edu_view" id="univ_edu_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="univ_edu"
                           value="<fmt:formatNumber value="${totalInfo.univ_edu}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="univ_edu" name="univ_edu"
                           value="${totalInfo.univ_edu}">

                    <input type="text" name="uniform_expense_view" id="uniform_expense_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="uniform_expense"
                           value="<fmt:formatNumber value="${totalInfo.uniform_expense}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="uniform_expense" name="uniform_expense"
                           value="${totalInfo.uniform_expense}">
                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>근로자 본인 세액공제 대상?</p2>
                <br/>
                <p> &#183;대학원 교육비, 직업능력개발훈련시설 수강료 등 </p>
                <p2>부양가족 세액공제 대상?</p2>
                <br/>
                <p> &#183; 취학 전 아동, 초/중/고생 연 300만원 한도, 대학생 900만원 한도</p>
                <p2>교복 구입비?</p2>
                <br/>
                <p> &#183; 교복구입비용 연 50만원 한도</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p><br/>
            <div class="flex-container">
                <input type="button" id="saveButton10" class="update-button" value="저장">
            </div>
        </form>
    </div>
</div>
<%-- 11번 모달창 --%>
<div class="modal_simulation" id="detailsModal11">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>기부금</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>해당하는 항목에 기부금을 입력해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>세액 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="donation_total"><fmt:formatNumber value="${totalInfo.education_total}"
                                                                groupingUsed="true"/>원</span><br/>
                    <p2 id="education_total"><fmt:formatNumber value="${totalResult.education_taxcredit}"
                                                               groupingUsed="true"/>원
                    </p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>
                    <label for="donation1">정치자금기부금 :</label><br/>
                    <label for="donation2">법정기부금 :</label><br/>
                    <label for="donation3">우리사주조합기부금 :</label><br/>
                    <label for="religionEct_donation">지정기부금(종교기부금외) :</label><br/>
                    <label for="religion_donation">지정기부금(종교기부금) :</label><br/>
                </div>

                <div class="modal-amount-money-variable">
                    <input type="text" name="donation1_view" id="donation1_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="donation1"
                           value="<fmt:formatNumber value="${totalInfo.donation1}" groupingUsed="true"/>">원
                    <input type="hidden" id="donation1" name="donation1"
                           value="${totalInfo.donation1}"><br/>

                    <input type="text" name="donation2_view" id="donation2_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="donation2"
                           value="<fmt:formatNumber value="${totalInfo.children_edu}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="donation2" name="donation2"
                           value="${totalInfo.donation2}">

                    <input type="text" name="donation3_view" id="donation3_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="donation3"
                           value="<fmt:formatNumber value="${totalInfo.donation3}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="donation3" name="donation3"
                           value="${totalInfo.donation3}">

                    <input type="text" name="religionEct_donation_view" id="religionEct_donation_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="religionEct_donation"
                           value="<fmt:formatNumber value="${totalInfo.religionEct_donation}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="religionEct_donation" name="religionEct_donation"
                           value="${totalInfo.religionEct_donation}">

                    <input type="text" name="religion_donation_view" id="religion_donation_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="religion_donation"
                           value="<fmt:formatNumber value="${totalInfo.religion_donation}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="religion_donation" name="religion_donation"
                           value="${totalInfo.religion_donation}">
                </div>
            </div>

            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p><br/>
            <div class="flex-container">
                <input type="button" id="saveButton11" class="update-button" value="저장">
            </div>
        </form>
    </div>
</div>
<%-- 12번 모달창 --%>
<div class="modal_simulation" id="detailsModal12">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form class="updateForm" action="/update" method="post">
            <h3>월세</h3>
            <p>기준일시 : ${totalInfo.result_time}</p>
            <p>월세로 납입한 세액공제대상 금액을 입력해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>세액 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="rent_total"><fmt:formatNumber value="${totalInfo.rent_total}"
                                                            groupingUsed="true"/>원</span><br/>
                    <p2 id="rentDeduction"><fmt:formatNumber value="${totalResult.rent_taxcredit}"
                                                             groupingUsed="true"/>원
                    </p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h3></h3>

                    <label for="edu_expense">월세 납입액 :</label><br/>
                </div>
                <div class="modal-amount-money-variable">

                    <input type="text" name="edu_expense_view" id="rent_total_view"
                           oninput="addCommaToNumber(this)"
                           data-hidden-id="rent_total"
                           value="<fmt:formatNumber value="${totalInfo.rent_total}" groupingUsed="true"/>">원
                    <input type="hidden" id="rent_total2" name="rent_total"
                           value="${totalInfo.rent_total}"><br/>

                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>공제대상?</p2>
                <br/>
                <p> &#183;해당 과세기간 총 급여액이 7천만원 이하 근로소득자(종합소득금액 6천만원 초과자 제외) </p>
                <p> &#183;무주택 세대의 세대주(세대주가 주택 관련 고제를 받지 않는 경우 세대운도 가능)가 국민주택규모 또는
                    기준시가 4억원 이하의 주택(주거용 오피스텔, 고시원 포함)을 임차하기 위해 지급하는 월세액 </p>

                <div class="flex-container">
                    <input type="button" id="saveButton12" class="update-button" value="저장">
                </div>
            </div>
        </form>
    </div>
</div>

<footer>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<%-- 업데이트 진행률 --%>
<script>
    let currentStep = 1;
    // 클릭으로 이동하기
    $(".step").click(function () {
        $(this).addClass("active").prevAll().addClass("active");
        $(this).nextAll().removeClass("active");
    });

    $(".step01").click(function () {
        $("#line-progress").css("width", "50%");
        $(".step1").addClass("active").siblings().removeClass("active");
    });

    $(".step02").click(function () {
        $("#line-progress").css("width", "100%");
        $(".step2").addClass("active").siblings().removeClass("active");
    });

    // 버튼으로 이동하기
    $(".prev-button, .next-button").click(function () {
        if ($(this).hasClass('next-button')) {
            currentStep++;
        } else {
            currentStep--;
        }
        updateStep();
    });

    function updateStep() {
        let progressPercentages = [50, 50, 100];

        $(".step").removeClass("active");
        $(".section-content").removeClass("active");

        $(`.step0${currentStep}`).addClass("active").prevAll().addClass("active");
        $(".section-content.step" + currentStep).addClass("active");
        $("#line-progress").css("width", progressPercentages[currentStep] + "%");
    }

</script>

<%--모달 표시 및 숨기기--%>
<script>
    const triggers = document.querySelectorAll('.modal-trigger');
    triggers.forEach(trigger => {
        trigger.addEventListener('click', function () {
            const targetId = this.getAttribute('data-target');
            const targetModal = document.getElementById(targetId);
            targetModal.style.display = 'block';
        });
    });

    const modals = document.querySelectorAll('.modal_simulation');
    modals.forEach(modal => {
        const closeBtn = modal.querySelector('.close');
        closeBtn.addEventListener('click', function () {
            modal.style.display = 'none';
        });

        // modal-content를 클릭하면 모달이 닫히지 않도록 수정
        // modal.querySelector('.modal-content').addEventListener('click', function (event) {
        //     event.stopPropagation();
        // });
    });

    window.addEventListener('click', function (event) {
        if (event.target.classList.contains('modal_simulation')) {
            event.target.style.display = 'none';
        }
    });

</script>


<script>
    function addCommaToNumber(inputElem) {
        let num = inputElem.value.replace(/,/g, "");

        if (!isNaN(num) && num.trim() != "") {
            inputElem.value = parseFloat(num).toLocaleString('en-US');

            // 연관된 숨겨진 입력 필드의 값을 갱신합니다.
            let hiddenFieldId = inputElem.getAttribute("data-hidden-id");
            document.getElementById(hiddenFieldId).value = num;
        } else {
            inputElem.value = num;
        }
    }

    // 모든 "view" 입력 필드의 초기값 설정
    function setInitialValues() {
        let viewInputs = document.querySelectorAll('input[data-hidden-id]');

        viewInputs.forEach(viewInput => {
            let hiddenFieldId = viewInput.getAttribute("data-hidden-id");
            document.getElementById(hiddenFieldId).value = viewInput.value.replace(/,/g, "");
        });
    }

    // 페이지 로드 시 초기값 설정 함수 호출
    window.onload = setInitialValues;


</script>
<%-- 업데이트 로직 --%>
<script>
    // 이벤트 리스너 추가
    document.addEventListener('DOMContentLoaded', (event) => {
        if (document.getElementById('saveButton0')) {
            document.getElementById('saveButton0').addEventListener('click', updatePart0);
        }
        if (document.getElementById('saveButton1')) {
            document.getElementById('saveButton1').addEventListener('click', updatePart1);
        }
        if (document.getElementById('saveButton2')) {
            document.getElementById('saveButton2').addEventListener('click', updatePart2);
        }
        if (document.getElementById('saveButton3')) {
            document.getElementById('saveButton3').addEventListener('click', updatePart3);
        }
        if (document.getElementById('saveButton7')) {
            document.getElementById('saveButton7').addEventListener('click', updatePart7);
        }
        if (document.getElementById('saveButton9')) {
            document.getElementById('saveButton9').addEventListener('click', updatePart9);
        }
        if (document.getElementById('saveButton10')) {
            document.getElementById('saveButton10').addEventListener('click', updatePart10);
        }

        function updatePart0() {
            let data = {
                // updateType: 'Part0',
                preTaxVO: {
                    prepayment_tax: document.getElementById('prepayment_tax').value
                }
            };
            // 데이터 출력
            console.log("Data to be sent:", data);

            sendUpdateRequest(data);
            console.log("데이터를 보냅니다:");
        }

        function updatePart1() {
            const spouseDeductionValue = document.querySelector('input[name="spouseDeduction"]:checked');
            const womanDeductionValue = document.querySelector('input[name="womanDeduction"]:checked');
            const singleParentValue = document.querySelector('input[name="singleParent"]:checked');
            console.log("spouseDeductionValue:", spouseDeductionValue);


            let data = {
                taxFormVO: {
                    totalIncome: document.getElementById('totalIncome').value,
                    spouseDeduction: spouseDeductionValue ? spouseDeductionValue.value : null,
                    child: document.getElementById('child').value,
                    adoptedChild: document.getElementById('adoptedChild').value,
                    directAncestor: document.getElementById('directAncestor').value,
                    siblings: document.getElementById('siblings').value,
                    senior: document.getElementById('senior').value,
                    disability: document.getElementById('disability').value,
                    womanDeduction: womanDeductionValue ? womanDeductionValue.value : null,
                    singleParent: singleParentValue ? singleParentValue.value : null
                }
            };
            // 데이터 출력
            console.log("Data to be sent:", data);

            sendUpdateRequest(data);
            console.log("데이터를 보냅니다:");
        }

        function updatePart2() {
            let data = {
                // updateType: 'Part2',
                pensionVO: {
                    other_pension: document.getElementById('other_pension').value
                }
            };
            sendUpdateRequest(data);
        }

        function updatePart3() {
            let data = {
                // updateType: 'Part3',
                housingVO: {
                    housing_loan: document.getElementById('housing_loan').value,
                    housing_account1: document.getElementById('housing_account1').value,
                    housing_account2: document.getElementById('housing_account2').value
                }
            };
            // 데이터 출력
            console.log("Data to be sent:", data);

            sendUpdateRequest(data);
            console.log("데이터를 보냅니다:");
        }

        function updatePart7() {
            let data = {
                // updateType: 'Part7',
                pensionVO: {
                    pension_amount: document.getElementById('pension_amount').value,
                    irp_amount: document.getElementById('irp_amount').value,
                }
            };
            // 데이터 출력
            console.log("Data to be sent:", data);

            sendUpdateRequest(data);
            console.log("데이터를 보냅니다:");
        }
        // 의료비
        function updatePart9() {
            let data = {
                // updateType: 'Part9',
                medicalVO: {
                    medical_expense: document.getElementById('medical_expense').value,
                    medical_expense2: document.getElementById('medical_expense2').value,
                    medical_expense3: document.getElementById('medical_expense3').value,
                    family_medical: document.getElementById('family_medical').value,
                }
            };
            // 데이터 출력
            console.log("Data to be sent:", data);

            sendUpdateRequest(data);
            console.log("데이터를 보냅니다:");
        }

        function updatePart10() {
            let data = {
                // updateType: 'Part10',
                eduVO: {
                    edu_expense: document.getElementById('edu_expense').value,
                    children_edu: document.getElementById('children_edu').value,
                    univ_edu: document.getElementById('univ_edu').value,
                    uniform_expense: document.getElementById('uniform_expense').value,
                }
            };
            // 데이터 출력
            console.log("Data to be sent:", data);

            sendUpdateRequest(data);
            console.log("데이터를 보냅니다:");
        }

        function sendUpdateRequest(data) {
            $.ajax({

                url: '/updateDetail',
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    console.log(response);  // 이 부분을 추가
                    alert('데이터가 정상적으로 저장되었습니다.');
                },
                error: function (error) {
                    alert('오류가 발생했습니다: ' + error.responseText);
                }
            });
        }
    });

</script>
<%-- 주택공제 금액 실시간 반영 --%>
<script>
    function updateHousingAmounts() {
        // 숫자 문자열에서 쉼표를 제거하고 숫자로 변환하는 함수
        function parseNumber(inputValue) {
            return parseInt(inputValue.replace(/,/g, ""), 10) || 0;
        }

        // 각 입력란의 값을 가져옵니다.
        const housingLoan = parseNumber(document.getElementById('housing_loan_view').value);
        const housingAccount1 = parseNumber(document.getElementById('housing_account1_view').value);
        const housingAccount2 = parseNumber(document.getElementById('housing_account2_view').value);

        // 총납입액을 계산합니다.
        const totalHousingAmount = housingLoan + housingAccount1 + housingAccount2;

        // 총납입액을 출력 형식에 맞게 표시합니다.
        document.getElementById('totalHousing').innerText = totalHousingAmount.toLocaleString('ko-KR') + "원";

        // 소득 공제 금액을 계산하고 표시합니다.
        const deductionAmount = totalHousingAmount * 0.4;
        document.getElementById('deductionAmount').innerText = deductionAmount.toLocaleString('ko-KR') + "원";

        // 바깥쪽 소득공제금액도 업데이트 합니다.
        document.getElementById('outsideDeductionAmount').innerText = deductionAmount.toLocaleString('ko-KR') + "원";
    }

    // 각 입력란에 이벤트 리스너를 추가하여 값이 변경될 때마다 updateHousingAmounts 함수를 호출합니다.
    document.getElementById('housing_loan_view').addEventListener('input', updateHousingAmounts);
    document.getElementById('housing_account1_view').addEventListener('input', updateHousingAmounts);
    document.getElementById('housing_account2_view').addEventListener('input', updateHousingAmounts);

</script>
<%-- 연금계좌 계산--%>
<script>
    function updatePensionAmounts() {
        // 숫자 문자열에서 쉼표를 제거하고 숫자로 변환하는 함수
        function parseNumber(inputValue) {
            return parseInt(inputValue.replace(/,/g, ""), 10) || 0;
        }

        // 각 입력란의 값을 가져옵니다.
        /* 연금계좌 */
        const pension = parseNumber(document.getElementById('pension_amount_view').value);
        const irp = parseNumber(document.getElementById('irp_amount_view').value);

        // 총납입액을 계산
        const irpPension_total = pension + irp;
        // 총납입액을 출력 형식에 맞게 표시
        document.getElementById('irpPension_total').innerText = irpPension_total.toLocaleString('ko-KR') + "원";

        // 세액 공제 금액을 계산
        const irpPensionDeduction = irpPension_total * 0.132;
        document.getElementById('irpPensionDeduction').innerText = irpPensionDeduction.toLocaleString('ko-KR') + "원";

        // 바깥쪽 세액공제금액도 업데이트
        document.getElementById('outsideIrpPensionDeduction').innerText = irpPensionDeduction.toLocaleString('ko-KR') + "원";
    }

    // 각 입력란에 이벤트 리스너를 추가하여 값이 변경될 때마다 updatePensionAmounts 함수를 호출합니다.
    document.getElementById('pension_amount_view').addEventListener('input', updatePensionAmounts);
    document.getElementById('irp_amount_view').addEventListener('input', updatePensionAmounts);

</script>
<%-- 의료비 계산--%>
<script>
    function updateMedicalAmounts() {
        // 숫자 문자열에서 쉼표를 제거하고 숫자로 변환하는 함수
        function parseNumber(inputValue) {
            return parseInt(inputValue.replace(/,/g, ""), 10) || 0;
        }

        // 각 입력란의 값을 가져옵니다.
        const medical_expense = parseNumber(document.getElementById('medical_expense_view').value);
        const medical_expense2 = parseNumber(document.getElementById('medical_expense2_view').value);
        const medical_expense3 = parseNumber(document.getElementById('medical_expense3_view').value);
        const family_medical = parseNumber(document.getElementById('family_medical_view').value);

        // 총납입액을 계산
        const medical_total = medical_expense + medical_expense2 + medical_expense3 + family_medical;
        // 총납입액을 출력 형식에 맞게 표시
        document.getElementById('medical_total').innerText = medical_total.toLocaleString('ko-KR') + "원";

        // 세액 공제 금액을 계산
        const medicalDeduction = medical_expense * 0.15 + medical_expense2 * 0.3 + medical_expense3 * 0.2 + family_medical * 0.15;
        document.getElementById('medicalDeduction').innerText = medicalDeduction.toLocaleString('ko-KR') + "원";

        // 바깥쪽 세액공제금액도 업데이트
        document.getElementById('outsideMedicalDeduction').innerText = medicalDeduction.toLocaleString('ko-KR') + "원";
    }

    // 각 입력란에 이벤트 리스너를 추가하여 값이 변경될 때마다 updatePensionAmounts 함수를 호출합니다.
    document.getElementById('medical_expense_view').addEventListener('input', updateMedicalAmounts);
    document.getElementById('medical_expense2_view').addEventListener('input', updateMedicalAmounts);
    document.getElementById('medical_expense3_view').addEventListener('input', updateMedicalAmounts);
    document.getElementById('family_medical_view').addEventListener('input', updateMedicalAmounts);

</script>
<%-- 교육비 계산--%>
<script>
    function updateEduAmounts() {
        // 숫자 문자열에서 쉼표를 제거하고 숫자로 변환하는 함수
        function parseNumber(inputValue) {
            return parseInt(inputValue.replace(/,/g, ""), 10) || 0;
        }

        // 각 입력란의 값을 가져옵니다.
        const edu_expense = parseNumber(document.getElementById('edu_expense_view').value);
        const children_edu = parseNumber(document.getElementById('children_edu_view').value);
        const univ_edu = parseNumber(document.getElementById('univ_edu_view').value);
        const uniform_expense = parseNumber(document.getElementById('uniform_expense_view').value);

        // 총납입액을 계산
        const education_total = edu_expense + children_edu + univ_edu + uniform_expense;
        // 총납입액을 출력 형식에 맞게 표시
        document.getElementById('education_total').innerText = education_total.toLocaleString('ko-KR') + "원";

        // 세액 공제 금액을 계산
        const educationDeduction = education_total * 0.15;
        document.getElementById('educationDeduction').innerText = educationDeduction.toLocaleString('ko-KR') + "원";

        // 바깥쪽 세액공제금액도 업데이트
        document.getElementById('outsideEduDeduction').innerText = educationDeduction.toLocaleString('ko-KR') + "원";
    }

    // 각 입력란에 이벤트 리스너를 추가하여 값이 변경될 때마다 updatePensionAmounts 함수를 호출합니다.
    document.getElementById('edu_expense_view').addEventListener('input', updateEduAmounts);
    document.getElementById('children_edu_view').addEventListener('input', updateEduAmounts);
    document.getElementById('univ_edu_view').addEventListener('input', updateEduAmounts);
    document.getElementById('uniform_expense_view').addEventListener('input', updateEduAmounts);

</script>
<script>
    $(document).on('click', '#detailBtn', function() {
        window.location.href = "/redirectToHanaIrp";
    });

</script>

</body>
</html>