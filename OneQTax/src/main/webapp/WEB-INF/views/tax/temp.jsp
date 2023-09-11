<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>1Q Tax 소득공제결과</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>

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
    <tr>
        <td>${result.deduction_id}</td>
        <td>${result.calculation_id}</td>
        <td>${result.total_id}</td>
        <td>${result.credit_deductible}</td>
        <td>${result.credit_deduction}</td>
        <td>${result.debit_deductible}</td>
        <td>${result.cash_deductible}</td>
        <td>${result.debit_deduction}</td>
        <td>${result.cash_deduction}</td>
        <td>${result.basic_deduction}</td>
        <td>${result.additional_deduction}</td>
        <td>${result.total_deduction}</td>
        <td>${result.reducing_tax}</td>
        <td>${result.result_date}</td>
    </tr>
</table>


<%--<table>--%>
<%--    <tr>--%>
<%--        <th>Total ID</th>--%>
<%--        <th>Member ID</th>--%>
<%--        <th>Credit Total</th>--%>
<%--        <th>Debit Total</th>--%>
<%--        <th>Cash Total</th>--%>
<%--        <th>Culture Total</th>--%>
<%--        <th>Market Total</th>--%>
<%--        <th>Transport Total</th>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>${transaction.total_id}</td>--%>
<%--        <td>${transaction.member_id}</td>--%>
<%--        <td>${transaction.credit_total}</td>--%>
<%--        <td>${transaction.debit_total}</td>--%>
<%--        <td>${transaction.cash_total}</td>--%>
<%--        <td>${transaction.culture_total}</td>--%>
<%--        <td>${transaction.market_total}</td>--%>
<%--        <td>${transaction.transport_total}</td>--%>
<%--    </tr>--%>
<%--</table>--%>
</body>



</html>