<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 문자열 바꾸기 --%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>HanaOneTax</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <%--    common.css--%>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/main.css" rel="stylesheet">

    <!-- font awseom -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <%--    chartjs 추가--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="../../../resources/css/tax.css" rel="stylesheet">


    <!-- Add Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>


<style>
    *, ::after, ::before {
        box-sizing: inherit;
    }

    .section2 {
        width: 1200px;
        background: #f1f3f5;
        display: flex;
        flex-direction: column;
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
        padding-right: 25px;
        /*box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);*/
    }

    .title {
        text-align-all: center;
        margin-top: 40px;
        font-size: 30px;
        font-weight: 700;
    }

    .card-box {
        background-color: #fdfdfd;
        border-radius: 10px;
        padding: 20px 20px;
        margin: 25px 25px;
        /*width: 95%;*/
        height: 674px;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        /*border: 15px solid #00857e;*/
        /* transform과 box-shadow 효과를 0.3초 동안 부드럽게 적용 */
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }


    .card-selector {
        /*background-color: #55e7df;*/
        border-radius: 10px;
        padding: 20px 0;
        /*margin: 25px 25px;*/
        width: 90%;
        /*height: 700px;*/
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        color: #2a9791;
        /*box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);*/
    }

    .card-box h3 {
        font-size: 30px;
        color: #2a9791;
    }

    .monthly-box {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px 25px;
        margin: 25px 20px 20px 0;
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
        margin: 0 20px 25px 0;
        width: 90%;
        height: 725px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
        color: #666B85;
        background: #b4cece;
        box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.2);
    }

    .date-selector span {
        font-weight: 600;
        font-size: 18px;
        line-height: 15px;
    }

    .info-box1 {
        background-color: rgb(255 223 237) !important;
        /*padding: 10px;*/
        border-radius: 10px;
        text-align: center;
        width: 90%;
        height: 300px;
        padding: 20px 16px;
        margin-top: 20px;
        /*color: #ffffff;*/
    }


    .info-box2 {
        /*position: absolute;*/
        /*top: 10px;*/
        /*right: 10px;*/
        background-color: rgb(239, 241, 243) !important;
        /*padding: 10px;*/
        border-radius: 10px;
        text-align: center;
        width: 90%;
        height: 270px;
        padding: 20px 16px;
        margin-top: 40px;
    }

    /*   금액 표시 */
    .price-currency {
        line-height: 21px;
        font-size: 14px;
        font-weight: 600;
        color: #90A3BF;
        /*margin-left: 8px;*/
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



    .inner-text {
        text-align: left;
        /* color: #e4003f; */
        font-size: 27px;
        font-weight: 600;
        /* width: 430px; */
        height: 160px;
        margin: 25px 0 20px 0;
    }
    /*  모달창 버튼  */
    .modalBtn2 {
        border: none;
        border-radius: 5px;
        text-align: center;
        font-size: 15px;
        cursor: pointer;
        background: none !important;
        color: #7a7a7a;
        transition: background-color 0.3s, transform 0.3s;
    }

    .modalBtn2:hover {
        transform: scale(1.05);
        /* hover 시 약간 확대되는 효과 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        /* hover 시 그림자 약간 강화 */
    }

    .modal-content2 {
        position: relative;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-direction: column;
        flex-direction: column;
        /* width: 100%; */
        pointer-events: auto;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid rgba(0, 0, 0, .2);
        border-radius: 0.3rem;
        outline: 0;
    }

    /*  드랍다운  */


    .inner-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        /*min-height: 50vh;*/
        gap: 20px;
    }

    @media only screen and (max-width: 767px) {
        .inner-wrapper {
            flex-direction: column;
        }
    }

    .white-wrapper {
        min-height: 50vh;
    }

    .hex-select {
        position: relative;
        display: inline-block;
        padding: .75rem 0;
        cursor: pointer;
    }

    .hex-select:after {
        content: '';
        width: .35rem;
        height: .35rem;
        display: block;
        position: absolute;
        top: 50%;
        right: 1rem;
        transform: translateY(-50%) rotate(-135deg);
        border-right: .125rem solid #ddd;
        border-bottom: .125rem solid #ddd;
    }

    .hex-select select,
    .hex-select .custom-select {
        position: relative;
        appearance: none;
        background: #fdfdfd;
        /*color: #ddd;*/
        font-family: inherit;
        height: 3.5rem;
        line-height: 3.5rem;
        outline: none;
        padding: 0 1.5rem;
        transition: all .35s ease-in-out;
        width: 400px;
        font-size: 21px;
        font-weight: 700;
        text-transform: uppercase;
        border: 1px solid #222;
        border-radius: .35rem;
        cursor: pointer;
    }

    .select-options {
        position: absolute;
        top: 100%;
        left: 0;
        display: flex;
        flex-direction: column;
        background: #f3f0f0;
        border: 1px solid #444;
        border-radius: .35rem;
        list-style: none;
        padding: 0;
        margin: .75rem 0;
        opacity: 0;
        visibility: hidden;
        pointer-events: none;
        max-height: 250px;
        overflow-y: auto;
        transition: .35s ease-in-out all;
    }

    .hex-select .select-options li {
        height: 3rem;
        line-height: 3rem;
        outline: none;
        padding: 0 1.5rem;
        text-transform: none;
        letter-spacing: .025rem;
        border-bottom: 1px solid #333;
        cursor: pointer;
        transition: .35s ease-in-out all;
    }

    .hex-select .select-options li:hover {
        background: #777777;
        color: #FFFFFF;
    }

    .hex-select:hover select,
    .hex-select:hover .custom-select {
        border-color: #444;
    }

    .hex-select:hover .select-options {
        opacity: 1;
        visibility: visible;
        pointer-events: all;
    }

    .info-item6 {
        border: 1px solid #f6f3f3;
        border-radius: 10px;
        margin-bottom: 50px;
        width: 600px;
        padding: 25px;
        font-size: 26px;
        text-align: center;
        background: #f8f8f8;
        line-height: 1.7;

    }

    .info-item {
        border: 1px solid #f6f3f3;
        border-radius: 10px;
        /*margin-bottom: 50px;*/
        width: 540px;
        padding: 25px;
        font-size: 26px;
        text-align: center;
        background: #f8f8f8;
        line-height: 1.7;
        display: flex;
        justify-content: space-between;
    }

    /*  막대그래프  */
    .chart-cover {
        width: 800px;
        height: 200px;
        background-color: #1d3a59;
        font-weight: 600;
        font-size: 25px;
        position: relative;
        display: flex;
        align-items: center;
        border-radius: 15px;
        color: #FFFFFF;
        align-content: space-around;
        flex-direction: column;
        justify-content: flex-end;
    }

    .progress-sector {
        width: 600px;
        display: flex;
        font-weight: 600;
        font-size: 22px;
        position: relative;
        justify-content: space-between;
        color: #ffffff;
        margin: 11px 0 20px 0;
    }

    .progress-text {
        font-size: 35px;
    }

    .progress-container {
        width: 600px;
        height: 50px;
        background-color: #dedede;
        font-weight: 600;
        font-size: .8rem;
        position: relative;
        /* margin-bottom: 35px; */
    }
    .progress-container .gauge {
        height: 50px;
        padding: 0px;
        text-align: center;
        background-color: #6eb4e5;
        color: #111;
        overflow: hidden;
    }
    .flex-text {
        width: 600px;
        display: flex;
        margin-bottom: 15px;
        justify-content: space-between;
        align-items: center;
    }
    /* 실적 구간 */
    .limits-info{
        display: flex;
        width: 600px;
        justify-content: space-between;
        margin-left: 200px;
        font-size: 20px;
        font-weight: 600;
    }
    .limits-info h4{
        font-size: 21px;
        /*color: #e4003f;*/
    }
    .limits-info h5{
        font-size: 18px;
        color: #2a9791;
    }
    /*  테이블  */
    .table-fill2 {
        background: white;
        border-radius: 3px;
        border-collapse: collapse;
        height: 400px;
        margin: 50px;
        margin-top: 5px;
        max-width: 800px;
        padding: 5px;
        width: 100%;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        animation: float 5s infinite;
    }
    .text-th{
        color: #454b4b !important;
        background: #d5dfdf !important;
        height: 45px !important;
        border-bottom: 4px solid #cacfcf !important;
        border-right: 1px solid #d5dfdf !important;
        font-size: 20px !important;
        font-weight: 500 !important;
        text-align: center !important;
    }
    #benefitTable{
        display: none;
    }
    #benefitTable2{
        display: none;
    }
    .notice1{
        display: none;
    }
    .notice2{
        display: none;
    }
    /*    */

