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
    <link href="../../../resources/css/main.css" rel="stylesheet">

    <%--    chartjs 추가--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="../../../resources/css/tax.css" rel="stylesheet">


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
            <br/>
            <br/>
            <br/>
            <div style="padding-left: 30px;">
                <h3 style="color: #018c8d; margin-bottom: 15px;">카드황금비율계산</h3>
                <hr style="width: 200px; height: 5px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소득공제 안내</div>
                </a>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxInfo" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 계산</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소비 문턱넘기기</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">카드황금비율 결과</h6></a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">우리집 돈관리</div>
                </a>
                <hr style="width: 200px;">
            </div>
        </div>


        <div class="section">
            <%--            <div class="container-xxl py-5">--%>
            <div class="container-title" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">
                    Hana 1QTax <span style="color: #ff328b;">연말정산</span>
                </h6>
                <h2 class="mb-4">카드황금비율 계산 결과💰</h2>
            </div>


            <div id="myModal" class="modal">
                <div class="modal-content">
                    <div class="container1">
                        <span class="close">&times;</span>
                        <table class="table-fill">
                            <thead>
                            <tr>
                                <th class="text-left">항목</th>
                                <th class="text-left">사용금액</th>
                                <th class="text-left">공제가능금액</th>
                                <th class="text-left">공제율</th>
                                <th class="text-left">공제액</th>
                            </tr>
                            </thead>
                            <tbody class="table-hover">
                            <tr>
                                <td class="text-left">신용카드</td>
                                <td class="text-left">${credit_total}원</td> <!--사용금액-->
                                <td class="text-left">${credit_deductible}원</td> <!-- 공제가능 금액-->
                                <td class="text-left">15%</td>
                                <td class="text-left">${credit_deduction}원</td> <!-- 공제액 금액-->
                            </tr>
                            <tr>
                                <td class="text-left">체크카드</td>
                                <td class="text-left">${debit_total}원</td> <!--사용금액-->
                                <td class="text-left">${debit_deductible}원</td> <!-- 공제가능 금액-->
                                <td class="text-left">30%</td>
                                <td class="text-left">${debit_deduction}원</td> <!-- 공제액 금액-->
                            </tr>
                            <tr>
                                <td class="text-left">현금영수증</td>
                                <td class="text-left">${cash_total}원</td> <!--사용금액-->
                                <td class="text-left">${cash_deductible}원</td> <!-- 공제가능 금액-->
                                <td class="text-left">30%</td>
                                <td class="text-left">${cash_deduction}원</td> <!-- 공제액 금액-->
                            </tr>
                            <%--                        <tr>--%>
                            <%--                            <td class="text-left">일반 공제액</td>--%>
                            <%--                            <td class="text-left">${basic_deduction}원</td>--%>
                            <%--                        </tr>--%>
                            <%--                        <tr>--%>
                            <%--                            <td class="text-left">추가 공제액</td>--%>
                            <%--                            <td class="text-left">${additional_deduction}원</td>--%>
                            <%--                        </tr>--%>
                            <%--                        <tr>--%>
                            <%--                            <td class="text-left">공제액 합계</td>--%>
                            <%--                            <td class="text-left">${total_deduction}원</td>--%>
                            <%--                        </tr>--%>
                            </tbody>
                        </table>
                    </div>
                    <div class="container1">
                        <table class="table-fill">
                            <h3>급여별 총 한도액</h3><br/>
                            <thead>
                            <tr>
                                <th class="text-left"></th>
                                <th class="text-left">기본 공제 한도</th>
                                <th class="text-left">추가 공제 한도</th>

                            </tr>
                            </thead>
                            <tbody class="table-hover">
                            <tr>
                                <td class="text-left">7천만 원 이하</td>
                                <td class="text-left">300만 원</td>
                                <td class="text-left">300만 원</td>
                            </tr>
                            <tr>
                                <td class="text-left">7천만 원 초과</td>
                                <td class="text-left">250만 원</td>
                                <td class="text-left">200만 원</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

            <div class="container2">
                <div class="comment-box">
                    <div class="result-tax">
                        <h6>2023년 카드 등 소득공제 공제액</h6>
                        <br/>
                        <h2>${total_deduction}원</h2>
                        <br/>
                        남은 최대 공제액 ${remainingDeduction}원
                    </div>
                    <div class="comment-info">
                        <c:choose>
                            <c:when test="${total > 0}">
                                신용카드 대신 체크카드, 현금을 쓰면 0만원 더 돌려받을 수 있어요
                                <br/>문화관련, 전통시장, 대중교통은 신용카드 혜택이 좋아요


                            </c:when>
                            <c:when test="${remainingDeduction == 0}">
                                이미 최대 환급을 받고 있으니<br/>
                                혜택이 큰 신용카드를 사용해볼까요?
                            </c:when>
                        </c:choose>
                        <img class="imgLogo" src="../../../resources/img/card8.png" height="150">
                    </div>
                    <div class="btn-container">
                        <button id="openModalBtn" class="modalBtn"><h6>계산 결과 상세보기</h6></button>
                        <br/>
                        <br/>
                        <button id="recommendBtn" class="modalBtn"><h6>내게 맞는 카드 추천받기</h6></button>
                    </div>
                </div>

                <div class="chart-box">
                    <div class="chart">
                    <canvas id="deductionChart"></canvas>
                    <script src="../../resources/js/deductionChart.js"></script>
                    </div>
                    <div class="info-box">
                        <div class="info-item">일반공제액: <span>${basic_deduction}원</span></div>
                        <div class="info-item">추가공제액: <span>${additional_deduction}원</span></div>
                        <div class="info-item">공제액합계: <span>${total_deduction}원</span></div>
                        <div class="info-item">공제가능액: <span>${total}</span></div>
                    </div>

                </div>
            </div>

        </div>

    </section>
</div>

<script>
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("openModalBtn");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function () {
        modal.style.display = "block";
    }

    span.onclick = function () {
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

</script>

<script>
    window.creditDeduction = ${credit_deduction};
    window.debitDeduction = ${debit_deduction};
    window.cashDeduction = ${cash_deduction};
    window.additional = ${additional_deduction};
    window.total = ${total};
    window.remainingDeduction = ${remainingDeduction};
</script>


<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>