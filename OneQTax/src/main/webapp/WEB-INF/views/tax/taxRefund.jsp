<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <link href="../../../resources/css/taxRefund.css" rel="stylesheet">

    <%--    chartjs 추가--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link href="../../../resources/css/tax.css" rel="stylesheet">
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
                <h3 style="color: #018c8d; margin-bottom: 15px;">카드황금비율계산</h3>
                <hr style="width: 200px; height: 5px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxMain"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소득공제 안내</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxInfo" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 계산</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxThreshold"
                   style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">소비 문턱넘기기</h6>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">카드황금비율 결과</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">우리집 돈관리</div>
                </a>
                <hr style="width: 200px;">
            </div>
        </div>
        <div class="container1">
            <div class="progress-wrapper">
                <div id="progress-bar-container">
                    <ul>
                        <li class="step step01 active">
                            <div class="step-inner">Step 1</div>
                        </li>
                        <li class="step step02">
                            <div class="step-inner">Step 2</div>
                        </li>
                        <li class="step step03">
                            <div class="step-inner">Step 3</div>
                        </li>
                    </ul>
                    <div id="line">
                        <div id="line-progress"></div>
                    </div>

                    <form id="multiStepForm" method="post" action="your_server_endpoint_here">
                        <div id="progress-content-section">
                            <div class="section-content step1 active" data-step="1">
                                <h2>Step 1</h2>

                                <h2>Q2. 손님의 가족구성 정보를 알려주세요</h2>

                                <h3>배우자 공제 유/무</h3>
                                <input type="radio" name="spouse_deduction" value="yes" id="yes">
                                <label for="yes">유</label>
                                <input type="radio" name="spouse_deduction" value="no" id="no">
                                <label for="no">무</label>

                                <h3>만 20세 이하 자녀 수</h3>
                                <select name="child_count" class="content-dropdown">
                                    <option value="0">0명</option>
                                    <option value="1">1명</option>
                                    <option value="2">2명</option>
                                </select>

                                <h3>출산/입양 자녀 수</h3>
                                <select name="adopted_child_count" class="content-dropdown">
                                    <option value="0">0명</option>
                                    <option value="1">1명</option>
                                    <option value="2">2명</option>
                                </select>

                                <br>
                                <button type="button" class="next-button">다음</button>
                            </div>

                            <div class="section-content step2" data-step="2">
                                <h2>Step 2</h2>
                                <p>
                                    Lorem ipsum...
                                </p>

                                <button type="button" class="prev-button" data-step="2">이전</button>
                                <button type="button" class="next-button">다음</button>
                            </div>

                            <div class="section-content step3" data-step="3">
                                <h2>Step 3</h2>
                                <p>
                                    Lorem ipsum...
                                </p>
                                <button type="button" class="prev-button" data-step="3">이전</button>
                                <button type="submit" class="submit-button">제출하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>


<script>
    $(".step").click(function () {
        triggerStepClick($(this));
    });

    $(".prev-button, .next-button").click(function() {
        let currentStep;
        if ($(this).hasClass('next-button')) {
            currentStep = $(".step.active").length;
        } else {
            currentStep = parseInt($(this).data('step'));
        }

        if($(this).hasClass('next-button')) {
            triggerStepClick($(`.step0${currentStep + 1}`));
        } else {
            triggerStepClick($(`.step0${currentStep - 1}`));
        }
    });

    function triggerStepClick(stepElement) {
        stepElement.addClass("active").prevAll().addClass("active");
        stepElement.nextAll().removeClass("active");

        if (stepElement.hasClass('step01')) {
            $("#line-progress").css("width", "8%");
            $(".step1").addClass("active").siblings().removeClass("active");
        } else if (stepElement.hasClass('step02')) {
            $("#line-progress").css("width", "50%");
            $(".step2").addClass("active").siblings().removeClass("active");
        } else if (stepElement.hasClass('step03')) {
            $("#line-progress").css("width", "100%");
            $(".step3").addClass("active").siblings().removeClass("active");
        }
    }


</script>

<%--<script>--%>
<%--    $(document).ready(function() {--%>

<%--        // 원래의 스텝 클릭 이벤트--%>
<%--        $(".step").click(function () {--%>
<%--            $(this).addClass("active").prevAll().addClass("active");--%>
<%--            $(this).nextAll().removeClass("active");--%>
<%--        });--%>

<%--        // 다음 및 이전 버튼을 사용하여 스텝 진행--%>
<%--        $('.next-button').click(function() {--%>
<%--            const currentStep = $(this).closest('.section-content').data('step');--%>
<%--            switch (currentStep) {--%>
<%--                case 1:--%>
<%--                    $(".step02").trigger("click");--%>
<%--                    break;--%>
<%--                case 2:--%>
<%--                    $(".step03").trigger("click");--%>
<%--                    break;--%>
<%--            }--%>
<%--        });--%>

<%--        $('.prev-button').click(function() {--%>
<%--            const currentStep = $(this).closest('.section-content').data('step');--%>
<%--            switch (currentStep) {--%>
<%--                case 2:--%>
<%--                    $(".step01").trigger("click");--%>
<%--                    break;--%>
<%--                case 3:--%>
<%--                    $(".step02").trigger("click");--%>
<%--                    break;--%>
<%--            }--%>
<%--        });--%>

<%--        // 원래의 코드--%>
<%--        $(".step01").click(function () {--%>
<%--            $("#line-progress").css("width", "8%");--%>
<%--            $(".step1").addClass("active").siblings().removeClass("active");--%>
<%--        });--%>

<%--        $(".step02").click(function () {--%>
<%--            $("#line-progress").css("width", "50%");--%>
<%--            $(".step2").addClass("active").siblings().removeClass("active");--%>
<%--        });--%>

<%--        $(".step03").click(function () {--%>
<%--            $("#line-progress").css("width", "100%");--%>
<%--            $(".step3").addClass("active").siblings().removeClass("active");--%>
<%--        });--%>

<%--    //     버튼 누르면 색 바뀜--%>
<%--        $(".step").click(function () {--%>
<%--            $(this).addClass("active").prevAll().addClass("active");--%>
<%--            $(this).nextAll().removeClass("active");--%>
<%--        });--%>

<%--        $(".step01").click(function () {--%>
<%--            $("#line-progress").css("width", "8%");--%>
<%--            $(".step1").addClass("active").siblings().removeClass("active");--%>
<%--        });--%>

<%--        $(".step02").click(function () {--%>
<%--            $("#line-progress").css("width", "50%");--%>
<%--            $(".step2").addClass("active").siblings().removeClass("active");--%>
<%--        });--%>

<%--        $(".step03").click(function () {--%>
<%--            $("#line-progress").css("width", "100%");--%>
<%--            $(".step3").addClass("active").siblings().removeClass("active");--%>
<%--        });--%>

<%--    });--%>
<%--</script>--%>

<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>