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
<style>#progress-bar-container li {
    list-style: none;
    float: left;
    width: 50%;
    text-align: center;
    color: #aaa;
    text-transform: uppercase;
    font-size: 11px;
    cursor: pointer;
    font-weight: 700;
    transition: all ease 0.2s;
    vertical-align: bottom;
    height: 60px;
    position: relative;
}</style>

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
            <a href="${pageContext.request.contextPath}/taxSimulation" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 시뮬레이션</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/simulationResult"
               style="display: block; margin-bottom: 20px;">
                <h6 style="color: black; margin-bottom: 15px;">연말정산 결과</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/taxCalculator"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">연말정산 계산기</div>
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
                        <div class="step-inner">결과</div>
                    </li>
                    <li class="step step02" data-step="2">
                        <div class="step-inner">상세내용</div>
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
                            <h3>연말정산 결과</h3>
                                <br/>
                            <h4>납부할 세금 :
                                <td class="text-right"><fmt:formatNumber value="${totalResult.determined_tax}"
                                                                         groupingUsed="true"/>원
                            </h4><br/>
                            <h4>혜택 받는 공제액 :<fmt:formatNumber value="${totalBenefit}" groupingUsed="true"/>원 </h4>
                            <br/><br/>
                            <table class="table-tax">
                                <thead>
                                <tr>
                                    <th class="text-left">항목</th>
                                    <th class="text-left">금액</th>

                                </tr>
                                </thead>
                                <tbody class="table-hover">
                                <tr>
                                    <td class="text-left">1) 근로소득금액</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.income_final}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp(-) 소득공제</td>
                                    <td class="text-right"><fmt:formatNumber
                                            value="${totalResult.total_incomeDeduction}" groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">3) (=) 과세표준</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.tax_base}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbspx 기본세율</td>
                                </tr>
                                <tr>
                                    <td class="text-left">4) (=) 산출세액</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.calculated_amount}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp(-) 세액공제</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.total_taxcredit}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">5) (=) 결정세액</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.determined_tax}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp(-) 기납부세액</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.prepayment_tax}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp6) (=) 납부예상세금</td>
                                    <td class="text-right"><fmt:formatNumber value="${totalResult.determined_tax}"
                                                                             groupingUsed="true"/>원
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <br>
                            <button type="button" class="next-button">추가항목 입력</button>
                        </fieldset>


                        <!-- Step 3 Content -->
                        <!-- 모달창 -->
                        <fieldset class="section-content step2" data-step="2">
                            <h3>상세보기</h3>
                            <p>기준일 : ${totalInfo.result_time}</p>
                            <br/>

                            <div class="total-amount-box modal-trigger" data-target="detailsModal1">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>인적사항</h4>
                                        <br/>
                                        소득 공제 금액 :
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.personal_deduction}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal2">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>근로소득</h4>
                                        <br/>
                                        소득 공제 금액 :
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.income_final}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal3">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>연금보험료</h4>
                                        <br/>
                                        소득 공제 금액 :
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.pension_deduction}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal4">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>주택자금/주택마련저축</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.housing_deduciton}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal5">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>신용카드</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.card_deduction}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal6">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>추가소득</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1>0원</p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal7">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>연금계좌</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.irp_taxcredit}" groupingUsed="true"/>원</p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal8">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">0%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>보장성보험</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.guarantee_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal9">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>의료비</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.medical_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal10">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>교육비</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.education_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal11">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>기부금</h4>
                                        <br/>
                                        소득 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p1><fmt:formatNumber value="${totalResult.donation_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p1>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="total-amount-box modal-trigger" data-target="detailsModal12">
                                <!-- id="showModal" 추가 -->
<%--                                <div class="percent">90%달성</div>--%>
                                <div class="total-text-box">
                                    <div class="total-text">
                                        <h4>월세</h4>
                                        <br/>
                                        세액 공제 금액:
                                    </div>
                                    <div class="more">
                                        <span> </span>
                                        <h5>&gt&gt</h5>
                                        <br/>
                                        <p2><fmt:formatNumber value="${totalResult.rent_taxcredit}"
                                                              groupingUsed="true"/>원
                                        </p2>
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

