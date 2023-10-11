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


    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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
            margin-bottom: 40px;
        }
        .pointBtn {
            display: inline-block;
            color: #05413d;
            padding: 15px 20px;
            margin: 10px 120px;
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
                <a href="${pageContext.request.contextPath}/taxSimulationMain"
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
            <br/><br/>
            <div class="container2">

                <div class="flex-box">
                    <div class="copy-text">이제 배우자에게 초대장을 보내보세요 🤵👰</div>
                </div>
                    배우자가 초대를 수락하면 문자로 알려드릴게요.<br/><br/>


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
                <img src="../../../resources/img/invitation.png" height="450px"><br/>
                <button class="pointBtn" id="kakaotalk-sharing-btn" href="javascript:;" onclick="send()">
                    <span>배우자 초대하기</span>
                </button>
                <form method="get" action="/getSpouseInvitation">
                    <button class="modalBtn" type="submit">결과 확인하기</button>
                </form>
            </div>
        </div>
    </section>
</div>
<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>

<script>
    function send() {
        $.ajax({
            url:'accept/getMemberId',
            method: "GET",
            success: function(response) {
                var memberId = response.memberId;
                if(memberId!=""){
                    Kakao.Share.createDefaultButton({
                        container: '#kakaotalk-sharing-btn',
                        objectType: 'feed',
                        content: {
                            title: '하나원큐택스 우리집 돈 관리 초대장',
                            description: '우리집, 13월의 월급을 받을 수 있을까?🏡',

                                // '프라이버시는 지키면서 우리집 소득공제현황을 한 눈에 파악하고 컨설팅 받을 수 있어요. ',
                                // '아래 링크에서 초대를 수락하고 13월의 월급과 카드 혜택까지 받아보세요.',

                            imageUrl: 'https://github.com/imje96/Hana1QTax/assets/127702320/8033408d-1263-4756-b8f5-f86d69776cd7',
                            link: {
                                // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
                                mobileWebUrl: 'http://localhost:8080/accept/'+memberId,
                                webUrl: 'http://localhost:8080/accept/'+memberId
                            },
                        },
                        buttons: [
                            {
                                title: '우리집 돈 관리 시작하기',
                                link: {
                                    mobileWebUrl: 'http://localhost:8080/accept/'+memberId,
                                    webUrl: 'http://localhost:8080/accept/'+memberId
                                },
                            }
                        ],
                        serverCallbackArgs: '{"key" : "value"}',
                    });

                }else{
                    alert('로그인이 필요합니다.');
                }
            }
        })
    }
    Kakao.init('b959273014359f70ea6960b0c2a699df'); // 사용하려는 앱의 JavaScript 키 입력

</script>
</body>
</html>