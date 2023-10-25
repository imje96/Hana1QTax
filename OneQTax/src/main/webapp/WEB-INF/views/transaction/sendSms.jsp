<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Send Mail</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div>
    <h1>텍스트 메일 보내기</h1>

    <form action="/send" method="post">
        <table>
            <tr class="form-group">
                <td>발송할 전화번호</td>
                <td>
                    <input type="text" class="form-control" name="to" placeholder="이메일 주소를 입력하세요">
                </td>
            </tr>
            <tr class="form-group">
                <td>내용</td>
                <td>
                    <textarea class="form-control" name="content" placeholder="보낼 내용을 입력하세요"></textarea>
                </td>
            </tr>
        </table>
        <button class="btn btn-default">발송</button>
    </form>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
