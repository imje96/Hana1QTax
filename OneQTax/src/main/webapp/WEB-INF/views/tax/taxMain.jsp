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

    <%--    <script defer--%>
    <%--            src="${ pageContext.request.contextPath }/resources/assets_portal/plugins/fontawesome/js/all.min.js"></script>--%>

    <%--    <!-- App CSS -->--%>
    <%--    <link id="theme-style" rel="stylesheet"--%>
    <%--          href="${ pageContext.request.contextPath }/resources/assets_portal/css/portal.css">--%>



    <style>
        .side-nav {
            font-family: 'Noto Sans KR', sans-serif !important;
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
                <a href="${pageContext.request.contextPath}/taxMain" style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black;">소득공제 안내</h6>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxThreshold" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소비 문턱 넘기기</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxInfo" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 계산</div>
                </a>

                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 결과</div>
                </a>

            </div>
        </div>


        <div class="section">
            <%--            <div class="container-xxl py-5">--%>
            <div class="container-title">
                <%--                <h6 class="text-primary">--%>
                <%--                    Hana 1QTax <span style="color: #ff328b;">연말정산</span>--%>
                <%--                </h6>--%>
                <%--                    💰--%>
                <h2>카드황금비율 서비스 안내</h2>
                <br/>
                <span style="color: #615e5e"><h3>돈 쓰고 돌려받는 세금은 얼마나 될까? 소비금액에 대한 소득공제를 확인해 보세요</h3></span>
            </div>

            <div class="container2">
<h3>TIP : ⍰ 박스에 마우스를 갖다 대면 추가적인 설명이 나타납니다/</h3>
                <div class="hero-box">
                    <div class="position-relative p-4 pt-0"
                         style="text-align: center;">
                        <h4 style="padding-top: 50px;">
<%--                            <span class="text-primary">관리부터 분석</span>까지, 내 모든 금융 자산을 <span--%>
<%--                                style="color: #ff328b;">한번에!</span>--%>
                            올해 카드 소득공제 얼마 받게 될까? <span style="color: #ff328b;"> 결제수단</span>을 연동해보세요!
                        </h4>
                        <%--                        <img class="img-fluid" style="width: 50%; height: 50%;"--%>
                        <%--                             src="${pageContext.request.contextPath }/resources/img/debitcard.png" alt="">--%>
                        <br/><p>카드와 홈택스를 연동하고 소득공제 혜택을 확인하세요.</p>
                    </div>
                </div>

                <div class="list-box" style="padding-top: 30px;">

                    <div class="flex-box" style="text-align: center;">
                        <div class="inputImg2">
                            <img src="../../../resources/img/tax3.png">
                        </div>
                        <div class="text-box3">
                            <br/>
                            <h6>카드소득공제를 받으려면 얼마를 사용해야 할까?<span style="color: #ff328b">조회</span>하세요</h6>
                            <div style="padding: 10px;">
                                <a href="${pageContext.request.contextPath }/taxThreshold">
                                    <span style="color: #106e69;background: #b1e8e6;font-weight: bold">소비 문턱 넘기기</span> </a>
                            </div>
                        </div>
                    </div>
                    <br/><br/>
                    <div class="flex-box" style="text-align: center;">
                        <div class="text-box3">
                            <br/>
                            <h6>연말정산에서 <span style="color: #ff328b">카드 소득공제</span>를 가장 많이 받을 수 있도록 제안해드려요</h6>
                            <div style="padding: 10px;">
                                <a href="${pageContext.request.contextPath }/getLatestDeductionResult">
                                    <span style="color: #106e69;background: #b1e8e6;font-weight: bold">카드 황금비율</span></a>
                            </div>
                        </div>
                        <div class="inputImg2">
                            <img src="../../../resources/img/tax3.png">
                        </div>
                    </div>
                    <br/><br/>
                    <div class="flex-box" style="text-align: center;">
                        <div class="inputImg2">
                            <img src="../../../resources/img/tax3.png">
                        </div>
                        <div class="text-box3">
                            <br/>
                            <h6>배우자의 소득공제 현황과 <span style="color: #ff328b">카드 사용 황금비율</span>을 확인해보세요</h6>

                            <div style="padding: 10px;">
                                <a class="btn btn-primary"
                                   href="${pageContext.request.contextPath }/consult/consultForm">
                                    <span style="color: #106e69;background: #b1e8e6;font-weight: bold">우리집 돈관리</span> </a>
                            </div>
                        </div>
                    </div>

                    <%--                        <div class="col-12 col-lg-4 wow fadeInUp" data-wow-delay="0.2s">--%>
                    <%--                            <div class="service-item rounded overflow-hidden">--%>
                    <%--                                <div class="position-relative p-4 pt-0"--%>
                    <%--                                     style="text-align: center;">--%>
                    <%--                                    <div>--%>
                    <%--                                        <img alt="" style="width: 10%; height: 10%;" class="mt-4 mb-3"--%>
                    <%--                                             src="../../../resources/img/tax3.png">--%>
                    <%--                                    </div>--%>
                    <%--                                    <h6>배우자와의 카드 사용 황금비율을 찾아보세요</h6>--%>
                    <%--                                    <h6>--%>
                    <%--                                        원큐택스에서 <span style="color: #ff328b">분석</span>하세요--%>
                    <%--                                    </h6>--%>
                    <%--                                    <div style="padding: 10px;">--%>
                    <%--                                        <a class="btn btn-primary"--%>
                    <%--                                           href="${pageContext.request.contextPath }/consult/togetherConsultForm">부부--%>
                    <%--                                            설계 하기</a>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <div class="col-12 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item rounded overflow-hidden">
                            <div class="funcionality1" style="text-align: center;">
<%--                                <div class="mt-3">--%>
<%--                                    <img alt="" style="width: 10%; height: 10%;" class="mt-4 mb-3"--%>
<%--                                         src="../../../resources/img/tax3.png">--%>
<%--                                </div>--%>
<%--                                <h6>이전에 설계한</h6>--%>
<%--                                <h6>--%>
<%--                                    <span style="color: #ff328b">연말정산 내역을</span> 확인하세요--%>
<%--                                </h6>--%>
<%--                                <div style="padding: 10px;">--%>
<%--                                    <a class="btn btn-primary"--%>
<%--                                       href="${pageContext.request.contextPath }/consult/consultLogList">--%>
<%--                                        나의 설계내역 확인하기</a>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%--            </div>--%>
        </div>
    </section>
</div>

<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>