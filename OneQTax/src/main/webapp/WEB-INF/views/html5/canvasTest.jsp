<%--
  Created by IntelliJ IDEA.
  User: jieun
  Date: 2023-10-30
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Canvas 예제</title>
</head>
<body>
    <h1>Canvas 그래픽 예제</h1>

    <%-- 그래픽을 그릴 <canvas> 요소 --%>
    <canvas id="myCanvas" width="400" height="200"></canvas>

    <script>
        // Jas를 사용하여 그래픽 그리기
        var canvas = document.getElementById("myCanvas");
        var ctx = canvas.getContext("2d");

        // 사각형 그리기
        ctx.fillStyle = "blue"; // 채우기 색상
        ctx.fillRect(50, 50, 100, 100); // (x,y, width, height)

        // 원그리기
        ctx.fillStyle = "red";
        ctx.beginPath();
        ctx.arc(300, 100, 40, 0, 2 * Math.PI); // (x, y, 반지름, 시작 각도, 끝 각도)
        ctx.fill();
    </script>
</body>
</html>
