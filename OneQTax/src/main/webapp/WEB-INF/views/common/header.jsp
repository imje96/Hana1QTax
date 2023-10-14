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
                            <a href="${pageContext.request.contextPath}/taxSimulation">
                                <button class="dropbtn">연말정산플래너
                                </button>
                            </a>
                            <div class="dropdown-content">
                                <a href="#">연말정산 안내</a>
                                <a href="#">연말정산 시뮬레이션</a>
                                <a href="#">연말정산 결과</a>
                                <a href="#">우리집 돈관리 초대하기</a>
                                <a href="#">우리집 돈관리 리포트</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/taxMain">
                                <button class="dropbtn">카드황금비율관리
                                    <%--                                                        <i class="fa fa-caret-down"></i>--%>
                                </button>
                            </a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/taxMain">소득공제 안내</a>
                                <a href="#">소비 문턱 넘기기</a>
                                <a href="#">카드황금비율 계산</a>
                                <a href="#">카드황금비율 결과</a>

                            </div>
                        </div>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/tranDashboard">
                                <button class="dropbtn">마이데이터
                                </button>
                            </a>
                            <div class="dropdown-content">
                                <a href="#">대시보드</a>
                                <a href="#">내 카드 확인하기</a>
                                <a href="#">실적 확인하기</a>
                                <a href="#">카드 사용내역</a>
                                <a href="#">현금영수증 사용내역</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/recommCard1">
                                <button class="dropbtn">카드추천
                                </button>
                            </a>
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

</div>

</body>
</html>
