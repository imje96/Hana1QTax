<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TaxCalculator</title>
    <!--css 파일 연결-->
    <link rel="stylesheet" href="../../resources/css/TaxCalculatorStyle.css">
</head>
<body>
<main>
    <table class="type08">
        <thead>
        <tr>
            <th scope="cols">구분</th>
            <th scope="cols">금액</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">총급여</th>
            <td id="총급여">
                <!--총급여는 input으로 받을 예정-->
                <input id="총급여입력" type="text" onkeyup="inputNumberFormat(this)"/>
            </td>
        </tr>
        <tr>
            <th scope="row">근로소득공제</th>
            <td id="근로소득공제">
                <!--근로소득공제는 미리 설정된 공식에 따라 자동계산됨-->
                <!-- <output type="number"> -->
            </td>
        </tr>
        <tr>
            <th scope="row">근로소득금액</th>
            <td id="근로소득금액">
                <output type="number">
            </td>
        </tr>
        <tr>
            <th scope="row">소득공제</th>
            <td>
                <output type="number" id="소득공제">
            </td>
        </tr>
        <tr>
            <th scope="row">과세표준</th>
            <td>
                <output type="number" id="과세표준">
            </td>
        </tr>
        <tr>
            <th scope="row">산출세액</th>
            <td>
                <output type="number" id="산출세액">
            </td>
        </tr>
        <tr>
            <th scope="row">세액감면</th>
            <td>
                <output type="number" id="세액감면">
            </td>
        </tr>
        <tr>
            <th scope="row">세액공제</th>
            <td>
                <output type="number" id="세액공제">
            </td>
        </tr>
        <tr>
            <th scope="row">결정세액</th>
            <td>
                <output type="number" id="결정세액">
            </td>
        </tr>
        <!--
                    <tr>
                      <th scope="row">기납부세액</th>
                      <td>
                        <input type="number" id="기납부세액">
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">차감납부(환급)세액</th>
                      <td>
                        <output type="number" name="차감납부세액">
                      </td>
                    </tr>H
        -->
        </tbody>
    </table>
    <button name="세액계산" onclick="TaxCalculate()">세액계산</button>
</main>
<!--자바스크립트 파일 연결-->
<script src="../../resources/js/TaxCalculatorScript.js"></script>


</body>
</html>


