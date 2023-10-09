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
                <h3 style="color: #065859; margin-bottom: 15px;">카드황금비율관리</h3>
                <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxMain"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소득공제 안내</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">

                <a href="${pageContext.request.contextPath}/taxThreshold"
                   style="display: block; margin-bottom: 20px;">
                    <div style="color: grey; margin-bottom: 15px;">소비 문턱 넘기기</div>
                </a>
                <hr style="width: 200px; margin-bottom: 15px;">
                <a href="${pageContext.request.contextPath}/taxInfo"
                   style="display: block; margin-bottom: 20px;">
                    <h6 style="color: black; margin-bottom: 15px;">카드황금비율 계산</h6>
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
            </div>
        </div>



        <div class="section">
            <div class="container-title">
                <h2>우리가족 초대 확인하기</h2>
                <br/>
                <span style="color: #615e5e"><h3>우리 부부의 소득공제 현황을 파악하고 전략을 제안받아보세요</h3></span>
            </div>
            <br/><br/>
            <div class="container2">

                <div class="flex-box">


                    배우자에게 초대장을 보내보세요.
                </div>


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
<%--                <button class="pointBtn">초대 수락하기</button>--%>

                <button class="pointBtn" id="kakaotalk-sharing-btn" href="javascript:;" onclick="send()">
                    <span>배우자 초대하기</span>
                </button>
                <br/>
                <form method="get" action="/spouseResult">
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
                    // Kakao.Share.createCustomButton({
                    //     container: '#kakaotalk-sharing-btn',
                    //     templateId: 98999,
                    //     templateArgs: {
                    //         title: '하나원큐택스 우리집 돈 관리 초대장',
                    //         description: '우리집, 13월의 월급을 받을 수 있을까?🏡',
                    //
                    //         imageUrl: 'https://ibb.co/HD27qgB',
                    //         link: {
                    //             // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
                    //             mobileWebUrl: 'http://localhost:8080/accept/'+memberId,
                    //             webUrl: 'http://localhost:8080/accept/'+memberId
                    //         },
                    //     },
                    //     buttons: [
                    //         {
                    //             title: '우리집 돈 관리 시작하기',
                    //             link: {
                    //                 mobileWebUrl: 'http://localhost:8080/accept/'+memberId,
                    //                 webUrl: 'http://localhost:8080/accept/'+memberId
                    //             },
                    //         }
                    //     ],
                    //     serverCallbackArgs: '{"key" : "value"}',
                    // });

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
                    // Kakao.Share.createCustomButton({
                    //     container: '#kakaotalk-sharing-btn',
                    //     templateId: 98999,
                    //     templateArgs: {
                    //         title: '하나원큐택스 우리집 돈 관리 초대장',
                    //         description: '우리집, 13월의 월급을 받을 수 있을까?🏡',
                    //     },
                    // });

                }else{
                    alert('로그인이 필요합니다.');
                    // var modal = document.getElementById('myModal');
                    // modal.style.display = 'block';
                }
            }
        })
    }
    Kakao.init('b959273014359f70ea6960b0c2a699df'); // 사용하려는 앱의 JavaScript 키 입력

</script>
</body>
</html>