<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Xác nhận OTP</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/login.css">
</head>

<body>

<div class="login-card otp-card">

    <h1 class="login-title">
        Xác nhận OTP
    </h1>

    <div class="login-subtitle">
        Nhập mã OTP đã được gửi đến email của bạn
    </div>

    <c:if test="${not empty alert}">
        <div class="alert alert-error">
            ${alert}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/forgot-password/verify"
          method="post">

        <div class="form-group">
            <label for="otp">
                Mã OTP
            </label>

            <input type="text"
                   id="otp"
                   name="otp"
                   class="form-control otp-input"
                   maxlength="6"
                   inputmode="numeric"
                   pattern="[0-9]{6}"
                   placeholder="000000"
                   autocomplete="one-time-code"
                   required>
        </div>

        <button type="submit"
                class="btn-login">
            Xác nhận OTP
        </button>

    </form>

    <div class="back-home">
        <a href="${pageContext.request.contextPath}/forgot-password">
            ← Quay lại
        </a>
    </div>

</div>

</body>

</html>
