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

    <title>Quên mật khẩu</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/login.css">

    <style>
        .btn-verify {
            width: 100%;
            height: 50px;

            margin-top: 12px;

            display: flex;
            justify-content: center;
            align-items: center;

            border: 1px solid #2563eb;
            border-radius: 10px;

            background: white;

            color: #2563eb;

            text-decoration: none;

            font-size: 16px;
            font-weight: 600;

            transition: 0.2s;
        }

        .btn-verify:hover {
            background: #eff6ff;
        }
    </style>

</head>

<body>

<div class="login-card forgot-card">

    <h1 class="login-title">
        Quên mật khẩu
    </h1>

    <div class="login-subtitle">
        Nhập email đã đăng ký để nhận mã OTP
    </div>


    <c:if test="${not empty alert}">

        <div class="alert alert-error">
            ${alert}
        </div>

    </c:if>


    <form action="${pageContext.request.contextPath}/forgot-password"
          method="post">

        <div class="form-group">

            <label for="email">
                Email
            </label>

            <input type="email"
                   id="email"
                   name="email"
                   class="form-control"
                   placeholder="Nhập email"
                   value="${param.email}"
                   autocomplete="email"
                   required>

        </div>


        <button type="submit"
                class="btn-login">

            Gửi OTP

        </button>

    </form>


    <!-- CHỈ HIỆN KHI ĐÃ CÓ EMAIL QUÊN MẬT KHẨU TRONG SESSION -->

    <c:if test="${not empty sessionScope.forgotEmail}">

        <a href="${pageContext.request.contextPath}/forgot-password/verify"
           class="btn-verify">

            Nhập mã OTP

        </a>

    </c:if>


    <div class="back-home">

        <a href="${pageContext.request.contextPath}/login">
            ← Quay lại đăng nhập
        </a>

    </div>

</div>

</body>

</html>