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
        /*  로딩 애니메이션   */
        .modal-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.2); /* 투명한 검은색 배경 */
            display: flex; /* 로더를 중앙에 위치시키기 위해 flex 사용 */
            justify-content: center;
            align-items: center;
            z-index: 1000; /* 다른 요소 위에 위치 */
        }

        .loader {
            display: inline-block;
            left: 40px;
            width: 80px;
            height: 80px;
            border: 5px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top: 3px solid #192662;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
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

<%--                    <img src="../../../resources/img/character4.png" height="200px">--%>
                    <div class="conversation-box">
                        <img src="../../../resources/img/conversation.png" height="300px">
<%--                        <div class="info-item5">--%>
<%--                            <div class="info-item">--%>
<%--                                체크카드나 현금영수증 혜택이 좋다던데... <br/>--%>
<%--                                계속 신용카드 써도 될까?--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <br/>--%>
<%--                        <div class="info-item6">--%>
<%--                            <div class="info-item">--%>
<%--                                아직 하나원큐택스 안 써봤어?<br/>--%>
<%--                                연말정산에 유리한 소비전략도 다 알려주잖아--%>
<%--                            </div>--%>
<%--                        </div>--%>

                    </div>
<%--                    <img src="../../../resources/img/character3.png" height="220px">--%>
                </div>
                <br/>
                <h3>지금 바로 최대 혜택 확인해 보기</h3><br/>
                👇 👇<br/><br/>
                <div class="modal-background" style="display: none;">
                    <div class="loader"></div>
                </div>

                <form action="/calculateAndInsertDeduction" method="post">
                    <button id="openModalBtn" class="modalBtn" type="submit"><h6>계산하기</h6></button>
                </form>
                <br/>
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult">
                    <button class="pointBtn"><h6>결과보기</h6></button>
                </a>
                <br/>
            </div>

        </div>
    </section>
</div>
<%-- 로딩 애니메이션 --%>

<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<%-- 로딩 애니메이션 --%>
<script>
    document.getElementById("openModalBtn").addEventListener("click", function(event) {
        event.preventDefault();

        // 모달 배경과 로딩 애니메이션 표시
        document.querySelector(".modal-background").style.display = "flex";

        // 임시로 2초 후 로딩 애니메이션과 모달 배경을 숨기고 계산하기 버튼을 숨깁니다.
        setTimeout(function() {
            document.querySelector(".modal-background").style.display = "none";
            document.getElementById("openModalBtn").style.display = "none";
        }, 2000);
    });



</script>

</body>
</html>