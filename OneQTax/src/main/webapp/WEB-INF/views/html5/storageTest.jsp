
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로컬 스토리지 예제</title>
</head>
<body>
  <h1>로컬 스토리지 예제</h1>

  <input type="text" id="textInput" placeholder="데이터 입력">
  <button onclick="saveData()">저장</button>
  <br/>
  <p>저장된 데이터 : <span id = "savedData"></span></p>
  <script>
    // 데이터를 로컬 스토리지에 저장하는 함수
    function saveData() {
      var data = document.getElementById("textInput").value;
      localStorage.setItem("user_data", data);
      alert("데이터가 저장되었습니다");
    }
  </script>

  <script>
    // 데이터를 불러오는 함수
    window.onload = function (){
      var savedData = localStorage.setItem("user_data");
      if (saveData){
        document.getElementById("saveData").textContent = savedData;
      } else {
        document.getElementById("saveData").textContent = "저장된 데이터 없음";
      }
    };
  </script>
</body>
</html>
