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
            <h3 style="color: #018c8d; margin-bottom: 15px;">연말정산플래너</h3>
            <hr style="width: 200px; height: 5px; background-color: #018c8d; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxMain"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 안내</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxRefund" style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">연말정산 시뮬레이션</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxTest"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 결과</div>
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

                <form id="multiStepForm" method="post" action="your_server_endpoint_here">
                    <div id="progress-content-section">
                        <!-- Step 1 Content -->
                        <fieldset class="section-content step1 active" data-step="1">
<%--                            <legend>STEP 1: 가족구성 정보</legend>--%>
                            <h3>STEP 1: 가족구성 정보</h3>

                            <h2>Q2. 손님의 가족 구성정보를 알려주세요</h2>
                            <label>배우자 공제 유/무:</label>
                            <div class="choice-button">
                                <input type="radio" id="spouse_deduction_yes" name="spouse_deduction" value="yes">
                                <label for="spouse_deduction_yes">O</label>
                                <input type="radio" id="spouse_deduction_no" name="spouse_deduction" value="no">
                                <label for="spouse_deduction_no">X</label>
                            </div>
                            <br/>
                            <label for="child_count_step1">만 20세 이하 자녀 수:</label><br/>
                            <select name="child_count_step1" id="child_count_step1" class="content-dropdown">
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
                            <label for="adopted_child_count_step1">출산/입양 자녀 수:</label><br/>
                            <select name="adopted_child_count_step1" id="adopted_child_count_step1"
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
                            <button type="button" class="next-button">다음</button>
                        </fieldset>

                        <!-- Step 2 Content -->
                        <fieldset class="section-content step2" data-step="2">
                            <h3>STEP 2: 부양가족 정보</h3>

                            <h2>Q3. 손님의 부양가족 정보를 알려주세요</h2>

                            <label for="direct_ancestor_count">직계존속 수:</label><br/>
                            <select name="direct_ancestor_count" id="direct_ancestor_count"
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
                            <label for="adopted_child_tax_deduction_count">출산/입양 자녀 수(세액공제):</label><br/>
                            <select name="adopted_child_tax_deduction_count" id="adopted_child_tax_deduction_count"
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
                            <br/>
                            <label for="senior_count">경로자 수:</label><br/>
                            <select name="senior_count" id="senior_count" class="content-dropdown">
                                <option value="0">0명</option>
                                <option value="1">1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                            <br/><br/>
                            <label for="disability_count">장애인 수:</label><br/>
                            <select name="disability_count" id="disability_count" class="content-dropdown">
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
                                <input type="radio" id="woman_yes" name="woman_deduction" value="yes">
                                <label for="woman_yes">O</label>
                                <input type="radio" id="woman_no" name="woman_deduction" value="no">
                                <label for="woman_no">X</label>
                            </div>
                            <br/>
                            <label>한부모 여부:</label>
                            <div class="choice-button">
                                <input type="radio" id="single_parent_yes" name="single_parent" value="yes">
                                <label for="single_parent_yes">O</label>
                                <input type="radio" id="single_parent_no" name="single_parent" value="no">
                                <label for="single_parent_no">X</label>
                            </div>
                            <br/>
                            <button type="button" class="prev-button" data-step="2">이전</button>
                            <button type="button" class="next-button">다음</button>
                        </fieldset>

                        <!-- Step 3 Content -->
                        <!-- 모달창 -->
                        <fieldset class="section-content step3" data-step="3">
                            <h3>STEP 3</h3>

                            <div class="total-amount-box modal-trigger" data-target="detailsModal1">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>연금보험료</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal1">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>주택자금/주택마련저축</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal3">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>신용카드</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal4">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>추가소득</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal5">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>연금계좌</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal6">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">0%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>보장성보험</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal7">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>의료비</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal8">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>교육비</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal9">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>기부금</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal10">
                                <!-- id="showModal" 추가 -->
                                <div class="percent">90%달성</div>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>월세</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt;</h5>
                                        <br/>
                                        <p2>1,000,000원</p2>
                                    </div>
                                </div>
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

<div class="modal" id="detailsModal1">a
    <div class="modal-content">

        <span class="close">&times;</span>
        <h3>연금보험료</h3>
        <p>근로자 4대 보험 이외 개인연금저축 납입현황을 확인해주세요.</p>
        <br/>
        <p>기준일</p>
        <br/>
        <div class="modal-amount-box">
            <div class="modal-amount-text">
                <h5>총 납입액</h5>
                <h5>소득 공제 금액</h5>
            </div>
            <div class="modal-amount-money">
                <p2>5,170,000원</p2><br/>
                <p2>5,170,000원</p2>
            </div>
        </div>
            <hr>
        <div class="modal-amount-box">
            <div class="modal-amount-text">
                <h5>건강보험료 납입공제</h5>
                <h5>고용보험료 납입공제</h5>
                <h5>국민연금 납입공제</h5>
                <h5>개인연금저축 보험</h5>
                <h5>기타 납입연금</h5>
            </div>
            <div class="modal-amount-money">
                <p2>2,200,000원</p2><br/>
                <p2>495,000원</p2><br/>
                <p2>2,475,000원</p2><br/>
                <p2>0원</p2><br/>
                <p2>0원</p2>
            </div>
        </div>
            <div class="modal-amount-explanation">
                <p2>기타 납입연금?</p2>
                <p>	&#183; 공무원 연금, 군인연금 </p>
            </div>

    </div>
        <ul>
            <li>조건1: <span id="condition1Amount">0원</span></li>
            <li>조건2: <span id="condition2Amount">0원</span></li>
            <li>조건3: <span id="condition3Amount">0원</span></li>
            <!-- ... 다른 조건들 ... -->
        </ul>
    </div>
</div>

<div class="modal" id="detailsModal2">
    <div class="modal-content">

        <span class="close">&times;</span>
        <h3>세부사항</h3>
        <ul>
            <li>조건1: <span id="condition4Amount">0원</span></li>
            <li>조건2: <span id="condition5Amount">0원</span></li>
            <li>조건3: <span id="condition6Amount">0원</span></li>
            <!-- ... 다른 조건들 ... -->
        </ul>
    </div>


</div>

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
<%--모달 표시 및 숨기기--%>
<script>
    const triggers = document.querySelectorAll('.modal-trigger');
    triggers.forEach(trigger => {
        trigger.addEventListener('click', function () {
            const targetId = this.getAttribute('data-target');
            const targetModal = document.getElementById(targetId);
            targetModal.style.display = 'block';
        });
    });

    const modals = document.querySelectorAll('.modal');
    modals.forEach(modal => {
        const closeBtn = modal.querySelector('.close');
        closeBtn.addEventListener('click', function () {
            modal.style.display = 'none';
        });

        // modal-content를 클릭하면 모달이 닫히지 않도록 수정
        // modal.querySelector('.modal-content').addEventListener('click', function (event) {
        //     event.stopPropagation();
        // });
    });

    window.addEventListener('click', function (event) {
        if (event.target.classList.contains('modal')) {
            event.target.style.display = 'none';
        }
    });

</script>


<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>