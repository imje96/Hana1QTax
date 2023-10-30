<%--
  Created by IntelliJ IDEA.
  User: jieun
  Date: 2023-10-30
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>오디오 예제</title>
</head>
<body>
    <h1>오디오 재생 예제</h1>

    <%-- 오디오 파일을 재생할  <audio> 요소--%>
    <audio controls>
        <source src="../../../resources/audio/example.mp3" type="audio/mpeg">
        Your browser does not support the audio element
    </audio>
</body>
</html>
