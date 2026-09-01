<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả upload</title>
</head>

<body>

<h2>Kết quả upload</h2>

<p>
    ${message}
</p>

<c:if test="${not empty fileName}">
    <img
            src="${pageContext.request.contextPath}/image?fname=${fileName}"
            width="300"
            alt="${fileName}">
</c:if>

<br><br>

<a href="${pageContext.request.contextPath}/home">
    Về trang chủ
</a>

</body>
</html>
