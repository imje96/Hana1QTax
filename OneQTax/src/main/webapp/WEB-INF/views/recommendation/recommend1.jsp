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
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card-box h3 {
            font-size: 30px;
            color: #2a9791;
        }

        .cardImg-box {
            margin: 15px;
            text-align: center;
        }

        .cardImg {
            background-color: #e1caca;
            border-radius: 10px;
            margin: 0 0 30px 0;
            height: 178px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s;
        }

        .cardImg:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        }

        .cardImg2 {
            background-color: #e1caca;
            border-radius: 10px;
            margin: 0 0 30px 0;
            width: 100%;
            height: 280px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s;
        }

        .cardImg2:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        }

        .recomm-Info {
            border: 3px solid #6b6b6b;
            border-radius: 10px;
            padding: 20px;
            margin: 0 0 20px 15px;
            width: 250px;
            height: 230px;

            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .recomm-Info h4 {
            font-size: 25px;
            margin-bottom: 20px;
            color: #fd328a !important;
        }

        .category-box {
            background-color: #fff;
            border-radius: 10px;
            padding: 10px 25px;
            margin: 25px 0 25px 0;
            width: 90%;
            height: 385px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            border: 3px solid #00857e;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .category-box h4 {
            font-size: 26px;
            color: #6b6a6a;
        }

        .category-box2 {
            background-color: #e7e7e7;
            border-radius: 10px;
            padding: 20px 25px;
            margin: 25px 0 25px 0;
            width: 90%;
            height: 120px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            /*border: 3px solid #00857e;*/
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .category-box3 {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px 25px;
            margin: 25px 0 25px 0;
            width: 90%;
            /*height: 420px;*/
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            border: 3px solid #00857e;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .category-box3 h4 {
            font-size: 26px;
            color: #6b6a6a;
            margin-bottom: 15px;
        }

        .category-box4 {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px 25px;
            margin: 25px 0 25px 0;
            width: 90%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            border: 3px solid #e3003f;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .category-box4 h4 {
            font-size: 26px;
            color: #6b6a6a;
            margin-bottom: 15px;
        }


        .recommendList {
            display: flex;
            align-items: center;
            justify-content: center;
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

        .card-info {
            line-height: 24px;
            font-size: 20px;
            margin-bottom: 15px;
        }

        .card-title {
            background: #eee9e9;
            border-radius: 10px;
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            margin-top: 40px;
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
            background-color: rgb(209 231 230) !important;
            /*padding: 10px;*/
            border-radius: 10px;
            text-align: left;
            width: 90%;
            /*height: 150px;*/
            padding: 20px 20px;
            margin-top: 20px;
        }

        .info-box2 {
            background-color: #cde1e1 !important;
            border-radius: 10px;
            text-align: center;
            width: 90%;
            /*height: 150px;*/
            padding: 20px 20px;
            margin-top: 20px;
        }

        .info-box3 {
            background-color: #fdd0e4 !important;
            border-radius: 10px;
            text-align: center;
            width: 90%;
            /*height: 150px;*/
            padding: 20px 20px;
            margin-top: 20px;
        }

        .info-box4 {
            background-color: #ece8e8 !important;
            border-radius: 10px;
            text-align: center;
            /*width: 90%;*/
            /*height: 150px;*/
            /*padding: 20px 20px;*/
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 18px;
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
            display: inline-block;
            color: #ffffff;
            padding: 10px 10px;
            width: 200px;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            font-size: 18px;
            cursor: pointer;
            background-color: #6b6b6b;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .modalBtn2:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        }

        .modalBtn3 {
            display: inline-block;
            color: #ffffff;
            padding: 15px 20px;
            width: 350px;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            font-size: 18px;
            cursor: pointer;
            background-color: #6b6b6b;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .modalBtn3:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        }


        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 350px;
            padding-left: 160px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
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
            padding: 50px 100px 400px 100px;
        }

        .modal-subtitle {
            width: 600px;
            text-align: center;
        }

        .inputImg4 {
            margin: 30px 0;
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
            width: 540px;
            padding: 25px;
            font-size: 26px;
            text-align: center;
            background: #f8f8f8;
            line-height: 1.7;
            display: flex;
            justify-content: space-between;
        }


        /* 실적 구간 */
        .limits-info {
            display: flex;
            width: 600px;
            justify-content: space-between;
            margin-left: 200px;
            font-size: 20px;
            font-weight: 600;
        }

        .limits-info h4 {
            font-size: 21px;
            /*color: #e4003f;*/
        }

        .limits-info h5 {
            font-size: 18px;
            color: #2a9791;
        }

        /*    토글 */
        .toggle-button {
            width: 140px;
            height: 40px;
            background-color: #ddd;
            position: relative;
            border-radius: 20px;
            cursor: pointer;
            left: 400px;
        }

        .slider {
            position: absolute;
            top: 5px;
            left: 5px;
            width: 30px;
            height: 30px;
            background-color: white;
            border-radius: 50%;
            transition: 0.3s;
        }

        .status {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-weight: bold;
            font-size: 20px;
            color: black;
        }

        .toggle-button.on .slider {
            left: 105px;
        }

        .toggle-button.on .status {
            color: black;
            right: 50px;
            content: "ON";
            font-size: 20px;
        }

        .content {
            margin-top: 10px;
            font-size: 24px;
            text-align: center;
        }

        .content h5 {
            font-size: 26px;
            padding: 10px;
            margin-bottom: 20px;
        }

        .container-title {
            text-align: center;
            font-size: 25px;
        }
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
            <h3 style="color: #065859; margin-bottom: 15px;">카드추천</h3>
            <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/recommCard2" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">일반 카드 추천받기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/recommCard1" style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">소득공제 카드 추천받기</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/recommendResult" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">종합 결과 확인하기</div>
            </a>
        </div>
    </div>


    <div class="section">

        <div class="container-title">

            <h2>소득공제 기반 하나카드 추천받기</h2>
            <br/>
            <span style="color: #615e5e"><h3>💳소득공제/소비내역 기반의 연말정산에 유리한 카드를 추천받아보세요</h3></span>
        </div>


        <div class="section2">
            <div class="uppper-section">
                <div class="card-box">

                    <div class="category-box">
                        <h4><span style="color: black; font-size: 28px;"> ${name}</span>님의 보유카드 추천</h4>
                        <div class="recommendList">
                            <div class="cardImg-box">
                                <img class="cardImg"
                                     src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/13015.png">

                                <div class="card-info">
                                    <span class="card-title">모두의 일상 체크카드</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c"> #페이 적립 #전가맹점 적립</span>
                                </div>
                            </div>
                            <div class="cardImg-box">
                                <img class="cardImg"
                                     src="https://www.hanacard.co.kr/ATTACH/MOBILE_APP/images/card/14295.png">

                                <div class="card-info">
                                    <span class="card-title">금쪽이 Young Hana+ 체크카드</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c"> #페이 캐시백 #편의점/딜리버리 캐시백</span>
                                </div>
                            </div>
                            <div class="recomm-Info">
                                <h4>" 체크카드 추천 "</h4>

                                카드 소득공제 금액을 채우기 전까지는 <span style="color:#fd328a"> 체크카드</span>를 사용하는 것이 유리해요.<br/>
                                신용카드보다 세금을 <span style="color: #fd328a">2배</span> 더 <br/>아낄 수 있어요.<br/>
                                <span style="font-size: 17px">(단, 공제한도 300만원 이내)</span>

                            </div>

                        </div>
                    </div>
                    <div class="category-box2">
                        <h3>❓ 정말 체크카드가 신용카드보다 유리할까?</h3>
                        <br>
                        <button id="openModalBtn" class="modalBtn3"><h6>자세히 알아보기</h6></button>
                    </div>
                    <div class="category-box3">(알뜰교통 +α)
                        <h4>💚추가로 혜택받기💚</h4>
                        <div class="flex-box">
                            <span style="font-weight:bold; font-size:23px;"> ${name}</span>님이 주로 사용한 업종은&nbsp; <span
                                style="font-weight: bold; color: #2a9791; font-size: 25px"># 외식&nbsp;</span> <span
                                style="font-weight: bold; color: #2a9791;font-size: 25px"># 마트&nbsp;</span>
                            <span style="font-weight: bold; color: #2a9791;font-size: 25px"># 배달&nbsp;</span>입니다.<br/>
                        </div>
                        자주 사용하시는 업종에 맞춰 체크카드를 추천해드릴게요.
                        <div class="info-box2">
                            아래 카드를 함께 사용하면 매달 최대 <span style="font-weight: bold; font-size: 25px">50,000</span> 하나머니 혜택을
                            받을
                            수 있어요
                            <span style="font-size:17px">(MULTI Any 체크카드)</span>
                        </div>
                        <br/>
                        <div class="recommendList">
                            <div class="cardImg-box">
                                <img class="cardImg2" src="../../../resources/img/multianycard.png">
                                <div class="card-info">
                                    <span class="card-title">MULTI Any 체크카드</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c">#전가맹점 #페이 결제 <br/>
                                       #딜리버리 #쇼핑 </span>
                                </div>
                                <button id="openModalBtn2" class="modalBtn2"><h6>자세히 알아보기</h6></button>
                            </div>
                            <div class="cardImg-box">
                                <img class="cardImg2" src="../../../resources/img/younghanacard.png">
                                <div class="card-info">
                                    <span class="card-title">Young Hana+ 체크카드</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c"> #편의점/딜리버리 #대중교통<br/>
                                            #커피 #페이결제 캐시백
                                        </span>
                                </div>
                                <button id="openModalBtn3" class="modalBtn2"><h6>자세히 알아보기</h6></button>
                            </div>
                        </div>
                        <p>* 최대 혜택금액은 영역별 최대 혜택 한도를 산출한 것으로 개인별 소비패턴에 따라 혜택 금액이 달라질 수 있습니다.</p>
                    </div>
                    <div class="category-box4">
                        <h4>💕추가공제 업종에서 혜택받기💕</h4>
                        <div class="flex-box">
                            추가공제 업종은&nbsp; <span style="font-weight:bold; font-size:23px; color: #ff328b;">대중교통, 문화(영화관/공연/도서), 전통시장</span>을
                            의미해요.<br/>
                        </div>
                        <div class="flex-box">
                            <span style="font-weight:bold;">추가공제</span>도 받고&nbsp; <span
                                style="font-weight:bold;">카드 혜택</span>도 동시에 누릴 수 있는 카드를 추천해드릴게요.
                        </div>
                        <div class="info-box3">
                            추가공제항목은 혜택이 좋은 <span style="font-weight: bold; font-size: 25px">신용카드</span>를 사용하는 것이 유리해요
                        </div>
                        <br/>


                        <div class="toggle-button" id="toggleBtn">
                            <div class="slider"></div>
                            <p class="status">대중교통</p>
                        </div>
                        <div id="contentA" class="content">
                            <h5>대중교통 혜택 카드</h5>
                            <div class="info-box4">
                                아래 카드를 함께 사용하면 교통업종에서 매달 최대 <span
                                    style="font-weight: bold; font-size: 25px">12,000</span> 원 혹은 <span
                                    style="font-weight: bold; font-size: 25px">20% </span>(알뜰교통 +α) 혜택을 받을
                                수 있어요
                            </div>
                            <div class="recommendList">
                                <div class="cardImg-box">
                                    <img class="cardImg"
                                         src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/14127.png">
                                    <div class="card-info">
                                        <span class="card-title">원더카드 DAILY</span><br/><br/>
                                        <span style="font-size: 17px; color: #605c5c">#영상스트리밍 #대중교통 <br/>
                                       #딜리버리/편의점 #하나페이 맛집 </span>
                                    </div>
                                    <button id="openModalBtn6" class="modalBtn2"><h6>자세히 알아보기</h6></button>
                                </div>
                                <div class="cardImg-box">
                                    <img class="cardImg"
                                         src="https://m.hanacard.co.kr/ATTACH/NEW_MOBILE/images/cardinfo/card_img/12709.png">
                                    <div class="card-info">
                                        <span class="card-title">알뜰교통 my pass 마패 신용</span><br/><br/>
                                        <span style="font-size: 17px; color: #605c5c"> #대중교통 #편의점<br/>
                                            #커피
                                        </span>
                                    </div>
                                    <button id="openModalBtn7" class="modalBtn2"><h6>자세히 알아보기</h6></button>
                                </div>
                                <div class="cardImg-box">
                                    <img class="cardImg"
                                         src="https://www.hanacard.co.kr/ATTACH/MOBILE_APP/images/card/14022.png">
                                    <div class="card-info">
                                        <span class="card-title">#MY WAY(샵 마이웨이) 카드</span><br/><br/>
                                        <span style="font-size: 17px; color: #605c5c"> #대중교통/커피/편의점 #디지털구독<br/>
                                            #쇼핑 #전가맹점
                                        </span>
                                    </div>
                                    <button id="openModalBtn8" class="modalBtn2"><h6>자세히 알아보기</h6></button>
                                </div>
                            </div>
                            <p>* 최대 혜택금액은 영역별 최대 혜택 한도를 산출한 것으로 개인별 소비패턴에 따라 혜택 금액이 달라질 수 있습니다.</p>
                        </div>

                        <div id="contentB" class="content" style="display: none;">
                            <h5>영화관 혜택 카드</h5>
                            <div class="info-box4">
                                아래 카드를 함께 사용하면 영화관 업종에서 매달 최대 <span
                                    style="font-weight: bold; font-size: 25px">5,000</span> 머니 혜택을 받을 수 있어요
                            </div>
                            <div class="recommendList">
                                <div class="cardImg-box">
                                    <img class="cardImg"
                                         src="https://m.hanacard.co.kr/ATTACH/NEW_MOBILE/images/cardinfo/card_img/12223.png">
                                    <div class="card-info">
                                        <span class="card-title">1Q My Lunch</span><br/><br/>
                                        <span style="font-size: 17px; color: #605c5c">#요식10%적립 #영화5천머니 <br/>
                                       #레저 #주유 </span>
                                    </div>
                                    <button id="openModalBtn9" class="modalBtn2"><h6>자세히 알아보기</h6></button>
                                </div>
                                <div class="cardImg-box">
                                    <img class="cardImg"
                                         src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/11662.png">
                                    <div class="card-info">
                                        <span class="card-title">Mile 1.6 대한항공</span><br/><br/>
                                        <span style="font-size: 17px; color: #605c5c"> #해외1.8마일 #국내1.6마일<br/>
                                            #영화 #스타벅스
                                        </span>
                                    </div>
                                    <button id="openModalBtn10" class="modalBtn2"><h6>자세히 알아보기</h6></button>
                                </div>
                                <div class="cardImg-box">
                                    <img class="cardImg"
                                         src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/11661.png">
                                    <div class="card-info">
                                        <span class="card-title">Mile 1.6 아시아나</span><br/><br/>
                                        <span style="font-size: 17px; color: #605c5c"> #해외1.8마일 #국내1.6마일<br/>
                                            #영화 #스타벅스
                                        </span>
                                    </div>
                                    <button id="openModalBtn11" class="modalBtn2"><h6>자세히 알아보기</h6></button>
                                </div>
                            </div>
                            <p>* 최대 혜택금액은 영역별 최대 혜택 한도를 산출한 것으로 개인별 소비패턴에 따라 혜택 금액이 달라질 수 있습니다.</p>
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
        <h2>체크카드 vs 신용카드 사용 비교</h2>
        (연봉이 6000만원인 손님이 월 200만원, 연간 2400만원 사용 가정)
        <div class="info-box1">
            공제시작 구간부터 체크카드 사용 시, 아끼는 세금은 <span style="font-weight: bold;">약 648,000원</span>
            신용카드 사용 시보다 <span style="font-weight: bold;">324,000</span> 혜택을 더 받을 수 있어요.<br/>
            신용카드 연간 혜택이 <span style="font-weight: bold;">약 32만원</span>보다 높지 않다면
            <span style="font-weight: bold; color: #ee364f">체크카드</span> <br/>이용이 유리해요.
        </div>
        <br/>
        <table class="table-fill">

            <thead>
            <tr>
                <th class="text-left"><span style="margin-left: 40px; color: black; font-size: bold">구분</span></th>
                <th class="text-left">지출액</th>
                <th class="text-left">공제금액</th>

            </tr>
            </thead>
            <tbody class="table-hover">
            <tr>
                <td class="text-left">공제문턱 (연봉의 25%)</td>
                <td class="text-left"> 1500 만원</td>
                <td class="text-left">300 만원</td>
            </tr>
            <tr>
                <td class="text-left">소득공제를 최대로 받기 위해<br/> <span style="font-weight: bold; color: #ee364f">신용카드</span>를
                    주로 사용하는 경우
                </td>
                <td class="text-left"><span style="font-weight: bold; color: #ee364f"> 3500 만원</span></td>
                <td class="text-left">300 만원</td>
            </tr>
            <tr>
                <td class="text-left">신용카드와 <span style="font-weight: bold; color: #ee364f">직불카드/현금영수증</span>을<br/> 함께
                    사용하는 경우
                </td>
                <td class="text-left"><span style="font-weight: bold; color: #ee364f">2500 만원</span></td>
                <td class="text-left">300 만원</td>
            </tr>

            </tbody>
        </table>
        <br/>
        <div class="modal-subtitle"><h3>☑ 체크카드 이용 시</h3></div>
        <img class="inputImg4" src="../../../resources/img/debitDeduction.png">

        <div class="modal-subtitle"><h4>☑ 신용카드 이용 시</h4></div>
        <img class="inputImg4" src="../../../resources/img/creditDeduction.png">
    </div>

</div>

<%-- 카드 번호 ajax로 보내기--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%-- 모달창 --%>
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
<%-- 멀티any 체크카드 --%>
<script>
    $("#openModalBtn2").click(function () {
        window.location.href = "/redirectToMultiAny";
    });
    $("#openModalBtn3").click(function () {
        window.location.href = "/redirectToYoungHana";
    });
</script>
<script>

    document.getElementById('toggleBtn').addEventListener('click', function () {
        this.classList.toggle('on');

        var status = this.querySelector('.status');
        var contentA = document.getElementById('contentA');
        var contentB = document.getElementById('contentB');

        if (this.classList.contains('on')) {
            status.textContent = '영화관';
            contentA.style.display = 'none';
            contentB.style.display = 'block';
        } else {
            status.textContent = '대중교통';
            contentA.style.display = 'block';
            contentB.style.display = 'none';
        }
    });

</script>
<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>

</body>
</html>