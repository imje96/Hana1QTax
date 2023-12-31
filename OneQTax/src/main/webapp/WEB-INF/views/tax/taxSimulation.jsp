<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>HanaOneTax</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <%--    common.css--%>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/main.css" rel="stylesheet">
    <link href="../../../resources/css/taxRefund.css" rel="stylesheet">

    <%--    chartjs 추가--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="../../../resources/js/main.js"></script>

    <link href="../../../resources/css/tax.css" rel="stylesheet">

    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>
    <style>
        .section-content.active button {
            text-align: center;
        }
        .text-color{
            color: #fd328a;
        }
        .container-title {
            text-align: center;
            margin-left: 100px;
        }
    </style>

</head>


<body>


<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>


<section class="main">

    <div class="aside" style="width: 20%; float: left; font-family: 'Noto Sans KR', sans-serif !important">
        <br/>
        <br/>
        <br/>
        <div style="padding-left: 30px;">
            <h3 style="color: #065859; margin-bottom: 15px;">연말정산 플래너</h3>
            <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/simulationMain"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 안내</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxSimulation" style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">연말정산 시뮬레이션</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/simulationResult"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 결과</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/spouseAgreement"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">우리집 돈관리 초대하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/spouseResult" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">우리집 돈관리 리포트</div>
            </a>
        </div>
    </div>
    <div class="container2">
        <div class="container-title">
            <h2>연말정산 시뮬레이션</h2>
            <br/>
            <span style="color: #615e5e"><h3>조건별 연말정산 시뮬레이션을 통해 절세 현황을 확인해보세요</h3></span>
        </div>

        <div class="progress-wrapper">
            <div id="progress-bar-container">
                <ul>
                    <li class="step step01 active" data-step="1">
                        <div class="step-inner">Step 1</div>
                    </li>
                    <li class="step step02" data-step="2">
                        <div class="step-inner">Step 2</div>
                    </li>
                    <li class="step step03">
                        <div class="step-inner" data-step="3">Step 3</div>
                    </li>
                </ul>
                <div id="line">
                    <div id="line-progress"></div>
                </div>

                <form id="multiStepForm" method="post" action="/taxSimulation">
                    <div id="progress-content-section2">
                        <!-- Step 1 Content -->
                        <fieldset class="section-content step1 active" data-step="1">
                            <br/>
                            <div class="text-color">
                            <h3>STEP 1: 총급여정보</h3><br/>
                            </div>

                            <h2>Q1. 손님의 총급여 정보를 알려주세요</h2><br/>
                            <label>총급여 정보</label><br/>
                            <p>총급여란? 연봉에서 식대나 보육수당 같은 <br/>'비과세 소득'을 뺀 금액을 말합니다.</p>
                            <br/>
                            <br/>

                            <p>홈택스에서 전년도 총급여정보를 가져왔어요.<br/> 총급여 금액을 확인하고, 실제 금액을 입력해 <br/>정확한 정보를 확인해보세요.</p>
                            <br/>
                            <br/>
                            <div>
                                <label for="totalIncome">총급여:</label>
                                <%--                                    <input type="text" name="totalIncome_view" id="totalIncome_view" oninput="addCommaToNumber(this)" value="<fmt:formatNumber value="${totalIncome}" groupingUsed="true"/>">--%>
                                <%--                                    원--%>
                                <%--                                    <input type="hidden" id="totalIncome" name="totalIncome">--%>
                                <input type="text" name="totalIncome_view" id="totalIncome_view" oninput="addCommaToNumber(this)" data-hidden-id="totalIncome" value="<fmt:formatNumber value="${totalIncome}" groupingUsed="true"/>">
                                원
                                <input type="hidden" id="totalIncome" name="taxFormVO.totalIncome" value="${totalIncome}">

                            </div>
                            <br/>
                            <br>
                            <span style="margin-left: 130px">
                            <button type="button" class="next-button">다음</button>
                            </span>
                        </fieldset>

                        <!-- Step 2 Content -->
                        <fieldset class="section-content step2" data-step="2">
                            <br/>
                            <div class="text-color">
                            <h3>STEP 2: 가족구성 정보</h3><br/>
                            </div>
                            <h2>Q2. 손님의 가족 구성정보를 알려주세요</h2><br/>
                            <label>배우자 공제 유/무:</label>
                            <div class="choice-button">
                                <input type="radio" id="spouseDeduction" name="spouseDeduction" value="yes">
                                <label for="spouseDeduction">O</label>
                                <input type="radio" id="spouseDeduction_no" name="taxFormVO.spouseDeduction" value="no">
                                <label for="spouseDeduction_no">X</label>
                            </div>
                            <br/>
                            <label for="child">만 20세 이하 자녀 수(세액공제):</label><br/>
                            <select name="taxFormVO.child" id="child" class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <p>거주자와 생계를 같이하는 연간 소득금액 합계액<br/> 100만원 이하인 부양가족</p>
                            <br/>
                            <label for="adoptedChild">출산/입양 자녀 수(세액공제):</label><br/>
                            <select name="taxFormVO.adoptedChild" id="adoptedChild"
                                    class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <p>연말정산 적용기간에 출산하거나 입양신고 자녀</p>

                            <br>
                            <span style="margin-left: 50px">
                            <button type="button" class="prev-button" data-step="2">이전</button>
                            <button type="button" class="next-button">다음</button>
                            </span>
                        </fieldset>

                        <!-- Step 3 Content -->
                        <!-- 모달창 -->
                        <fieldset class="section-content step3" data-step="3">
                            <br/>
                            <div class="text-color">
                            <h3>STEP 3: 부양가족 정보</h3><br/>
                            </div>
                            <h2>Q3. 손님의 부양가족 정보를 알려주세요</h2><br/>

                            <label for="directAncestor">직계존속 수:</label><br/>
                            <select name="taxFormVO.directAncestor" id="directAncestor"
                                    class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <p>거주자와 생계를 같이하는 연간 소득금액 합계액<br/> 100만원 이하인 부양가족</p>
                            <br/>
                            <label for="siblings">형제/자매 수:</label><br/>
                            <select name="taxFormVO.siblings" id="siblings" class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <p>연말정산 적용기간에 출산하거나 입양신고 자녀</p>
                            <br/>
                            <label for="senior">경로자 수:</label><br/>
                            <select name="taxFormVO.senior" id="senior" class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <br/><br/>
                            <label for="disability">장애인 수:</label><br/>
                            <select name="taxFormVO.disability" id="disability" class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <br/><br/>
