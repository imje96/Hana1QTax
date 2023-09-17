<%--
  Created by IntelliJ IDEA.
  User: jieun
  Date: 2023-09-17
  Time: 오후 6:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

폼 결과 보는 페이지입니다
    인적소득공제: ${formResult.personal_deduction}
<br/>${totalResult.personal_deduction}
<br/>
    자녀세액공제: ${formResult.children_taxcredit}
<br/>${totalResult.children_taxcredit}
    근로소득공제 ${formResult.income_deduction}
<br/>${totalResult.income_deduction}
    건강보험공제: ${totalResult.pension_deduction}

<br/>연금저축보험: ${totalResult.irp_taxcredit}
</body>
</html>
