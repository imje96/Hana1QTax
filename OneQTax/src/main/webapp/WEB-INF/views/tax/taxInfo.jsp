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

<h1>Tax Information</h1>

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


</body>
