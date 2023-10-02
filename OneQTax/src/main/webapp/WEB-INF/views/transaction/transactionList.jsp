<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.spring.oneqtax.transaction.domain.CardTranVO" %>
<%@ page import="java.util.List" %>
<%--<%--%>
<%--    List<CardTranVO> thisTran = (List<CardTranVO>) request.getAttribute("thisTran");--%>
<%--    Gson gson = new Gson();--%>
<%--    String jsonData = gson.toJson(thisTran);--%>
<%--    pageContext.setAttribute("jsonData", jsonData);--%>
<%--%>--%>


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
    <link href="../../../resources/css/main.css" rel="stylesheet">

    <%--    chartjs 추가--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="../../../resources/css/tax.css" rel="stylesheet">


<%--    <!-- Add Bootstrap CSS -->--%>
<%--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">--%>


</head>

<style>
    *, ::after, ::before {
        box-sizing: inherit;
    }

    .section2 {
        width: 1200px;
        background: #f1f3f5;
        display: flex;
        margin-top: 50px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .container-left {
        background-color: #efecec;
        width: 60%;
        height: 1000px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        /*box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);*/
    }

    .date-selector span {
        font-weight: 600;
        font-size: 18px;
        line-height: 15px;
    }


    .inner-text {
        position: absolute;
        transform: translate(0%, -530%);
        /*top: 32%;*/
        /*left: 50%;*/
        text-align: center;
        color: #e4003f;
    }

    /*   금액 표시 */
    .price-currency {
        line-height: 21px;
        font-size: 14px;
        font-weight: 600;
        color: #90A3BF;
        /*margin-left: 8px;*/
    }





</style>


<body>

<!--contents-->


<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>

<div id="jsonData" data-json='${jsonData}' style="display: none;"></div>

<section class="main">

    <div class="aside" style="width: 20%; float: left; font-family: 'Noto Sans KR', sans-serif !important">
        <br/>
        <br/>
        <br/>
        <div style="padding-left: 30px;">
            <h3 style="color: #065859; margin-bottom: 15px;">마이데이터</h3>
            <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/tranDashboard"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">대시보드</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxThreshold"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">내 카드 확인하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/transactionList" style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">카드 사용내역</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">홈택스 사용내역</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/spouseResult"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">실적 확인하기</div>
            </a>
            <hr style="width: 200px;">
        </div>
    </div>


    <div class="section">
        <div class="container-title">

            <h2>내 소비 모아보기</h2>
            <br/>
            <span style="color: #615e5e"><h3>소득공제액을 미리 확인하고 관리하세요!</h3></span>
        </div>


        <div class="section2">

            <div class="container-left">




            </div>



                    <!-- 테이블 구조 정의 -->
            <table id="tranTable" class="display">
                <thead>
                <tr>
                    <th>거래 ID</th>
                    <th>금액</th>
                    <th>카테고리</th>

                </tr>
                </thead>
                <tbody>
                <!-- 데이터 행은 DataTables에 의해 여기에 동적으로 추가됩니다. -->
                </tbody>
            </table>

                </div>

            </div>


</section>
<%--<script type="text/javascript">--%>
<%--    $(document).ready(function() {--%>
<%--        // JSP에서 모델로부터 받은 JSON 문자열을 JavaScript 객체로 변환--%>
<%--        var jsonData = JSON.parse('${jsonThisTran}');--%>

<%--        try {--%>
<%--            var dataTable = $('#tranTable').DataTable();--%>

<%--            $.each(jsonData, function(index, tran) {--%>
<%--                dataTable.row.add([--%>
<%--                    tran.transaction_id,--%>
<%--                    tran.amount,--%>
<%--                    tran.category--%>
<%--                ]).draw();--%>
<%--            });--%>
<%--        } catch (e) {--%>
<%--            console.error("Error initializing DataTable or processing data:", e);--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<script type="text/javascript">
    $(document).ready(function() {
        try {
            var dataTable = $('#tranTable').DataTable({
                processing: true,
                ordering: false,
                data: JSON.parse('${jsonThisTran}'),
                columns: [
                    {data: "transaction_id"},
                    {data: "amount"},
                    {data: "category"}
                ]
            });
        } catch (e) {
            console.error("Error initializing DataTable or processing data:", e);
        }
    });
</script>


<%--<script>--%>
<%--    // jQuery.noConflict();--%>
<%--    // $(document).ready(function () {--%>
<%--    //     $('#tranTable').DataTable({--%>
<%--    //         dom: 'Bfrtip',--%>
<%--    //         buttons: [--%>
<%--    //             {--%>
<%--    //                 extend: 'excel',--%>
<%--    //                 title: '데이터 테이블 엑셀파일',--%>
<%--    //                 text: '엑셀 다운로드',--%>
<%--    //                 className: 'detailBtn'--%>
<%--    //             }--%>
<%--    //         ],--%>
<%--    //         language: {--%>
<%--    //             "emptyTable": "기록이 없습니다."--%>
<%--    //         },--%>
<%--    //         order: [[3, 'desc']],--%>
<%--    //         lengthChange: false,--%>
<%--    //         columns: [--%>
<%--    //             { title: '번호', data: 'transaction_id' },--%>
<%--    //             { title: '금액', data: 'amount' },--%>
<%--    //             { title: '항목', data: 'category' }--%>
<%--    //             // Add more column definitions as needed--%>
<%--    //         ]--%>
<%--    //     });--%>
<%--    // });--%>

<%--</script>--%>



<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<!-- Load jQuery first -->
<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- Load DataTables CSS and JS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css"/>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>

<!-- Load Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</body>
</html>
