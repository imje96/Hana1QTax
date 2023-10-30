<%--
  Created by IntelliJ IDEA.
  User: jieun
  Date: 2023-10-30
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebSocket Chat</title>
</head>
<body>
    <input type="text" id="message" placeholder="Type a message">
    <button onclick="sendMessage()">Send</button>
    <ul id="chat"></ul>

    <script>
        const socket = new WebSocket("ws://localhost:8080/chat");

        socket.onmessage = function (event){
            const chat = document.getElementById("chat");
            const li = document.createElement("li"); // li 요소를 생성
            li.appendChild(document.createTextNode(event.data));
            chat.appendChild(li);
        }


        function sendMessage(){
            const message = document.getElementById("message").value;
            socket.send(message);
            document.getElementById("message").value = "";
        }
    </script>
</body>
</html>
