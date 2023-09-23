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
</head>


<body>
<style>#progress-bar-container li {
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
}</style>

<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>


<section class="main">

    <div class="aside" style="width: 20%; float: left; font-family: 'Noto Sans KR', sans-serif !important">
        <br/>
        <br/>
        <br/>
        <div style="padding-left: 30px;">
            <h3 style="color: #018c8d; margin-bottom: 15px;">연말정산플래너</h3>
            <hr style="width: 200px; height: 5px; background-color: #018c8d; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxMain"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 안내</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxSimulation" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 시뮬레이션</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/simulationResult"
               style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">연말정산 결과</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxCalculator"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 계산기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">우리집 돈관리</div>
            </a>
            <hr style="width: 200px;">
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
                            <h3>연말정산 결과</h3>
                            <br/>

                            <h4>납부할 세금 :
                                <td class="text-right"><fmt:formatNumber value="${totalResult.determined_tax}"
                                                                         groupingUsed="true"/>원
                            </h4>
                            <br/>
                            <h4>혜택 받는 공제액 :<fmt:formatNumber value="${totalBenefit}" groupingUsed="true"/>원 </h4>
                            <br/>
                            <p2>&#183; 납부할 세금이 +(양수)이면 세금을 납부해야하며,<br/> -(음수)이면 세금을 환급받습니다.</p2>
                            <br/><br/>
                            <table class="table-tax">
                                <thead>
                                <tr>
                                    <th class="text-left">항목</th>
                                    <th class="text-left">금액</th>

                                </tr>
                                </thead>
                                <tbody class="table-hover">
                                <tr>
                                    <td class="text-left">1) 근로소득금액</td>
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
                                    <td class="text-left">3) (=) 과세표준</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.tax_base}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbspx 기본세율</td>
                                </tr>
                                <tr>
                                    <td class="text-left">4) (=) 산출세액</td>
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
                                    <td class="text-left">5) (=) 결정세액</td>
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
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp6) (=) 납부예상세금</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.determined_tax}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                    <br/>
                                    연봉 ${totalInfo.total_income2}<br/>
                                    본인공제${totalInfo.taxpayer_deduction}<br/>
                                    배우자공제${totalInfo.spouse_deduction}<br/>
                                    20세이하자녀공제${totalInfo.children_deduction}<br/>
                                    입양자녀${totalInfo.adopted_deduction}<br/>
                                    직계존속${totalInfo.directAnc_deduction}<br/>
                                    형제자매${totalInfo.siblings_deduction}<br/>
                                    경로자${totalInfo.senior_deduction}<br/>
                                    장애인${totalInfo.disability_deduction}<br/>
                                    부녀자${totalInfo.woman_deduction}<br/>
                                    한부모${totalInfo.singleParent_deduction}<br/>
                                    <br/>
                                    <br/>
                                    근로소득세액${totalResult.earned_taxcredit}
                                    자녀세액${totalResult.children_taxcredit}<br/>
                                    연금세액${totalResult.irp_taxcredit}<br/>
                                    보장보험세액${totalResult.guarantee_taxcredit}<br/>
                                    의료비세액${totalResult.medical_taxcredit}<br/>
                                    교육비${totalResult.education_taxcredit}<br/>
                                    기부금${totalResult.donation_taxcredit}<br/>
                                    월세${totalResult.rent_taxcredit}<br/>
                                    통합${totalResult.total_taxcredit}<br/>
                                </tr>
                                </tbody>
                            </table>

                            <br>
                            <button type="button" class="next-button">추가항목 입력</button>
                        </fieldset>


                        <!-- Step 3 Content -->
                        <!-- 모달창 -->
                        <fieldset class="section-content step2" data-step="2">
                            <h3>상세보기</h3>

                            <br/>

                            <div class="total-amount-box modal-trigger" data-target="detailsModal1">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>인적사항</h4>
                                        <br/>
                                        소득 공제 금액 :
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.personal_deduction}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal2">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>근로소득</h4>
                                        <br/>
                                        소득 공제 금액 :
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.income_deduction}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal3">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>연금보험료</h4>
                                        <br/>
                                        소득 공제 금액 :
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.pension_deduction}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal4">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>주택자금/주택마련저축</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.housing_deduction}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal5">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>신용카드 등</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.card_deduction}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal6">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>추가소득</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1>0원</p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal7">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>연금계좌</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.irp_taxcredit}" groupingUsed="true"/>원</p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal8">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">0%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>보장성보험</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.guarantee_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal9">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>의료비</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.medical_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal10">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>교육비</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.education_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal11">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>기부금</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.donation_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal12">
                                <!-- id="showModal" 추가 -->
                                <%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>월세</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.rent_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <button type="button" class="prev-button" data-step="3">이전</button>
                            <button type="submit" class="submit-button">제출하기</button>
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
            <p>인적 공제를 위한 부양가족 수 및 특별공제 항목을 확인해주세요.</p>
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
                    <label for="totalIncome">총급여:</label>
                    <input type="text" name="totalIncome_view" id="totalIncome_view" oninput="addCommaToNumber(this)" data-hidden-id="totalIncome" value="<fmt:formatNumber value="${totalInfo.total_income2}" groupingUsed="true"/>">
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
                    <input type="button" id="saveButton1" class="update-button" value="저장">
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
<%--        </form>--%>
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
<%--                    <label for="healthInsurance">건강보험료 납입공제 :</label><br/>--%>
<%--                    <label for="employmentInsurance">고용보험료 납입공제 :</label><br/>--%>
<%--                    <label for="nationalPension">국민연금 납입공제 :</label><br/>--%>
                    <label for="other_pension">기타연금 납입공제 :</label><br/>


                </div>
                <div class="modal-amount-money-variable">
                <div class="modal-amount-money-variable">
                    <fmt:formatNumber value="${totalInfo.health_insurance}" groupingUsed="true"/>원<br/>
