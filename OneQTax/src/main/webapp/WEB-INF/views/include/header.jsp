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

            <!-- <h4>하나카드 홈페이지</h4> -->
            <div id="welcomeMessage">
                <span>사용자이름 님 환영합니다</span>
                |
                <button id="hdbnt" onclick="window.location.href='/logout'">로그아웃</button>

            </div>
            <div id="loginout">
                <button id="hdtn" onclick="window.location.href='/join'">로그인</button>
                <button id="hdBtn" onclick="window.location.href='/join'">회원가입</button>
                <!-- <a href="/login">로그인</a>
            |
            <a href="/join">회원가입</a> -->
            </div>
            <!-- <div id="loginout">
            <button id="loginBtn" onclick="window.location.href='/login'">로그인</button>
            <button id="joinBtn" onclick="window.location.href='/join'">회원가입</button>
        </div> -->

        </div>

        <nav>
            <div class="navbar">
                <div id="logo">
                     <img class="imgLogo" src="../../../resources/img/logo.png" height="50">
                </div>
                <div class="dropdown">

                    <button class="dropbtn">연말정산
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">공제현황보기</a>
                        <a href="#">리포트</a>
                        <a href="#">우리집돈관리</a>
                    </div>
                </div>


                <div class="dropdown">
                    <button class="dropbtn">마이데이터
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">카드관리</a>
                        <a href="#">사용내역</a>
                        <a href="#">내혜택확인</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">카드추천
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">카드한눈에보기</a>
                        <a href="#">추천카드</a>
                        <a href="#">카드안내</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">커뮤니티
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">세테크tip</a>
                        <a href="#">절세게시판</a>
                    </div>
                </div>

            </div>
        </nav>
    </header>
</body>
</html>
