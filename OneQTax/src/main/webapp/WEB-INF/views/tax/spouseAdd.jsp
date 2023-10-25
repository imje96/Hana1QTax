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
    <link href="../../../resources/css/tax.css" rel="stylesheet">
    <link href="../../../resources/css/main.css" rel="stylesheet">


    <script
            src="https://www.chatbase.co/embed.min.js"
            chatbotId="aAn7wOmZmfF1MQ-xG1wpb"
            domain="www.chatbase.co"
            defer>
    </script>

    <style>
        .copy-text{
            padding: 10px 30px;
            background: #f8f2ce;
            border-radius: 10px;
            font-size: 24px;
        }
        .container2 h3 {
            font-size: 25px;
        }

        .inviteForm {
            font-size: 28px;
            font-weight: bold;
            /* display: flex; */
            border: 4px solid #a6c9c9;
            box-shadow: 0 6px 17px rgba(0, 0, 0, 0.4);
            border-radius: 15px;
            padding: 40px 40px 0 40px;
            margin: 0 0 20px 0;
            transition: background-color 0.4s, transform 0.4s;
        }

        .inviteForm:hover {
            transform: scale(1.05);
            /* hover 시 약간 확대되는 효과 */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            /* hover 시 그림자 약간 강화 */
        }
            .form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .pointBtn {
            display: inline-block;
            color: #05413d;
            padding: 15px 20px;
            margin: 20px 120px;
            width: 350px;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            font-size: 21px;
            cursor: pointer;
            background-color: #fdd0e4;
            font-weight: 600;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .modalBtn {
            display: inline-block;
            color: #05413d;
            padding: 15px 20px;
            margin: 20px 120px;
            width: 350px;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            font-size: 21px;
            cursor: pointer;
            background-color: #c7dedd;
            font-weight: 600;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        #spouseEmail {
            height: 40px;
            width: 250px;
            padding: 0 20px;
            font-size: 20px;
        }

        .text-box2 {
            background: #eaf3f3;
            border-radius: 10px;
            margin: 20px 0;
            padding: 20px 100px;
            text-align: left;
            width: 800px;
            font-size: 23px;
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
                <h3 style="color: #065859; margin-bottom: 15px;">연말정산 플래너</h3>
                <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/simulationMain"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">연말정산 안내</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxSimulation"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">연말정산 시뮬레이션</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/simulationResult" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">연말정산 결과</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/spouseAgreement"
                   style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">우리집 돈관리 초대하기</h6>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/spouseResult" style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">우리집 돈관리 리포트</div>
                </a>
            </div>
        </div>


        <div class="section">
            <div class="container-title">
                <h2>나의 배우자 초대하기</h2>
                <br/>
                <span style="color: #615e5e"><h3>배우자를 초대하여 우리 부부의 연말정산 현황을 파악하고 절세 방법을 제안받아보세요.</h3></span>
            </div>
            <br/>
            <div class="container2">
               <div class="copy-text"> 함께 번 돈, 똑똑하게 활용하자! 맞벌이 부부를 위한 연말정산 전략 🤵👰</div>
                <img src="../../../resources/img/spouse.png">

                <h2>💌 배우자 초대하고 <span style="color: #ff328b; font-size: 30px;">맞벌이 부부 절세 전략</span> 확인해 보기 </h2><br/><br/>
               부부의 지출과 절세 항목을 한 번에 파악하며 최적의 소비 전략을 제시해드릴게요.<br/>

                <br/><br/>
                <span style="background: #f8f2ce"> <h5>🔊 이런 분들이 사용하면 좋아요 </h5></span>

                <div class="text-box2">
                    ✅  현재 맞벌이 부부이다 / 부부가 연말정산 대상자이다
                    <br/><br/>
                    ✅  절세를 위해 공동의 소비를 전략적으로 관리하는 것에 관심이 있다
                    <br/><br/>
                    ✅  연말정산이 복잡해서 부부의 소비 전략을 수립하는데 어려움을 느끼는 부부
                    <br/><br/>
                    ✅  서로의 금융 습관을 이해하고 존중하며, 더 나은 금융전략을 찾고자 하는 부부
                    <br/><br/>
                    ✅  프라이버시는 지키면서 절세 전략을 수립하고 싶은 부부
                </div>
                <br/><br/>
                배우자 연결을 위해 배우자를 등록하는 과정이 필요해요. 배우자는 1명만 등록할 수 있습니다.<br/><br/>
                <h3>배우자의 하나카드 아이디를 입력해주세요</h3><br/>
                👇 👇<br/><br/>

                    <div class="inviteForm">
                        <form id="spouseInviteForm" method="post">
                            <label for="spouseEmail">배우자의 하나카드 아이디: </label>
                            <input type="email" id="spouseEmail" name="spouseEmail" placeholder="example@example.com" required><br>
                            <button class="pointBtn" type="button" id="submitBtn">배우자 등록하기</button>
                        </form>
                        <br/>
                    </div>
                    <br/>
                <br/>
                    <h3>만약, 배우자와의 연결을 해제하고 싶다면? </h3>

                    <button class="modalBtn" type="submit">배우자 등록 해제하기</button>

                <div class="invitation">
                    <div class="envelope"></div>
                    <div class="letter"></div>
                    <div class="seal"></div>
                    <div class="open">
                        <div class="card-container">
                            <div class="card">
                                <div class="front"></div>
                                <div class="back"></div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>
</div>
<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {
        $("#submitBtn").on("click", function(e) {
            e.preventDefault();

            $.ajax({
                type: "POST",
                url: "/spouseInvite",
                data: $("#spouseInviteForm").serialize(),
                success: function(data) {
                    alert("배우자 등록이 완료되었습니다.");
                    window.location.href = '/spouseAdd';
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert("오류가 발생했습니다. 다시 시도해 주세요.");
                }
            });
        });
    });
</script>
</body>
</html>