</style>
</head>

<body>

<!--contents-->


<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>

<section class="main">

    <div class="aside" style="width: 20%; float: left; font-family: 'Noto Sans KR', sans-serif !important">
        <br/>
        <br/>
        <br/>
        <div style="padding-left: 30px;">
            <h3 style="color: #065859; margin-bottom: 15px;">마이데이터</h3>
            <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/tranDashboard"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">대시보드</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/cardList"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">내 카드 확인하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/transactionList" style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">실적 확인하기</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/transactionList"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">카드 사용내역</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/hometaxList"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">현금영수증 사용내역</div>
            </a>
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
            <h2>하나카드 실적 확인하기</h2>
            <br/>
            <span style="color: #615e5e"><h3>하나카드의 실적 충족 현황을 확인해보세요</h3></span>
            <p>(무실적 상품은 화면에 표시되지 않습니다)</p>
        </div>


        <div class="section2">
            <div class="uppper-section">
                <div class="card-box">

                    <div class="card-selector">
                        <h5>카드를 선택해주세요</h5>
                        <div class="inner-wrapper">
                            <div class="hex-select hex-select-js">
                                <select name="example" id="example-custom">
                                    <%--           카드리스트에서 카드 가져오기                         --%>
                                    <c:forEach items="${cardList}" var="card">
                                        <option value="${card.card_number}">${card.card_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="info-item">

                        <div>총 이용금액 :</div>
                        <h3><fmt:formatNumber value="${monthSpending.totalAmount}" groupingUsed="true"/> <span
                                class="price-currency">(원)</span></h3>
                    </div>
                    <div class="inner-text">
                        ${defaultBenefitMessage}
                    </div>

                    <div class="chart-cover">
                        <div class="flex-text">
                            <div><span style="font-size: 26px">내 카드 실적 현황</span></div>
                            <div class="progress-text"> 0%</div>
                        </div>

                        <div class="progress-container">
                            <div class="gauge" per="0"></div> <!-- 초기 값은 0%로 설정 -->

                        </div>
                        <div class="progress-sector">
                            <%--   초기 카드 실적, 이후 동적으로 변화    --%>
                            <h5>0만원</h5>
                            <h5>40만원</h5>
                            <h5>80만원</h5>
                            <h5>120만원</h5>
                        </div>
                    </div>

                </div>
                <div class="card-box">
                    <div class="title">실적별 주요혜택</div>
                    <table class="table-fill2" id="benefitTable0">
                        <br/>
                        <br/>
                        <thead>
                        <tr>
                            <th class="text-th">혜택업종</th>
                            <th class="text-th">혜택구분</th>
                            <th class="text-th">실적1 (40만원~)</th>
                            <th class="text-th">실적2 (80만원~)</th>
                            <th class="text-th">실적3 (120만원~)</th>
                        </tr>
                        </thead>
                        <tbody class="table-hover">
                        <tr>
                            <td><h5>공과금</h5></td>
                            <td>할인</td>
                            <td>10% / 4,000원</td>
                            <td>10% / 6,000원</td>
                            <td>10% / 10,000원</td>
                        </tr>
                        <tr>
                            <td><h5>병원/약국</h5></td>
                            <td>할인</td>
                            <td>10% / 4,000원</td>
                            <td>10% / 6,000원</td>
                            <td>10% / 10,000원</td>
                        </tr>
                        <tr>
                            <td><h5>주유</h5></td>
                            <td>할인</td>
                            <td>10% / 4,000원</td>
                            <td>10% / 8,000원</td>
                            <td>10% / 12,000원</td>
                        </tr>
                        <tr>
                            <td><h5>택시</h5></td>
                            <td>할인</td>
                            <td>10% / 4,000원</td>
                            <td>10% / 8,000원</td>
                            <td>10% / 12,000원</td>
                        </tr>
                        <tr>
                            <td><h5>카페</h5></td>
                            <td>할인</td>
                            <td>10% / 8,000원</td>
                            <td>10% / 12,000원</td>
                            <td>10% / 15,000원</td>
                        </tr>
                        <tr>
                            <td><h5>생활</h5></td>
                            <td>할인</td>
                            <td>10% / 8,000원</td>
                            <td>10% / 12,000원</td>
                            <td>10% / 15,000원</td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="table-fill2" id="benefitTable">
                        <thead>
                        <tr>
                            <th class="text-th">혜택업종</th>
                            <th class="text-th">혜택구분</th>
                            <th class="text-th">실적1 (40만원~)</th>
                            <th class="text-th">실적2 (80만원~)</th>
                            <th class="text-th">실적3 (120만원~)</th>
                        </tr>
                        </thead>
                        <tbody class="table-hover">
                        <tr>
                            <td><h5>공과금</h5></td>
                            <td>할인</td>
                            <td>10% / 4,000원</td>
                            <td>10% / 6,000원</td>
                            <td>10% / 10,000원</td>
                        </tr>
                        <tr>
                            <td><h5>병원/약국</h5></td>
                            <td>할인</td>
                            <td>10% / 4,000원</td>
                            <td>10% / 6,000원</td>
                            <td>10% / 10,000원</td>
                        </tr>
                        <tr>
                            <td><h5>주유</h5></td>
                            <td>할인</td>
                            <td>10% / 4,000원</td>
                            <td>10% / 8,000원</td>
                            <td>10% / 12,000원</td>
                        </tr>
                        <tr>
                            <td><h5>택시</h5></td>
                            <td>할인</td>
                            <td>10% / 4,000원</td>
                            <td>10% / 8,000원</td>
                            <td>10% / 12,000원</td>
                        </tr>
                        <tr>
                            <td><h5>카페</h5></td>
                            <td>할인</td>
                            <td>10% / 8,000원</td>
                            <td>10% / 12,000원</td>
                            <td>10% / 15,000원</td>
                        </tr>
                        <tr>
                            <td><h5>생활</h5></td>
                            <td>할인</td>
                            <td>10% / 8,000원</td>
                            <td>10% / 12,000원</td>
                            <td>10% / 15,000원</td>
                        </tr>
                        </tbody>
                    </table>

                    <table class="table-fill2" id="benefitTable2">
                        <thead>
                        <tr>
                            <th class="text-th">혜택업종</th>
                            <th class="text-th">혜택구분</th>
                            <th class="text-th">실적1 (~30만원)</th>
                            <th class="text-th">실적2 (30만원~)</th>
                            <th class="text-th">실적3 (60만원~)</th>
                            <th class="text-th">비고</th>
                        </tr>
                        </thead>
                        <tbody class="table-hover">
                        <tr>
                            <td><h5>데일리 적립</h5></td>
                            <td>적립</td>
                            <td>0.3%</td>
                            <td>0.5%</td>
                            <td>1.0%</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><h5>플러스 적립</h5></td>
                            <td>적립</td>
                            <td>X</td>
                            <td>5천 머니</td>
                            <td>동일</td>
                            <td>영역별 합산<br/>10만원 이상 시</td>
                        </tr>
                        <tr>
                            <td><h5>주유 할인</h5></td>
                            <td>할인</td>
                            <td>X</td>
                            <td>3,000원 / 6,000원</td>
                            <td>동일</td>
                            <td>SK주유소<br/>5만원 이상 결제 시</td>
                        </tr>
                        <tr>
                            <td><h5>커피 할인</h5></td>
                            <td>할인</td>
                            <td>X</td>
                            <td>4,000원 / 4,000원</td>
                            <td>동일</td>
                            <td>스타벅스/커피빈<br/>4천원 이상 결제 시</td>
                        </tr>
                        <tr>
                            <td><h5>아파트 관리비/<br/>4대보험</h5></td>
                            <td>적립</td>
                            <td>X</td>
                            <td>X</td>
                            <td>5천 머니 / 5천 머니</td>
                            <td>이번달 합산<br/>10만원 이상 시</td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="notice0">
                        <h5>유의사항</h5>
                        <p>* 원더카드는 회원이 원하는 혜택을 직접 선택하여 이용할 수 있는 상품으로 기본 서비스와 신청 시 추가 혜택을 받을 수 있는 혜택플러스가 제공됩니다.</p>
                        <p>카드 신청 시 선택한 맞춤 혜택 조홥의 상세한 내용은 하나페이 앱에서 확인 가능하며. 카드 발급 후 직접 변경하여 이용 가능합니다.</p>
                        <br/>
                    </div>
                    <div class="notice1">
                        <h5>유의사항</h5>
                        <p>* 원더카드는 회원이 원하는 혜택을 직접 선택하여 이용할 수 있는 상품으로 기본 서비스와 신청 시 추가 혜택을 받을 수 있는 혜택플러스가 제공됩니다.</p>
                        <p>카드 신청 시 선택한 맞춤 혜택 조홥의 상세한 내용은 하나페이 앱에서 확인 가능하며. 카드 발급 후 직접 변경하여 이용 가능합니다.</p>
                        <br/>
                    </div>
                    <div class="notice2">
                        <h5>유의사항</h5>
                        <p>1Q Daily+는 ‘하나멤버스 1Q카드 Daily’와는 다른 상품이며, 서비스 내용에 차이가 있으니 유의하시기 바랍니다.</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<%-- 카드 번호 ajax로 보내기--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#example-custom').change(function () {
            var cardNumber = $(this).val();

            $.ajax({
                type: "POST",
                url: "/getMonthlyTotal",
                data: {cardNumber: cardNumber},
                success: function (response) {
                    // Update the displayed total amount
                    let formattedTotal = new Intl.NumberFormat().format(response.totalAmount);
                    $('.info-item h3').html(formattedTotal + ' <span class="price-currency">(원)</span>');
                    $('.inner-text').html(response.benefitMessage);
                    // 카드 타입에 따른 h5 태그들 변경
                    if (response.cardType === "type1") {
                        $('.progress-sector').html(`
                        <h5>0만원</h5>
                        <h5>40만원</h5>
                        <h5>80만원</h5>
                        <h5>120만원</h5>
                    `);
                        // 테이블 보이기
                        $('#benefitTable0').hide();
                        $('#benefitTable').show();
                        $('#benefitTable2').hide();
                        $('.notice0').hide();
                        $('.notice1').show();
                        $('.notice2').hide();
                    } else if (response.cardType === "type2") {
                        $('.progress-sector').html(`
                        <h5>0만원</h5>
                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;30만원</h5>
                        <h5>60만원</h5>
                    `);
                        // 테이블 숨기기
                        $('#benefitTable0').hide();
                        $('#benefitTable').hide();
                        $('#benefitTable2').show();
                        $('.notice0').hide();
                        $('.notice1').hide();
                        $('.notice2').show();
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });
</script>
<script>
    window.totalUsed = ${monthSpending.totalAmount};

    $(document).ready(function () {
        function updateGauge(totalUsed, cardType) {
            const limits = (cardType === "type1") ? 1200000 : 600000;
            var visualUsedPercentage = (totalUsed / limits) * 100 > 100 ? 100 : (totalUsed / limits) * 100;
            var actualPercentage = (totalUsed / limits) * 100;

            $('.gauge').animate({
                width: visualUsedPercentage + "%"
            }, {
                duration: 500,
                step: function (now, fx) {
                    if (fx.prop === "width") {
                        $('.progress-text').text(actualPercentage.toFixed(2) + "%");
                    }
                }
            });
        }

        // Update the gauge on initial load
        updateGauge(window.totalUsed || 0, "type1");

        $('#example-custom').change(function () {
            var cardNumber = $(this).val();

            $.ajax({
                type: "POST",
                url: "/getMonthlyTotal",
                data: {cardNumber: cardNumber},
                success: function (response) {
                    // Update the gauge
                    updateGauge(response.totalAmount || 0, response.cardType);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });
</script>


<%-- 모달창 --%>
<script>
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("openModalBtn1");
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

<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>

</body>
</html>