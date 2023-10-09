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


    <!-- Favicon -->
    <link
            href="${ pageContext.request.contextPath }/resources/img/favicon.ico"
            rel="icon">


    <!-- Template Stylesheet -->
    <link
            href="${ pageContext.request.contextPath }/resources/css/style.css"
            rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
            rel="stylesheet">
    <%--    <style type="text/css">--%>
    <%--        * {--%>
    <%--            font-family: 'Noto Sans KR', sans-serif !important;--%>
    <%--        }--%>
    <%--    </style>--%>


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
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">우리집 돈관리</div>
                </a>
                <hr style="width: 200px;">
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
                <h3>지금 바로 최대 혜택 확인해보기</h3><br/>
                👇 👇<br/><br/>

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
<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>