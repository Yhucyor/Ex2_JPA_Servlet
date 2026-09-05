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

    <title>Đặt lại mật khẩu</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/login.css">

    <style>

        /* =========================
           AUTH PAGE LAYOUT
           ========================= -->

        .auth-page .login-card {
            display: grid;

            grid-template-columns:
                    minmax(0, 1fr)
                    minmax(0, 1fr);

            max-width: 900px;

            width: 100%;
        }


        /* =========================
           VISUAL PANEL
           ========================= -->

        .auth-visual {
            background: linear-gradient(
                    135deg,
                    #667eea 0%,
                    #764ba2 100%
            );

            color: #fff;

            padding: 60px 48px;

            display: flex;

            flex-direction: column;

            justify-content: center;

            border-radius: 12px 0 0 12px;
        }

        .auth-visual span {
            font-size: 12px;

            font-weight: 600;

            letter-spacing: 2px;

            opacity: 0.9;

            margin-bottom: 16px;

            display: block;
        }

        .auth-visual h2 {
            font-size: 32px;

            font-weight: 700;

            margin-bottom: 16px;

            line-height: 1.2;
        }

        .auth-visual p {
            font-size: 15px;

            line-height: 1.6;

            opacity: 0.95;
        }


        /* =========================
           FORM PANEL
           ========================= -->

        .auth-form-panel {
            background: #fff;

            padding: 60px 48px;

            border-radius: 0 12px 12px 0;
        }

        .auth-form-box {
            max-width: 380px;

            margin: 0 auto;
        }


        /* =========================
           ICON
           ========================= -->

        .auth-icon {
            width: 64px;

            height: 64px;

            background: linear-gradient(
                    135deg,
                    #667eea 0%,
                    #764ba2 100%
            );

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            margin: 0 auto 24px;

            font-size: 28px;

            color: #fff;
        }


        /* =========================
           USERNAME DISPLAY
           ========================= -->

        .reset-account-name {
            background: #f8f9fa;

            padding: 12px 16px;

            border-radius: 8px;

            margin-bottom: 20px;

            font-size: 14px;

            color: #495057;
        }

        .reset-account-name strong {
            color: #212529;

            margin-left: 6px;

            font-weight: 600;
        }


        /* =========================
           TITLE
           ========================= -->

        .auth-form-box h1 {
            font-size: 28px;

            font-weight: 700;

            color: #212529;

            margin-bottom: 24px;

            text-align: center;
        }


        /* =========================
           FORM
           ========================= -->

        .auth-form-box .login-field {
            margin-bottom: 18px;
        }

        .auth-form-box .form-control {
            height: 48px;

            font-size: 15px;
        }

        .auth-form-box .login-submit-btn {
            height: 50px;

            font-size: 16px;

            margin-top: 8px;
        }


        /* =========================
           RESPONSIVE
           ========================= -->

        @media (max-width: 768px) {

            .auth-page .login-card {
                grid-template-columns: 1fr;

                width: calc(100% - 30px);
            }

            .auth-visual {
                border-radius: 12px 12px 0 0;

                padding: 40px 32px;
            }

            .auth-visual h2 {
                font-size: 26px;
            }

            .auth-form-panel {
                border-radius: 0 0 12px 12px;

                padding: 40px 32px;
            }
        }

    </style>

</head>


<body>


<section class="login-section auth-page">

    <div class="container">

        <div class="login-card auth-card">


            <!-- =========================
                 LEFT PANEL - VISUAL
                 ========================= -->

            <div class="login-panel auth-visual">

                <div>

                    <span>NEW PASSWORD</span>

                    <h2>Bảo mật tài khoản</h2>

                    <p>
                        Tạo mật khẩu mới để giữ an toàn cho
                        tài khoản TechStore của bạn.
                    </p>

                </div>

            </div>


            <!-- =========================
                 RIGHT PANEL - FORM
                 ========================= -->

            <div class="login-form-panel auth-form-panel">

                <div class="login-form-box auth-form-box">


                    <!-- ICON -->

                    <div class="auth-icon">
                        🔒
                    </div>


                    <!-- USERNAME DISPLAY -->

                    <c:if test="${not empty resetUsername}">

                        <div class="reset-account-name">
                            Username:
                            <strong>${resetUsername}</strong>
                        </div>

                    </c:if>


                    <!-- TITLE -->

                    <h1>Đặt lại mật khẩu</h1>


                    <!-- ERROR MESSAGE -->

                    <c:if test="${not empty alert}">

                        <div class="alert alert-error">
                            ${alert}
                        </div>

                    </c:if>


                    <!-- FORM -->

                    <form action="${pageContext.request.contextPath}/reset-password"
                          method="post">


                        <!-- NEW PASSWORD -->

                        <div class="login-field">

                            <input
                                    type="password"
                                    name="password"
                                    class="form-control"
                                    placeholder="Mật khẩu mới"
                                    autocomplete="new-password"
                                    required
                            >

                        </div>


                        <!-- CONFIRM PASSWORD -->

                        <div class="login-field">

                            <input
                                    type="password"
                                    name="confirmPassword"
                                    class="form-control"
                                    placeholder="Xác nhận mật khẩu"
                                    autocomplete="new-password"
                                    required
                            >

                        </div>


                        <!-- SUBMIT -->

                        <button type="submit"
                                class="login-submit-btn">

                            ĐỔI MẬT KHẨU

                        </button>

                    </form>


                </div>

            </div>


        </div>

    </div>

</section>


</body>

</html>