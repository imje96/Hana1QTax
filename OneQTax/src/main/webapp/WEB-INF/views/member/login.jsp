<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
    .login {
        margin-top: 120px;
        display: inline-block;
        color: black; /* 글자색 변경 */
        padding: 7px 20px; /* 패딩 */
        border: none; /* 테두리 없음 */
        border-radius: 5px; /* 둥근 모서리 */
        text-align: center;
        text-decoration: none;
        font-size: 12px; /* 폰트 크기 변경 */
        cursor: pointer;
        background-color: #ffffff; /* 배경색 추가 */
        transition: background-color 0.3s, transform 0.3s; /* 부드러운 전환 효과 추가 */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }

    .login > * {
        margin-right: 20px; /* 각 요소의 오른쪽에 마진 추가 */
    }

    #loginForm {

        width: 250px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    #loginForm div {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }


    #rowinput {
        display: flex;
        flex-direction: column;
        align-items: flex-start; /* 아이템을 왼쪽으로 정렬 */
        margin-bottom: 20px;
    }


</style>

<body>

<h2>Login</h2>
<form action="/login" method="post">
    <div>
        <label>Email:</label>
        <input type="text" name="email" required>
    </div>
    <div>
        <label>Password:</label>
        <input type="password" name="password" required>
    </div>
    <div>
        <input type="submit" value="Login">
    </div>
</form>

<c:if test="${not empty msg}">
    <p style="color: red;">${msg}</p>
</c:if>

</body>
</html>


<%--<%@ include file="../common/header.jsp" %>--%>

<%--<h1><spring:message code="label.title"></spring:message></h1>--%>
<%--<div align="left">--%>
<%--    <form:form action="${pageContext.request.contextPath }/login"--%>
<%--               method="post" modelAttribute="loginVO">--%>
<%--        id: <form:input path="id"/>--%>
<%--        <form:errors path="id"/><br>--%>
<%--        password: <input type="text" name="password">--%>
<%--        <form:errors path="password"/><br>--%>
<%--        <input type="submit" value="로그인">--%>
<%--    </form:form>--%>
<%--</div>--%>


<%--<div class="container">--%>
<%--    <div class="formsize">--%>
<%--        <img src="../../resources/img/bank1.jpg" height="250" class="imgLoginForm">--%>
<%--        <div id="rowinput">--%>
<%--            <label for="email">이메일</label>--%>
<%--            <input type="text" id="email" name="email">--%>
<%--        </div>--%>
<%--        <div id="rowinput">--%>
<%--            <label for="password">비밀번호</label>--%>
<%--            <input type="password" id="password" name="password">--%>
<%--        </div>--%>
<%--        <button id="loginBtn" onclick="loginFormFunc()">로그인</button>--%>
<%--        &lt;%&ndash;    <input type="button" class="button" value="회원가입" onclick="joinFunc(); return false;">&ndash;%&gt;--%>
<%--        <a href="/selectAll">회원목록</a>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<%@ include file="../common/footer.jsp" %>--%>
<%--</body>--%>
<%--<script>--%>
<%--    function loginFormFunc() {--%>
<%--        var email = $("#email").val();--%>
<%--        var password = $("#password").val();--%>

<%--        console.log("email:", email); // 아이디 확인--%>
<%--        console.log("Password:", password); // 비밀번호 확인--%>

<%--        $.ajax({--%>
<%--            type: "POST",--%>
<%--            url: "${pageContext.request.contextPath}/login",--%>
<%--            data: JSON.stringify({--%>
<%--                email: email,--%>
<%--                password: password--%>
<%--            }),--%>
<%--            contentType: 'application/json',--%>
<%--            error: function (xhr, status, error) {--%>
<%--                alert(error + "error");--%>
<%--            },--%>
<%--            success: function (response) {--%>
<%--                if (response === "로그인 성공") {--%>
<%--                    alert("로그인 성공");--%>
<%--                    location.href = "../../..";--%>
<%--                } else {--%>
<%--                    console.error("로그인 실패");--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--</script>--%>

</html>