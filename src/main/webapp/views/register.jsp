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

    <style>

        /* =========================
           RESET & BASE
           ========================= */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #e8f0fe;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }


        /* =========================
           REGISTER CARD
           ========================= */

        .login-card.register-card {
            max-width: 580px;
            width: 100%;
            padding: 42px 48px 38px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .login-title {
            font-size: 32px;
            font-weight: 700;
            color: #1e3a8a;
            text-align: center;
            margin-bottom: 8px;
        }

        .login-subtitle {
            margin-bottom: 32px;
            text-align: center;
            color: #64748b;
            font-size: 15px;
        }


        /* =========================
           FORM GROUP
           ========================= */

        .form-group {
            margin-bottom: 0;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #334155;
        }

        .form-control,
        select.form-control {
            height: 48px;
            font-size: 15px;
            padding: 0 16px;
            border: 1.5px solid #cbd5e1;
            border-radius: 8px;
            transition: all 0.3s ease;
            width: 100%;
            box-sizing: border-box;
        }

        .form-control:focus,
        select.form-control:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            outline: none;
        }

        select.form-control {
            cursor: pointer;
            background-color: #fff;
        }


        /* =========================
           TWO COLUMN ROWS
           ========================= */

        .register-form-row,
        .password-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 18px;
        }


        /* =========================
           SINGLE FIELD ROW (ROLE)
           ========================= */

        .single-field-row {
            margin-bottom: 18px;
        }


        /* =========================
           BUTTON
           ========================= */

        .btn-login {
            width: 100%;
            height: 52px;
            margin-top: 12px;
            font-size: 16px;
            font-weight: 600;
            background: linear-gradient(135deg, #3b82f6 0%, #1e40af 100%);
            border: none;
            border-radius: 8px;
            color: #fff;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
        }


        /* =========================
           LINKS
           ========================= */

        .register {
            margin-top: 24px;
            font-size: 14px;
            text-align: center;
            color: #64748b;
        }

        .register a {
            color: #3b82f6;
            font-weight: 600;
            text-decoration: none;
        }

        .register a:hover {
            text-decoration: underline;
        }

        .back-home {
            margin-top: 16px;
            text-align: center;
        }

        .back-home a {
            color: #64748b;
            font-size: 14px;
            text-decoration: none;
        }

        .back-home a:hover {
            color: #3b82f6;
        }


        /* =========================
           ALERT
           ========================= */

        .alert {
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .alert-error {
            background-color: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }


        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 640px) {
            .login-card.register-card {
                width: calc(100% - 30px);
                padding: 32px 24px;
            }

            .register-form-row,
            .password-row {
                grid-template-columns: 1fr;
            }

            .login-title {
                font-size: 26px;
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
             ROW 1: USERNAME + EMAIL
             ========================= -->

        <div class="register-form-row">

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
                        value="${param.username}"
                        autocomplete="username"
                        required
                >

            </div>

            <!-- EMAIL -->
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

        </div>


        <!-- =========================
             ROW 2: FULLNAME + PHONE
             ========================= -->

        <div class="register-form-row">

            <!-- FULL NAME -->
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

            <!-- PHONE -->
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

        </div>


        <!-- =========================
             ROW 3: PASSWORD + CONFIRM PASSWORD
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
             ROW 4: ROLE (FULL WIDTH)
             ========================= -->

        <div class="single-field-row">

            <div class="form-group">

                <label for="roleid">
                    Vai trò
                </label>

                <select
                        id="roleid"
                        name="roleid"
                        class="form-control"
                        required
                >

                    <option value="">
                        -- Chọn vai trò --
                    </option>

                    <option value="1"
                            ${param.roleid == '1' ? 'selected' : ''}>
                        Admin
                    </option>

                    <option value="2"
                            ${param.roleid == '2' ? 'selected' : ''}>
                        Manager
                    </option>

                    <option value="3"
                            ${param.roleid == '3' ? 'selected' : ''}>
                        User
                    </option>

                    <option value="4"
                            ${param.roleid == '4' ? 'selected' : ''}>
                        Guest
                    </option>

                </select>

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