<%--                    <input type="text" name="healthInsurance_view" id="healthInsurance_view" oninput="addCommaToNumber(this)"--%>
<%--                           data-hidden-id="healthInsurance" value="<fmt:formatNumber value="${totalInfo.health_insurance}" groupingUsed="true"/>">원<br/>--%>
<%--                    <input type="hidden" id="healthInsurance" name="healthInsurance" value="${totalInfo.health_insurance}">--%>
                    <fmt:formatNumber value="${totalInfo.employment_insurance}" groupingUsed="true"/>원<br/>

<%--                    <input type="text" name="employmentInsurance_view" id="employmentInsurance_view" oninput="addCommaToNumber(this)"--%>
<%--                           data-hidden-id="employmentInsurance" value="<fmt:formatNumber value="${totalInfo.employment_insurance}" groupingUsed="true"/>">원<br/>--%>
<%--                    <input type="hidden" id="employmentInsurance" name="employmentInsurance" value="${totalInfo.employment_insurance}">--%>
<%--                    --%>
                    <fmt:formatNumber value="${totalInfo.national_pension}" groupingUsed="true"/>원<br/>

<%--                    <input type="text" name="nationalPension_view" id="nationalPension_view" oninput="addCommaToNumber(this)"--%>
<%--                           data-hidden-id="nationalPension" value="<fmt:formatNumber value="${totalInfo.national_pension}" groupingUsed="true"/>">원<br/>--%>
<%--                    <input type="hidden" id="nationalPension" name="nationalPension" value="${totalInfo.national_pension}">--%>
                    <input type="text" name="otherPension_view" id="otherPension_view" oninput="addCommaToNumber(this)"
                           data-hidden-id="other_pension" value="<fmt:formatNumber value="${totalInfo.other_pension}" groupingUsed="true"/>">원<br/>
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
<%--            <input type="submit" class="update-button" value="저장">--%>
            <input type="button" id="saveButton2" class="update-button" value="저장">
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
            <p>주택임차차입금 및 청약저축금액을 확인해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>소득 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="totalHousing"><fmt:formatNumber value="${totalInfo.housing_total}"
                                                              groupingUsed="true"/>원</span><br/>
                    <p2><fmt:formatNumber value="${totalResult.housing_deduction}" groupingUsed="true"/>원</p2>
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
                           data-hidden-id="housing_loan" value="<fmt:formatNumber value="${totalInfo.housing_loan}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="housing_loan" name="housing_loan" value="${totalInfo.housing_loan}"><br/>

<%--                    <input type="text" id="housing_loan" name="health_insurance" oninput="addCommaToNumber(this)"--%>
<%--                           value="<fmt:formatNumber value="${totalInfo.housing_loan}" groupingUsed="true"/>">원<br/>--%>
                    <input type="text" name="housing_account1_view" id="housing_account1_view" oninput="addCommaToNumber(this)"
                           data-hidden-id="housing_account1" value="<fmt:formatNumber value="${totalInfo.housing_account1}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="housing_account1" name="housing_account1" value="${totalInfo.housing_account1}">
<%--                    <input type="text" id="housing_account1" name="employment_insurance" oninput="addCommaToNumber(this)"--%>
<%--                           value="<fmt:formatNumber value="${totalInfo.housing_account1}" groupingUsed="true"/>">원<br/>--%>
                    <input type="text" name="housing_account2_view" id="housing_account2_view" oninput="addCommaToNumber(this)"
                           data-hidden-id="housing_account2" value="<fmt:formatNumber value="${totalInfo.housing_account2}" groupingUsed="true"/>">원<br/>
                    <input type="hidden" id="housing_account2" name="housing_account2" value="${totalInfo.housing_account2}">
<%--                    <input type="text" id="housing_account2" name="national_pension" oninput="addCommaToNumber(this)"--%>
<%--                           value="<fmt:formatNumber value="${totalInfo.housing_account2}" groupingUsed="true"/>">원<br/>--%>
                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>주택임차 차입금?</p2>
                <br/>
                <p> &#183; 과세기간 종료일 현재 무주택 세대의 세대주(세대주가 주택관련 공제를 받지 않는 경우 세대원도 가능)<br/>로서 근로소득이 있는 자</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p>
