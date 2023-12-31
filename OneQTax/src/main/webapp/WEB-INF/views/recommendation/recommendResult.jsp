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
            /*height: 674px;*/
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

            /*border: 15px solid #00857e;*/
            /* transform과 box-shadow 효과를 0.3초 동안 부드럽게 적용 */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card-box h3 {
            font-size: 30px;
            color: #2a9791;
        }

        .cardImg-box {
            /*margin: 0 40px 20px 0;*/
            margin: 15px;
            text-align: center;
        }

        .cardImg {
            background-color: #e1caca;
            border-radius: 10px;
            /* padding: 20px 0; */
            margin: 0 0 30px 0;
            /* width: 40%; */
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
            /*background-color: #f4d8db;*/
            border: 3px solid #6b6b6b;
            border-radius: 10px;
            padding: 20px;
            margin: 0 0 40px 15px;
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
            /*height: 420px;*/
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

        .category-box5 {
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

        .card-title2 {
            background: #fdd0e4;
            border-radius: 10px;
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            margin-top: 40px;
            margin-bottom: 10px;
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

        .inner-text2 {
            position: absolute;
            transform: translate(0%, -315%);
            text-align: center;
            color: #e4003f;
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
            /* hover 시 약간 확대되는 효과 */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            /* hover 시 그림자 약간 강화 */
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
            /* hover 시 약간 확대되는 효과 */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            /* hover 시 그림자 약간 강화 */
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
            width: 700px;
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
            /*background: #aaaaaa;*/
            font-size: 26px;
            padding: 10px;
            margin-bottom: 20px;
        }

        /*  소비 그래프  */
        .chart3 {
            width: 280px;
            height: 280px;
        }

        /* 차트 안 글씨 */
        .chart-inner-text {
            position: absolute;
            transform: translate(0%, -295%);
            /*top: 32%;*/
            /*left: 50%;*/
            text-align: center;
            color: #e4003f;
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
            background: #fc91b7;
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

        .tenth {
            background: #4371ec;
        }

        .eleventh {
            background: #063dc2;
        }

        .twelfth {
            background: #0d0036;
        }

        .flex-box2 {
            width: 650px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .container-title {
            text-align: center;
            font-size: 25px;
        }

        .comment-text1 h4 {
            font-size: 25px;
        }


        .hover-text {
            position: relative;
            display: inline-block;
            font-size: 25px;
        }

        .popup-modal {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            padding: 10px;
            background-color: #FFFFFF;
            border: 2px solid #106e69;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            line-height: 1.5em;
            z-index: 1;
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
                <div style="color: grey; margin-bottom: 15px;">소득공제 카드 추천받기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/recommCard2"
               style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">종합 결과 확인하기</h6>
            </a>
        </div>
    </div>


    <div class="section">
        <div class="container-title">
            <h2>종합 결과 확인하기</h2>
            <br/>
            <span style="color: #615e5e"><h3>💳소득공제 추천내역을 기반으로 최적의 조합을 알려드릴게요</h3></span>
        </div>


        <div class="section2">
            <div class="uppper-section">
                <div class="card-box">

                    <%--                    <div class="title">소득공제 기반 카드추천</div>--%>
                    <div class="category-box4"><br/>
                        <h4><span style="color: black; font-size: 28px;">💚소득공제에 유리한 </span>카드 추천💚</h4>
                        <div class="recommendList">
                            <div class="cardImg-box">
                                <div class="card-title2">일상생활용🧭</div>
                                <img class="cardImg"
                                     src="https://m.hanacard.co.kr/ATTACH/NEW_MOBILE/images/cardinfo/card_img/13278.png"
                                     width="296px">
                                <div class="card-info">
                                    <span class="card-title">MULTI Any 체크카드</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c">#전가맹점 #페이 결제<br/>#딜리버리 #쇼핑</span>
                                </div>
                            </div>
                            <h3>+</h3>
                            <div class="cardImg-box">
                                <div class="card-title2">대중교통용</div>
                                <img class="cardImg"
                                     src="https://m.hanacard.co.kr/ATTACH/NEW_MOBILE/images/cardinfo/card_img/12709.png">
                                <%--                              <img class="cardImg" src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/04652.png">--%>
                                <%--                              <img class="cardImg" src="../../../resources/img/travellog.png" height="180" >--%>
                                <div class="card-info">
                                    <span class="card-title">알뜰교통 my pass 마패 신용</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c">#대중교통 #알뜰교통 #편의점<br/>#커피</span>
                                </div>
                            </div>
                            <h3>+</h3>
                            <div class="cardImg-box">
                                <div class="card-title2">영화 및 문화용</div>
                                <img class="cardImg"
                                     src="https://m.hanacard.co.kr/ATTACH/NEW_MOBILE/images/cardinfo/card_img/12223.png">
                                <div class="card-info">
                                    <span class="card-title">1Q My Lunch</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c"> #요식 #영화 #레저<br/>#주유 #통신/대중교통</span>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="info-box2">
                        위의 카드 조합으로 사용하면 매달 최대 <span style="font-weight: bold; font-size: 25px">67,000원</span> 상당의 혜택을 받을
                        것으로 예상돼요

                        <div class="hover-text">
                            ⍰
                            ${name}님의 3개월 평균 사용금액 : 200만원 기준
                            <div class="popup-modal">
                                <span style="color: #0d6565; font-weight: bold">Multi Any 체크카드 120만원 사용 시</span><br/>
                                쇼핑 적립 0.6% & 딜리버리 적립 0.8% => 8천원<br/>
                                <span style="color: #0d6565; font-weight: bold">알뜰교통 my pass 마패 신용카드 50만원 사용 시</span><br/>
                                대중교통 20% 청구할인 & 편의점 10% 청구할인 & 커피 10% 청구할인 => 3만원<br/>
                                <span style="color: #0d6565; font-weight: bold">1Q My Lunch 신용카드 30만원 사용 시</span><br/>
                                영화 적립 5천 하나머니 적립 & 요식 적립 10% & 레저 및 통식 적립 7% => 2만 9천원<br/>
                            </div>
                        </div>
                        <br/><br/>
                        <p>* 최대 혜택금액은 영역별 최대 혜택 한도를 산출한 것으로 개인별 소비패턴에 따라 혜택 금액이 달라질 수 있습니다.</p>
                    </div>


                    <div class="category-box3">
                        <h4>만약, 신용카드를 써야 한다면?</h4>
                        <div class="flex-box">
                            체크카드 대신&nbsp;<span style="font-weight:bold; font-size:23px;">원더카드 Free</span>를 사용해보세요<br/>
                        </div>
                        <div class="info-box2">
                            대중교통, 영화 및 문화용 카드와 아래 카드를 함께 사용하면<br/> 매달 최대 <span
                                style="font-weight: bold; font-size: 25px">17,000원</span> 상당의 혜택, 총 <span
                                style="font-weight: bold; font-size: 25px">76,000원</span> 상당의 혜택받을
                            것으로 예상돼요<br/>

                        </div>
                        <br/>
                        <div class="recommendList">
                            <div class="cardImg-box">
                                <img class="cardImg"
                                     src="https://m.hanacard.co.kr/ATTACH/NEW_MOBILE/images/cardinfo/card_img/14126.png">
                                <div class="card-info">
                                    <span class="card-title">원더카드 FREE</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c">#전가맹점 #간편결제 <br/>
                                       #쿠팡/마트/베이커리  </span>
                                </div>
                                <button id="openModalBtn1" class="modalBtn2"><h6>자세히 알아보기</h6></button>
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


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Chart.js 및 Datalabels 플러그인 추가 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
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
<%-- 이번 달 차트 --%>

<script type="text/javascript">
    let categories = [];
    <c:forEach var="item" items="${categoryMonth}">
    categories.push('${item.categoryBig}');
    </c:forEach>
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ctx2 = document.getElementById('tranChart').getContext('2d');

        var tranChart = new Chart(ctx2, {
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
                        ${categoryMonth[9].totalAmount},
                        ${categoryMonth[10].totalAmount},
                        ${categoryMonth[11].totalAmount},
                    ],
                    backgroundColor: ['#fc91b7', '#f8d5d6', '#f8f2ce', '#d1ede5', '#aee3eb', '#e6e4dc', '#bfcaf2', '#839ee6', '#7C5CFC', '#063cbe', '#063dc2', '#0d0036'],
                    borderColor: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'],
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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ctx3 = document.getElementById('tranChart2').getContext('2d');

        var tranChart2 = new Chart(ctx3, {
            type: 'doughnut',
            data: {
                labels: categories,
                datasets: [{
                    data: [
                        ${categoryLastMonth[0].totalAmount},
                        ${categoryLastMonth[1].totalAmount},
                        ${categoryLastMonth[2].totalAmount},
                        ${categoryLastMonth[3].totalAmount},
                        ${categoryLastMonth[4].totalAmount},
                        ${categoryLastMonth[5].totalAmount},
                        ${categoryLastMonth[6].totalAmount},
                        ${categoryLastMonth[7].totalAmount},
                        ${categoryLastMonth[8].totalAmount},
                        ${categoryLastMonth[9].totalAmount},
                        ${categoryLastMonth[10].totalAmount},
                        ${categoryLastMonth[11].totalAmount},
                    ],
                    backgroundColor: ['#fc91b7', '#f8d5d6', '#f8f2ce', '#d1ede5', '#aee3eb', '#e6e4dc', '#bfcaf2', '#839ee6', '#7C5CFC', '#063cbe', '#063dc2', '#0d0036'],
                    borderColor: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'],
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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ctx4 = document.getElementById('tranChart3').getContext('2d');

        var tranChart3 = new Chart(ctx4, {
            type: 'doughnut',
            data: {
                labels: categories,
                datasets: [{
                    data: [
                        ${categoryBeforeMonth[0].totalAmount},
                        ${categoryBeforeMonth[1].totalAmount},
                        ${categoryBeforeMonth[2].totalAmount},
                        ${categoryBeforeMonth[3].totalAmount},
                        ${categoryBeforeMonth[4].totalAmount},
                        ${categoryBeforeMonth[5].totalAmount},
                        ${categoryBeforeMonth[6].totalAmount},
                        ${categoryBeforeMonth[7].totalAmount},
                        ${categoryBeforeMonth[8].totalAmount},
                        ${categoryBeforeMonth[9].totalAmount},
                        ${categoryBeforeMonth[10].totalAmount},
                        ${categoryBeforeMonth[11].totalAmount},
                    ],
                    backgroundColor: ['#fc91b7', '#f8d5d6', '#f8f2ce', '#d1ede5', '#aee3eb', '#e6e4dc', '#bfcaf2', '#839ee6', '#7C5CFC', '#063cbe', '#063dc2', '#0d0036'],
                    borderColor: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'],
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
<%-- 멀티any 체크카드 --%>
<script>
    $("#openModalBtn2").click(function () {
        window.location.href = "/redirectToMultiAny";
    });
    $("#openModalBtn3").click(function () {
        window.location.href = "/redirectToYoungHana";
    });
</script>
<%-- 캐러셀 --%>

<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<script>
    const inner = document.querySelector('.carousel-inner');
    const slides = inner.querySelectorAll('.slide');
    let idx = 0;

    document.querySelector('.prev').addEventListener('click', function () {
        idx--;
        if (idx < 0) idx = slides.length - 1;
        updateCarousel();
    });

    document.querySelector('.next').addEventListener('click', function () {
        idx++;
        if (idx >= slides.length) idx = 0;
        updateCarousel();
    });

    function updateCarousel() {
        const offset = -idx * 600; // 300px는 각 슬라이드의 너비
        inner.style.transform = `translateX(${offset}px)`;
    }

</script>
</body>
</html>