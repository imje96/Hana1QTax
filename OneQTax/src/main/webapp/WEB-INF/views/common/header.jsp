<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="../../../resources/css/common.css">
</head>

<body>
<div class="wrap">
    <!--header-->
    <header>
        <div id="headerLogo">
            <!-- Dynamic Welcome Message and Log Out button would be here -->

            <h2>하나카드 홈페이지</h2>

            <c:if test="${empty currentUser}">
                <div id="loginout">
                    <a href="${pageContext.request.contextPath}/login">
                        <button id="btn-login" type="button">로그인</button>
                    </a>
                    <a href="${pageContext.request.contextPath}/join">
                        <button id="btn-login" type="button">회원가입</button>
                    </a>
                </div>
            </c:if>
            <c:if test="${not empty currentUser }">
                <div id="welcomeMessage">
                    <span>${currentUser.name} 님 환영합니다</span>
                    <span class="bar"></span>
                    <a href="${pageContext.request.contextPath}/logout">
                        <button id="btn-login" type="button"  class="btn-login">로그아웃</button>
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
                    <img class="imgLogo" src="../../../resources/img/logo.png" height="65">
                </div>
                <div class="drops">
                    <div class="dropdown">
                        <button class="dropbtn">연말정산

                        </button>
                        <div class="dropdown-content">
                            <a href="#">공제현황보기</a>

                            <a href="#">리포트</a>
                            <a href="#">우리집돈관리</a>
                        </div>
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
                    <div class="dropdown">
                        <button class="dropbtn">커뮤니티

                        </button>
                        <div class="dropdown-content">
                            <a href="#">세테크tip</a>
                            <a href="#">절세게시판</a>
                        </div>
                    </div>

                </div>
            </div>
        </nav>
    </header>



</body>
</html>
