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


    <!-- Template Stylesheet -->
    <link
            href="${ pageContext.request.contextPath }/resources/css/style.css"
            rel="stylesheet">

    <style>
        .section {
            width: 1700px;
        }

        .copy-text {
            padding: 10px 30px;
            background: #f8f2ce;
            border-radius: 10px;
            font-size: 24px;
        }

        .copy-text2 {
            background: #c7dedd;
            border-radius: 10px;
            font-size: 24px;
            width: 600px;
            padding: 10px 20px 10px 50px;
            line-height: 2em;
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
            padding: 40px 20px 0 40px;
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

        .container2 h3 {
            font-size: 26px;
        }

        .container2 p {
            font-size: 20px;
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

        <div class="section">
            <div class="container-title">
                <h2>💌 <span style="color: #00847d; font-size: 32px">${name}</span>님으로부터 초대장이 도착했습니다 </h2>
                <br/>
                <span style="color: #615e5e"><h3>초대를 수락하여 우리 부부의 연말정산 현황을 파악하고 절세 혜택을 누려보세요</h3></span>
            </div>
            <br/>
            <div class="container2">
                <h3>우리집, 이번 년도엔 <span style="color: #fd328a"> 환급</span>받을 수 있을까?</h3><br/>
                <div class="copy-text"> 함께 번 돈, 똑똑하게 활용하자! 맞벌이 부부를 위한 연말정산 전략 🤵👰</div>
                <br/>
                부부의 지출과 절세 항목을 한 번에 파악하며 최적의 소비 전략을 제시해드릴게요.<br/><br/>
                <img src="../../../resources/img/family.png"><br/>

                <h2>✔ 초대 수락하고 <span style="color: #ff328b; font-size: 30px;">맞벌이 부부 절세 전략</span> 확인해 보기</h2>
                <br/><br/>
                <div class="copy-text2"><h5> 우리 부부를 기준으로 절세 전략을 제안받을 수 있어요</h5>
                    <p>상황에 맞는 절세 전략을 알아보세요</p>
                </div>
                <br/>
                <div class="copy-text2"><h5> 프라이버시 걱정 마세요</h5>
                    <p>자세한 소비내역은 공유되지 않아요</p>
                </div>
                <br/>
                <div class="copy-text2"><h5>가족이 함께하면 절세 관리 더 잘할 수 있어요</h5>
                    <p>한 번만 연결하면 따로 시간 낼 필요 없이 우리집 소득공제현황을 한눈에</p>
                </div>
                <br/>

                <br/><br/>
                <span style="background: #f8f2ce"> <h5>🔊 이런 분들이 사용하면 좋아요 </h5></span>

                <div class="text-box2">
                    ✅ 현재 맞벌이 부부이다 / 부부가 연말정산 대상자이다
                    <br/><br/>
                    ✅ 절세를 위해 공동의 소비를 전략적으로 관리하는 것에 관심이 있다
                    <br/><br/>
                    ✅ 연말정산이 복잡해서 부부의 소비 전략을 수립하는데 어려움을 느끼는 부부
                    <br/><br/>
                    ✅ 서로의 금융 습관을 이해하고 존중하며, 더 나은 금융전략을 찾고자 하는 부부
                    <br/><br/>
                    ✅ 프라이버시는 지키면서 절세 전략을 수립하고 싶은 부부
                </div>
                <br/><br/>
                <h3>서비스 이용을 위해 수락하기 버튼을 눌러주세요</h3><br/>
                👇 👇<br/>

                <%--                <div class="inviteForm">--%>
<%--                <form id="spouseInviteForm" method="post">--%>
<%--                    <button class="pointBtn" type="button" id="submitBtn">초대 수락하기</button>--%>
<%--                <form id="spouseInviteForm" method="post">--%>
<%--                    <input type="hidden" id="hiddenMemberId" value="${memberId}"> <!-- 이렇게 memberId를 받아옵니다. -->--%>
<%--                    <button class="pointBtn" type="button" id="submitBtn">초대 수락하기</button>--%>
<%--                </form>--%>

                <button class="pointBtn" type="button" id="acceptBtn" data-member-id="${memberId}">수락하기</button>


                <br/>
                <%--                </div>--%>
                <br/>
                <br/>


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

                <%--                   <button class="pointBtn" onclick="acceptInvitation(${relationId})">Accept Invitation</button>--%>
                <%--                   <button class="pointBtn">초대 수락하기</button>--%>


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
    // $(document).ready(function() {
    //     var memberId = $("#hiddenMemberId").val();
    //
    //     $("#submitBtn").click(function() {
    //         // 초대 수락 로직 실행 요청 보내기
    //         $.post("/acceptApi/execute/" + memberId, function(data) {
    //             if(data === "Success") {
    //                 alert("초대가 수락되었습니다.");
    //             } else {
    //                 alert("오류가 발생했습니다. 다시 시도해 주세요.");
    //             }
    //         });
    //     });
    // });


    $(document).ready(function() {
        $("#acceptBtn").on("click", function() {
            var memberId = $(this).data('member-id');

            $.ajax({
                type: "POST",
                url: "/confirmInvitation/" + memberId,
                success: function(response) {
                    if(response === "Success") {
                        alert("초대를 수락했습니다.");
                    } else {
                        alert("오류가 발생했습니다. 다시 시도해주세요.");
                    }
                },
                error: function() {
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    });



</script>
</body>
</html>