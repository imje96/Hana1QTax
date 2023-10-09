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

    <style>
        .flex-box {
            display: flex;
            align-items: center;
            width: 1100px;
            font-size: 25px;
            margin-bottom: 20px;
            justify-content: space-around;
        }

        .member-title {
            background: #a5a5a5;
            padding: 10px 20px;
            border-radius: 5px;
            color: #ffffff;
            text-align: center;
            width: 270px;
        }

        .member-title2 {
            background: #00857f;
            padding: 10px 20px;
            border-radius: 5px;
            color: #ffffff;
            text-align: center;
            width: 270px;
        }
        .chart-box-inner2 {
            display: flex;
            flex-direction: column;
            width: 510px;
            /* height: 430px; */
            align-items: center;
            background: #f3f3f3a3;
            padding-top: 30px;
            border-radius: 10px;
            box-shadow: 3px 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s;
        }
        .chart-box-inner3{
            display: flex;
            flex-direction: column;
            width: 510px;
            /* height: 430px; */
            align-items: center;
            background: #f3f3f3a3;
            padding-top: 30px;
            border-radius: 10px;
            box-shadow: 3px 4px 6px rgba(0, 0, 0, 0.1);
            border: 7px solid #00857e;
            transition: background-color 0.3s, transform 0.3s;
        }
        .chart-box-inner2 h3{
            font-size: 27px;
        }
        .chart-box-inner3 h3{
            font-size: 27px;
        }
        /*.chart-box-inner2:hover {*/
        /*    transform: scale(1.05);*/
        /*    !* hover 시 약간 확대되는 효과 *!*/
        /*    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);*/
        /*    !* hover 시 그림자 약간 강화 *!*/
        /*}*/
        .chart-box-inner3:hover {
            transform: scale(1.05);
            /* hover 시 약간 확대되는 효과 */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            /* hover 시 그림자 약간 강화 */
        }
        .chart-box .chart1 {
            width: 400px;
            /* height: 200px; */
            display: flex;
            justify-content: center;
             margin: 0;
        }
        .info-box {
            border-radius: 10px;
            padding: 10px;
            width: 365px;
        }
        /* 소득공제 tip */
        .character-box2 {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .comment-text1 {
            font-weight: bold;
            width: 700px;
            line-height: 2em;
            background: white;
            border-radius: 15px;
            padding: 10px 20px 10px 30px;
            margin-left: 30px;
            box-shadow: 5px 2px 11px rgba(0, 0, 0, 0.1);
        }
        .text-box2 {
            background: #eaf3f3;
            border-radius: 10px;
            margin: 20px 0;
            padding: 20px 50px;
            text-align: left;
            width: 1000px;
        }
        .consumption-comment{
            padding: 10px 20px;
            background: #fcffd0;
            margin-top: 10px;
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
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 결과</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/spouseResult"
                   style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">우리집 돈관리</h6></a>
                <hr style="width: 200px;">
            </div>
        </div>


        <div class="section">
            <%--            <div class="container-xxl py-5">--%>
            <%--            <div class="container-title" data-wow-delay="0.1s" style="max-width: 600px;">--%>
            <div class="container-title">
                <%--                <h6 class="text-primary">--%>
                <%--                    Hana 1QTax <span style="color: #ff328b;">연말정산</span>--%>
                <%--                </h6>--%>
                <%--                    💰--%>
                <h2>우리집 돈관리</h2>
                <br/>
                <span style="color: #615e5e"><h3>맞벌이 부부 절세 전략</h3></span>
            </div>


            <div class="time" style="text-align: right">
                <c:set var="formattedTimestamp" value="${fn:substring(deduction_date, 0, 19)}"/>
                ${formattedTimestamp}
                <a href=""${pageContext.request.contextPath}/calculateAndInsertDeduction"
                onclick="window.location.reload(); return false;">
                <img src="../../../resources/img/refresh.png" height="30"></a>
            </div>


            <br/>
            <br/>
            <br/>
            <span style="text-align: center;"><h2>부부 소득공제 현황 보기📊</h2></span>
            <br/>
            <br/>
            <div class="big-chart-box">

                <div class="flex-box">
                    <div class="member-title"><h3>${currentUser.name}님 소득공제</h3></div>
                    <div class="member-title2"><h3>배우자: ${currentUser.name}님 소득공제</h3></div>
                </div>
                <div class="chart-box">
                    <div class="chart-box-inner2">

                        <h3>[ 전체 카드소득공제 현황 ]</h3> <br/>
                        <div class="info-item1">
                        <span style="color: #8b8b8b; font-size: 20px;">
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
                            <div class="info-item2">전체 남은 공제가능액:&nbsp;<fmt:formatNumber value="${remainingDeduction}"
                                                                                     groupingUsed="true"/>원
                            </div>
                        </div>

                        <br/>
                        <h3>[ 기본 카드소득공제 현황 ]</h3><br/>
                        <div class="info-item1">
                     <span style="color: #8b8b8b; font-size: 20px;">
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
                        <p> * 연봉 : 6000 만원 기준 <br><br></p>
                    </div>
                    <br/>
                    <div class="chart-box-inner3">
                        <h3>[ 전체 카드소득공제 현황 ]</h3> <br/>
                        <div class="info-item1">
                        <span style="color: #8b8b8b; font-size: 20px;">
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
                            <div class="info-item2">전체 남은 공제가능액:&nbsp;<fmt:formatNumber value="${remainingDeduction}"
                                                                                        groupingUsed="true"/>원
                            </div>
                        </div>
                        <br/>
                        <h3>[ 기본 카드소득공제 현황 ]</h3><br/>
                        <div class="info-item1">
                     <span style="color: #8b8b8b; font-size: 20px;">
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
                </div>
                <%--                        <span style="font-weight: bold; color: #fd328a;">--%>
                <br/><br/>
                <h2>💡 맞벌이 부부 카드소득공제 TIP</h2><br/>

                <div class="text-box2">
                    <c:choose>
                        <c:when test="${basic_deduction > 0}">
                            <div class="character-box2">
                                <img  src="../../../resources/img/character5.png" height="180">
                                <div class="comment-text1">
                                    <h2>별돌이의 소비 제안💫</h2>
                                    <div class="consumption-comment">
                                    <h3><span style="color: #106e69; font-size: 25px;">결제</span>는 <span style="color: #106e69; font-size: 25px;">${currentUser.name}</span>님이 주로 하실 것을 제안드려요</h3>
                                        <p>(카드 소득공제금액을 채우기 전까지는 ${currentUser.name}님의 소비가, 그 이후엔 배우자님의 소비가 유리해요)</p>
                                    </div>
                                    <br/>
                                    <h5> ☑ 1년간 소비금액이 많다면 <span style="color: #ff328b; font-size: 22px;">연봉이 상대적으로 많은 </span>배우자에게 몰아서 <br/>&nbsp;&nbsp;&nbsp;&nbsp;공제 한도를 채우는 것이 좋아요<br/>
                                    <h5> ☑ 1년간 소비금액이 많지 않다면 <span style="color: #ff328b; font-size: 22px;">연봉이 상대적으로 적은 </span>배우자에게 몰아서 <br/>&nbsp;&nbsp;&nbsp;&nbsp;공제 한도를 채우는 것이 좋아요<br/>
                                </div>
                            </div>

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
<%--                    <p2>✔️ 카드소득공제는 일반소득공제와 추가소득공제로 구성되어있어요.</p2>--%>
<%--                    <br/><br/>--%>
<%--                    <p2>✔️ 카드 등 소득공제는 총 급여액의 25%를 초과한 금액부터 가능해요.</p2>--%>
<%--                    <br/>--%>
<%--                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(총 급여액은 연봉에서 식대나 보육 수당 같은 ‘비과세 소득’을 뺀 금액을 의미해요.)</p>--%>
<%--                    <br/>--%>
<%--                    <p2>✔️ 기본공제항목은 결제수단이 신용카드, 체크/직불카드, 현금영수증인 것을 의미해요.</p2>--%>
<%--                    <br/><br/>--%>
<%--                    <p2>✔️ 추가공제항목에는 도서/공연 등의 문화비, 전통시장, 대중교통에서 사용한 금액이 해당돼요</p2>--%>
<%--                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(단, 총급여가 7천만원을 초과하는 경우는 문화비 공제를 받을 수 없어요)</p><br/>--%>
                </div>
                <br/>
            </div>


            <div class="container2">
                <div class="comment-box">
                    <div class="comment-box-inner">
                        <div class="comment-info">
                            <c:choose>
                                <c:when test="${basic_deduction > 0}">
                                    <div class="character-box">
                                        <img class="inputImg" src="../../../resources/img/character1.png" height="180">
                                        <div class="comment-text1">
                                            <h2>별돌이의 소비 제안💫</h2>
                                            <h5> 신용카드 대신 <span style="color: #ff328b; font-size: 25px;">체크카드, 현금</span>을<br/>
                                                사용하는 것이 소득공제에 더 좋아요.</h5>
                                        </div>
                                    </div>

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


</body>
</html>