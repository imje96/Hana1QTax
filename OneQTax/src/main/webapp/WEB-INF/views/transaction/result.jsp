<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Send Result</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <h2>SMS 내역 조회</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>requestId</th>
            <th>요청 시간</th>
            <th>Status Code</th>
            <th>Status Name</th>
        </tr>
        </thead>
        <tbody>
        <tr>

            <td>${response.requestId}</td>
            <td>${response.requestTime}</td>
            <td>${response.statusCode}</td>
            <td>${response.statusName}</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