<div class="modal_simulation" id="detailsModal3">
    <div class="modal-content2">

        <span class="close">&times;</span>
        <form id="updateForm" action="/update" method="post">
            <h3>연금보험료</h3>
            <p>근로자 4대 보험 이외 개인연금저축 납입현황을 확인해주세요.</p>
            <br/>

            <div class="modal-amount-box">
                <div class="modal-amount-text">
                    <h5>총 납입액</h5>
                    <h5>소득 공제 금액</h5>
                </div>
                <div class="modal-amount-money">
                    <span id="totalPension"><fmt:formatNumber value="${totalInfo.irpPension_total}" groupingUsed="true"/>원</span><br/>
                    <p2><fmt:formatNumber value="${totalResult.total_incomeDeduction}" groupingUsed="true"/>원</p2>
                </div>
            </div>
            <hr>
            <div class="modal-amount-box">
                <div class="modal-amount-text">

                    <label for="healthInsurance">건강보험료 납입공제:</label><br/>

                    <label for="employmentInsurance">고용보험료 납입공제:</label><br/>

                    <label for="nationalPension">국민연금 납입공제:</label><br/>


                </div>
                <div class="modal-amount-money-variable">
                    <input type="text" id="healthInsurance" name="health_insurance" oninput="addCommaToNumber(this)" value="<fmt:formatNumber value="${totalInfo.health_insurance}" groupingUsed="true"/>">원<br/>
                    <input type="text" id="employmentInsurance" name="employment_insurance" oninput="addCommaToNumber(this)" value="<fmt:formatNumber value="${totalInfo.employment_insurance}" groupingUsed="true"/>">원<br/>
                    <input type="text" id="nationalPension" name="national_pension" oninput="addCommaToNumber(this)" value="<fmt:formatNumber value="${totalInfo.national_pension}" groupingUsed="true"/>">원<br/>
                </div>
            </div>
            <div class="modal-amount-explanation">
                <p2>기타 납입연금?</p2>
                <br/>
                <p> &#183; 공무원 연금, 군인연금, 사립학교 교직원 연금, 별정 우체국 연금 등 납입한 연금보험료 공제</p>
            </div>
            <p>* 대상금액을 기준으로 조건에 따라 단순 계산한 금액으로 실제 공제금액과 다를 수 있습니다.</p>
            <input type="button" id="pensionBtn" value="Update">
        </form>
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
        $("#line-progress").css("width", "50%");
        $(".step1").addClass("active").siblings().removeClass("active");
    });

    $(".step02").click(function () {
        $("#line-progress").css("width", "100%");
        $(".step2").addClass("active").siblings().removeClass("active");
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
        let progressPercentages = [50, 50, 100];

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

    const modals = document.querySelectorAll('.modal_simulation');
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
        if (event.target.classList.contains('modal_simulation')) {
            event.target.style.display = 'none';
        }
    });

</script>

<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        document.getElementById('pensionBtn').addEventListener('click', updateTotalPension);

        updateTotalPension();
    });

    function updateTotalPension() {
        const healthInsurance = parseInt(document.getElementById('healthInsurance').value.replace(/,/g, '').replace('원', ''));
        const employmentInsurance = parseInt(document.getElementById('employmentInsurance').value.replace(/,/g, '').replace('원', ''));
        const nationalPension = parseInt(document.getElementById('nationalPension').value.replace(/,/g, '').replace('원', ''));


        const totalValue = healthInsurance + employmentInsurance + nationalPension;
        const totalPensionSpan = document.getElementById('totalPension');
        totalPensionSpan.textContent = new Intl.NumberFormat('ko-KR').format(totalValue) + '원';

        const data = {
            totalInfoVO: {
                health_insurance: healthInsurance,
                employment_insurance: employmentInsurance,
                national_pension: nationalPension
                // private_pension: privatePension,
                // other_pension: otherPension
            }
        };

        fetch("/update", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(data)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                document.getElementById('totalPension').textContent = new Intl.NumberFormat('ko-KR', {
                    style: 'currency',
                    currency: 'KRW'
                }).format(data.health_insurance + data.employment_insurance + data.national_pension);
            });
    }


</script>
</body>

</html>