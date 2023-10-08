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
        margin: 0 40px 20px 0;
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
    }

    .recomm-Info {
        /*background-color: #f4d8db;*/
        border: 3px solid #6b6b6b;
        border-radius: 10px;
        padding: 20px;
        margin: 0 0 20px 0;
        width: 250px;
        height: 230px;
        /*display: flex;*/
        /*flex-direction: column;*/
        /*justify-content: space-around;*/
        /*align-items: center;*/
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .recomm-Info h4 {
        font-size: 25px;
        margin-bottom: 20px;
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
    .category-box h4{
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
        padding: 10px 25px;
        margin: 25px 0 25px 0;
        width: 90%;
        height: 420px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        border: 3px solid #00857e;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .category-box3 h4{
        font-size: 26px;
        color: #6b6a6a;
    }
    .recommendList {
        display: flex;
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
    }
    .card-title{
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
        height: 150px;
        padding: 20px 20px;
        margin-top: 20px;
    }


    .info-box2 {
        background-color: #fbcfe3 !important;
        border-radius: 10px;
        text-align: center;
        width: 90%;
        /*height: 150px;*/
        padding: 20px 20px;
        margin-top: 20px;
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
    .modalBtn {
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


    .modalBtn2:hover {
        transform: scale(1.05);
        /* hover 시 약간 확대되는 효과 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        /* hover 시 그림자 약간 강화 */
    }
    .modal{
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
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
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
    .modal-subtitle{
        width: 600px;
        text-align: center;
    }
    .inputImg4{
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
            <a href="${pageContext.request.contextPath}/transactionList" style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">카드 추천받기</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/transactionList"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">종합 결과 확인하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
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
            <h2>소득공제 기반 하나카드 추천받기</h2>
            <br/>
            <span style="color: #615e5e"><h3>💳소득공제와 소비내역 기반으로 카드를 추천받아보세요</h3></span>
        </div>


        <div class="section2">
            <div class="uppper-section">
                <div class="card-box">

                    <%--                    <div class="title">소득공제 기반 카드추천</div>--%>
                    <div class="category-box">
                        <h4>${name}님의 보유카드 추천</h4>
                        <div class="recommendList">
                            <div class="cardImg-box">
                                <img class="cardImg" src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/13015.png">

                                <div class="card-info">
                                    <span class="card-title">모두의 일상 체크카드</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c"> #페이 적립 #전가맹점 적립</span>
                                </div>
                            </div>
                            <div class="cardImg-box">
                                <img class="cardImg" src="https://www.hanacard.co.kr/ATTACH/MOBILE_APP/images/card/14295.png">
                                <%--                              <img class="cardImg" src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/04652.png">--%>
                                <%--                              <img class="cardImg" src="../../../resources/img/travellog.png" height="180" >--%>
                                <div class="card-info">
                                    <span class="card-title">금쪽이 Young Hana+ 체크카드</span><br/><br/>
                                    <span style="font-size: 17px; color: #605c5c"> #페이 캐시백 #편의점/딜리버리 캐시백</span>
                                </div>
                            </div>
                            <div class="recomm-Info">
                                <h4>" 체크카드 추천 "</h4>

                                카드 소득공제 금액을 채우기 전까지는 <span style="color:#e40140"> 체크카드</span>를 사용하는 것이 유리해요.<br/>
                                신용카드보다 세금을 <span style="color: #e40140">2배</span> 더 <br/>아낄 수 있어요.<br/>
                                <span style="font-size: 17px">(단, 공제한도 300만원 이내)</span>

                            </div>

                        </div>
                    </div>
                    <div class="category-box2">
                        <h3>❓ 정말 체크카드가 신용카드보다 유리할까?</h3>
                        <br>
                        <button id="openModalBtn" class="modalBtn"><h6>자세히 알아보기</h6></button>
                    </div>
                    <div class="category-box3">
                        <h4>추가로 혜택받기</h4>
                        <div class="flex-box">
                            ${name}님이 주로 사용한 업종은&nbsp; <span style="font-weight: bold; color: #2a9791; font-size: 25px"># 외식&nbsp;</span> <span style="font-weight: bold; color: #2a9791;font-size: 25px"># 마트&nbsp;</span>
                            <span style="font-weight: bold; color: #2a9791;font-size: 25px"># 배달&nbsp;</span>입니다.<br/>
                        </div>
                        <div class="info-box2">
                            아래 카드를 함께 사용하면 매달 최대 <span style="font-weight: bold">17,000</span> 원 혜택을 받을 수 있어요
                        </div>
                        <div class="info-box1"></div>
                    </div>
                    <div class="category-box">
                        <h5>추가 공제에 유리한 카드 추천</h5>
                        #대중교통 #영화 할인<br/>
                        ${name}님이 주로 사용한 업종은  #외식 #마트 #배달 입니다.<br/>

                    </div>

                    <%--          <div class="category-box">--%>
                    <%--            <h5>추가로 혜택받기</h5>--%>
                    <%--          </div>--%>


                    <%--          <div class="info-item">--%>

                    <%--            <div>총 이용금액 :</div>--%>
                    <%--            <h3><fmt:formatNumber value="${monthSpending.totalAmount}" groupingUsed="true"/> <span--%>
                    <%--                    class="price-currency">(원)</span></h3>--%>
                    <%--          </div>--%>
                    <div class="inner-text">
                    </div>


                </div>
                <div class="card-box">
                    <div class="title">실적별 주요혜택</div>


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
            신용카드 연간 혜택이 <span style="font-weight: bold;">약 32만원</span>보다 높지 않으면
            <span style="font-weight: bold; color: #ee364f">체크카드</span> 이용이<br/> 유리해요.
        </div> <br/>
        <div class="modal-subtitle"> <h4>☑ 체크카드 이용 시</h4></div>
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

<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>

</body>
</html>