<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <title>HanaOneQTax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/main.css">
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
                            <button class="dropbtn">카드황금비율관리
<%--                                                        <i class="fa fa-caret-down"></i>--%>
                            </button>
                        </a>
                        <div class="dropdown-content">
                            <a href="#">공제현황보기</a>

                            <a href="#">리포트</a>
                            <a href="#">우리집돈관리</a>
                        </div>
                    </div>

                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/taxSimulation">
                            <button class="dropbtn">연말정산플래너
                            </button>
                        </a>
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


    <!--contents-->
        <div style="overflow: hidden;">

            <section class="visual">

                <div class="inner">
                    <!-- <h2 class="title">Crew a la mode</h2> -->
                    <div class="slideshow-container">
                        <div class="Slidesbackground">
                            <div class="mySlides fade">
                                <img src="../../../resources/img/banner1-3.png" class="slideshow-image">
                            </div>
                            <div class="mySlides fade">
                                <img src="../../../resources/img/banner2-1.png" class="slideshow-image">
                            </div>
                            <div class="mySlides fade">
                                <img src="../../../resources/img/banner3-3.png" class="slideshow-image">
                            </div>
                        </div>
                    </div>

                    <div class="userinfo-box">

                        <div class="login-wrap">
                            <div class="login-info">

                                <c:if test="${empty currentUser}">
                                    <p class="tit">내게 필요한 카드/절세/혜택<br><br>정보를 확인하세요.</p>
                                    <img class="iconimg" src="../../../resources/img/icon1.png " style="height: 150px">
                                    <a href="${pageContext.request.contextPath}/login" class="btn-login">로그인</a>
                                </c:if>
                                <c:if test="${not empty currentUser }">
                                    <p class="tit">${currentUser.name} 님 환영합니다.</p>
                                    <img class="iconimg" src="../../../resources/img/icon1.png " style="height: 150px">
                                    <h2></h2>
                                    <a href="${pageContext.request.contextPath}/logout" class="btn-login">로그아웃</a>
                                </c:if>
                            </div>
                            <div class="join-find-wrap">
                                <div class="left">
                                    <%--                                    <a href="/nlogin/findUsrId">아이디찾기</a>--%>
                                    <%--                                    <span class="bar"></span>--%>
                                    <%--                                    <a href="/nlogin/findUsrPwd">비밀번호찾기</a>--%>
                                </div>
                                <div class="right">
                                    <a href="${pageContext.request.contextPath}/member/login">회원가입</a>
                                </div>
                            </div>
                        </div>

                    </div>


                    <%--                        보류--%>
                    <%--                    <div class="noticeicon">--%>
                    <%--                        <p class="tit">내게 필요한 카드/절세/혜택<br>정보를 확인하세요.</p>--%>
                    <%--                        <div class="icons">--%>
                    <%--                            <div class="icon1">--%>
                    <%--                                <img class="iconimg" src="../../../resources/img/icon1.png " >--%>
                    <%--                            </div>--%>
                    <%--                            <div class="icon2">--%>
                    <%--                                <img class="iconimg" src="../../../resources/img/icon2.png " >--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>


                    <%--                    </div>--%>
                </div>
            </section>


            <%--            <section class="about">--%>
            <%--                <div class="inner">--%>
            <%--                    <p class="tit">이런 서비스 어떠세요</p>--%>
            <%--                </div>--%>
            <%--            </section>--%>


            <%--            <section class="approach">--%>
            <%--                <div class="inner">--%>
            <%--                    <ul class="list">--%>
            <%--                        <li><a href="#"><img src="../../../resources/img/approach_1.jpg" alt="">--%>
            <%--                            <span><b>CREW</b>made</span>--%>
            <%--                        </a></li>--%>
            <%--                        <li><a href="#"><img src="../../../resources/img/approach_1.jpg" alt="">--%>
            <%--                            <span><b>CREW</b>Ready</span>--%>
            <%--                        </a></li>--%>
            <%--                        <li><a href="#"><img src="../../../resources/img/approach_3.jpg" alt="">--%>
            <%--                            <span><b>CREW</b>made</span>--%>
            <%--                        </a></li>--%>
            <%--                        <li><a href="#"><img src="../../../resources/img/approach_4.jpg" alt="">--%>
            <%--                            <span><b>CREW</b>made</span>--%>
            <%--                        </a></li>--%>
            <%--                    </ul>--%>
            <%--                    <div class="fix">--%>
            <%--                        <div class="text">--%>
            <%--                            <h2 class="title">about us</h2>--%>
            <%--                            <p>The apparel & lifestyle agency.<br>--%>
            <%--                                A decade of unrivalled experience.<br>--%>
            <%--                                Trusted by the worlds most luxurious<br>--%>
            <%--                                yachts.</p>--%>
            <%--                            <a href="#">explore</a>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </section>--%>
            <section class="sectors">
                <div class="inner">
                    <div class="text animate" data-animate="motion">
                        <%--                        <p class="tit">이런 서비스 어떠세요</p>--%>
                        <h1 class="title">이런 서비스는 어떠세요</h1>
                        <%--                        <p>Luxury crew apparel curated across oceans,<br>--%>
                        <%--                            in private residences and at altitude.</p>--%>
                        <br><br>
                        <%--                            버튼--%>
                        <%--                          <a href="#">explore</a>--%>
                    </div>
                    <ul class="list animate" data-animate="motion">
                        <li><a href="${pageContext.request.contextPath}/taxMain">
                            <div class="add">
                                <p>똑똑하게 절세하고 혜택받기</p><br>
                                <h3>연말정산</h3>
                            </div>
                            <img class="iconimg" src="../../../resources/img/tax.png" alt="">

                        </a></li>
                        <li><a href="#">
                            <div class="add">
                                <p>내 전체 사용내역은 얼마일까</p> <br>
                                <h3>마이데이터</h3>
                            </div>
                            <img class="iconimg" src="../../../resources/img/data4.png" alt="">

                        </a></li>
                        <li><a href="#">
                            <div class="add">
                                <p>연말정산에 유리한 카드 추천</p><br>
                                <h3>카드추천</h3>

                            </div>
                            <img class="iconimg" src="../../../resources/img/card8.png" alt="">

                        </a></li>

                    </ul>
                </div>
            </section>
