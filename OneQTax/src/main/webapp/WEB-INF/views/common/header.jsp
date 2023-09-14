<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>HanaOneQTax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%--    <link rel="stylesheet" href="../../resources/css/main.css">--%>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <!--script-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="../../resources/js/scrolla.jquery.min.js"></script>
    <script src="../../resources/js/main.js"></script>


    <!-- font awseom -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

</head>
<body>
<div class="wrap">
    <!--header-->
    <header>
        <div id="headerLogo">
            <!-- Dynamic Welcome Message and Log Out button would be here -->
            <div id="welcomMessage">
                <h6>하나카드 홈페이지</h6>
            </div>

            <c:if test="${empty currentUser}">
                <div id="loginout">
                    <a href="${pageContext.request.contextPath}/login" class="loginBtn">로그인</a>
                    <a href="${pageContext.request.contextPath}/join" class="joinBtn">회원가입</a>
                </div>
            </c:if>
            <c:if test="${not empty currentUser }">
                <div id="welcomeMessage">
                    <span>${currentUser.name} 님 환영합니다</span>
                    &nbsp; &nbsp;
                    <a href="${pageContext.request.contextPath}/logout" class="logoutBtn">로그아웃</a>
                </div>
            </c:if>


            <!-- <div id="loginout">
            <button id="loginBtn" onclick="window.location.href='/login'">로그인</button>
            <button id="joinBtn" onclick="window.location.href='/join'">회원가입</button>
        </div> -->

        </div>

        <nav>
            <div class="navbar">
                <div id="lognavbaro">
                    <a href="${pageContext.request.contextPath}/main">
                        <img class="imgLogo" src="../../../resources/img/logo.png" height="65">
                    </a>
                </div>
                <div class="drops">
                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/taxInfo">
                            <button class="dropbtn">카드황금비율계산
                            </button>
                        </a>
                        <div class="dropdown-content">
                            <a href="#">공제현황보기</a>

                            <a href="#">리포트</a>
                            <a href="#">우리집돈관리</a>
                        </div>
                    </div>

                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/taxRefund">
                            <button class="dropbtn">연말정산계산기
                            </button>
                        </a>
                    </div>
                    <div class="dropdown">
                        <button class="dropbtn">마이데이터
                        </button>
                        <div class="dropdown-content">
                            <a href="#">카드관리</a>
                            <a href="#">사용내역</a>
                            <a href="#">내혜택확인</a>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button class="dropbtn">카드추천
                        </button>
                        <div class="dropdown-content">
                            <a href="#">카드한눈에보기</a>
                            <a href="#">추천카드</a>
                            <a href="#">카드안내</a>
                        </div>
                    </div>
                    <%--                    <div class="dropdown">--%>
                    <%--                        <button class="dropbtn">커뮤니티--%>
                    <%--                            <i class="fa fa-caret-down"></i>--%>
                    <%--                        </button>--%>
                    <%--                        <div class="dropdown-content">--%>
                    <%--                            <a href="#">세테크tip</a>--%>
                    <%--                            <a href="#">절세게시판</a>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                </div>
            </div>
        </nav>
    </header>



</body>
</html>
