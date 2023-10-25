<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.spring.oneqtax.transaction.domain.CardTranVO" %>
<%@ page import="java.util.List" %>

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

    <!-- font awseom -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>

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

    .transaction-list {
        width: 1200px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h1, h2 {
        font-weight: 700!important;
        font-size: 30px!important;
        margin-top: inherit!important;
        margin-bottom: inherit!important;
    }

    h3, h4, h5, h6 {
        font-size: inherit!important;
        font-weight: 700 !important;
        margin-top: inherit!important;
        margin-bottom: inherit!important;
    }

    body {
        font-size: 20px !important;
        line-height: 1.42857143;
        color: #333;
        background-color: #fff;
    }

    .btn-group-vertical>.btn-group:after, .btn-group-vertical>.btn-group:before, .btn-toolbar:after, .btn-toolbar:before, .clearfix:after, .clearfix:before, .container-fluid:after, .container-fluid:before, .container:after, .container:before, .dl-horizontal dd:after, .dl-horizontal dd:before, .form-horizontal .form-group:after, .form-horizontal .form-group:before, .modal-footer:after, .modal-footer:before, .modal-header:after, .modal-header:before, .nav:after, .nav:before, .navbar-collapse:after, .navbar-collapse:before, .navbar-header:after, .navbar-header:before, .navbar:after, .navbar:before, .pager:after, .pager:before, .panel-body:after, .panel-body:before, .row:after, .row:before {
        display: inherit !important;
         content: inherit !important;
    }

    * {
         -webkit-box-sizing: inherit !important;
        /*-moz-box-sizing: border-box;*/
         box-sizing: inherit;!important;
    }
    button{
        font-family: inherit;
        /*font-size: 17px !important;*/
        line-height: inherit;
        background: #e9efee;
        /*color: #ffffff !important;*/
        border-radius: 10px;
        padding: 0 9px;
        border-color: #e9efee !important;
    }
    button:hover {
        background-color: #106e69;
        color: #FFFFFF;
        transform: scale(1.05);
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
    }
    /*  테이블   */
    th {
        color: #454b4b !important;
        background: #d5dfdf !important;
        height: 45px !important;
        border-bottom: 4px solid #cacfcf !important;
        border-right: 1px solid #d5dfdf !important;
        font-size: 20px !important;
        font-weight: 500 !important;
        text-align: center !important;
    }
    table.dataTable {
        clear: both;
        margin-top: 15px !important;
        margin-bottom: 15px !important;
        max-width: 800px !important;
        border-collapse: inherit !important;
    }
    table.dataTable td, table.dataTable th {
        -webkit-box-sizing: content-box;
        box-sizing: content-box;
        width: 200px !important;
        padding: 4px !important;
    }
    .section3 {
        width: 1200px;
        background: #f1f3f5;
        display: flex;
        margin-top: 50px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        height: 800px;
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
            <a href="${pageContext.request.contextPath}/cardList"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">내 카드 확인하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/cardBenefits" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">실적 확인하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/transactionList"
               style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">카드 사용내역</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/hometaxList"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">현금영수증 사용내역</div>
            </a>
            <hr style="width: 200px;">
        </div>
    </div>


    <div class="section">
        <div class="container-title">

            <h2>카드 사용내역 보기</h2>
            <br/>
            <span style="color: #615e5e"><h3>마이데이터로 연결한 카드 사용내역을 확인해보세요</h3></span>
        </div>

        <div class="section3">

            <div class="transaction-list">
                <div class="container-title">
                    <br/>
                    <span style="color: #615e5e"><h3>카드 결제내역 확인하기</h3></span><br/>
                </div>
                <div class="info-item5">
                    <div class="info-item">
                        <h3><a href="#"><span style="font-size: 25px;color: #041e1e;font-weight: bold;"> 10 월 <i class="fa fa-caret-down"></i></span></a> 사용금액 :
                            <fmt:formatNumber value="${thisMonthSpending.totalAmount}" groupingUsed="true"/> 원</h3>
                    </div>
                </div><br/>
                <!-- 테이블 구조 정의 -->
                <table id="tranTable" class="display"  data-te-max-height="460"
                       data-te-fixed-header="true">
                    <thead>
                    <tr>
                        <th>결제일자</th>
                        <th>거래처</th>
                        <th>결제금액</th>
                        <th>결제업종</th>
                        <th>카드번호</th>

                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>

        </div>
    </div>

</section>
    <%-- 카드번호 가리기--%>
<script>
    $(document).ready(function() {
        $.get('/changeCardNum', function(data) {
            var cardNumber = data.cardNumber;
            var maskedCardNumber = maskCardNumber(cardNumber);
            $('#card_number').text(maskedCardNumber);
        });
    });

    function maskCardNumber(cardNumber) {
        var firstDigits = cardNumber.substring(0, 4); // 카드 번호의 앞 4자리
        var lastDigits = cardNumber.substring(cardNumber.length - 4); // 카드 번호의 뒤 4자리
        var masked = firstDigits + " **** " + lastDigits; // 중간 8자리를 *로 치환
        return masked;
    }
</script>
    <%-- 통화 표시 --%>
<script>
    function formatCurrency(amount) {
            return amount.toLocaleString('ko-KR');
    }

</script>
<div id="cardNumber"></div>


<script type="text/javascript">
    $(document).ready(function () {
        try {
            var dataTable = $('#tranTable').DataTable({
                processing: true,
                ordering: false,
                data: JSON.parse('${jsonThisTran}'),
                dom: 'Bfrtip',
                        buttons: [
                            {
                                extend: 'excel',
                                title: '데이터 테이블 엑셀파일',
                                text: '📋 엑셀 다운로드',
                                className: 'detailBtn'
                            }
                        ],
                columns: [
                    {data: "cardtrandate"},
                    {data: "store"},
                    {data: "amount",
                        render: function (data, type, row) {
                            return formatCurrency(data);
                        }
                    },
                    {data: "category"},
                    {data: "card_number",
                        render: function(data, type, row) {
                            if(type === 'display') {
                                var firstDigits = data.substring(0, 4);
                                var lastDigits = data.substring(data.length - 4);
                                return firstDigits + " **** **** " + lastDigits;
                            }
                            return data;
                        }
                    }
                ]
            });
        } catch (e) {
            console.error("Error initializing DataTable or processing data:", e);
        }
    });
</script>



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


<!-- 엑셀 --> <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>

</body>
</html>
