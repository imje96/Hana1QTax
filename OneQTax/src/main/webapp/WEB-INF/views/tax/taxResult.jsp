<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>HanaOneTax</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <%--    common.css--%>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/main.css" rel="stylesheet">

    <%--    chartjs 추가--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="../../../resources/css/tax.css" rel="stylesheet">


    <link
            href="${ pageContext.request.contextPath }/resources/img/favicon.ico"
            rel="icon">
    <!-- Template Stylesheet -->
    <link
            href="${ pageContext.request.contextPath }/resources/css/style.css"
            rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
            rel="stylesheet">
    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>


    <style>
        .comment-text1 h4 {
            font-size: 25px;
        }

        <%--  hover 시 텍스트 보이기      --%>
        .hover-text {
            position: relative; /* popup-modal의 위치를 기준으로 설정하기 위함 */
            display: inline-block; /* container의 크기를 내용에 맞게 조절 */
            font-size: 25px;
        }

        .popup-modal {
            display: none;
            position: absolute;
            top: 100%; /* container 바로 아래에 위치 */
            left: 0; /* container의 왼쪽 경계에 맞춤 */
            padding: 10px;
            background-color: #FFFFFF;
            border: 2px solid #106e69;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            line-height: 1.5em;
            z-index: 1; /* 다른 요소 위에 표시되도록 함 */
        }

        .hover-text:hover .popup-modal {
            display: block;
            border-radius: 10px;
            padding: 10px 20px;
            width: 600px;
            font-size: 20px;
            text-align: left;
        }

        .hover-text:hover .popup-modal p {
            font-size: 16px;
        }

        .comment-text2 {
            margin: 30px 0 30px 10px;
            font-size: 20px;
            font-weight: bold;
            color: #615e5e;
            text-align: right;
        }

        .flex-box {
            display: flex;
            align-items: center;
            color: #ffffff;
            font-size: 23px;
        }

        .info-box {
            border-radius: 10px;
            padding: 10px;
            width: 360px;
        }

        .text-box2 {
            /*background: #eaf3f3;*/
            background: #106e69;
            border-radius: 10px;
            margin: 20px 0;
            padding: 20px 50px 5px 100px;
            text-align: left;
            font-size: 22px;
            width: 900px;
            letter-spacing: 1px;
            color: white;
        }

        .copy-text {
            padding: 10px 30px;
            background: #f8f2ce;
            border-radius: 10px;
            font-size: 24px;
        }

        .copy-text2 {
            background: #f1f1f1;
            border-radius: 10px;
            font-size: 26px;
            width: 800px;
            padding: 10px 20px 10px 50px;
            line-height: 2em;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .hover-text2 {
            position: relative;
            display: inline-block;
            font-size: 25px;
            width: 800px;
            text-align: center;
        }
        .bar-container {
            width: 100%;
            height: 60px;
            border: 1px solid #bebbbb;
            display: flex;
            overflow: hidden; /* 이 속성을 추가하여 넘치는 부분을 숨깁니다. */
            border-radius: 15px; /* 컨테이너에 둥근 모서리를 추가합니다. */
        }

        .bar {
            height: 100%;
            transition: width 0.5s; /* 애니메이션 효과를 위해 추가, 필요 없으면 제거해도 됩니다. */
        }

        .bar1 {
            background: #e4003f;
        }

        .bar2 {
            background: #cfdfd2;
        }
        .flex-box2 {
            display: flex;
            width: 800px;
            align-items: center;
            font-size: 23px;
            justify-content: space-between;
        }
        .percent-box{
            background: #e3e3e3;
            border-radius: 10px;
            margin-top: 10px;
            padding: 10px;
        }
    </style>
</head>


<body>


<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>

<!--contents-->
<div style="overflow: hidden;">

    <section class="main">


        <div class="aside" style="width: 20%; float: left; font-family: 'Noto Sans KR', sans-serif !important">
            <br/>
            <br/>
            <br/>
            <div style="padding-left: 30px;">
                <h3 style="color: #065859; margin-bottom: 15px;">카드황금비율관리</h3>
                <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxMain"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소득공제 안내</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxThreshold"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소비 문턱 넘기기</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxInfo" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 계산</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">

                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">카드황금비율 결과</h6></a>
            </div>
        </div>


        <div class="section">
            <div class="container-title">
                <h2>카드황금비율 계산 결과</h2>
                <br/>
                <span style="color: #615e5e"><h3>카드소득공제현황을 파악해보고 유리한 소비 전략을 제안받아보세요</h3></span>
            </div>
            <br/>


            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <span style="color: #0d736c; font-size: 23px;"><h3>계산결과</h3></span>
                    <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-top:10px; margin-bottom: 10px;">
                    <br/>


                    <table class="table-fill">
                        <span style="text-align: center"></span>
                        <h3>기본공제항목 계산 결과</h3>
                        <br/>
                        <%--                            <p>일반공제항목이란? 추가공제항목인 대중교통, 전통시장, 도서및문화 등의 업종을 제외한~~</p>--%>
                        <br/>
                        <div class="text-box">
                            <p2><span style="font-weight: bold; color: #fd328a">✔️ 최저사용금액 : <fmt:formatNumber
                                    value="${minimumAmount}" groupingUsed="true"/>원</span>을 초과한 금액부터 공제 가능
                            </p2>
                        </div>
                        <br/><span style="text-align: right;"><p>&nbsp;&nbsp;* 최저사용금액: 총급여의 25%</p></span>
                        <thead>
                        <tr>
                            <th class="text-left">항목</th>
                            <th class="text-left">사용금액</th>
                            <th class="text-left">공제가능금액</th>
                            <th class="text-left">공제율</th>
                            <th class="text-left">공제액</th>
                        </tr>
                        </thead>
                        <tbody class="table-hover">
                        <tr>
                            <td class="text-left">신용카드</td>
                            <td class="text-left"><fmt:formatNumber value="${credit_total}" groupingUsed="true"/>원
                            </td>
                            </td> <!--사용금액-->
                            <td class="text-left"><fmt:formatNumber value="${credit_deductible}"
                                                                    groupingUsed="true"/>원
                            </td>
                            <td class="text-left">15%</td>
                            <td class="text-left"><fmt:formatNumber value="${credit_deduction}"
                                                                    groupingUsed="true"/>원
                            </td><!-- 공제액 금액-->
                        </tr>
                        <tr>
                            <td class="text-left">체크카드</td>
                            <td class="text-left"><fmt:formatNumber value="${debit_total}" groupingUsed="true"/>원
                            </td>
                            </td> <!--사용금액-->
                            <td class="text-left"><fmt:formatNumber value="${debit_deductible}"
                                                                    groupingUsed="true"/>원
                            </td>
                            <td class="text-left">30%</td>
                            <td class="text-left"><fmt:formatNumber value="${debit_deduction}" groupingUsed="true"/>원
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">현금영수증</td>
                            <td class="text-left"><fmt:formatNumber value="${cash_total}" groupingUsed="true"/>원
                            </td>
                            </td> <!--사용금액-->
                            <td class="text-left"><fmt:formatNumber value="${cash_deductible}" groupingUsed="true"/>원
                            </td>
                            <td class="text-left">30%</td>
                            <td class="text-left"><fmt:formatNumber value="${cash_deduction}"
                                                                    groupingUsed="true"/>원
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <%--                        <br/><span style="text-align: right"><p>&nbsp;&nbsp;* 최저사용금액: 총급여의 25%</p></span>--%>
                    <br/><br/>


                    <div class="container1">
                        <span style="color: #0d736c; font-size: 23px;"><h3>공제율/공제한도</h3></span>
                        <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-top:10px; margin-bottom: 10px;">
                        <br/>
                        <h3>공제율</h3><br/>
                        <table class="table-fill">
                            <thead>
                            <tr>
                                <th class="text-left">항목</th>
                                <th class="text-left">1~3월 공제율</th>
                                <th class="text-left">4~12월 공제율</th>

                            </tr>
                            </thead>
                            <tbody class="table-hover">
                            <tr>
                                <td class="text-left">신용카드</td>
                                <td class="text-left">15%</td>
                                <td class="text-left">15%</td>
                            </tr>
                            <tr>
                                <td class="text-left">선불카드/체크카드/현금</td>
                                <td class="text-left">30%</td>
                                <td class="text-left">30%</td>
                            </tr>
                            <tr>
                                <td class="text-left">문화비(도서,공연 등)</td>
                                <td class="text-left">30%</td>
                                <td class="text-left">40%</td>
                            </tr>
                            <tr>
                                <td class="text-left">전통시장</td>
                                <td class="text-left">40%</td>
                                <td class="text-left">50%</td>
                            </tr>
                            <tr>
                                <td class="text-left">대중교통</td>
                                <td class="text-left">80%</td>
                                <td class="text-left">80%</td>
                            </tr>
                            </tbody>
                        </table>
                        <br/>
                        <p>&nbsp;&nbsp;&nbsp; * 단, 문화비 항목인 영화관람료 소득공제는 23년 7월 1일 이후 결제분부터 합산됩니다</p>
                        <br/><br/>
                        <h3>급여별 총 한도액</h3><br/>
                        <table class="table-fill">

                            <thead>
                            <tr>
                                <th class="text-left"></th>
                                <th class="text-left">기본 공제 한도</th>
                                <th class="text-left">추가 공제 한도</th>

                            </tr>
                            </thead>
                            <tbody class="table-hover">
                            <tr>
                                <td class="text-left">7천만 원 이하</td>
                                <td class="text-left">300만 원</td>
                                <td class="text-left">300만 원</td>
                            </tr>
                            <tr>
                                <td class="text-left">7천만 원 초과</td>
                                <td class="text-left">250만 원</td>
                                <td class="text-left">200만 원</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


            <div class="time" style="text-align: right">
                최종 계산 일자 :
                <c:set var="formattedTimestamp" value="${fn:substring(deduction_date, 0, 19)}"/>
                ${formattedTimestamp}
                <a href="${pageContext.request.contextPath}/calculateAndInsertDeduction"
                   onclick="this.href=this.href; return true;">
                    <img src="../../../resources/img/refresh.png" height="30"></a>
            </div>


            <div class="container2">
                <%--                <p>${deduction_date}</p>--%>

                <div class="comment-box">
                    <div class="comment-box-inner">
                        <div class="result-tax">
                            <h6>2023년 카드 등 소득공제액</h6>
                            <br/>
                            <h2><fmt:formatNumber value="${total_deduction}" groupingUsed="true"/> 원</h2>
                            <br/>
                            <%--                            남은 최대 공제액 <fmt:formatNumber value="${remainingDeduction}" groupingUsed="true"/>원--%>

                            <div class="flex-box">
                                지금까지 아낀 세금 : &nbsp;<span
                                    style="font-weight: bold; font-size: 28px; color: #ffa2ca"><fmt:formatNumber
                                    value="${reducing_tax}" groupingUsed="true"/> 원</span>
                            </div>


                        </div>
                        <div class="btn-container">

                            <button id="openModalBtn" class="modalBtn"><h6>계산 결과 상세보기</h6></button>
                            <br/>
                            <br/>
                            <a href="${pageContext.request.contextPath}/recommCard1">
                                <button id="recommendBtn" class="pointBtn"><h6>내게 맞는 카드 추천받기</h6></button>
                            </a>
                        </div>
                    </div>
                    <div class="comment-box-inner">
                        <div class="comment-info">
                            <c:choose>
                                <c:when test="${basic_deduction > 0}">
                                    <div class="character-box">
                                        <img class="inputImg" src="../../../resources/img/character1.png" height="180">
                                        <div class="comment-text1">
                                            <h2>별돌이의 소비 제안💫</h2>
                                            <h4> 신용카드 대신 <span style="color: #ff328b; font-size: 28px;">체크카드, 현금</span>을<br/>
                                                사용하는 것이 소득공제에 더 좋아요.</h4>
                                        </div>
                                    </div>
                                    <div class="comment-text2">
                                        <div class="hover-text">
                                            문화(공연/영화), 교통카드, 재래시장은 <span
                                                style="color: #ff328b; font-size: 28px;">신용카드</span>로!<br/>
                                            <span style="font-size: 22px;">왜 그럴까요 ⍰</span>
                                                <%--                                    <h5> 신용카드 대신 <span style="color: #ff328b;">체크카드, 현금</span>을 사용하는 것이 <br/>소득공제에 더--%>
                                                <%--                                        좋아요.</h5>--%>

                                            <div class="popup-modal">
                                                <span style="color: #0d6565;">  <p1>체크카드 사용이 좋은 이유는 같은 1만원을 쓰더라도 체크카드는 3,000원, 신용카드는 1,500원만 공제되기 때문이에요.</p1></span><br/>
                                                다만, 문화관련은 <span style="color: #ff328b;">30~40%</span>, 교통카드는 <span
                                                    style="color: #ff328b;">40~80%</span>, 재래시장은 <span
                                                    style="color: #ff328b;">40~50%</span>,<br/>
                                                결제수단에 상관없이 공제가 되니 혜택이 좋은 신용카드를 쓰는 것이<br/> 유리해요.
                                            </div>
                                        </div>
                                    </div>
                                    <%--                                <img class="inputImg" src="../../../resources/img/debitcard.png" height="180">--%>
                                </c:when>
                                <c:when test="${remainingDeduction == 0}">
                                    <div class="text">

                                        소비 황금 비율 달성!<br>
                                        이미 최대 환급을 받고 있으니<br/>
                                        혜택이 큰 <span style="color: #ff328b;">신용카드</span>를 사용해볼까요?
                                    </div>
                                    <img class="inputImg" src="../../../resources/img/debitcard.png" height="180">
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <br/><br/>
                    <span style="text-align: center;"><h2>이렇게 쓰면 최대로 공제받을 수 있어요(카드 황금비율)💰</h2></span><br/><br/>
                <div class="copy-text2">

                    * 추가로 아낄 수 있는 세금 : &nbsp;<span
                        style="font-weight: bold; font-size: 28px; color: #ff458b"><fmt:formatNumber
                        value="${remaining_tax}" groupingUsed="true"/> 원 </span>
                    <br/>
                    <div class="hover-text2">
                    <h6>카드 황금 비율 </h6>
                    </div>

                    <div class="bar-container">
                        <div class="bar bar1"></div>
                        <div class="bar bar2"></div>
                    </div>
                    <div class="flex-box2">

                      <div class="percent-box">
                        <h5>체크카드 사용: <span id="ratio1Value"></span>%</h5>
                         <h5> <span
                                 style="font-weight: bold; font-size: 28px; color: #ff458b"><fmt:formatNumber value="${(basicTotal - basic_deduction) / 0.3}"
                                                                                                              groupingUsed="true"/></span> 만원 </h5>이용필요
                          <p>(기본 공제)</p>
                      </div>
                        <div class="percent-box">
                        <h5>신용카드 사용: <span id="ratio2Value"></span>%</h5>
                           <h5> <span
                                   style="font-weight: bold; font-size: 28px; color: #ff458b"><fmt:formatNumber value="${(basicTotal - additional_deduction) / 0.8}"
                                                                                                                groupingUsed="true"/></span> 만원</h5>이용필요
                        <p>(대중교통 업종으로 사용할 시)</p>
                        </div>
                    </div>





                </div>
                <br/>
                <br/>
                <span style="text-align: center;"><h2>소득공제 현황 보기📊</h2></span>
                <br/>
                <br/>
                <div class="big-chart-box">
                    <div class="chart-box">
                        <div class="chart-box-inner">
                            <div class="hover-text">
                                <h3>전체 카드소득공제 현황 ⍰</h3><br/>
                                <div class="popup-modal">
                                    <h5><span style="font-size: 21px; color: #096e65">전체 카드소득공제란?</span> 기본 소득공제와
                                        추가소득공제를 더한 것이에요. </h5>
                                    * 추가 소득공제(문화, 교통카드, 재래시장 업종)
                                </div>
                            </div>
                            <div class="info-item1">
                        <span style="color: #106e69; font-size: 23px;">
                            달성금액 : <span style="color: #ff328b;"><fmt:formatNumber value="${total_deduction}"
                                                                                   groupingUsed="true"/></span>/<fmt:formatNumber
                                value="${total}"
                                groupingUsed="true"/> 원</span>
                            </div>
                            <p>(기준금액 = 기본공제한도 + 추가공제한도)</p>
                            <div class="chart1">
                                <canvas id="deductionChart1"></canvas>
                            </div>
                            <div class="info-box">
                                <div class="info-item2">전체 남은 공제가능액:&nbsp;<fmt:formatNumber
                                        value="${remainingDeduction}"
                                        groupingUsed="true"/>원

                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="chart-box-inner">
                            <div class="hover-text">
                                <h3>기본 카드소득공제 현황 ⍰</h3><br/>
                                <div class="popup-modal">
                                    <h5><span style="font-size: 21px; color: #096e65">기본 카드소득공제란?</span> 신용카드, 체크/직불카드,
                                        현금영수증 사용액에
                                        따라 기본적으로 공제되는 것을 의미해요.</h5>
                                </div>
                            </div>
                            <div class="info-item1">
                     <span style="color: #106e69; font-size: 23px;">
                            달성금액 : <span style="color: #ff328b;"><fmt:formatNumber value="${basic_deduction}"
                                                                                   groupingUsed="true"/></span>/<fmt:formatNumber
                             value="${basicTotal}"
                             groupingUsed="true"/> 원</span>
                            </div>
                            <p>(기준금액 = 기본공제한도)</p>
                            <div class="chart2">
                                <canvas id="deductionChart2"></canvas>
                            </div>
                            <div class="info-box">
                                <div class="info-item2">남은 공제가능액:&nbsp;<fmt:formatNumber value="${remainingDeduction2}"
                                                                                         groupingUsed="true"/>원
                                </div>
                            </div>
                        </div>
                        <script src="../../resources/js/deductionChart.js"></script>
                        <!-- Chart.js 및 Datalabels 플러그인 추가 -->
                        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>


                    </div>
                    <%--                        <span style="font-weight: bold; color: #fd328a;">--%>
                    <br/><br/>
                    <h2>💡카드 소득공제 TIP</h2><br/>
                    <div class="text-box2">

                        <p2>✔️ 카드소득공제는 기본 소득공제와 추가 소득공제로 구성되어있어요.</p2>
                        <br/><br/>
                        <p2>✔️ 카드 등 소득공제는 총 급여액의 25%를 초과한 금액부터 가능해요.</p2>
                        <br/>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(총 급여액은 연봉에서 식대나 보육 수당 같은 ‘비과세 소득’을 뺀 금액을
                            의미해요.)</p><br/>
                        <p2>✔️ 기본공제항목은 결제수단이 신용카드, 체크/직불카드, 현금영수증인 것을 의미해요.</p2>
                        <br/><br/>
                        <p2>✔️ 추가공제항목에는 도서/공연 등의 문화비, 전통시장, 대중교통에서 사용한 금액이 해당돼요</p2>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(단, 총급여가 7천만원을 초과하는 경우는 문화비 공제를 받을 수 없어요)</p><br/>

                    </div>
                    <br/>
                </div>
            </div>
        </div>

    </section>

</div>

<script>
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("openModalBtn");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function () {
        modal.style.display = "block";
    }

    span.onclick = function () {
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

</script>

<script>
    window.creditDeduction = ${credit_deduction};
    window.debitDeduction = ${debit_deduction};
    window.cashDeduction = ${cash_deduction};
    window.basicDeduction = ${basic_deduction};
    window.additionalDeduction = ${additional_deduction};
    window.totalDeduction = ${total_deduction};
    window.total = ${total}; // 전체 공제한도
    window.basicTotal = ${basicTotal}; // 기본 공제한도
    window.remainingDeduction = ${remainingDeduction};
    window.remainingDeduction2 = ${remainingDeduction2};
</script>


<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        var ratio1 = ${((basicTotal - basic_deduction) / 0.3) / (((basicTotal - basic_deduction) / 0.3) + ((basicTotal - additional_deduction) / 0.8)) * 100};
        var ratio2 = ${((basicTotal - additional_deduction) / 0.8) / (((basicTotal - basic_deduction) / 0.3) + ((basicTotal - additional_deduction) / 0.8)) * 100};

        $('.bar1').css('width', ratio1 + '%');
        $('.bar2').css('width', ratio2 + '%');

        // HTML 요소에 값 설정
        $('#ratio1Value').text(Math.round(ratio1));
        $('#ratio2Value').text(Math.round(ratio2));
    });
</script>


</body>
</html>