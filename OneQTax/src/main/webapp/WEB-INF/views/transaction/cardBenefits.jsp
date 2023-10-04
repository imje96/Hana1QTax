<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 문자열 바꾸기 --%>
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

    <!-- font awseom -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <%--    chartjs 추가--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="../../../resources/css/tax.css" rel="stylesheet">


    <!-- Add Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">


</head>


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

    /*.card-box:hover {*/
    /*    !* hover 시 약간 확대되는 효과 *!*/
    /*    transform: scale(1.04);*/
    /*    !* hover 시 그림자 약간 강화 *!*/
    /*    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);*/
    /*}*/

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

    .upper-section {
        display: flex;
        width: 1200px;
    }

    .lower-section {
        display: flex;
        width: 1200px;
    }

    /*  카드 타이틀  */
    .card_title {
        text-align: center;
        color: #000000;
        font-size: 22px;
    }

    .personal_info {
        text-align: center;
        color: #7a7a7a;
        font-size: 17px;
    }

    .card_subtitle {
        text-align: center;
        color: #ffffff;
        font-size: 18px;
        background: #e50745;
        padding: 5px 10px;
        border-radius: 15px;
    }

    .card_brand {
        text-align: center;
        color: #ffffff;
        font-size: 18px;
        background: #afafaf;
        padding: 5px 10px;
        border-radius: 15px;
    }

    .card_number {
        text-align: center;
        /*color: #ffffff;*/
        font-size: 18px;
        /*background: #e50745;*/
        /*padding: 5px 10px;*/
        border-radius: 15px;
        margin-top: 5px;
    }

    .card-benefits {
        color: #000000;
        font-size: 15px;
        border: 3px solid #FFFFFF;
        border-radius: 10px;
        padding: 10px 0;
        line-height: 1.8;
        text-align: left;
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin: 10px 0;
    }

    .card-benefits2 {
        color: #000000;
        font-size: 20px;
        border: 3px solid #FFFFFF;
        border-radius: 10px;
        padding: 10px 0;
        line-height: 1.8;
        text-align: left;
        margin: 10px 0;
    }

    .point {
        color: #2a9791;
        font-weight: bold;
    }

    .icon-box {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        font-size: 14px;
        color: #4f4949;
    }

    .icon-bg {
        background: #05413d;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .icon-bg:hover {
        /* hover 시 약간 확대되는 효과 */
        transform: scale(1.05);
        /* hover 시 그림자 약간 강화 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
    }

    .inner-text {
        text-align: left;
        /*color: #e4003f;*/
        font-size: 25px;
        font-weight: 600;
        /*width: 430px;*/
        height: 130px;
        margin: 25px 0 15px 0;
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
        width: 600px;
        height: 150px;
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
        width: 500px;
        display: flex;
        font-weight: 600;
        font-size: .8rem;
        position: relative;
        justify-content: space-between;
        color: #afb4b8;
        margin: 5px 0 20px 0;
    }

    .progress-sector2 {
        width: 500px;
        display: flex;
        font-weight: 600;
        font-size: .7rem;
        color: #dddddd;
        position: relative;
        justify-content: space-between;
        /*margin-bottom: 35px;*/
    }

    .progress-container {
        width: 500px;
        height: 30px;
        background-color: #dedede;
        font-weight: 600;
        font-size: .8rem;
        position: relative;
        /*margin-bottom: 35px;*/
    }

    .progress-container .gauge {
        height: 30px;
        padding: 0px;
        text-align: center;
        background-color: #6eb4e5;
        color: #111;
        overflow: hidden;
    }

    .flex-text {
        width: 500px;
        display: flex;
        margin-bottom: 15px;
        justify-content: space-between;
    }


</style>


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
            <h2>실적 충족 조회</h2>
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
                            <div><span style="font-size: 22px">내 카드 실적 현황</span></div>
                            <div class="progress-text"> 0%</div>
                        </div>

                        <div class="progress-container">
                            <div class="gauge" per="0"></div> <!-- 초기 값은 0%로 설정 -->

                        </div>
                        <div class="progress-sector">
                            <h5>0만원</h5>
                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;30만원</h5>
                            <h5>60만원</h5>
                        </div>
                    </div>
                </div>
                <div class="card-box">
                    <table class="table-fill">
                        <span style="text-align: center"></span><h3>기본공제항목 계산 결과</h3>
                        <br/>
                        <%--                            <p>일반공제항목이란? 추가공제항목인 대중교통, 전통시장, 도서및문화 등의 업종을 제외한~~</p>--%>
                        <br/>
                        <div class="text-box"><p2><span style="font-weight: bold; color: #fd328a">✔️ 최저사용금액 : <fmt:formatNumber value="${minimumAmount}" groupingUsed="true"/>원</span>을 초과한 금액부터 공제 가능</p2></div>
                        <br/><span style="text-align: right;"><p>&nbsp;&nbsp;* 최저사용금액: 총급여의 25%</p></span>
                        <thead>
                        <tr>
                            <th class="text-left">구분</th>
                            <th class="text-left">충족여부</th>
                            <th class="text-left">사용금액</th>
                            <th class="text-left">적립/할인 예정금액</th>
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
                            <td class="text-left"><fmt:formatNumber value="${debit_deduction}" groupingUsed="true"/>원</td>
                        </tr>
                        <tr>
                            <td class="text-left">현금영수증</td>
                            <td class="text-left"><fmt:formatNumber value="${cash_total}" groupingUsed="true"/>원
                            </td>
                            </td> <!--사용금액-->
                            <td class="text-left"><fmt:formatNumber value="${cash_deductible}" groupingUsed="true"/>원</td>
                            <td class="text-left">30%</td>
                            <td class="text-left"><fmt:formatNumber value="${cash_deduction}"
                                                                    groupingUsed="true"/>원
                            </td>
                        </tr>
                        </tbody>
                    </table>
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
                        var currentPercentage = (now / 100) * actualPercentage;
                        $('.progress-text').text(currentPercentage.toFixed(2) + "%");
                    }
                }
            });
        }

        // Update the gauge on initial load
        // Note: You might need to get the cardType value during initial load too!
        updateGauge(window.totalUsed || 0, "type1"); // Or "type2" or however you get this value during initial load

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


<script>
    // Custom select logic
    let customSelects = document.querySelectorAll('.hex-select-js');

    customSelects.forEach((element) => {
        // ... (this part remains unchanged)
    });
</script>

<script>
    $(document).ready(function () {
        var data1 = [10, 20, 30, 40];
        var data2 = [40, 30, 20, 10];

        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Point 1', 'Point 2', 'Point 3', 'Point 4'],
                datasets: [{
                    label: 'Sample Data',
                    data: data1,
                    borderColor: 'rgba(75, 192, 192, 1)'
                }]
            }
        });

        $('.dropdown-item').click(function (e) {
            e.preventDefault();
            var dataSet = $(this).data('value');

            if (dataSet === 'set1') {
                chart.data.datasets[0].data = data1;
            } else if (dataSet === 'set2') {
                chart.data.datasets[0].data = data2;
            }

            chart.update();
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