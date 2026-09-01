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

    <title>Đăng ký tài khoản</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/login.css">

    <style>

        .register-card {
            max-width: 500px;
            padding: 38px 42px 32px;
        }

        .register-card .login-title {
            font-size: 32px;
        }

        .register-card .login-subtitle {
            margin-bottom: 26px;
        }

        .register-card .form-group {
            margin-bottom: 15px;
        }

        .register-card .form-group label {
            margin-bottom: 7px;
            font-size: 14px;
        }

        .register-card .form-control {
            height: 47px;
            font-size: 14px;
        }

        /* =========================
           PASSWORD ROW
           ========================= */

        .password-row {
            display: grid;

            grid-template-columns:
                    repeat(2, minmax(0, 1fr));

            gap: 14px;
        }

        /* =========================
           REGISTER BUTTON
           ========================= */

        .register-card .btn-login {
            height: 50px;

            margin-top: 7px;

            font-size: 16px;
        }

        /* =========================
           LINKS
           ========================= */

        .register-card .register {
            margin-top: 19px;

            font-size: 14px;
        }

        .register-card .back-home {
            margin-top: 14px;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 550px) {

            .register-card {
                width: calc(100% - 30px);

                padding: 32px 24px;
            }

            .password-row {
                grid-template-columns: 1fr;

                gap: 0;
            }
        }

    </style>

</head>


<body>

<div class="login-card register-card">


    <!-- =========================
         TITLE
         ========================= -->

    <h1 class="login-title">
        Đăng ký
    </h1>

    <div class="login-subtitle">
        Tạo tài khoản mới của bạn
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
         REGISTER FORM
         ========================= -->

    <form action="${pageContext.request.contextPath}/register"
          method="post">


        <!-- =========================
             1. USERNAME
             ========================= -->

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
                    value="${param.username}"
                    autocomplete="username"
                    required
            >

        </div>


        <!-- =========================
             2. EMAIL
             ========================= -->

        <div class="form-group">

            <label for="email">
                Email
            </label>

            <input
                    type="email"
                    id="email"
                    name="email"
                    class="form-control"
                    placeholder="Nhập email"
                    value="${param.email}"
                    autocomplete="email"
                    required
            >

        </div>


        <!-- =========================
             3. FULL NAME
             ========================= -->

        <div class="form-group">

            <label for="fullname">
                Họ và tên
            </label>

            <input
                    type="text"
                    id="fullname"
                    name="fullname"
                    class="form-control"
                    placeholder="Nhập họ và tên"
                    value="${param.fullname}"
                    autocomplete="name"
                    required
            >

        </div>


        <!-- =========================
             4. PHONE
             ========================= -->

        <div class="form-group">

            <label for="phone">
                Số điện thoại
            </label>

            <input
                    type="text"
                    id="phone"
                    name="phone"
                    class="form-control"
                    placeholder="Nhập số điện thoại"
                    value="${param.phone}"
                    autocomplete="tel"
            >

        </div>


        <!-- =========================
             5 + 6. PASSWORD
             ========================= -->

        <div class="password-row">


            <!-- PASSWORD -->

            <div class="form-group">

                <label for="password">
                    Mật khẩu
                </label>

                <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-control"
                        placeholder="Nhập mật khẩu"
                        autocomplete="new-password"
                        required
                >

            </div>


            <!-- CONFIRM PASSWORD -->

            <div class="form-group">

                <label for="confirmPassword">
                    Nhập lại mật khẩu
                </label>

                <input
                        type="password"
                        id="confirmPassword"
                        name="confirmPassword"
                        class="form-control"
                        placeholder="Nhập lại mật khẩu"
                        autocomplete="new-password"
                        required
                >

            </div>

        </div>


        <!-- =========================
             SUBMIT
             ========================= -->

        <button type="submit"
                class="btn-login">

            Đăng ký

        </button>

    </form>


    <!-- =========================
         LOGIN LINK
         ========================= -->

    <div class="register">

        Bạn đã có tài khoản?

        <a href="${pageContext.request.contextPath}/login">
            Đăng nhập
        </a>

    </div>


    <!-- =========================
         HOME LINK
         ========================= -->

    <div class="back-home">

        <a href="${pageContext.request.contextPath}/home">
            ← Quay về trang chủ
        </a>

    </div>


</div>

</body>

</html>