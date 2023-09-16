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
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 관리</div></a>
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
            <div class="container1">
                <table>
                    <tr>
                        <th>Calculation ID</th>
                        <th>Member ID</th>
                        <th>Total Income</th>
                        <th>Minimum Amount</th>
                        <th>Deduction Rate</th>
                        <th>Basic Limit</th>
                        <th>Additional Limit</th>
                    </tr>
                    <tr>
                        <td>${taxInfo.calculation_id}</td>
                        <td>${taxInfo.member_id}</td>
                        <td>${taxInfo.total_income}</td>
                        <td>${taxInfo.minimum_amount}</td>
                        <td>${taxInfo.deduction_rate}</td>
                        <td>${taxInfo.basic_limit}</td>
                        <td>${taxInfo.additional_limit}</td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <th>Total ID</th>
                        <th>Member ID</th>
                        <th>Credit Total</th>
                        <th>Debit Total</th>
                        <th>Cash Total</th>
                        <th>Culture Total</th>
                        <th>Market Total</th>
                        <th>Transport Total</th>
                    </tr>
                    <tr>
                        <td>${transaction.total_id}</td>
                        <td>${transaction.member_id}</td>
                        <td>${transaction.credit_total}</td>
                        <td>${transaction.debit_total}</td>
                        <td>${transaction.cash_total}</td>
                        <td>${transaction.culture_total}</td>
                        <td>${transaction.market_total}</td>
                        <td>${transaction.transport_total}</td>
                    </tr>
                </table>

            </div>

            <div class="container2">
                <form action="/calculateAndInsertDeduction" method="post">
                    <!-- 필요한 입력 필드들을 여기에 추가합니다. 예를 들면, -->

                    <!-- 제출 버튼 -->
<%--                    <input type="submit" value="계산하기" />--%>
                    <button id="openModalBtn" class="modalBtn" type="submit"><h6>계산하기</h6></button>
                </form>



                <a href="${pageContext.request.contextPath}/getLatestDeductionResult">결과보기</a>
                <br/>
                <a href="${pageContext.request.contextPath}/taxMain">소득공제 메인화면으로 이동</a>
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