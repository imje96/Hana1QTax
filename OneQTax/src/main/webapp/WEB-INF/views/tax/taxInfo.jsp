<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
<%--<header>--%>
<%--    <jsp:include page="/WEB-INF/views/common/header.jsp" />--%>
<%--</header>--%>
<div class="contents">

    <section class="visual">

<h1>소득공제 계산 전 정보</h1>
<br/>
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
    </section>
    <section class="visual">
<form action="/calculateAndInsertDeduction" method="post">
    <!-- 필요한 입력 필드들을 여기에 추가합니다. 예를 들면, -->

    <!-- 제출 버튼 -->
    <input type="submit" value="계산하기" />
</form>



<a href="${pageContext.request.contextPath}/getLatestDeductionResult">결과보기</a>
<br/>
<a href="${pageContext.request.contextPath}/taxMain">소득공제 메인화면으로 이동</a>
</section>
</div>
</body>

</html>


