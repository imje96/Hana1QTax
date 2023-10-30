<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <title>HanaOneQTax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/main.css">
    <!--script-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <%--  옆에서 나오는 기능  --%>
    <script src="../../resources/js/scrolla.jquery.min.js"></script>
    <script src="../../resources/js/main.js"></script>


    <!-- font awseom -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
                        <a href="${pageContext.request.contextPath}/simulationMain">
                            <button class="dropbtn">연말정산플래너
                            </button>
                        </a>
<%--                        <div class="dropdown-content">--%>
<%--                            <a href="#">연말정산 안내</a>--%>
<%--                            <a href="#">연말정산 시뮬레이션</a>--%>
<%--                            <a href="#">연말정산 결과</a>--%>
<%--                            <a href="#">우리집 돈관리 초대하기</a>--%>
<%--                            <a href="#">우리집 돈관리 리포트</a>--%>
<%--                        </div>--%>
                    </div>
                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/taxMain">
                            <button class="dropbtn">카드황금비율관리
<%--                                                        <i class="fa fa-caret-down"></i>--%>
                            </button>
                        </a>
<%--                        <div class="dropdown-content">--%>
<%--                            <a href="${pageContext.request.contextPath}/taxMain">소득공제 안내</a>--%>
<%--                            <a href="#">소비 문턱 넘기기</a>--%>
<%--                            <a href="#">카드황금비율 계산</a>--%>
<%--                            <a href="#">카드황금비율 결과</a>--%>
<%--                        </div>--%>
                    </div>
                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/tranDashboard">
                        <button class="dropbtn">마이데이터
                        </button>
                        </a>
<%--                        <div class="dropdown-content">--%>
<%--                            <a href="#">대시보드</a>--%>
<%--                            <a href="#">내 카드 확인하기</a>--%>
<%--                            <a href="#">실적 확인하기</a>--%>
<%--                            <a href="#">카드 사용내역</a>--%>
<%--                            <a href="#">현금영수증 사용내역</a>--%>
<%--                        </div>--%>
                    </div>
                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/recommCard1">
                        <button class="dropbtn">카드추천
                        </button>
                        </a>
<%--                        <div class="dropdown-content">--%>
<%--                            <a href="#">카드한눈에보기</a>--%>
<%--                            <a href="#">추천카드</a>--%>
<%--                            <a href="#">카드안내</a>--%>
<%--                        </div>--%>
                    </div>

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
                                    <img class="iconimg" src="../../../resources/img/icon1.png " style="height: 200px">
                                    <h2></h2>
                                    <a href="${pageContext.request.contextPath}/logout" class="btn-login">로그아웃</a>
                                </c:if>
                            </div>
                            <div class="join-find-wrap">
                                <div class="left">
                                </div>

                            </div>
                        </div>

                    </div>


                </div>
            </section>



            <section class="sectors">


                <div class="inner">
                    <a href="${pageContext.request.contextPath}/audioTest">
                        오디오테스트
                    </a>

                    <a href="${pageContext.request.contextPath}/videoTest">
                        비디오테스트
                    </a>

                    <a href="${pageContext.request.contextPath}/canvasTest">
                        canvas테스트
                    </a>

                    <a href="${pageContext.request.contextPath}/headerTest">
                        header테스트
                    </a>

                    <a href="${pageContext.request.contextPath}/storageTest">
                        storageTest테스트
                    </a>

                    <a href="${pageContext.request.contextPath}/websocket">
                        websocket테스트
                    </a>

                    <div class="text animate" >
                        <%--                        <p class="tit">이런 서비스 어떠세요</p>--%>
                        <h1 class="title">이런 서비스는 어떠세요</h1>
                        <%--                        <p>Luxury crew apparel curated across oceans,<br>--%>
                        <%--                            in private residences and at altitude.</p>--%>
                        <br><br>
                        <%--                            버튼--%>
                        <%--                          <a href="#">explore</a>--%>
                    </div>
                    <ul class="list animate" >
                        <li><a href="${pageContext.request.contextPath}/simulationMain">
                            <div class="add">
                                똑똑하게 절세하고 혜택 받기<br><br>
                                <h3>연말정산</h3>
                            </div>
                            <img class="iconimg" src="../../../resources/img/tax.png" alt="">

                        </a></li>
                        <li><a href="#">
                            <div class="add">
                                내 전체 사용내역은 얼마일까<br><br>
                                <h3>마이데이터</h3>
                            </div>
                            <img class="iconimg" src="../../../resources/img/data4.png" alt="">

                        </a></li>
                        <li><a href="#">
                            <div class="add">
                               연말정산에 유리한 카드 추천<br><br>
                                <h3>카드추천</h3>

                            </div>
                            <img class="iconimg" src="../../../resources/img/card8.png" alt="">

                        </a></li>

                    </ul>
                </div>
            </section>
            <section class="journal">
                <div class="inner">
                    <br/> <br/>
                    <h2>연말정산 관련 유용한 정보🎥</h2>
                    <div class="list animate" data-animate="motion">
                        <li><a href="#">
    <iframe width="650" height="360" src="https://www.youtube.com/embed/UcxKu_G0M7o?si=A31N1pKEqFIxP_tj" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

                        </a></li>
                        <li><a href="#">
                            <iframe width="650" height="360" src="https://www.youtube.com/embed/yVJAXxXOQio?si=LNDhZUfgPjSSw9Y9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

                        </a></li>
                    </div>
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

