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


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
            rel="stylesheet">
    <%--    <style type="text/css">--%>
    <%--        * {--%>
    <%--            font-family: 'Noto Sans KR', sans-serif !important;--%>
    <%--        }--%>
    <%--    </style>--%>


    <style>
        .side-nav {
            font-family: 'Noto Sans KR', sans-serif !important;
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
                    <h6 style="color: black; margin-bottom: 15px;">소비 문턱 넘기기</h6>
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
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">우리집 돈관리</div>
                </a>
                <hr style="width: 200px;">
            </div>
        </div>


        <div class="section">
            <%--            <div class="container-xxl py-5">--%>

            <%--                <h5>공제 문턱을 넘기기 전엔, 혜택이 많은 카드로!</h5>--%>
            <%--                <p>소득공제를 받으려면 공제 문턱(총 급여의 25%)을 넘어야 해요<br/>--%>
            <%--                    공제 문턱까지는 어떤 결제수단이든 상관없으니 혜택이 많은 신용카드를 쓰시는게 어떨까요?</p>--%>

            <div class="container-title">
                <h2>소비 문턱 넘기기</h2>
                <br/>
                <span style="color: #615e5e"><h3>연말정산 소득공제가 가능한 금액을 알려드릴게요</h3></span>
            </div>
          <br/><br/>

            <div class="big-chart-box">
                <div class="chart-box">
                    <div class="chart-box-inner">
                        <h3>연말정산 문턱넘기 현황</h3><br/>
                        <div class="info-item1">
                    <span style="color: #106e69;">
                            달성금액 : <span style="color: #ff328b;"><fmt:formatNumber value="${basicTotal}"
                                                                                   groupingUsed="true"/></span>/
                      <fmt:formatNumber value="${minimum_amount}" groupingUsed="true"/>원</span>
                        </div>
                        <p>(사용누적액/최저사용금액)</p>
                        <div class="chart2">
                            <canvas id="threshold1"></canvas>
                        </div>
                        <div class="info-box">
                            <div class="info-item2">공제 시작까지 남은 금액:&nbsp;0 원</div>
                        </div>
                    </div>
                    <script src="../../resources/js/thresholdChart.js"></script>


                    <div class="chart-box-inner">
                      <h3>누적 사용금액 확인하기</h3><br/><br/>
<%--                        <div class="info-box">--%>
                      <div class="info-item3">
                        <h3>🔔 소득공제가 가능한 금액을 달성했어요!</h3>
                      </div><br/>
                      카드황금비율 계산 페이지에서 카드 사용전략을 확인해보세요<br/><br/>
                          <div class="info-item4">
                            <div class="info-item">신용카드 사용금액 :&nbsp;<span style="font-weight: bold"><fmt:formatNumber value="${credit_total}"
                                                                                       groupingUsed="true"/> 원</span>
                            </div>
                            <div class="info-item">체크카드 사용금액 :&nbsp;<span style="font-weight: bold"><fmt:formatNumber value="${debit_total}"
                                                                                       groupingUsed="true"/> 원
                            </div>
                            <div class="info-item">현금영수증 사용금액 :&nbsp;<span style="font-weight: bold"><fmt:formatNumber value="${cash_total}"
                                                                                        groupingUsed="true"/> 원
                            </div>
                            <div class="info-item">기타 공제항목 사용금액 :&nbsp;<span style="font-weight: bold"><fmt:formatNumber value="${additionalTotal}"
                                                                                          groupingUsed="true"/> 원
                            </div>
                        </div>
                        <br/>

                    </div>
                </div>
            </div>
              <br/>

                <div class="comment-info">
                      <div class="character-box-large">
                        <img class="inputImg" src="../../../resources/img/character1.png" height="180">
                        <div class="comment-text1-large">
                          <h2>별돌이의 소비 제안💫</h2>
                          <h5> 공제 문턱을 넘기기 전엔, <span style="color: #ff328b; font-size: 25px;">혜택이 많은 카드</span>로!<br/></h5>
                        </div>
                      </div>
                      <div class="comment-text-center">
                        소득공제를 받으려면 공제 문턱(총 급여의 25%)을 넘어야 해요<br/>
                        공제 문턱까지는 어떤 결제수단이든 상관없으니 혜택이 많은 <span style="color: #ff328b;">신용카드</span>를 쓰시는게 어떨까요?
                      </div>
                      <%--                                <img class="inputImg" src="../../../resources/img/debitcard.png" height="180">--%>
                  <button id="recommendBtn" class="pointBtn"><h6>내게 맞는 카드 추천받기</h6></button>

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
    window.creditTotal = ${credit_total};
    window.debitTotal = ${debit_total};
    window.cashTotal = ${cash_total};
    window.cultureTotal = ${culture_total};
    window.marketTotal = ${market_total};
    window.transportTotal = ${transport_total};
    window.minimumAmount = ${minimum_amount}; // 최소 사용액
    window.remainingThreshold = ${remainingThreshold}; // 연말정산 문턱넘기까지 남은 금액
</script>


<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>