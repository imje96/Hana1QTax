<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="../../../resources/css/tax.css" rel="stylesheet">
    <link href="../../../resources/css/main.css" rel="stylesheet">

    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>


    <style>
        .text-box3 {
            background: #eaf3f3;
            padding: 15px 5px 10px 5px;
            border-radius: 10px;
            text-align: center;
            width: 700px;
            height: 110px;
            margin: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .redirectLink {
            font-weight: bold;
            border-radius: 10px;
            background: #fbcfe3;
            margin: 10px 0;
            padding: 10px;
            width: 160px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .redirectLink:hover {
            background-color: #fbcfe3;
            /* hover 시 배경색 변경 */
            transform: scale(1.05);
            /* hover 시 약간 확대되는 효과 */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            /* hover 시 그림자 약간 강화 */
        }

        .redirectLink2 {
            font-weight: bold;
            border-radius: 10px;
            background: #fbcfe3;
            margin: 10px 0;
            padding: 10px;
            width: 160px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .redirectLink2:hover {
            background-color: #fbcfe3;
            /* hover 시 배경색 변경 */
            transform: scale(1.05);
            /* hover 시 약간 확대되는 효과 */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            /* hover 시 그림자 약간 강화 */
        }
        /* 버 */
        /*  아코디언  */
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
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            line-height: 1.7em;
            transition: background-color 0.3s, transform 0.3s;
        }

        .accordion {
            border-radius: 4px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .accordion-header, .accordion-body {
            padding: 15px;
            border: 1px solid #ddd;
        }

        .accordion-header {
            background-color: #d6d6d6;
            cursor: pointer;
            border-bottom: none;
            padding-bottom: 0;
            height: 50px;
        }

        .accordion-body {
            max-height: 0;
            padding: 0 15px;
            overflow: hidden;
            transition: max-height 0.4s ease-out;
        }

        .terms-agree-checkbox{
            font-size: 20px;
            text-align: right;
        }
        .accordion-header h3{
            font-size: 23px;
        }
        .accordion-body h4{
            font-size: 22px;
        }
        .accordion-body.open {
            max-height: 500px; /* 예시 값: 실제 내용에 맞게 조정해야 함 */
        }

        .accordion-item:last-child .accordion-header {
            border-bottom: 1px solid #ddd;
        }
        .agreeBtn{
            padding: 10px 15px;
            font-size: 22px;
            width: 200px;
            cursor: pointer;
            background-color: #018c8d;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .copy-text{
            padding: 10px 30px;
            background: #f8f2ce;
            border-radius: 10px;
            font-size: 24px;
        }
        /* hover 시 팝업창*/
        .comment-text1 h4{
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
        .hover-text:hover .popup-modal p{
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
                <a href="${pageContext.request.contextPath}/simulationMain"
                   style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">연말정산 안내</h6>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxSimulation" style="display: block; margin-bottom: 20px;">
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
                <a href="${pageContext.request.contextPath}/spouseResult" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">우리집 돈관리 리포트</div>
                </a>
            </div>
        </div>


        <div class="section">
            <%--            <div class="container-xxl py-5">--%>
            <div class="container-title">
                <h2>연말정산 안내</h2>
                <br/>
                <span style="color: #615e5e"><h3>올해는 13월의 월급을 받을 수 있을까? 연말정산을 미리 확인해보고 환급액을 예상해 보세요</h3></span>
                <br/><br/>
                <h2> <span style="color: #ff328b">
                   13월의 월급? vs 세금 폭탄? </span>연말정산 시작하기로 확인해 보세요</h2>
            </div>

                <br/>
            <div class="container2">
                <div class="hover-text">
                <div class="copy-text"> 🍯TIP : ⍰ 박스에 마우스를 가져다 대면 추가적인 설명이 나타납니다</div>

                    <div class="popup-modal">
                        손님께 도움을 드릴 설명창이에요. 페이지에 있는 ⍰를 확인해주세요😊<br/>
                        <span style="color: #0d6565;"> 이제 아래의 연말정산 시작하기 버튼을 눌러보세요</span>👇👇

                    </div>
                </div>


                <div class="list-box" style="padding-top: 30px;">
                    <div class="flex-box" style="text-align: center;">
                        <div class="inputImg2">
                            <img src="../../../resources/img/simulationMain3.png">
                        </div>
                        <div class="text-box3">
                            <br/>
                            <h6>이번 년도 13월의 월급은 얼마나 될까?<span style="color: #ff328b"> 조회</span>하세요</h6>
                            <div style="padding: 10px;">
                                <button id="openModalBtn" class="pointBtn2"><h6>연말정산 시작하기</h6></button>
                            </div>
                        </div>
                    </div>
                    <br/><br/>
                    <div class="flex-box" style="text-align: center;">
                        <div class="text-box3">
                            <br/>
                            <h6>이미 계산한  <span style="color: #ff328b">연말정산 결과</span>를 확인해보세요</h6>
                            <div style="padding: 10px;">
                                    <a href="${pageContext.request.contextPath }/taxSimulation">
                                        <button class="pointBtn2"><h6>결과 확인하기</h6></button>
                                    </a>
                            </div>
                        </div>
                        <div class="inputImg2">
                            <img src="../../../resources/img/tax3.png">
                        </div>
                    </div>
                    <br/><br/>
                    <div class="flex-box" style="text-align: center;">
                        <div class="inputImg2">
                            <img src="../../../resources/img/simulationMain2.png">
                        </div>
                        <div class="text-box3">
                            <br/>
                            <h6>배우자의 소득공제 현황과 <span style="color: #ff328b">연말정산 전략</span>을 확인해보세요</h6>
                            <div style="padding: 10px;">
                                    <a href="${pageContext.request.contextPath }/taxSimulation">
                                        <button class="pointBtn2"><h6>우리집 돈 관리 시작하기</h6></button>
                                    </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item rounded overflow-hidden">
                            <div class="funcionality1" style="text-align: center;">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</div>

<!-- 약관 동의 모달 -->
<%--<div id="termsModal">--%>
<%--    <div style="background: white; padding: 20px; width: 80%; max-width: 600px;">--%>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h3>[필수] 개인(신용)정보 수집&#183;이용 동의</h3><br/>
        <br/>
        (주)하나원큐택스 귀중<br/>
        * 귀사가 연말정산서비스와 관련하여 본인의 개인의(신용)정보를 수집&#183;이용하고자 하는 경우에는
        『신용정보의 이용 및 보호에 관한 법률』 및  『개인정보보호법』 등 관계법령에 따라 본인의 동의가 필요합니다.<br/>
        * 연말정산서바스는 손님이 동의한 마이데이터 수집 정보와 직접 입력된 수집정보에 기반하여 제공합니다.<br/>
        <div class="accordion">
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h3>수집 &#183; 이용에 관한 사항</h3><br/>
                </div>


                <div class="accordion-body">
                  <br/>  <h4> 수집&#183;이용 목적</h4>
                연말정산 관려 분석 조회서비스, 연말정산 관련 상품 및 서비스 안내, 금융자산 경영 컨설팅 서비스<br/><br/>
                    <h4> 보유 및 이용기간</h4>
                개인(신용)정보는 서비스 종료일 또는 동의 철회 시까지 보유&#183;이용됩니다

                    <br/><br/>
<%--                    <label>--%>
<%--                        <input type="checkbox" class="terms-agree-checkbox"> .--%>
<%--                    </label>--%>
                </div>
            </div>

            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h3> 수집 &#183; 이용 항목</h3>
                </div>
                <div class="accordion-body">
                    <h4>개인신용정보</h4>

                    <h4>일반개인정보</h4>
                    &#183; 결혼 여부, 부녀자 여부, 한부모 여부, 부양가족 정보(미성년 자녀 수, 당해 출산/입양 자녀 수 , 직계존속 수, 형제/자매 수,
                    경로자 수, 장애인 수)

                    <h4>신용능력정보</h4>
                    &#183;소득, 본인 및 세대원의 주거소유여부

                    <h4>신용거래정보</h4>
                    &#183;신용/체크카드 사용액, 현금영수증 사용액, 전통시장, 사용액, 대중교통 사용액, 주택마련 저축, 소기업/소상공인 공제부금 납입액,
                    우리사주출연금, 투자조합출자 투자금액, 연금저축 납입액, 보장성 보험 납입액, 주택임차 차입금, 주택마련저축 납입액, 의료비관련 금액,
                    교육비관련 금액, 기부금, 월세납입액<br/><br/>
                    <label>
                   <h3>     <input type="checkbox" class="terms-agree-checkbox"> 위 개인(신용)정보 수집&#183;이용에 동의하십니까?</h3>
                    </label>
                </div>

            </div>
        </div>
            <div style="text-align: center; padding-top: 20px;">
                <button onclick="agreeTermsAndRedirect()" class="agreeBtn">동의하고 이동</button>
            </div>

    </div>
</div>

<%-- 챗봇 --%>
<%--<div id="iframeWrapper"--%>
<%--     style="width: 0; position: fixed; top: 10%; right: 0; height: 80%; overflow-x: hidden; transition: 0.5s;">--%>
<%--    <iframe--%>
<%--            id="chatIframe"--%>
<%--            src="https://www.chatbase.co/chatbot-iframe/aAn7wOmZmfF1MQ-xG1wpb"--%>
<%--            width="100%"--%>
<%--            height="100%"--%>
<%--            frameborder="0">--%>
<%--    </iframe>--%>
<%--</div>--%>

<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<%-- 약관 --%>
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
<%-- 아코디언 --%>
<script>
    function toggleAccordion(element) {
        const content = element.nextElementSibling;
        if (content.style.maxHeight && content.style.maxHeight !== '0px') {
            content.style.maxHeight = null;
        } else {
            content.style.maxHeight = content.scrollHeight + "px";
        }
    }

    function agreeTermsAndRedirect() {
        const checkboxes = document.querySelectorAll('.terms-agree-checkbox');

        for (let checkbox of checkboxes) {
            checkbox.checked = true; // 체크박스를 자동으로 선택
        }

        // 모든 약관에 동의한 경우 페이지 이동
        window.location.href = "${pageContext.request.contextPath}/taxSimulation";
    }


    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById('linkForModal').addEventListener('click', showTermsModal);

        function showTermsModal(event) {
            console.log("showTermsModal 함수가 호출되었습니다.");
            event.preventDefault();
            document.getElementById('termsModal').style.display = 'flex';
        }
    });

</script>
<%--<script>--%>

<%--    function toggleAccordion(element) {--%>
<%--        const content = element.nextElementSibling;--%>
<%--        if (content.style.maxHeight && content.style.maxHeight !== '0px') {--%>
<%--            content.style.maxHeight = null;--%>
<%--        } else {--%>
<%--            content.style.maxHeight = content.scrollHeight + "px";--%>
<%--        }--%>
<%--    }--%>


<%--</script>--%>
<%--<script>--%>

<%--    document.addEventListener("DOMContentLoaded", function() {--%>
<%--        document.getElementById('linkForModal').addEventListener('click', showTermsModal);--%>


<%--        document.getElementById('termsModal').style.display = 'flex';--%>

<%--        document.getElementById('linkForModal').addEventListener('click', showTermsModal, { capture: true });--%>


<%--        function showTermsModal(event) {--%>
<%--            console.log("showTermsModal 함수가 호출되었습니다.");--%>
<%--            event.preventDefault();--%>
<%--            document.getElementById('termsModal').style.display = 'flex';--%>
<%--        }--%>



<%--    function agreeTermsAndRedirect() {--%>
<%--        const checkboxes = document.querySelectorAll('.terms-agree-checkbox');--%>

<%--        for (let checkbox of checkboxes) {--%>
<%--            if (!checkbox.checked) {--%>
<%--                alert('모든 약관에 동의해주세요.');--%>
<%--                return;--%>
<%--            }--%>
<%--        }--%>

<%--        // 모든 약관에 동의한 경우 페이지 이동--%>
<%--        window.location.href = "${pageContext.request.contextPath}/taxSimulation";--%>
<%--    }--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>