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
        padding: 20px 0;
        margin: 25px 25px;
        width: 90%;
        height: 674px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border: 15px solid #00857e;
        /* transform과 box-shadow 효과를 0.3초 동안 부드럽게 적용 */
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card-box:hover {
        /* hover 시 약간 확대되는 효과 */
        transform: scale(1.04);
        /* hover 시 그림자 약간 강화 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
    }

    .card-box2 {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px 0;
        margin: 25px 25px;
        width: 90%;
        height: 700px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .card-box h3 {
        font-size: 25px;
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

    .carousel-inner {
        position: relative;
        width: 350px;
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
        position: relative;
    }

    .carousel-control-prev {
        left: -55px;
    }

    .carousel-control-next {
        right: -55px;
    }

    .carousel-control-next, .carousel-control-prev {
        position: absolute;
        top: 100px;
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
        font-size: 25px;
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
        height: 300px;
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
        flex-direction: column;
        align-items: center;
        justify-content: center;
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
        /*background: #05413d;*/
        background: #FFFFFF;
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

    .icon-bg2 {
        background: #05413d;
        /*background: #FFFFFF;*/
        border-radius: 50%;
        width: 50px;
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 5px;
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

    /*  카드사별 한도  */
    .cards-limit {
        background-color: #fff;
        border-radius: 10px;
        padding: 10px 0;
        margin: 25px 25px;
        width: 95%;
        height: 350px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
                <h6 style="color: black; margin-bottom: 15px;">내 카드 확인하기</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/cardBenefits" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">실적 확인하기</div>
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
            <h2>나의 카드 목록</h2>
            <br/>
            <span style="color: #615e5e"><h3>마이데이터로 연동한 모든 카드 목록을 확인해보세요</h3></span>
        </div>


        <div class="section2">


            <div class="upper-section">
                <div class="card-box">
                    <h3> 마이 하나카드</h3>

                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/14134.png"
                                     class="d-block w-100" alt="Slide 1">
                                <div class="info-box1">
                                    <span class="card_title"><h5>원더카드 LIVING</h5></span>
                                    <span class="personal_info">VISA | 본인4565 (신용)<br/></span>
                                    <span class="card_subtitle">병원부터 관리비까지 생활비 혜택</span>
                                    <div class="card_number"><h5>결제일 : 매월 1일</h5></div>
                                    <div class="card_number">카드번호 : 4882-****-****-4565<br/></div>
                                    <div class="card-benefits">
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-house" style="font-size: 25px;"></i>
                                            </div>
                                            관리비
                                        </div>
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-house-medical" style="font-size: 25px;"></i>
                                            </div>
                                            병원&약국
                                        </div>
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-car" style="font-size: 25px;"></i>
                                            </div>
                                            주유/택시
                                        </div>
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-mug-saucer" style="font-size: 25px; "></i>
                                            </div>
                                            커피
                                        </div>
                                    </div>
                                    <button id="openModalBtn1" class="modalBtn2"><h6>[혜택 더 보기]</h6></button>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/11530.png"
                                     class="d-block w-100" alt="Slide 2">
                                <div class="info-box1">
                                    <span class="card_title"><h5>1Q Daily+(원큐데일리플러스)</h5></span>
                                    <span class="personal_info">VISA | 본인2640 (신용)<br/></span>
                                    <span class="card_subtitle">매일매일 혜택이 플러스<br/></span>
                                    <div class="card_number"><h5>결제일 : 매월 1일</h5></div>
                                    <div class="card_number">카드번호 : 4152-****-****-2640<br/></div>
                                    <div class="card-benefits">
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-store" style="font-size: 25px;"></i>
                                            </div>
                                            모든가맹점
                                        </div>
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-cart-shopping"
                                                   style="font-size: 25px;"></i>
                                            </div>
                                            온라인쇼핑
                                        </div>
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-car" style="font-size: 25px;"></i>
                                            </div>
                                            주유
                                        </div>
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-house" style="font-size: 25px;"></i>
                                            </div>
                                            관리비
                                        </div>
                                    </div>
                                    <button id="openModalBtn2" class="modalBtn2"><h6>[혜택 더 보기]</h6></button>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/13015.png"
                                     class="d-block w-100" alt="Slide 3">
                                <div class="info-box1">
                                    <span class="card_title"><h5>모두의 일상 카드</h5></span>
                                    <span class="personal_info">VISA | 본인9723 (체크)<br/></span>
                                    <span class="card_subtitle">전월 실적 없이 어디서나 최대 0.4% 적립<br/></span>
                                    <div class="card_number">카드번호 : 4773-****-****-9723<br/></div>
                                    <div class="card-benefits">
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <img src="https://m.hanacard.co.kr/ATTACH/NEW_MOBILE/images/event/logo_1QPayAppCard.png"
                                                     style="font-size: 20px">

                                            </div>
                                            하나원큐페이
                                        </div>
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fa-brands fa-amazon-pay"
                                                   style="font-size: 25px;"></i>
                                            </div>
                                            페이결제
                                        </div>
                                        <div class="icon-box">
                                            <div class="icon-bg">
                                                <i class="fas fa-house" style="font-size: 25px;"></i>
                                            </div>
                                            모든가맹점
                                        </div>
                                    </div>
                                    <button id="openModalBtn3" class="modalBtn2"><h6>[혜택 더 보기]</h6></button>
                                </div>
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

                <div class="card-box2">
                    <h3>타사카드</h3>

                    <div id="myCarousel2" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://www.econovill.com/news/photo/202008/407097_337754_4414.png"
                                     class="d-block w-100" alt="Slide 1">
                                <div class="info-box2">
                                    <span class="card_title"><h5>네이버페이 라인프렌즈 신한카드</h5></span>
                                    <span class="personal_info">VISA | 1298 (신용)<br/></span>
                                    <div class="card_brand ">카드사 : 신한카드</div>
                                    <div class="card_number">카드번호 : 9410-****-****-1298</div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="https://img1.kbcard.com/ST/img/cxc/kbcard/upload/img/product/01900_img.png"
                                     class="d-block w-100" alt="Slide 2">
                                <div class="info-box2">
                                    <span class="card_title"><h5>펭수 노리 체크카드</h5></span>
                                    <span class="personal_info">VISA | 2094 (체크)<br/></span>
                                    <div class="card_brand ">카드사 : KB 국민카드</div>
                                    <div class="card_number">카드번호 : 5409-****-****-2094</div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#myCarousel2" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#myCarousel2" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

            </div>
            <div class="lower-section">
                <div class="cards-limit">
                    <div class="header-container">
                        <h2 class="section-header">카드사별 한도</h2>
                        <div class="date-selector">
                            <span>📅 2023 10/1 - 10/12</span>
                        </div>
                    </div>
                </div>
                <div class="cards-limit">
                    <div class="header-container">
                        <h2 class="section-header">카드사 이용금액</h2>
                        <div class="date-selector">
                            <span>📅 2023 10/1 - 10/12</span>
                        </div>
                    </div>
                </div>
            </div>

           </div>
    </div>
</section>

<div id="myModal" class="modal">
    <div class="modal-content2">
        <span class="close">&times;</span>
        <br/>
        <h2>원더카드 LIVING 업종별 혜택</h2>
        <div class="card-benefits2">
            <div class="flex-box">
                <div class="icon-box">
                    <div class="icon-bg2">
                        <i class="fas fa-house" style="font-size: 25px; color: #FFFFFF"></i>
                    </div>
                    생활요금
                </div>
                &nbsp;&nbsp; 아파트관리비, 전기세, 가스비 &nbsp; <span class="point"> 10%</span> 청구할인<br/>
            </div>
            <div class="flex-box">
                <div class="icon-box">
                    <div class="icon-bg2">
                        <i class="fas fa-house-medical" style="font-size: 25px; color: #FFFFFF"></i>
                    </div>
                    병원&약국
                </div>
                &nbsp;&nbsp; 병원 및 약국&nbsp; <span class="point"> 10%</span>청구할인<br/>
            </div>
            <div class="flex-box">
                <div class="icon-box">
                    <div class="icon-bg2">
                        <i class="fas fa-car" style="font-size: 25px; color: #FFFFFF"></i>
                    </div>
                    주유/택시
                </div>
                &nbsp;&nbsp; SK에너지, GS칼텍스, S-OIL, 현대오일뱅크알뜰주유소&nbsp; <span class="point"> 10%</span>청구할인<br/>
            </div>
            <div class="flex-box">
                <div class="icon-box">
                    <div class="icon-bg2">
                        <i class="fas fa-mug-saucer" style="font-size: 25px; color: #FFFFFF"></i>
                    </div>
                    커피
                </div>
                &nbsp;&nbsp;스타벅스, 커피빈, 이디야, 폴바셋, 투썸플레이스, 블루보틀&nbsp; <span class="point"> 10%</span> 청구할인<br/>
            </div>
<%--            • 모든 가맹점&nbsp; <span class="point"> 0.3-1.0%</span> 적립<br/>--%>
<%--            • 온라인쇼핑, 통신/교통/자동이체 <span class="point"> 10만원 당 5천머니</span> 적립<br/>--%>
<%--            • 주유 <span class="point"> 5만원당 3천원</span> 청구할인<br/>--%>
<%--            • 아파트관리비/4대보험 <span class="point"> 10만원 당 5천머니</span> 적립<br/>--%>
        </div>
    </div>

</div>
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