<%--            <input type="button" class="update-button" value="저장">--%>
            <input type="button" id="saveButton3" class="update-button" value="저장">
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
            <p>주택임차차입금 및 청약저축금액을 확인해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>소득 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="totalCard"><fmt:formatNumber value="${totalTransaction}"
                                                           groupingUsed="true"/>원</span><br/>
                    <p2><fmt:formatNumber value="${totalResult.card_deduction}" groupingUsed="true"/>원</p2>
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
            <input type="button" class="update-button" value="저장">
<%--            <input type="button" id="saveButton5" class="update-button" value="저장">--%>
        </form>
    </div>
</div>


<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


<%--progress bar--%>
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
        if(document.getElementById('saveButton1')) {
            document.getElementById('saveButton1').addEventListener('click', updatePart1);
        }
        if(document.getElementById('saveButton2')) {
            document.getElementById('saveButton2').addEventListener('click', updatePart2);
        }
        if(document.getElementById('saveButton3')) {
            document.getElementById('saveButton3').addEventListener('click', updatePart3);
        }

        function updatePart1() {
            const spouseDeductionValue = document.querySelector('input[name="spouseDeduction"]:checked');
            const womanDeductionValue = document.querySelector('input[name="womanDeduction"]:checked');
            const singleParentValue = document.querySelector('input[name="singleParent"]:checked');
            console.log("spouseDeductionValue:", spouseDeductionValue);


            let data = {
                updateType: 'Part1',
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
            };
            // 데이터 출력
            console.log("Data to be sent:", data);

            sendUpdateRequest(data);
            console.log("데이터를 보냅니다:");
        }

        function updatePart2() {
            let data = {
                updateType: 'Part2',
                other_pension: document.getElementById('otherPension').value
            };
            sendUpdateRequest(data);
        }

        function updatePart3() {
            let data = {
                updateType: 'Part3',
                housing_loan: document.getElementById('housing_loan').value,
                housing_account1: document.getElementById('housing_account1').value,
                housing_account2: document.getElementById('housing_account2').value
            };
            sendUpdateRequest(data);
        }

        function sendUpdateRequest(data) {
            $.ajax({

                url: '/updateDetail',
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(response) {
                    console.log(response);  // 이 부분을 추가
                    alert('데이터가 정상적으로 저장되었습니다.');
                },
                error: function(error) {
                    alert('오류가 발생했습니다: ' + error.responseText);
                }
            });
        }
    });

    // document.addEventListener('DOMContentLoaded', (event) => {
    //     document.getElementById('saveButton1').addEventListener('click', updatePart1);
    //     document.getElementById('saveButton2').addEventListener('click', updatePart2);
    //     document.getElementById('saveButton3').addEventListener('click', updatePart3);
    //     // document.getElementById('saveButton4').addEventListener('click', updatePart4);
    //
    //     // 1번 ajax
    //     function updatePart1() {
    //         let data = {
    //             updateType: 'Part1',
    //             totalIncome: document.getElementById('totalIncome').value,
    //             spouseDeduction: document.querySelector('input[name="spouseDeduction"]:checked').value,
    //             child: document.getElementById('child').value,
    //             adoptedChild: document.getElementById('adoptedChild').value,
    //             directAncestor: document.getElementById('directAncestor').value,
    //             siblings: document.getElementById('siblings').value,
    //             senior: document.getElementById('senior').value,
    //             disability: document.getElementById('disability').value,
    //             womanDeduction: document.querySelector('input[name="womanDeduction"]:checked').value,
    //             singleParent: document.querySelector('input[name="singleParent"]:checked').value
    //         };
    //         sendUpdateRequest(data);
    //     }
    //
    //     // 2번 ajax
    //     function updatePart2() {
    //         let data = {
    //             updateType: 'Part2',
    //             other_pension: document.getElementById('otherPension').value
    //         };
    //         sendUpdateRequest(data);
    //     }
    //
    //     // 3번 ajax
    //     function updatePart3() {
    //         let data = {
    //             updateType: 'Part3',
    //             housing_loan: document.getElementById('housing_loan').value,
    //             housing_account1: document.getElementById('housing_account1').value,
    //             housing_account2: document.getElementById('housing_account2').value
    //         };
    //         sendUpdateRequest(data);
    //     }
    //
    //     // 공통 ajax 요청 함수
    //     function sendUpdateRequest(data) {
    //         $.ajax({
    //             url: '/detailUpdate',
    //             type: 'POST',
    //             data: JSON.stringify(data),
    //             contentType: 'application/json; charset=utf-8',
    //             dataType: 'json',
    //             success: function (response) {
    //                 // 성공 처리
    //                 alert('Data has been updated successfully!');
    //             },
    //             error: function (error) {
    //                 // 에러 처리
    //                 alert('An error occurred: ' + error.responseText);
    //             }
    //         });
    //     }
    // });
</script>

</body>

</html>