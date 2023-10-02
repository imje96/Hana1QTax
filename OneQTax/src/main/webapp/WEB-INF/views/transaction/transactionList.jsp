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


<%--    <!-- Add Bootstrap CSS -->--%>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

    <%--  jquery data table  --%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"></script>


</head>


<style>
    *, ::after, ::before {
        box-sizing: inherit;
    }

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
        padding-right: 25px;
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
            <a href="${pageContext.request.contextPath}/taxThreshold"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">내 카드 확인하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/transactionList" style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">카드 사용내역</h6>
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

            <div class="container-left">


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


                    <!-- 테이블 구조 정의 -->
                    <table id="tranTable" class="display">
                        <thead>
                        <tr>
                            <th>Transaction ID</th>
                            <th>Amount</th>
                            <th>Category</th>
                            <!-- 필요한 다른 컬럼들을 추가해주세요 -->
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tran" items="${cardTran}">
                            <tr>
                                <td>${tran.transaction_id}</td>
                                <td>${tran.amount}</td>
                                <td>${tran.category}</td>
                                <!-- 필요한 다른 값들을 추가해주세요 -->
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
    $(document).ready( function () {
        $('#tranTable').DataTable(); // DataTables 초기화
    });
</script>

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



<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>