<%--                            <c:if test="${memberId != 23}">--%>
                            <label>부녀자 여부:</label>
                            <div class="choice-button">
                                <input type="radio" id="woman_yes" name="taxFormVO.womanDeduction" value="yes">
                                <label for="woman_yes">O</label>
                                <input type="radio" id="woman_no" name="taxFormVO.womanDeduction" value="no">
                                <label for="woman_no">X</label>
                            </div>
                            <br/>
                            <label>한부모 여부:</label>
                            <div class="choice-button">
                                <input type="radio" id="singleParent_yes" name="taxFormVO.singleParent" value="yes">
                                <label for="singleParent_yes">O</label>
                                <input type="radio" id="singleParent_no" name="taxFormVO.singleParent" value="no">
                                <label for="singleParent_no">X</label>
                            </div>
                            <br/>
<%--                            </c:if>--%>
                            <span style="margin-left: 50px">
                            <button type="button" class="prev-button" data-step="3">이전</button>
                            <button type="submit" class="submit-button">제출하기</button>
                            </span>
                        </fieldset>
                    </div>
                </form>
            </div>
        </div>
    </div>


</section>




<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>



<%--progress bar--%>
<script>
    let currentStep = 1;
    // 클릭으로 이동하기
    $(".step").click(function () {
        $(this).addClass("active").prevAll().addClass("active");
        $(this).nextAll().removeClass("active");
    });

    $(".step01").click(function () {
        $("#line-progress").css("width", "8%");
        $(".step1").addClass("active").siblings().removeClass("active");
    });

    $(".step02").click(function () {
        $("#line-progress").css("width", "50%");
        $(".step2").addClass("active").siblings().removeClass("active");
    });

    $(".step03").click(function () {
        $("#line-progress").css("width", "100%");
        $(".step3").addClass("active").siblings().removeClass("active");
    });


    // 버튼으로 이동하기
    $(".prev-button, .next-button").click(function () {
        if ($(this).hasClass('next-button')) {
            currentStep++;
        } else {
            currentStep--;
        }
        updateStep();
    });

    function updateStep() {
        let progressPercentages = [0, 8, 50, 100];

        $(".step").removeClass("active");
        $(".section-content").removeClass("active");

        $(`.step0${currentStep}`).addClass("active").prevAll().addClass("active");
        $(".section-content.step" + currentStep).addClass("active");
        $("#line-progress").css("width", progressPercentages[currentStep] + "%");
    }
</script>

</body>

</html>