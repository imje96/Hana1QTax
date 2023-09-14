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
            <div style="padding-left: 30px;">
                <h3 style="color: #018c8d; margin-bottom: 15px;">카드황금비율계산</h3>
                <hr style="width: 200px; height: 5px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult" style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black;">소득공제 안내</h6>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxInfo" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 계산</div></a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxThreshold" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소비 문턱넘기기</div></a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 결과</div></a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">우리집 돈관리</div></a>
                <hr style="width: 200px;">
            </div>
        </div>


        <div class="section">
            <%--            <div class="container-xxl py-5">--%>
            <div class="container-title" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">
                    Hana 1QTax <span style="color: #ff328b;">연말정산</span>
                </h6>
                <h2 class="mb-4">소득공제</h2>
            </div>
            <div class="container1">

                <div class="row g-4">
                    <div class="col-md-12 col-lg-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded overflow-hidden">
                            <div class="position-relative p-4 pt-0"
                                 style="text-align: center;">
                                <h4 class="mb-3" style="padding-top: 50px;">
                                    <span class="text-primary">관리부터 분석</span>까지, 내 모든 금융 자산을 <span
                                        style="color: #ff328b;">한번에!</span>
                                </h4>
                                <img class="img-fluid" style="width: 50%; height: 50%;"
                                     src="${pageContext.request.contextPath }/resources/img/consultMain.jpg"
                                     alt="">
                                <p>*하나원큐레이터에서 하나은행과 타 은행의 계좌를 등록하여 나의 모든 금융자산을 한번에 관리하세요</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- row -->
            </div>


            <div class="container2" style="padding-top: 30px;">
                <div class="row g-4">
                    <div class="col-12 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded overflow-hidden">
                            <div class="position-relative p-4 pt-0"
                                 style="text-align: center;">
                                <div style="mt-3">
                                    <img alt="" style="width: 10%; height: 10%;" class="mt-4 mb-3"
                                         src="../../../resources/img/tax3.png">
                                </div>
                                <h6>다른 금융 자산도</h6>
                                <h6>
                                    원큐택스에서 <span style="color: #ff328b">조회</span>하세요
                                </h6>
                                <div style="padding: 10px;">
                                    <a class="btn btn-primary"
                                       href="${pageContext.request.contextPath }/consult/consultForm">소득공제 확인하기</a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-12 col-lg-4 wow fadeInUp" data-wow-delay="0.2s">
                        <div class="service-item rounded overflow-hidden">
                            <div class="position-relative p-4 pt-0"
                                 style="text-align: center;">
                                <div style="mt-3">
                                    <img alt="" style="width: 10%; height: 10%;" class="mt-4 mb-3"
                                         src="../../../resources/img/tax3.png">
                                </div>
                                <h6>배우자와의 카드 사용 황금비율을 찾아보세요</h6>
                                <h6>
                                    원큐택스에서 <span style="color: #ff328b">분석</span>하세요
                                </h6>
                                <div style="padding: 10px;">
                                    <a class="btn btn-primary"
                                       href="${pageContext.request.contextPath }/consult/togetherConsultForm">부부
                                        설계 하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item rounded overflow-hidden">
                            <div class="funcionality1" style="text-align: center;">
                                <div class="mt-3">
                                    <img alt="" style="width: 10%; height: 10%;" class="mt-4 mb-3"
                                         src="../../../resources/img/tax3.png">
                                </div>
                                <h6>이전에 설계한</h6>
                                <h6>
                                    <span style="color: #ff328b">연말정산 내역을</span> 확인하세요
                                </h6>
                                <div style="padding: 10px;">
                                    <a class="btn btn-primary"
                                       href="${pageContext.request.contextPath }/consult/consultLogList">
                                        나의 설계내역 확인하기</a>
                                </div>
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