<%--
  Created by IntelliJ IDEA.
  User: jieun
  Date: 2023-10-30
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header 예제</title>
</head>
<body>
<header>
    <h1>웹 페이지의 제목</h1>
    <p>웹 페이지의 부가 설명</p>
</header>
    <label for="quantity">수량</label>
    <input type="number" id="quantity" name="quantity" min="1" max="100" step="1" value="1">
    <br/>
    <label for="birthdate">생년월일</label>
    <input type="date" id="birthdate" name="birthdate">
    <br/>
    <label for="zipcode">우편번호 (5자리 숫자)</label>
    <input type="text" id="zipcode" name="zipcode" pattern="\d{5}" title="5자리숫자를 입력해 주세요">
    <br/>
    <label for="email">이메일 주소</label>
    <input type="email" id="email" name="email" required>
    <br/>
    <label for="website">웹사이트 URL</label>
    <input type="url" id="website" name="website" required>
</body>
</html>
