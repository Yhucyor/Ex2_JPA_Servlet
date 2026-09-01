<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">

</head>


<body>

<div class="login-card">

    <!-- =========================
         TITLE
         ========================= -->

    <h1 class="login-title">
        Đăng nhập
    </h1>

    <div class="login-subtitle">
        Sử dụng tài khoản của bạn
    </div>


    <!-- =========================
         ERROR MESSAGE
         ========================= -->

    <c:if test="${not empty alert}">

        <div class="alert alert-error">
            ${alert}
        </div>

    </c:if>


    <!-- =========================
         SUCCESS MESSAGE
         ========================= -->

    <c:if test="${not empty message}">

        <div class="alert alert-success">
            ${message}
        </div>

    </c:if>


    <!-- =========================
         LOGIN FORM
         ========================= -->

    <form action="${pageContext.request.contextPath}/login"
          method="post">


        <!-- USERNAME -->

        <div class="form-group">

            <label for="username">
                Tên đăng nhập
            </label>

            <input
                    type="text"
                    id="username"
                    name="username"
                    class="form-control"
                    placeholder="Nhập tên đăng nhập"
                    value="${username}"
                    autocomplete="username"
                    required
            >

        </div>


        <!-- PASSWORD -->

        <div class="form-group">

            <label for="password">
                Mật khẩu
            </label>

            <div class="password-box">

                <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-control"
                        placeholder="Nhập mật khẩu"
                        autocomplete="current-password"
                        required
                >

                <button
                        type="button"
                        class="show-password"
                        onclick="togglePassword()"
                        title="Hiện/ẩn mật khẩu">
                    &#128065;

                </button>

            </div>

        </div>


        <!-- REMEMBER + FORGOT -->

        <div class="login-options">

            <label class="remember">

                <input
                        type="checkbox"
                        name="remember"
                >

                Ghi nhớ đăng nhập

            </label>


            <a
                    href="${pageContext.request.contextPath}/forgot-password"
                    class="forgot-password">

                Quên mật khẩu?

            </a>

        </div>


        <!-- LOGIN BUTTON -->

        <button
                type="submit"
                class="btn-login">

            Đăng nhập

        </button>

    </form>


    <!-- =========================
         REGISTER
         ========================= -->

    <div class="register">

        Bạn chưa có tài khoản?

        <a href="${pageContext.request.contextPath}/register">
            Đăng ký ngay
        </a>

    </div>


    <!-- =========================
         HOME
         ========================= -->

    <div class="back-home">

        <a href="${pageContext.request.contextPath}/home">
            ← Quay về trang chủ
        </a>

    </div>

</div>


<script>

    function togglePassword() {

        const password =
                document.getElementById("password");

        if (password.type === "password") {

            password.type = "text";

        } else {

            password.type = "password";
        }
    }

</script>

</body>

</html>

