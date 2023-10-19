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
        .info-item5 {
            border: 1px solid #f6f3f3;
            /* background-color: #f5f5f5; */
            border-radius: 10px;
            margin-bottom: 10px;
            margin-left: 150px;
            width: 400px;
            padding: 20px;
            font-size: 23px;
            text-align: center;
            background: #d9e3e3;
            color: black;
            line-height: 1.7;
        }

        .info-item6 {
            border: 1px solid #f6f3f3;
            /* background-color: #f5f5f5; */
            border-radius: 10px;
            margin-bottom: 10px;
            margin-right: 100px;
            width: 400px;
            padding: 20px;
            font-size: 23px;
            text-align: center;
            background: #d9e3e3;
            color: black;
            line-height: 1.7;
        }

        .conversation-box {

        }
        .container2 {
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            align-items: center;
            flex-direction: column;
            margin-bottom: 100px;
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
                <h3 style="color: #065859; margin-bottom: 15px;">카드황금비율관리</h3>
                <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxMain"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소득공제 안내</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">

                <a href="${pageContext.request.contextPath}/taxThreshold"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소비 문턱 넘기기</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxInfo"
                   style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">카드황금비율 계산</h6>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 결과</div>
                </a>

            </div>
        </div>


        <div class="section">
            <div class="container-title">
                <h2>카드황금비율 계산</h2>
                <br/>
                <span style="color: #615e5e"><h3>연말정산에서 카드 소득공제를 가장 많이 받을 수 있도록 제안해드릴게요</h3></span>
            </div>
            <br/><br/>


            <div class="container2">
                <div class="flex-box">

                    <div class="conversation-box">
                        <img src="../../../resources/img/conversation.png" height="300px">

                    </div>
                </div>
                <br/>
                <h3>지금 바로 최대 혜택 확인해 보기</h3><br/>
                👇 👇<br/><br/>

                <form id="taxCalculate" action="/calculateAndInsertDeduction" method="post">
                    <button class="modalBtn" type="submit"><h6>계산하기</h6></button>
                </form>

<%--                <form id="simulationResult" method="post" action="/simulationResult">--%>
<%--                    <button type="submit" class="pointBtn">결과 확인하기</button>--%>
<%--                </form>--%>


                <br/>
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult">
                    <button class="pointBtn"><h6>결과보기</h6></button>
                </a>
                <br/>

                <!-- 로딩 svg 추가 -->
                <div class="modal-background" style="display: none; position: fixed; top: 0; left: 0; right: 0; bottom: 0; align-items: center; justify-content: center; background: rgba(0,0,0,0.5);">
                    <img src="../../../resources/img/loading3.svg?v=${Math.random()}" > <!-- 임시 캐시 우회 -->
                </div>


            </div>

        </div>
    </section>
</div>


<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<%-- 로딩 애니메이션--%>
<script>
    // document.getElementById("taxCalculate").addEventListener("submit", function(event) {
    //     event.preventDefault();
    //
    //     const modalBackground = document.querySelector(".modal-background");
    //     modalBackground.style.display = "flex";
    //
    //     // SVG 애니메이션 시작
    //     const svgImage = modalBackground.querySelector("img");
    //     setTimeout(() => {
    //         svgImage.classList.add("show-img");
    //     }, 100); // 약간의 딜레이 후 애니메이션 시작
    //
    //     setTimeout(() => {
    //         svgImage.classList.remove("show-img");
    //         modalBackground.style.display = "none";
    //
    //         // 이제 form을 제출하여 페이지 이동
    //         event.target.submit();
    //     }, 800);

        <%--// 2초 후 SVG 팝업과 버튼 숨기기--%>
        // setTimeout(function() {
        //     svgImage.classList.remove("show-img");
        //     modalBackground.style.display = "none";
        //     document.getElementById("openModalBtn").style.display = "none";
        // }, 2000);
    // });



</script>

<script>
    document.getElementById("taxCalculate").addEventListener("submit", function(event) {
        event.preventDefault();

        const modalBackground = document.querySelector(".modal-background");
        modalBackground.style.display = "flex";

        // 버튼 숨기기
        const taxCalculateBtn = document.getElementById("taxCalculate");
        taxCalculateBtn.style.display = "none";

        // SVG 애니메이션 시작
        const svgImage = modalBackground.querySelector("img");
        setTimeout(() => {
            svgImage.classList.add("show-img");
        }, 100); // 약간의 딜레이 후 애니메이션 시작

        // 800ms 후 SVG 팝업 숨기고 form 제출
        setTimeout(() => {
            svgImage.classList.remove("show-img");
            modalBackground.style.display = "none";

            // 여기서 form을 수동으로 제출 -> event.preventDefault 때문에
            document.getElementById("taxCalculate").submit();

        }, 800);
    });


</script>

</body>
</html>