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


    <!-- Add Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

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
</head>


<style>
    .section2 {
        width: 1200px;
        background: #f1f3f5;
        display: flex;
        margin-top: 50px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .container-left {
        background-color: #efecec;
        width: 60%;
        height: 1000px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        /*box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);*/
    }

    .container-right {
        background-color: #efecec;
        width: 40%;
        height: 1000px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        /*box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);*/
    }

    .title {
        text-align-all: center;
    }

    .card-box {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px 0;
        margin: 25px 25px;
        width: 90%;
        height: 300px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .monthly-box {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px 25px;
        margin: 20px 20px 20px 0;
        width: 90%;
        height: 200px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .category-box {
        background-color: #fff;
        border-radius: 10px;
        padding: 10px 25px;
        margin: 0 20px 20px 0;
        width: 90%;
        height: 725px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .card-transaction {
        background-color: #fff;
        border-radius: 10px;
        padding: 10px 0;
        margin: 0 20px;
        width: 90%;
        height: 350px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .hometax-transaction {
        background-color: #fff;
        border-radius: 10px;
        padding: 10px 0;
        margin: 25px 25px;
        width: 90%;
        height: 350px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .carousel-inner {
        position: relative;
        width: 300px;
        overflow: hidden;
    }

    .carousel img {
        max-width: 100%;
        height: auto;
        margin-top: 15px;
        margin-bottom: 10px;
    }

    .carousel-item {
        width: 100%; /* or any specific width */
        height: auto; /* or any specific height */
    }

    .carousel-control-prev {
        left: -50px;
    }

    .carousel-control-next {
        right: -50px;
    }

    .carousel-control-next, .carousel-control-prev {
        position: absolute;
        top: 78px;
        bottom: 0;
        height: 45px;
        border-radius: 40%;
        z-index: 1;
        background: #00857e;
        /*display: -ms-flexbox;*/
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        -ms-flex-pack: center;
        justify-content: center;
        width: 12%;
        /*color: #343a40;*/
        text-align: center;
        /* opacity: .5; */
        transition: opacity .15s ease;
    }

    .header-container {
        color: #1A202C;
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 10px;
        font-weight: 600;
        width: 580px;
    }

    .section-header {
        line-height: 24px;
        font-size: 20px;
    }

    .date-selector {
        padding: 10px 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 6px;
        background: #b4cece;
        box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.2);
    }

    .date-selector span {
        font-weight: 600;
        font-size: 18px;
        line-height: 15px;
    }

    /* 소비내역 카테고리   */
    .chart3 {
        width: 300px;
        height: 300px;
    }

    .pie-chart__labels {
        display: flex;
        flex-direction: column;
        gap: 10px;
        /*margin-top: 20px;*/
        width: 320px;
    }

    .pie-chart__labels-item, .label {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .pie-chart__labels-item {
        font-weight: 600;
        font-size: 15px;
        line-height: 150%;
    }

    .label {
        gap: 12px;
        font-weight: 600;
        font-size: 18px;
        line-height: 15px;
        color: #596780;
    }

    .label__color {
        width: 12px;
        height: 12px;
        border-radius: 50%;
    }

    .first {
        background: #f695b8;
    }

    .second {
        background: #f8d5d6;
    }

    .third {
        background: #f8f2ce;
    }

    .fourth {
        background: #d1ede5;
    }

    .fifth {
        background: #aee3eb;
    }

    .sixth {
        background: #e6e4dc;
    }

    .seventh {
        background: #bfcaf2;
    }

    .eighth {
        background: #839ee6;
    }

    .ninth {
        background: #7C5CFC;
    }

    .inner-text {
        position: absolute;
        transform: translate(0%, -530%);
        /*top: 32%;*/
        /*left: 50%;*/
        text-align: center;
        color: #e4003f;
    }

    /*   금액 표시 */
    .price-currency {
        line-height: 21px;
        font-size: 14px;
        font-weight: 600;
        color: #90A3BF;
        /*margin-left: 8px;*/
    }

    /* 카드사용내역 */
    .transaction-history {
        width: 90%;
        text-align: left;
        vertical-align: middle;
        /*margin-top: 24px;*/
    }

    tr > th {
        font-weight: 500;
        font-size: 17px;
        line-height: 100%;
        color: #90A3BF;
        /* text-align: center; */
        background: #fff;
        border-bottom: #fff;
        border-right: #fff;
    }

    tr > td:first-child {
        display: flex;
        align-items: center;
        gap: 9px;
        padding-left: 30px;
    }

    tr > td {
        font-weight: 600;
        font-size: 16px;
        padding: 8px 0;
        text-align: left;
        border-right: #fff;
    }

    tr:nth-child(odd) td {
        background: #ffffff;
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
        margin-left: 425px;
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

    #headerLogo2 {
        display: flex;
        align-items: center;
        width: 1644px;
        padding: 10px 0 0 250px;
        justify-content: space-between;
        font-size: 18px;
    }
</style>


<body>

<!--contents-->


<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>
<%--<header>--%>
<%--    <div id="headerLogo2">--%>
<%--        <!-- Dynamic Welcome Message and Log Out button would be here -->--%>
<%--        <div id="welcomMessage">--%>
<%--            <h6>하나카드 홈페이지</h6>--%>
<%--        </div>--%>

<%--        <c:if test="${empty currentUser}">--%>
<%--            <div id="loginout">--%>
<%--                <a href="${pageContext.request.contextPath}/login" class="loginBtn">로그인</a>--%>
<%--                <a href="${pageContext.request.contextPath}/join" class="joinBtn">회원가입</a>--%>
<%--            </div>--%>
<%--        </c:if>--%>
<%--        <c:if test="${not empty currentUser }">--%>
<%--            <div id="welcomeMessage">--%>
<%--                <span>${currentUser.name} 님 환영합니다</span>--%>
<%--                &nbsp; &nbsp;--%>
<%--                <a href="${pageContext.request.contextPath}/logout" class="logoutBtn">로그아웃</a>--%>
<%--            </div>--%>
<%--        </c:if>--%>


<%--        <!-- <div id="loginout">--%>
<%--        <button id="loginBtn" onclick="window.location.href='/login'">로그인</button>--%>
<%--        <button id="joinBtn" onclick="window.location.href='/join'">회원가입</button>--%>
<%--    </div> -->--%>

<%--    </div>--%>

<%--    <nav>--%>
<%--        <div class="navbar">--%>
<%--            <div id="lognavbaro">--%>
<%--                <a href="${pageContext.request.contextPath}/main">--%>
<%--                    <img class="imgLogo" src="../../../resources/img/logo.png" height="65">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="drops">--%>
<%--                <div class="dropdown">--%>
<%--                    <a href="${pageContext.request.contextPath}/taxMain">--%>
<%--                        <button class="dropbtn">카드황금비율관리--%>
<%--                            &lt;%&ndash;                                                        <i class="fa fa-caret-down"></i>&ndash;%&gt;--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-content">--%>
<%--                        <a href="#">소득공제 안내</a>--%>
<%--                        <a href="#">소비 문턱 넘기기</a>--%>
<%--                        <a href="#">카드황금비율 계산</a>--%>
<%--                        <a href="#">카드황금비율 결과</a>--%>
<%--                        <a href="#">우리집 돈관리</a>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="dropdown">--%>
<%--                    <a href="${pageContext.request.contextPath}/taxSimulation">--%>
<%--                        <button class="dropbtn">연말정산플래너--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-content">--%>
<%--                        <a href="#">연말정산 안내</a>--%>
<%--                        <a href="#">연말정산 시뮬레이션</a>--%>
<%--                        <a href="#">연말정산 결과</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="dropdown">--%>
<%--                    <a href="${pageContext.request.contextPath}/tranDashboard">--%>
<%--                        <button class="dropbtn">마이데이터--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-content">--%>
<%--                        <a href="#">카드관리</a>--%>
<%--                        <a href="#">사용내역</a>--%>
<%--                        <a href="#">내혜택확인</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="dropdown">--%>
<%--                    <a href="${pageContext.request.contextPath}/tranDashboard">--%>
<%--                        <button class="dropbtn">카드추천--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-content">--%>
<%--                        <a href="#">카드한눈에보기</a>--%>
<%--                        <a href="#">추천카드</a>--%>
<%--                        <a href="#">카드안내</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                &lt;%&ndash;                    <div class="dropdown">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <button class="dropbtn">커뮤니티&ndash;%&gt;--%>
<%--                &lt;%&ndash;                            <i class="fa fa-caret-down"></i>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        </button>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <div class="dropdown-content">&ndash;%&gt;--%>
<%--                &lt;%&ndash;                            <a href="#">세테크tip</a>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                            <a href="#">절세게시판</a>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    </div>&ndash;%&gt;--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</header>--%>

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
                <h6 style="color: black; margin-bottom: 15px;">대시보드</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxThreshold"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">내 카드 확인하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxInfo" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">카드 사용내역</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">홈택스 사용내역</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/spouseResult"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">실적 확인하기</div>
            </a>
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
            <h2>내 소비 모아보기</h2>
            <br/>
            <span style="color: #615e5e"><h3>소득공제액을 미리 확인하고 관리하세요!</h3></span>
        </div>


        <div class="section2">


            <%--            <div class="time" style="text-align: right">--%>
            <%--                <c:set var="formattedTimestamp" value="${fn:substring(deduction_date, 0, 19)}"/>--%>
            <%--                ${formattedTimestamp}--%>
            <%--                <a href=""${pageContext.request.contextPath}/calculateAndInsertDeduction" onclick="window.location.reload(); return false;">--%>
            <%--                <img src="../../../resources/img/refresh.png" height="30"></a>--%>
            <%--            </div>--%>
            <div class="container-left">
                <%--                <p>${deduction_date}</p>--%>

                <div class="card-box">
                    <h5> 내 카드</h5>

                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/13015.png"
                                     class="d-block w-100" alt="Slide 1">
                                <span style="text-align: center; color: #90A3BF;"><h5>모두의 일상 카드</h5></span>
                            </div>
                            <div class="carousel-item">
                                <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/11530.png"
                                     class="d-block w-100" alt="Slide 2">
                                <span style="text-align: center; color: #90A3BF;"><h5>1Q 카드</h5></span>
                            </div>
                            <div class="carousel-item">
                                <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/13015.png"
                                     class="d-block w-100" alt="Slide 3">
                                <span style="text-align: center; color: #90A3BF;"><h5>모두의 일상 카드</h5></span>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                </div>
                <div class="card-transaction">

                    <div class="header-container">
                        <h3 class="section-header">카드 사용내역</h3>
                        <div class="date-selector">
                            <span>📅 2023 10/1 - 10/12</span>
                        </div>
                    </div>
                    <button id="openModalBtn" class="detailBtn"><h6>더보기 +</h6></button>
                    <table class="transaction-history">
                        <tbody>
                        <tr>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp; 거래내역</th>
                            <th>결제일자
                            </th>
                            <th>결제금액
                            </th>

                        </tr>
                        <tr>
                            <td>
                                🥘 배달의 민족
                            </td>
                            <td>2023-10-12</td>
                            <td>25,000 원</td>

                        </tr>
                        <tr>
                            <td>
                                ☕ 스타벅스 철산점
                            </td>
                            <td>2023-10-12</td>
                            <td>6,800 원</td>

                        </tr>
                        <tr>
                            <td>
                                🏦 이마트 철산점
                            </td>
                            <td>2023-10-12</td>
                            <td>29,980 원</td>

                        </tr>
                        </tbody>
                    </table>

                </div>
                <div class="hometax-transaction">
                    <div class="header-container">
                        <h3 class="section-header">현금영수증 사용내역</h3>
                        <div class="date-selector">
                            <span>📅 2023 10/1 - 10/12</span>
                        </div>
                    </div>
                    <button class="detailBtn"><h6>더보기 +</h6></button>
                    <table class="transaction-history">
                        <tbody>
                        <tr>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp; 거래내역</th>
                            <th>결제일자
                            </th>
                            <th>결제금액
                            </th>

                        </tr>
                        <tr>
                            <td>
                                ☕ 와밀커피
                            </td>
                            <td>2023-10-09</td>
                            <td>5,600 원</td>

                        </tr>
                        <tr>
                            <td>
                                🥘 김가네
                            </td>
                            <td>2023-10-11</td>
                            <td>15,000 원</td>

                        </tr>
                        <tr>
                            <td>
                                📚 교보문고
                            </td>
                            <td>2023-10-02</td>
                            <td>14,000 원</td>

                        </tr>
                        </tbody>
                    </table>

                </div>

            </div>

            <div class="container-right">
                <%--                <p>${deduction_date}</p>--%>

                <div class="monthly-box">
                    <h5> 10월 사용금액</h5>
                    <h1 class="price"><fmt:formatNumber value="${thisMonthSpending.totalAmount}"
                                                        groupingUsed="true"/>
                        <span class="price-currency">(원)</span></h1>

                    <span class="price-currency">2023년 10월 3일</span>
                </div>
                <div class="category-box">

                    <div><h5>이번 달 사용 업종</h5></div>
                    <div class="chart3">

                        <canvas id="deductionChart2"></canvas>
                    </div>
                    <div class="inner-text">
                        <h3>1위 : ${categoryMonth[0].categoryBig}</h3>
                    </div>
                    <div class="pie-chart__labels">
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color first"></div>
                                ${categoryMonth[0].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[0].totalAmount}" groupingUsed="true"/> 원
                        </div>
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color second"></div>
                                ${categoryMonth[1].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[1].totalAmount}" groupingUsed="true"/> 원
                        </div>
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color third"></div>
                                ${categoryMonth[2].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[2].totalAmount}" groupingUsed="true"/> 원
                        </div>
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color fourth"></div>
                                ${categoryMonth[3].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[3].totalAmount}" groupingUsed="true"/> 원
                        </div>
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color fifth"></div>
                                ${categoryMonth[4].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[4].totalAmount}" groupingUsed="true"/> 원
                        </div>
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color sixth"></div>
                                ${categoryMonth[5].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[5].totalAmount}" groupingUsed="true"/> 원
                        </div>
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color seventh"></div>
                                ${categoryMonth[6].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[6].totalAmount}" groupingUsed="true"/> 원
                        </div>
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color eighth"></div>
                                ${categoryMonth[7].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[7].totalAmount}" groupingUsed="true"/> 원
                        </div>
                        <div class="pie-chart__labels-item">
                            <div class="label">
                                <div class="label__color ninth"></div>
                                ${categoryMonth[8].categoryBig}
                            </div>
                            <fmt:formatNumber value="${categoryMonth[8].totalAmount}" groupingUsed="true"/> 원
                        </div>
                    </div>


                </div>

            </div>

        </div>
    </div>
</section>
</div>

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="../../resources/js/deductionChart.js"></script>
<!-- Chart.js 및 Datalabels 플러그인 추가 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

<script>
    const slideContainer = document.querySelector(".slideshowContents");
    const slides = document.querySelectorAll(".slide");
    const prevButton = document.querySelector(".lastSlide");
    const nextButton = document.querySelector(".nextSlide");

    let currentSlide = 0;

    function updateButtonVisibility() {
        prevButton.style.display = currentSlide === 0 ? "none" : "block";
        nextButton.style.display =
            currentSlide === slides.length - 1 ? "none" : "block";
    }

    function goToSlide(index) {
        currentSlide = index;
        // Get width of a slide
        const slideWidth = slides[0].clientWidth;
        const translateX = -index * slideWidth;
        slideContainer.style.transform = `translateX(${translateX}px)`;
        updateButtonVisibility(); // Update button visibility after changing slide
    }

    prevButton.addEventListener("click", () => {
        currentSlide = Math.max(currentSlide - 1, 0);
        goToSlide(currentSlide);
    });

    nextButton.addEventListener("click", () => {
        currentSlide = Math.min(currentSlide + 1, slides.length - 1);
        goToSlide(currentSlide);
    });

    window.addEventListener("resize", () => {
        // Recalculate slide width on window resize
        const slideWidth = slides[0].clientWidth;
        // Update slide position based on new width
        goToSlide(currentSlide);
    });

    // Initialize button visibility
    updateButtonVisibility();

    // Initialize slide position
    goToSlide(currentSlide);

</script>
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
<script type="text/javascript">
    let categories = [];
    <c:forEach var="item" items="${categoryMonth}">
    categories.push('${item.categoryBig}'); // EL 태그를 사용하여 JavaScript 배열에 데이터 저장
    </c:forEach>
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ctx2 = document.getElementById('deductionChart2').getContext('2d');

        var deductionChart2 = new Chart(ctx2, {
            type: 'doughnut',
            data: {
                labels: categories,
                datasets: [{
                    data: [
                        ${categoryMonth[0].totalAmount},
                        ${categoryMonth[1].totalAmount},
                        ${categoryMonth[2].totalAmount},
                        ${categoryMonth[3].totalAmount},
                        ${categoryMonth[4].totalAmount},
                        ${categoryMonth[5].totalAmount},
                        ${categoryMonth[6].totalAmount},
                        ${categoryMonth[7].totalAmount},
                        ${categoryMonth[8].totalAmount},
                    ],
                    backgroundColor: ['#f695b8', '#f8d5d6', '#f8f2ce', '#d1ede5', '#aee3eb', '#e6e4dc', '#bfcaf2', '#839ee6', '#7C5CFC'],
                    borderColor: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'],
                    // circumference: 180,
                    rotation: 270,
                }]
            },
            options: {
                plugins: {
                    legend: {
                        display: false, // 범례를 숨김
                    },
                },
                tooltips: {
                    enabled: true,
                    callbacks: {
                        label: function (tooltipItem, data) {
                            let label = data.labels[tooltipItem.index];
                            let value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                            return label + ': ' + value;
                        }
                    }
                }
            }
        });
    });
</script>


<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>