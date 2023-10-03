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

    <!-- font awseom -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <%--    chartjs 추가--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="../../../resources/css/tax.css" rel="stylesheet">


    <!-- Add Bootstrap CSS -->
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
        flex-direction: column;
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

    .container-right {
        background-color: #efecec;
        width: 40%;
        height: 1000px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        padding-right: 25px;
        /*box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);*/
    }

    .title {
        text-align-all: center;
    }

    .card-box {
        background-color: #fdfdfd;
        border-radius: 10px;
        padding: 20px 20px;
        margin: 25px 25px;
        /*width: 95%;*/
        height: 674px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        /*border: 15px solid #00857e;*/
        /* transform과 box-shadow 효과를 0.3초 동안 부드럽게 적용 */
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    /*.card-box:hover {*/
    /*    !* hover 시 약간 확대되는 효과 *!*/
    /*    transform: scale(1.04);*/
    /*    !* hover 시 그림자 약간 강화 *!*/
    /*    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);*/
    /*}*/

    .card-box2 {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px 0;
        margin: 25px 25px;
        width: 90%;
        height: 700px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .card-box h3 {
        font-size: 25px;
    }

    .monthly-box {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px 25px;
        margin: 25px 20px 20px 0;
        width: 90%;
        height: 200px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .category-box {
        background-color: #fff;
        border-radius: 10px;
        padding: 10px 25px;
        margin: 0 20px 25px 0;
        width: 90%;
        height: 725px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }


    .header-container {
        color: #1A202C;
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 10px;
        font-weight: 600;
        width: 580px;
    }

    .section-header {
        line-height: 24px;
        font-size: 20px;
    }

    .date-selector {
        padding: 10px 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 6px;
        color: #666B85;
        background: #b4cece;
        box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.2);
    }

    .date-selector span {
        font-weight: 600;
        font-size: 18px;
        line-height: 15px;
    }

    .info-box1 {
        background-color: rgb(255 223 237) !important;
        /*padding: 10px;*/
        border-radius: 10px;
        text-align: center;
        width: 90%;
        height: 300px;
        padding: 20px 16px;
        margin-top: 20px;
        /*color: #ffffff;*/
    }


    .info-box2 {
        /*position: absolute;*/
        /*top: 10px;*/
        /*right: 10px;*/
        background-color: rgb(239, 241, 243) !important;
        /*padding: 10px;*/
        border-radius: 10px;
        text-align: center;
        width: 90%;
        height: 270px;
        padding: 20px 16px;
        margin-top: 40px;
    }

    /*   금액 표시 */
    .price-currency {
        line-height: 21px;
        font-size: 14px;
        font-weight: 600;
        color: #90A3BF;
        /*margin-left: 8px;*/
    }


    .detailBtn {
        display: inline-block;
        color: #05413d;
        padding: 7px;
        width: 150px;
        border: none;
        border-radius: 7px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        cursor: pointer;
        background-color: #fdd0e4;
        margin-left: 425px;
        transition: background-color 0.3s, transform 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .detailBtn:hover {
        background-color: #fa63a5;
        /* hover 시 배경색 변경 */
        transform: scale(1.05);
        /* hover 시 약간 확대되는 효과 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        /* hover 시 그림자 약간 강화 */
    }

    #headerLogo2 {
        display: flex;
        align-items: center;
        width: 1644px;
        padding: 10px 0 0 250px;
        justify-content: space-between;
        font-size: 18px;
    }

    .upper-section {
        display: flex;
        width: 1200px;
    }

    .lower-section {
        display: flex;
        width: 1200px;
    }

    /*  카드 타이틀  */
    .card_title {
        text-align: center;
        color: #000000;
        font-size: 22px;
    }

    .personal_info {
        text-align: center;
        color: #7a7a7a;
        font-size: 17px;
    }

    .card_subtitle {
        text-align: center;
        color: #ffffff;
        font-size: 18px;
        background: #e50745;
        padding: 5px 10px;
        border-radius: 15px;
    }

    .card_brand {
        text-align: center;
        color: #ffffff;
        font-size: 18px;
        background: #afafaf;
        padding: 5px 10px;
        border-radius: 15px;
    }

    .card_number {
        text-align: center;
        /*color: #ffffff;*/
        font-size: 18px;
        /*background: #e50745;*/
        /*padding: 5px 10px;*/
        border-radius: 15px;
        margin-top: 5px;
    }

    .card-benefits {
        color: #000000;
        font-size: 15px;
        border: 3px solid #FFFFFF;
        border-radius: 10px;
        padding: 10px 0;
        line-height: 1.8;
        text-align: left;
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin: 10px 0;
    }

    .card-benefits2 {
        color: #000000;
        font-size: 20px;
        border: 3px solid #FFFFFF;
        border-radius: 10px;
        padding: 10px 0;
        line-height: 1.8;
        text-align: left;
        margin: 10px 0;
    }

    .point {
        color: #2a9791;
        font-weight: bold;
    }

    .icon-box {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        font-size: 14px;
        color: #4f4949;
    }

    .icon-bg {
        background: #05413d;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .icon-bg:hover {
        /* hover 시 약간 확대되는 효과 */
        transform: scale(1.05);
        /* hover 시 그림자 약간 강화 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
    }

    /*  모달창 버튼  */
    .modalBtn2 {
        border: none;
        border-radius: 5px;
        text-align: center;
        font-size: 15px;
        cursor: pointer;
        background: none !important;
        color: #7a7a7a;
        transition: background-color 0.3s, transform 0.3s;
    }

    .modalBtn2:hover {
        transform: scale(1.05);
        /* hover 시 약간 확대되는 효과 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        /* hover 시 그림자 약간 강화 */
    }

    .modal-content2 {
        position: relative;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-direction: column;
        flex-direction: column;
        /* width: 100%; */
        pointer-events: auto;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid rgba(0, 0, 0, .2);
        border-radius: 0.3rem;
        outline: 0;
    }

         /*  드랍다운  */


    .inner-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 50vh;
        gap: 20px;
    }

    @media only screen and (max-width: 767px) {
        .inner-wrapper {
            flex-direction: column;
        }
    }

    .white-wrapper {
        min-height: 50vh;
    }

    .hex-select {
        position: relative;
        display: inline-block;
        padding: .75rem 0;
        cursor: pointer;
    }

    .hex-select:after {
        content: '';
        width: .35rem;
        height: .35rem;
        display: block;
        position: absolute;
        top: 50%;
        right: 1rem;
        transform: translateY(-50%) rotate(-135deg);
        border-right: .125rem solid #ddd;
        border-bottom: .125rem solid #ddd;
    }

    .hex-select select,
    .hex-select .custom-select {
        position: relative;
        appearance: none;
        background: #fdfdfd;
        /*color: #ddd;*/
        font-family: inherit;
        height: 3.5rem;
        line-height: 3.5rem;
        outline: none;
        padding: 0 1.5rem;
        transition: all .35s ease-in-out;
        width: 400px;
        font-size: 21px;
        font-weight: 700;
        text-transform: uppercase;
        border: 1px solid #222;
        border-radius: .35rem;
        cursor: pointer;
    }

    .select-options {
        position: absolute;
        top: 100%;
        left: 0;
        display: flex;
        flex-direction: column;
        background: #f3f0f0;
        border: 1px solid #444;
        border-radius: .35rem;
        list-style: none;
        padding: 0;
        margin: .75rem 0;
        opacity: 0;
        visibility: hidden;
        pointer-events: none;
        max-height: 250px;
        overflow-y: auto;
        transition: .35s ease-in-out all;
    }

    .hex-select .select-options li {
        height: 3rem;
        line-height: 3rem;
        outline: none;
        padding: 0 1.5rem;
        text-transform: none;
        letter-spacing: .025rem;
        border-bottom: 1px solid #333;
        cursor: pointer;
        transition: .35s ease-in-out all;
    }

    .hex-select .select-options li:hover {
        background: #777777;
        color: #FFFFFF;
    }

    .hex-select:hover select,
    .hex-select:hover .custom-select {
        border-color: #444;
    }

    .hex-select:hover .select-options {
        opacity: 1;
        visibility: visible;
        pointer-events: all;
    }


</style>


<body>

<!--contents-->


<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>

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
                <h6 style="color: black; margin-bottom: 15px;">내 카드 확인하기</h6>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/transactionList" style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">실적 확인하기</div>
            </a>
            <hr style="width: 200px; margin-bottom: 15px;">
            <a href="${pageContext.request.contextPath}/transactionList"
               style="display: block; margin-bottom: 20px;">
                <div style="color: grey; margin-bottom: 15px;">카드 사용내역</div>
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
        <%--            <div class="container-xxl py-5">--%>
        <%--            <div class="container-title" data-wow-delay="0.1s" style="max-width: 600px;">--%>
        <div class="container-title">
            <%--                <h6 class="text-primary">--%>
            <%--                    Hana 1QTax <span style="color: #ff328b;">연말정산</span>--%>
            <%--                </h6>--%>
            <%--                    💰--%>
            <h2>실적 충족 조회</h2>
            <br/>
            <span style="color: #615e5e"><h3>카드의 실적 충족 현황을 확인해보세요</h3></span>
        </div>


        <div class="section2">
            <div class="uppper-section">
                <div class="card-box">
                    <h3> 마이 하나카드</h3>


                        <div class="white-wrapper"></div>

                        <div class="inner-wrapper">

                            <div class="hex-select hex-select-js">
                                <select name="example" id="example-custom">
<%--                                    <option value="">Custom select....</option>--%>
                                    <option value="memberCard1">원더카드 LIVING</option>
                                    <option value="memberCard2">1Q Daily+(원큐데일리플러스)</option>
                                    <option value="memberCard3">모두의 일상 카드</option>
                                    <option value="otherCard1">펭수 노리 체크카드</option>
                                    <option value="otherCard2">네이버페이 라인프렌즈 신한카드</option>
                                </select>
                            </div>

                        </div>

                        <div class="white-wrapper"></div>
                    </div>

                    <!-- 그래프 영역 -->
<%--                    <canvas id="myChart"></canvas>--%>



            </div>
        </div>
    </div>
</section>

<%--<div id="myModal" class="modal">--%>
<%--    <div class="modal-content2">--%>
<%--        <span class="close">&times;</span>--%>
<%--        <br/>--%>
<%--        <h2>원더카드 LIVING 업종별 혜택</h2>--%>
<%--        <div class="card-benefits2">--%>
<%--            <div class="flex-box">--%>
<%--                <div class="icon-box">--%>
<%--                    <div class="icon-bg">--%>
<%--                        <i class="fas fa-house" style="font-size: 25px; color: #FFFFFF"></i>--%>
<%--                    </div>--%>
<%--                    생활요금--%>
<%--                </div>--%>
<%--                &nbsp;&nbsp; 아파트관리비, 전기세, 가스비 &nbsp; <span class="point"> 10%</span> 청구할인<br/>--%>
<%--            </div>--%>
<%--            <div class="flex-box">--%>
<%--                <div class="icon-box">--%>
<%--                    <div class="icon-bg">--%>
<%--                        <i class="fas fa-house-medical" style="font-size: 25px; color: #FFFFFF"></i>--%>
<%--                    </div>--%>
<%--                    병원&약국--%>
<%--                </div>--%>
<%--                &nbsp;&nbsp; 병원 및 약국&nbsp; <span class="point"> 10%</span>청구할인<br/>--%>
<%--            </div>--%>
<%--            <div class="flex-box">--%>
<%--                <div class="icon-box">--%>
<%--                    <div class="icon-bg">--%>
<%--                        <i class="fas fa-car" style="font-size: 25px; color: #FFFFFF"></i>--%>
<%--                    </div>--%>
<%--                    주유/택시--%>
<%--                </div>--%>
<%--                &nbsp;&nbsp; SK에너지, GS칼텍스, S-OIL, 현대오일뱅크알뜰주유소&nbsp; <span class="point"> 10%</span>청구할인<br/>--%>
<%--            </div>--%>
<%--            <div class="flex-box">--%>
<%--                <div class="icon-box">--%>
<%--                    <div class="icon-bg">--%>
<%--                        <i class="fas fa-mug-saucer" style="font-size: 25px; color: #FFFFFF"></i>--%>
<%--                    </div>--%>
<%--                    커피--%>
<%--                </div>--%>
<%--                &nbsp;&nbsp;스타벅스, 커피빈, 이디야, 폴바셋, 투썸플레이스, 블루보틀&nbsp; <span class="point"> 10%</span> 청구할인<br/>--%>
<%--            </div>--%>
<%--            &lt;%&ndash;            • 모든 가맹점&nbsp; <span class="point"> 0.3-1.0%</span> 적립<br/>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            • 온라인쇼핑, 통신/교통/자동이체 <span class="point"> 10만원 당 5천머니</span> 적립<br/>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            • 주유 <span class="point"> 5만원당 3천원</span> 청구할인<br/>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            • 아파트관리비/4대보험 <span class="point"> 10만원 당 5천머니</span> 적립<br/>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>
<script>
    // Custom select
    let customSelects = document.querySelectorAll('.hex-select-js');

    customSelects.forEach((element) => {
        const originalSelect = element.querySelector('select');
        const newSelect = document.createElement('div');
        newSelect.className = "custom-select";
        newSelect.innerHTML = '<span>' + originalSelect.options[0].text + '</span>';

        const optionsList = document.createElement('ul');
        optionsList.className = 'select-options';
        newSelect.appendChild(optionsList);

        for (i = 0; i < originalSelect.options.length; ++i) {
            const option = document.createElement('li');
            let optionText = originalSelect.options[i].text,
                optionValue = originalSelect.options[i].value;
            option.className = 'option-item';
            option.innerHTML = optionText;
            option.dataset.optionValue = optionValue;
            optionsList.appendChild(option);

            let event = new Event('change');

            // Adding the click function
            option.addEventListener('click', () => {
                newSelect.querySelector('span').innerHTML = optionText;
                originalSelect.value = optionValue;
                originalSelect.dispatchEvent(event);
            })
        }

        element.appendChild(newSelect);
        originalSelect.style.display = 'none';

        newSelect.addEventListener('click', checkPosition, false);
        newSelect.addEventListener('mouseover', checkPosition, false);
    });
</script>
<script>
    $(document).ready(function() {
        var data1 = [10, 20, 30, 40];
        var data2 = [40, 30, 20, 10];

        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Point 1', 'Point 2', 'Point 3', 'Point 4'],
                datasets: [{
                    label: 'Sample Data',
                    data: data1,
                    borderColor: 'rgba(75, 192, 192, 1)'
                }]
            }
        });

        $('.dropdown-item').click(function(e) {
            e.preventDefault();
            var dataSet = $(this).data('value');

            if(dataSet === 'set1') {
                chart.data.datasets[0].data = data1;
            } else if(dataSet === 'set2') {
                chart.data.datasets[0].data = data2;
            }

            chart.update();
        });
    });

</script>

<%-- 모달창 --%>
<script>
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("openModalBtn1");
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

<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>


</body>
</html>