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
        .side-nav {
            font-family: 'Noto Sans KR', sans-serif !important;
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
                <hr style="width: 200px;">
            </div>
        </div>



        <div class="section">
            <div class="container-title">
                <h2>우리가족 초대 확인하기</h2>
                <br/>
                <span style="color: #615e5e"><h3>연말정산에서 카드 소득공제를 가장 많이 받을 수 있도록 제안해드릴게요</h3></span>
            </div>
            <br/><br/>
            <div class="container2">

                <div class="flex-box">


                     <form method="post" action="/spouseAdd">
                        <label for="spouseEmail">배우자의 하나카드 아이디: </label>
                        <input type="email" id="spouseEmail" name="spouseEmail" required><br>
                        <button class="pointBtn" type="submit">Add Friend</button>
                    </form>
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
<%--                   <button class="pointBtn">초대 수락하기</button>--%>



            </div>
        </div>
    </section>
</div>
<!-- footer-wrapper -->
<footer>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</footer>

<script>
    function acceptInvitation(relationId) {
        fetch(`/friend/accept-invitation/${relationId}`, {
            method: 'POST',
        })
            .then(response => {
                if (response.ok) {
                    alert('You are now friends!');
                } else {
                    alert('Failed to accept the invitation!');
                }
            });
    }


</script>
</body>
</html>