<%--
  Created by IntelliJ IDEA.
  User: jieun
  Date: 2023-10-30
  Time: 오전 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비디오 예제</title>
</head>
<body>
  <h1>비디오 재생 예제</h1>

  <%-- 비디오 파일을 재생할 <video> 요소 --%>
  <video controls width="400" height="300">
      <source src="../../../resources/audio/test.mp4" type="video/mp4">
      Your browser does not support the video element
  </video>

</body>
</html>
