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


    <!-- Template Stylesheet -->
    <link
            href="${ pageContext.request.contextPath }/resources/css/style.css"
            rel="stylesheet">

    <script>
        window.embeddedChatbotConfig = {
            chatbotId: "aAn7wOmZmfF1MQ-xG1wpb",
            domain: "www.chatbase.co"
        }
    </script>
    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>

<style>
    .copy-text{
        padding: 10px 30px;
        background: #f8f2ce;
        border-radius: 10px;
        font-size: 24px;
    }
    .container2 h3 {
        font-size: 25px;
    }

    .inviteForm {
        font-size: 28px;
        font-weight: bold;
        /* display: flex; */
        border: 4px solid #a6c9c9;
        box-shadow: 0 6px 17px rgba(0, 0, 0, 0.4);
        border-radius: 15px;
        padding: 40px 40px 0 40px;
        margin: 0 0 20px 0;
        transition: background-color 0.4s, transform 0.4s;
    }

    .inviteForm:hover {
        transform: scale(1.05);
        /* hover 시 약간 확대되는 효과 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        /* hover 시 그림자 약간 강화 */
    }
    .form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .pointBtn {
        display: inline-block;
        color: #05413d;
        padding: 15px 20px;
        margin: 20px 120px;
        width: 350px;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        font-size: 21px;
        cursor: pointer;
        background-color: #fdd0e4;
        font-weight: 600;
        transition: background-color 0.3s, transform 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .modalBtn {
        display: inline-block;
        color: #05413d;
        padding: 15px 20px;
        margin: 20px 120px;
        width: 350px;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        font-size: 21px;
        cursor: pointer;
        background-color: #c7dedd;
        font-weight: 600;
        transition: background-color 0.3s, transform 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    #spouseEmail {
        height: 40px;
        width: 250px;
        padding: 0 20px;
        font-size: 20px;
    }

    .text-box2 {
        background: #eaf3f3;
        border-radius: 10px;
        margin: 20px 0;
        padding: 20px 100px;
        text-align: left;
        width: 800px;
        font-size: 23px;
    }
    /* 로딩*/
    .modal-background img {
        width: 200px; /* 원하는 크기로 조정 */
        height: 200px;
        transform: translateX(40%);
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
                    <div style="color: grey; margin-bottom: 15px;">연말정산 안내</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxSimulation"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">연말정산 시뮬레이션</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/simulationResult" style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">연말정산 결과</h6>
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
            <div class="container-title">
                <h2>연말정산 결과 확인하기</h2>
                <br/>
                <span style="color: #615e5e"><h3>연말정산 시뮬레이션을 통해 계산한 결과를 확인해 보세요</h3></span>
            </div>
            <br/>
            <div class="container2">
                <img class="inputImg3" src="../../../resources/img/announce.png" ><br/>
                <%--                <div class="copy-text"> 함께 번 돈, 똑똑하게 활용하자! 맞벌이 부부를 위한 연말정산 전략 🤵👰</div>--%>

                <h3>📋 기존에 계산한 <span style="color: #ff328b; font-size: 30px;">연말정산</span> 결과 확인하기 </h3><br/><br/>
                연말정산 결과를 확인해보고 상세내용에서 공제항목을 업데이트 할 수도 있어요
                <br/>

                <br/><br/>


                <br/><br/>
                <h3>   하단의 결과 확인하기 버튼을 눌러주세요.</h3><br/>
                <%--                👇 👇<br/><br/>--%>


                <form id="simulationResult" method="post" action="/simulationResult">
                    <button type="submit" class="pointBtn">결과 확인하기</button>
                </form>


                <!-- 아이콘 이미지 -->
<%--                <img src="../../../resources/img/chatbot.png" id="iconImage" style="cursor:pointer;">--%>

                <!-- iframe -->
                <div id="iframeWrapper" style="width: 0; position: fixed; top: 10%; right: 0; height: 80%; overflow-x: hidden; transition: 0.5s;">
                    <iframe
                            id="chatIframe"
                            src="https://www.chatbase.co/chatbot-iframe/aAn7wOmZmfF1MQ-xG1wpb"
                            width="100%"
                            height="80%"
                            frameborder="0">
                    </iframe>
                </div>
                <br/>
                <br/>
            </div>
        </div>
    </section>
</div>

<!-- 로딩 svg 추가 -->
<div class="modal-background" style="display: none; position: fixed; top: 0; left: 0; right: 0; bottom: 0; align-items: center; justify-content: center; background: rgba(0,0,0,0.5);">
    <img src="../../../resources/img/loading3.svg?v=${Math.random()}" > <!-- 임시 캐시 우회 -->
</div>

<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.getElementById('iconImage').addEventListener('click', function() {
        var iframeWrapper = document.getElementById('iframeWrapper');
        if (iframeWrapper.style.width === "0px" || iframeWrapper.style.width === "") {
            iframeWrapper.style.width = "400px";  /* 원하는 iframe 너비로 설정 */
        } else {
            iframeWrapper.style.width = "0";
        }
    });
</script>
<%-- 로딩 애니메이션 --%>
<script>
    document.getElementById("simulationResult").addEventListener("submit", function(event) {
        event.preventDefault();

        const modalBackground = document.querySelector(".modal-background");
        modalBackground.style.display = "flex";

        // SVG 애니메이션 시작
        const svgImage = modalBackground.querySelector("img");
        setTimeout(() => {
            svgImage.classList.add("show-img");
        }, 100); // 약간의 딜레이 후 애니메이션 시작

        // 800ms 후 SVG 팝업 숨기고 페이지 이동
        setTimeout(() => {
            svgImage.classList.remove("show-img");
            modalBackground.style.display = "none";

            // 이제 form을 제출하여 페이지 이동
            event.target.submit();
        }, 800);
    });
</script>

</body>
</html>