<%--            보류--%>
<%--            <section class="service">--%>
<%--                <div class="inner">--%>
<%--                    <div class="img animate" data-animate="motion"><img src="../../../resources/img/service.jpg" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="text">--%>
<%--                        <h2 class="title animate" data-animate="motion">service</h2>--%>
<%--                        <p>Crew à la Mode specialise in all<br>--%>
<%--                            your needs, from to storage<br>--%>
<%--                            solutions to graphic design,<br>--%>
<%--                            brand sourcing, customisation<br>--%>
<%--                            and much more.</p>--%>
<%--                        <a href="#">explore</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </section>--%>
            <section class="journal">
                <div class="inner">
                    <br/>
                    <h2>journal</h2>
                    <ul class="list animate" data-animate="motion">
                        <li><a href="#">
                            <p class="img"><img src="../../../resources/img/hanatv1.jpg" alt=""></p>
                            <h3>cocktails</h3>
                            <p>New Year’s Eve is all about celebrating in style.With that in mind, we asked
                                Daniel Hooper, Co-Founder of YesMore drinks-marketing agency (and former
                                superyacht crew member) to share with us his recommendations.</p>
                        </a></li>
                        <li><a href="#">
                            <p class="img"><img src="../../../resources/img/hanatv1.jpg" alt=""></p>
                            <h3>eco coffee</h3>
                            <p>Some small brands that are worth the switch to enjoy a cup of coffee that little
                                bit more.
                                For many of us, the need for a quick fix coffee in our busy day-to-day lives
                                sees the use of coffee capsules at home, onboard or in the workplace as a
                                much-used product. Convenient as they are, only a small percentage can actually
                                be recycled, meaning a vast majority will end up in our oceans and landfills for
                                up to 500 yrs.</p>
                        </a></li>
                        <li><a href="#">
                            <p class="img"><img src="../../../resources/img/hanatv1.jpg" alt=""></p>
                            <h3>arboremtum</h3>
                            <p>London is seeing a new genre of private independent member’s clubs emerging,
                                offering luxurious leisure and dining facilities, alongside unique working
                                environment and, most importantly an emphasis on environmental and social
                                change.</p>
                        </a></li>
                        <li><a href="#">
                            <p class="img"><img src="../../../resources/img/hanatv2.jpg" alt=""></p>
                            <h3>protected species</h3>
                            <p>Iconic British design with contemporary rainwear technology
                                At Crew à la Mode, we are passionate about sustainability, timeless style and
                                performance-led design and we are always looking for brands who share our ethos
                                and goals, in order to either work with them or recommend them to our clients.
                            </p>
                        </a></li>
                    </ul>
                </div>
            </section>
        </div>
    </div>


    <!--footer-->
    <footer>
        <div class="inner">
            <h1 class="footerLogo">하나카드</h1>
            <ul class="contact">
                <li>고객센터(유료) 국내 1800-1111 /</li>
                <li>해외 82-1800-1111</li>
            </ul>
            <ul class="footerlist">
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">위치서비스기반 이용약관</a></li>
                <li><a href="#">전자민원접수</a></li>
            </ul>
            <ul class="sns">
                <li><a href="#">하나금융그룹</a></li>
            </ul>
        </div>
    </footer>
</div>
</body>


</html>

