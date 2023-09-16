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
<%--    chartjs 추가--%>
    <title>Deduction Result</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
                <h3 style="color: #018c8d; margin-bottom: 15px;">카드황금비율관리</h3>
                <hr style="width: 200px; height: 5px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult" style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black;">소득공제 안내</h6>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxInfo" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 플래너</div></a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult" style="display: block; margin-bottom: 20px;">
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


                <h1>소득공제 결과</h1>
                <br/>
                <table>
                    <tr>
                        <th>Deduction ID</th>
                        <th>Calculation ID</th>
                        <th>Total ID</th>
                        <th>Credit Deductible</th>
                        <th>Credit Deduction</th>
                        <th>Debit Deductible</th>
                        <th>Debit Deduction</th>
                        <th>Cash Deductible</th>
                        <th>Cash Deduction</th>
                        <th>Basic Deduction</th>
                        <th>Additional Deduction</th>
                        <th>Total Deduction</th>
                        <th>Reducing Tax</th>
                        <th>Result Date</th>
                    </tr>

                </table>


            </div>
            <%--            </div>--%>
        </div>
    </section>
    <section class="graph">
        <canvas id="deductionChart"></canvas>

        <script src="../../resources/js/deductionChart.js"></script>



    </section>

</div>

<script>
    window.creditPercentage = ${creditPercentage};
    window.debitPercentage = ${debitPercentage};
    window.cashPercentage = ${cashPercentage};
</script>

<!-- footer-wrapper -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</body>
</html>