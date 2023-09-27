<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
            <a href="${pageContext.request.contextPath}/taxMain"
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
<%--            <hr style="width: 200px; margin-bottom: 15px;">--%>
<%--            <a href="${pageContext.request.contextPath}/taxCalculator"--%>
<%--               style="display: block; margin-bottom: 20px;">--%>
<%--                <div style="color: grey; margin-bottom: 15px;">연말정산 계산기</div>--%>
<%--            </a>--%>
<%--            <hr style="width: 200px; margin-bottom: 15px;">--%>
<%--            <a href="${pageContext.request.contextPath}/getLatestDeductionResult"--%>
<%--               style="display: block; margin-bottom: 20px;">--%>
<%--                <div style="color: grey; margin-bottom: 15px;">우리집 돈관리</div>--%>
<%--            </a>--%>
<%--            <hr style="width: 200px;">--%>
        </div>
    </div>
    <div class="container1">
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
                    <div id="progress-content-section">
                        <!-- Step 1 Content -->
                        <fieldset class="section-content step1 active" data-step="1">
                            <%--                            <legend>STEP 1: 가족구성 정보</legend>--%>
                            <h3>STEP 1: 총급여정보</h3>

                            <h2>Q2. 손님의 총급여 정보를 알려주세요</h2>
                            <label>총급여 정보</label><br/>
                            <p2>총급여란? 연봉에서 식대나 보육수당 같은 '비과세 소득'을 뺀 금액을 말합니다.</p2>
                            <br/>
                            <br/>

                                <p2>홈택스에서 전년도 총급여정보를 가져왔어요.<br/> 총급여 금액을 확인하고, 실제 금액을 입력해 정확한 정보를 확인해보세요.</p2>
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
                            <button type="button" class="next-button">다음</button>
                        </fieldset>

                        <!-- Step 2 Content -->
                        <fieldset class="section-content step2" data-step="2">
                            <h3>STEP 2: 가족구성 정보</h3>

                            <h2>Q2. 손님의 가족 구성정보를 알려주세요</h2>
                            <label>배우자 공제 유/무:</label>
                            <div class="choice-button">
                                <input type="radio" id="spouseDeduction_yes" name="spouseDeduction" value="yes">
                                <label for="spouseDeduction_yes">O</label>
                                <input type="radio" id="spouseDeduction_no" name="taxFormVO.spouseDeduction" value="no">
                                <label for="spouseDeduction_no">X</label>
                            </div>
                            <br/>
                            <label for="child">만 20세 이하 자녀 수(세액공제):</label><br/>
                            <select name="child" id="child" class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <p>거주자와 생계를 같이하는 연간 소득금액 합계액 100만원 이하인 부양가족</p>
                            <br/>
                            <label for="adoptedChild">출산/입양 자녀 수(세액공제):</label><br/>
                            <select name="taxFormVO.adoptedChild" id="adoptedChild"
                                    class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <foption value="2">2명</foption>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <p>연말정산 적용기간에 출산하거나 입양신고 자녀</p>

                            <br>
                            <button type="button" class="prev-button" data-step="2">이전</button>
                            <button type="button" class="next-button">다음</button>
                        </fieldset>

                        <!-- Step 3 Content -->
                        <!-- 모달창 -->
                        <fieldset class="section-content step3" data-step="3">
                            <h3>STEP 3: 부양가족 정보</h3>

                            <h2>Q3. 손님의 부양가족 정보를 알려주세요</h2>

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
                            <p>거주자와 생계를 같이하는 연간 소득금액 합계액 100만원 이하인 부양가족</p>
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
                            <button type="button" class="prev-button" data-step="3">이전</button>
                            <button type="submit" class="submit-button">제출하기</button>
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

    // $(".step").click(function () {
    //     let stepNum = parseInt($(this).data(`step`));
    //
    //     // currentStep = stepNum;
    //     // updateStep();
    // });
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
<%-- form 대신 jason 형태로 보내기--%>
<script>
    // $(document).ready(function() {
    //     $(".submit-button").on("click", function(event) {
    //         event.preventDefault();
    //
    //         const spouseDeductionValue = document.querySelector('input[name="spouseDeduction"]:checked');
    //         const womanDeductionValue = document.querySelector('input[name="womanDeduction"]:checked');
    //         const singleParentValue = document.querySelector('input[name="singleParent"]:checked');
    //
    //         const data = {
    //             totalIncome: document.getElementById('totalIncome').value,
    //             spouseDeduction: spouseDeductionValue ? spouseDeductionValue.value : null,
    //             child: document.getElementById('child').value,
    //             adoptedChild: document.getElementById('adoptedChild').value,
    //             directAncestor: document.getElementById('directAncestor').value,
    //             siblings: document.getElementById('siblings').value,
    //             senior: document.getElementById('senior').value,
    //             disability: document.getElementById('disability').value,
    //             womanDeduction: womanDeductionValue ? womanDeductionValue.value : null,
    //             singleParent: singleParentValue ? singleParentValue.value : null
    //         };
    //
    //         $.ajax({
    //             url: "/taxSimulation",
    //             type: "POST",
    //             contentType: "application/json",
    //             data: JSON.stringify(data),
    //             success: function(response) {
    //                 // 성공 시 처리
    //             },
    //             error: function(error) {
    //                 // 실패 시 처리
    //             }
    //         });
    //     });
    // });



</script>

</body>

</html>