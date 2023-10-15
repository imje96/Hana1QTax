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

    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>

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

        .chart-box-inner3 {
            display: flex;
            flex-direction: column;
            width: 510px;
            /* height: 430px; */
            align-items: center;
            background: #f3f3f3a3;
            padding-top: 30px;
            padding-bottom: 20px;
            border-radius: 10px;
            box-shadow: 3px 4px 6px rgba(0, 0, 0, 0.1);
            border: 7px solid #00857e;
            transition: background-color 0.3s, transform 0.3s;
        }

        .chart-box-inner2 h3 {
            font-size: 27px;
        }

        .chart-box-inner3 h3 {
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

        .comment-text2 {
            font-weight: bold;
            width: 800px;
            line-height: 2em;
            background: white;
            border-radius: 15px;
            padding: 10px 20px 10px 30px;
            /*margin-left: 180px;*/
            margin: 30px 0 30px 10px;
            font-size: 20px;
            color: black;
            box-shadow: 5px 2px 11px rgba(0, 0, 0, 0.1);
        }

        .text-box2 {
            background: #eaf3f3;
            border-radius: 10px;
            margin: 20px 0;
            padding: 20px 50px;
            text-align: left;
            width: 1000px;
            display: flex;
            justify-content: space-evenly;
        }

        .consumption-comment {
            padding: 10px 20px;
            background: #fcffd0;
            margin-top: 10px;
            text-align: center;
        }

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
            color: black;
            border: 2px solid #106e69;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            line-height: 1.5em;
            z-index: 1; /* 다른 요소 위에 표시되도록 함 */
        }

        .hover-text:hover .popup-modal {
            display: block;
            border-radius: 10px;
            padding: 10px 20px;
            width: 590px;
            font-size: 20px;
            text-align: left;
        }

        .hover-text:hover .popup-modal p {
            font-size: 16px;
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
                <h3 style="color: #065859; margin-bottom: 15px;">연말정산 플래너</h3>
                <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxSimulationMain"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">연말정산 안내</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxSimulation"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">연말정산 시뮬레이션</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/simulationResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">연말정산 결과</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/spouseAgreement"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">우리집 돈관리 초대하기</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxSimulation" style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">우리집 돈관리 리포트</h6>
                </a>
            </div>
        </div>


        <div class="section">
            <div class="container-title">

                <h2>우리집 돈관리</h2>
                <br/>
                <span style="color: #615e5e"><h3>맞벌이 부부 절세 및 소비 전략을 확인해 보세요</h3></span>
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
                    <div class="member-title"><h3>${currentUser.name} 님 소득공제</h3></div>
                    <div class="member-title2"><h3>배우자: ${spouseName} 님 소득공제</h3></div>
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
                        <p> * 총급여액 : 6000 만원 기준 <br><br></p>
                    </div>
                    <br/>
                    <div class="chart-box-inner3">
                        <h3>[ 전체 카드소득공제 현황 ]</h3> <br/>
                        <div class="info-item1">
                        <span style="color: #8b8b8b; font-size: 20px;">
                            달성금액 : <span style="color: #ff328b;"><fmt:formatNumber value="${total_deduction2}"
                                                                                   groupingUsed="true"/></span>/<fmt:formatNumber
                                value="${total}"
                                groupingUsed="true"/> 원</span>
                        </div>
                        <p>(기준금액 = 기본공제한도 + 추가공제한도)</p>
                        <div class="chart1">
                            <canvas id="deductionChart3"></canvas>
                        </div>
                        <div class="info-box">
                            <div class="info-item2">전체 남은 공제가능액:&nbsp;<fmt:formatNumber value="${remainingDeduction3}"
                                                                                        groupingUsed="true"/>원
                            </div>
                        </div>
                        <br/>
                        <h3>[ 기본 카드소득공제 현황 ]</h3><br/>
                        <div class="info-item1">
                     <span style="color: #8b8b8b; font-size: 20px;">
                            달성금액 : <span style="color: #ff328b;"><fmt:formatNumber value="${basic_deduction2}"
                                                                                   groupingUsed="true"/></span>/<fmt:formatNumber
                             value="${basicTotal}"
                             groupingUsed="true"/> 원</span>
                        </div>
                        <p>(기준금액 = 기본공제한도)</p>
                        <div class="chart2">
                            <canvas id="deductionChart4"></canvas>
                        </div>
                        <div class="info-box">
                            <div class="info-item2">남은 공제가능액:&nbsp;<fmt:formatNumber value="${remainingDeduction4}"
                                                                                     groupingUsed="true"/>원
                            </div>
                        </div>
                        <p> * 총급여액 : 5000 만원 기준 <br><br></p>
                    </div>
                    <script src="../../resources/js/deductionChart.js"></script>
                    <script src="../../resources/js/deductionChart2.js"></script>
                </div>
                <%--                        <span style="font-weight: bold; color: #fd328a;">--%>
                <br/><br/>
                <h2>💡 맞벌이 부부 카드소득공제 TIP</h2><br/>

                <div class="text-box2">
                    <div class="character-box2">
                        <img src="../../../resources/img/character5.png" height="180">
                        <div class="comment-text1">
                            <h2>별돌이의 소비 제안💫</h2>
                            <div class="consumption-comment">
                                <h3><span
                                        style="color: #106e69; font-size: 25px;">${currentUser.name}</span> 님의 카드로 <span
                                        style="color: #ff328b; font-size: 25px;">결제</span>하는 것을 제안드려요❕</h3>
                            </div>

                            <h5> ☑ 1년간 소비금액이 많다면 <span
                                    style="color: #ff328b; font-size: 22px;">소득이 상대적으로 높은 </span>배우자에게 몰아서 <br/>&nbsp;&nbsp;&nbsp;&nbsp;공제
                                한도를 채우는 것이 좋아요</h5>
                            <h5> ☑ 1년간 소비금액이 많지 않다면 <span style="color: #ff328b; font-size: 22px;">소득이 상대적으로 적은 </span>배우자에게
                                몰아서 <br/>&nbsp;&nbsp;&nbsp;&nbsp;공제 한도를 채우는 것이 좋아요</h5>

                            <div class="flex-box">
                                <div class="hover-text">
                                    <span style="text-align: right; font-size: 20px; margin-left: 100px; color: #4f4949">&nbsp;&nbsp;&nbsp;&nbsp; 왜 그럴까요 ⍰</span>
                                    <div class="popup-modal">
                                        <span style="color: #0d6565;">카드 소득공제금액을 채우기 전까지는 연봉이 높은 ${currentUser.name}님의 소비가, 그 이후엔 배우자님의 소비가 유리해요.</span><br/>
                                        소득이 높은 쪽은 보통 <span style="color: #ff328b;">세율도 높기 </span>때문에 소비 소득공제를 통해 <span
                                            style="color: #ff328b;">세금 <br/>공제액을 높이는</span> 것이 필요해요.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h2> 맞벌이 부부 인적공제 TIP</h2><br/>

                <div class="text-box2">
                    <div class="comment-text2">
                        <h2>부양가족 공제 제안 👨‍👩‍👧‍👦</h2>
                        <div class="consumption-comment">
                            <h3><span
                                    style="color: #106e69; font-size: 25px;">${spouseName}</span> 님이 <span
                                    style="color: #ff328b; font-size: 25px;">인적공제</span>받는 것을 제안드려요❕</h3>
                        </div>
                        <br/>
                        <h5> ☑ 부양가족 기본공제는<span
                                style="color: #ff328b; font-size: 22px;"> 소득이 높은 </span>배우자에게 몰아서 공제를 받는 것이 유리해요</h5>
                        <h5> ☑ 종합소득세는 많이 벌수록 많은 소득세를 내야 하는 누진세율 구조로 되어 있어,<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;맞벌이 부부 연말정산에서는 소득이 높은 쪽으로 공제를 받는 게 세액 상 유리한 부분이 있어요</h5>
                        <div class="hover-text">
                            <div class="flex-box">

                                <span style="font-size: 20px; color: #4f4949; margin-left: 270px;">추가 설명 보기 ⍰</span>
                            </div>
                            <div class="popup-modal">
                                맞벌이 부부가 부양가족으로 100만 원을 공제받는다고 해볼게요.<br/> 과세표준이 35% 구간에 해당하는 배우자라면 35만 원,
                                과세표준이 24% 구간에 해당하는 배우자라면 24만 원을 줄이는 효과가 발생해요.<br/>
                                그러므로 부양가족 기본공제는 소득이 높은 배우자에게 몰아주는 게 유리해요.
                            </div>
                        </div>
                    </div>
                </div>
                <h2> 맞벌이 부부 의료비 공제 TIP</h2><br/>
                <div class="text-box2">
                    <div class="comment-text2">
                        <h2>의료비 소비 제안 🏥</h2>
                        <div class="consumption-comment">
                            <h3><span
                                    style="color: #106e69; font-size: 25px;">${spouseName}</span> 님의 카드로 <span
                                    style="color: #ff328b; font-size: 25px;">결제</span>하는 것을 제안드려요❕</h3>
                        </div>
                        <br/>
                        <h5> ☑ 의료비는 총 급여액의 3%를 초과해야되기 때문에 <span
                                style="color: #ff328b; font-size: 22px;">연봉이 상대적으로 적은 </span>배우자가<br/>&nbsp;&nbsp;&nbsp;&nbsp;지출하는
                            것이 유리해요</h5>
                        <h5> ☑ 부양가족 의료비는 인적공제 대상자만 포함되기 때문에 의료비 사용 대상<span
                                style="color: #ff328b; font-size: 22px;"> 부양가족의<br/> &nbsp;&nbsp;&nbsp;&nbsp;인적공제도 </span>의료비
                            공제를 받을 배우자에게 몰아서 공제를 받는 것이 유리해요</h5>
                        <div class="hover-text">
                            <div class="flex-box">

                                <span style="font-size: 20px; color: #4f4949; margin-left: 270px;">추가 설명 보기 ⍰</span>
                            </div>
                            <div class="popup-modal">
                                의료비는 자격요건이나 소득, 나이에 제한이 없어요. 배우자가 소득이 많더라도 본인 카드로 결제했다면 본인 의료비로 공제 가능해요.<br/>
                                또, 부양가족인 부모님이나 형제자매를 위해 쓴 의료비도 신청 가능해요. 여기에 <span style="color: #0d6565;">산후조리원 비용이나 건강검진 비용, 시력교정용 안경, 콘택트렌즈</span>
                                의료비 공제에 해당하니 누락되는 것 없이 꼼꼼히 챙기셔야 해요
                            </div>
                        </div>
                    </div>
                </div>
                <br/><br/><br/>
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
<script>
    window.creditDeduction2 = ${credit_deduction2};
    window.debitDeduction2 = ${debit_deduction2};
    window.cashDeduction2 = ${cash_deduction2};
    window.basicDeduction2 = ${basic_deduction2};
    window.additionalDeduction2 = ${additional_deduction2};
    window.totalDeduction2 = ${total_deduction2};
    window.total2 = ${total2}; // 전체 공제한도
    window.basicTotal2 = ${basicTotal2}; // 기본 공제한도
    window.remainingDeduction3 = ${remainingDeduction3};
    window.remainingDeduction4 = ${remainingDeduction4};
</script>


<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>