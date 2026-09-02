<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>
        <c:choose>
            <c:when test="${not empty product}">
                ${product.productName} - Shop
            </c:when>
            <c:otherwise>
                Chi tiết sản phẩm - Shop
            </c:otherwise>
        </c:choose>
    </title>

    <style>

        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;

            font-family: Arial, Helvetica, sans-serif;

            background:
                    radial-gradient(
                            circle at right bottom,
                            rgba(219, 234, 254, 0.70),
                            transparent 28%
                    ),
                    #f8fbff;

            color: #0f172a;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

    .header {
        width: 100%;
        position: sticky;
        top: 0;
        z-index: 1000;
        background: rgba(255, 255, 255, 0.97);
        border-bottom: 1px solid #e5e7eb;
        backdrop-filter: blur(10px);
    }

    .header-container {
        width: 95%;
        max-width: 1500px;
        height: 76px;
        margin: 0 auto;

        display: flex;
        align-items: center;
        justify-content: space-between;

        gap: 28px;
    }

    .logo {
        display: flex;
        align-items: center;

        gap: 12px;

        flex-shrink: 0;

        font-size: 30px;
        font-weight: 800;

        color: #071333;
    }

    .logo-icon {
        width: 42px;
        height: 42px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 11px;

        background: #0b63f6;

        box-shadow:
                0 10px 22px
                rgba(37, 99, 235, 0.22);
    }

    .logo-icon svg {
        width: 24px;
        height: 24px;

        color: #ffffff;
        stroke: currentColor;
    }

    .nav-menu {
        height: 100%;

        display: flex;
        align-items: center;

        gap: 42px;
    }

    .nav-link {
        height: 100%;

        position: relative;

        display: flex;
        align-items: center;

        font-size: 15px;
        font-weight: 600;

        color: #0f172a;

        transition: color 0.2s ease;
    }

    .nav-link:hover,
    .nav-link.active {
        color: #0b63f6;
    }

    .nav-link.active::after {
        content: "";

        position: absolute;

        right: 0;
        bottom: 0;
        left: 0;

        height: 3px;

        border-radius: 999px;

        background: #0b63f6;
    }

    .header-right {
        display: flex;
        align-items: center;

        gap: 18px;
    }

    .search-form {
        width: 345px;
        height: 48px;

        padding: 0 14px 0 18px;

        display: flex;
        align-items: center;

        gap: 10px;

        border: 1px solid #d7deea;

        border-radius: 14px;

        background: #ffffff;
    }

    .search-form-disabled {
        background: #f8fafc;
        opacity: 0.72;
    }

    .search-form input {
        min-width: 0;

        flex: 1;

        border: 0;
        outline: 0;

        background: transparent;

        font-size: 15px;

        color: #0f172a;
    }

    .search-form input::placeholder {
        color: #94a3b8;
    }

    .search-submit {
        width: 28px;
        height: 28px;

        padding: 0;

        display: flex;
        align-items: center;
        justify-content: center;

        border: 0;

        background: transparent;

        color: #0f172a;
    }

    .search-submit svg {
        width: 23px;
        height: 23px;

        stroke: currentColor;
    }

    .account-button {
        width: 42px;
        height: 42px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 50%;

        color: #0f172a;

        transition:
                color 0.2s ease,
                background 0.2s ease;
    }

    .account-button:hover {
        color: #0b63f6;

        background: #eff6ff;
    }

    .account-button svg {
        width: 26px;
        height: 26px;

        stroke: currentColor;
    }
        .page-shell {
            width: 94%;
            max-width: 1400px;

            margin: 24px auto 50px;
        }

        .breadcrumb {
            margin-bottom: 20px;

            display: flex;
            align-items: center;
            flex-wrap: wrap;

            gap: 9px;

            color: #64748b;

            font-size: 14px;
        }

        .breadcrumb a {
            color: #2563eb;

            transition: 0.2s;
        }

        .breadcrumb a:hover {
            color: #1d4ed8;
        }

        .breadcrumb-arrow {
            color: #94a3b8;

            font-size: 18px;
        }

        .breadcrumb-current {
            color: #334155;
        }

        .detail-card {
            display: grid;

            grid-template-columns:
                    minmax(0, 1fr)
                    minmax(0, 1fr);

            gap: 45px;

            padding: 28px;

            border: 1px solid #e2e8f0;

            border-radius: 20px;

            background: rgba(255, 255, 255, 0.98);

            box-shadow:
                    0 18px 45px
                    rgba(15, 23, 42, 0.07);
        }

        .product-image-area {
            min-height: 590px;

            position: relative;

            overflow: hidden;

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 35px;

            border-radius: 17px;

            background:
                    radial-gradient(
                            circle at center,
                            #ffffff 0%,
                            #f8fbff 68%,
                            #eff6ff 100%
                    );
        }

        .product-image-area::before {
            content: "";

            position: absolute;

            width: 420px;
            height: 420px;

            border-radius: 50%;

            right: -190px;
            bottom: -200px;

            background:
                    rgba(59, 130, 246, 0.06);
        }

        .product-image-area::after {
            content: "";

            position: absolute;

            width: 380px;
            height: 160px;

            left: -100px;
            bottom: -60px;

            border-radius: 50%;

            background:
                    rgba(147, 197, 253, 0.11);
        }

        .product-image {
            position: relative;

            z-index: 2;

            width: 100%;
            height: 500px;

            object-fit: contain;
        }

        .no-image {
            position: relative;

            z-index: 2;

            display: flex;
            flex-direction: column;

            align-items: center;
            justify-content: center;

            gap: 10px;

            color: #94a3b8;
        }

        .no-image svg {
            width: 70px;
            height: 70px;

            stroke: #cbd5e1;
        }

        .product-info {
            min-width: 0;

            padding: 10px 5px;

            display: flex;
            flex-direction: column;

            justify-content: center;
        }

        .category-badge {
            width: fit-content;

            margin-bottom: 22px;

            padding: 7px 12px;

            border-radius: 9px;

            background: #eaf2ff;

            color: #2563eb;

            font-size: 14px;
            font-weight: 600;
        }

        .product-title {
            margin: 0 0 20px;

            color: #071333;

            font-size: 42px;
            line-height: 1.15;

            font-weight: 800;

            word-break: break-word;
        }

        .product-price {
            margin-bottom: 30px;

            color: #0b63f6;

            font-size: 34px;
            font-weight: 800;
        }

        .product-information {
            margin-bottom: 28px;

            border-top: 1px solid #e2e8f0;
        }

        .information-row {
            min-height: 64px;

            display: grid;

            grid-template-columns:
                    45px 150px 1fr;

            align-items: center;

            gap: 10px;

            border-bottom: 1px solid #e2e8f0;
        }

        .information-icon {
            width: 35px;
            height: 35px;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #64748b;
        }

        .information-icon svg {
            width: 23px;
            height: 23px;

            stroke: currentColor;
        }

        .information-label {
            color: #475569;

            font-size: 15px;
            font-weight: 600;
        }

        .information-value {
            color: #334155;

            font-size: 15px;
            font-weight: 600;
        }

        .status {
            width: fit-content;

            display: inline-flex;
            align-items: center;

            padding: 6px 12px;

            border-radius: 999px;

            font-size: 13px;
            font-weight: 600;
        }

        .status-active {
            color: #15803d;

            background: #dcfce7;
        }

        .status-inactive {
            color: #dc2626;

            background: #fee2e2;
        }

        .description-section {
            margin-bottom: 30px;
        }

        .description-title {
            margin-bottom: 10px;

            color: #0f172a;

            font-size: 20px;
            font-weight: 700;
        }

        .description-content {
            margin: 0;

            color: #475569;

            font-size: 15px;
            line-height: 1.75;

            white-space: pre-line;
        }

        .detail-actions {
            display: flex;
            align-items: center;

            gap: 16px;
        }

        .action-button {
            min-height: 52px;

            padding: 0 24px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 9px;

            border-radius: 10px;

            font-size: 15px;
            font-weight: 600;

            transition: 0.2s;
        }

        .action-button svg {
            width: 20px;
            height: 20px;

            stroke: currentColor;
        }

        .back-button {
            min-width: 230px;

            border: 1px solid #2563eb;

            background: #ffffff;

            color: #2563eb;
        }

        .back-button:hover {
            background: #eff6ff;

            transform: translateY(-1px);
        }

        .home-button {
            min-width: 190px;

            border: 1px solid #2563eb;

            background:
                    linear-gradient(
                            90deg,
                            #2563eb,
                            #0b63f6
                    );

            color: #ffffff;

            box-shadow:
                    0 9px 22px
                    rgba(37, 99, 235, 0.22);
        }

        .home-button:hover {
            transform: translateY(-1px);

            box-shadow:
                    0 12px 28px
                    rgba(37, 99, 235, 0.30);
        }

        .not-found {
            padding: 80px 25px;

            border: 1px solid #e2e8f0;

            border-radius: 18px;

            background: #ffffff;

            text-align: center;

            box-shadow:
                    0 15px 35px
                    rgba(15, 23, 42, 0.06);
        }

        .not-found h2 {
            margin-top: 0;

            color: #0f172a;
        }

        .not-found p {
            color: #64748b;

            margin-bottom: 28px;
        }

        @media (max-width: 1000px) {

            .nav-menu {
                display: none;
            }

            .detail-card {
                grid-template-columns: 1fr;

                gap: 25px;
            }

            .product-image-area {
                min-height: 480px;
            }

            .product-image {
                height: 420px;
            }

            .product-info {
                padding: 10px;
            }
        }

        @media (max-width: 650px) {

            .header-container,
            .page-shell {
                width: 94%;
            }

            .header-container {
                height: 66px;
            }

            .logo {
                font-size: 24px;
            }

            .logo-icon {
                width: 36px;
                height: 36px;
            }

            .detail-card {
                padding: 18px;

                border-radius: 15px;
            }

            .product-image-area {
                min-height: 330px;

                padding: 15px;
            }

            .product-image {
                height: 300px;
            }

            .product-title {
                font-size: 30px;
            }

            .product-price {
                font-size: 28px;
            }

            .information-row {
                grid-template-columns:
                        35px 100px 1fr;
            }

            .detail-actions {
                flex-direction: column;

                align-items: stretch;
            }

            .back-button,
            .home-button {
                width: 100%;

                min-width: 0;
            }
        }

    </style>

</head>


<body>


<header class="header">

    <div class="header-container">

        <a href="${pageContext.request.contextPath}/home"
           class="logo"
           aria-label="Trang chủ Shop">

            <span class="logo-icon" aria-hidden="true">

                <svg viewBox="0 0 24 24"
                     fill="none"
                     stroke-width="2"
                     stroke-linecap="round"
                     stroke-linejoin="round">

                    <path d="M6 8h12l-1 12H7L6 8Z"/>
                    <path d="M9 8V6a3 3 0 0 1 6 0v2"/>
                    <path d="M9 12h6"/>

                </svg>

            </span>

            <span>
                Shop
            </span>

        </a>


        <nav class="nav-menu"
             aria-label="Điều hướng chính">

            <a href="${pageContext.request.contextPath}/home"
               class="nav-link">

                Trang chủ

            </a>

            <a href="${pageContext.request.contextPath}/product"
               class="nav-link active">

                Sản phẩm

            </a>

            <a href="${pageContext.request.contextPath}/product"
               class="nav-link">

                Danh mục

            </a>

            <a href="${pageContext.request.contextPath}/home"
               class="nav-link">

                Tin tức

            </a>

            <a href="${pageContext.request.contextPath}/home"
               class="nav-link">

                Liên hệ

            </a>

        </nav>


        <div class="header-right">

            <form class="search-form search-form-disabled"
                  action="${pageContext.request.contextPath}/product"
                  method="get"
                  aria-disabled="true">

                <input type="text"
                       placeholder="Tìm kiếm sản phẩm..."
                       aria-label="Tìm kiếm sản phẩm"
                       disabled>

                <button type="button"
                        class="search-submit"
                        aria-label="Tìm kiếm"
                        disabled>

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke-width="2"
                         stroke-linecap="round"
                         stroke-linejoin="round">

                        <circle cx="11" cy="11" r="7"/>
                        <path d="m20 20-3.5-3.5"/>

                    </svg>

                </button>

            </form>


            <c:choose>

                <c:when test="${not empty sessionScope.account}">

                    <a href="${pageContext.request.contextPath}/logout"
                       class="account-button"
                       title="Đăng xuất - ${sessionScope.account.username}"
                       aria-label="Đăng xuất">

                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="2"
                             stroke-linecap="round"
                             stroke-linejoin="round">

                            <circle cx="12" cy="8" r="4"/>
                            <path d="M4 21c0-4 3.6-7 8-7s8 3 8 7"/>

                        </svg>

                    </a>

                </c:when>

                <c:otherwise>

                    <a href="${pageContext.request.contextPath}/login"
                       class="account-button"
                       title="Đăng nhập"
                       aria-label="Đăng nhập">

                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="2"
                             stroke-linecap="round"
                             stroke-linejoin="round">

                            <circle cx="12" cy="8" r="4"/>
                            <path d="M4 21c0-4 3.6-7 8-7s8 3 8 7"/>

                        </svg>

                    </a>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</header>



<main class="page-shell">


    <c:choose>


        <c:when test="${not empty product}">


            <nav class="breadcrumb"
                 aria-label="Breadcrumb">

                <a href="${pageContext.request.contextPath}/home">
                    Trang chủ
                </a>

                <span class="breadcrumb-arrow">
                    ›
                </span>

                <a href="${pageContext.request.contextPath}/product">
                    Sản phẩm
                </a>

                <span class="breadcrumb-arrow">
                    ›
                </span>

                <span class="breadcrumb-current">
                    ${product.productName}
                </span>

            </nav>



            <section class="detail-card">


                <div class="product-image-area">


                    <c:choose>

                        <c:when test="${not empty product.image}">

                            <c:choose>

                                <c:when test="${fn:startsWith(product.image, 'http://')
                                                or fn:startsWith(product.image, 'https://')}">

                                    <c:set var="imageUrl"
                                           value="${product.image}"/>

                                </c:when>

                                <c:otherwise>

                                    <c:set var="imageUrl"
                                           value="${pageContext.request.contextPath}/image?fname=${product.image}"/>

                                </c:otherwise>

                            </c:choose>


                            <img
                                    src="${imageUrl}"
                                    class="product-image"
                                    alt="${product.productName}"

                                    onerror="
                                        this.onerror=null;
                                        this.src='https://placehold.co/700x600?text=No+Image';
                                    "
                            >

                        </c:when>


                        <c:otherwise>

                            <div class="no-image">

                                <svg viewBox="0 0 24 24"
                                     fill="none"
                                     stroke-width="1.6"
                                     stroke-linecap="round"
                                     stroke-linejoin="round">

                                    <rect
                                            x="3"
                                            y="4"
                                            width="18"
                                            height="16"
                                            rx="2"/>

                                    <circle
                                            cx="8.5"
                                            cy="9"
                                            r="1.5"/>

                                    <path d="m21 15-5-5L5 20"/>

                                </svg>

                                <div>
                                    Chưa có ảnh sản phẩm
                                </div>

                            </div>

                        </c:otherwise>

                    </c:choose>

                </div>



                <div class="product-info">


                    <c:if test="${not empty product.category}">

                        <div class="category-badge">
                            ${product.category.categoryname}
                        </div>

                    </c:if>


                    <h1 class="product-title">
                        ${product.productName}
                    </h1>


                    <div class="product-price">

                        <fmt:formatNumber
                                value="${product.price}"
                                type="number"
                                groupingUsed="true"
                                maxFractionDigits="0"
                        />đ

                    </div>



                    <div class="product-information">


                        <div class="information-row">

                            <div class="information-icon">

                                <svg viewBox="0 0 24 24"
                                     fill="none"
                                     stroke-width="1.8"
                                     stroke-linecap="round"
                                     stroke-linejoin="round">

                                    <rect x="4" y="4" width="6" height="6" rx="1"/>
                                    <rect x="14" y="4" width="6" height="6" rx="1"/>
                                    <rect x="4" y="14" width="6" height="6" rx="1"/>
                                    <rect x="14" y="14" width="6" height="6" rx="1"/>

                                </svg>

                            </div>


                            <div class="information-label">
                                Danh mục
                            </div>


                            <div class="information-value">

                                <c:choose>

                                    <c:when test="${not empty product.category}">
                                        ${product.category.categoryname}
                                    </c:when>

                                    <c:otherwise>
                                        Chưa phân loại
                                    </c:otherwise>

                                </c:choose>

                            </div>

                        </div>



                        <div class="information-row">

                            <div class="information-icon">

                                <svg viewBox="0 0 24 24"
                                     fill="none"
                                     stroke-width="1.8"
                                     stroke-linecap="round"
                                     stroke-linejoin="round">

                                    <path d="M4 7 12 3l8 4-8 4-8-4Z"/>
                                    <path d="M4 7v10l8 4 8-4V7"/>
                                    <path d="M12 11v10"/>

                                </svg>

                            </div>


                            <div class="information-label">
                                Số lượng
                            </div>


                            <div class="information-value">
                                ${product.quantity}
                            </div>

                        </div>



                        <div class="information-row">

                            <div class="information-icon">

                                <svg viewBox="0 0 24 24"
                                     fill="none"
                                     stroke-width="1.8"
                                     stroke-linecap="round"
                                     stroke-linejoin="round">

                                    <path d="M20 13 13 20 4 11V4h7l9 9Z"/>
                                    <circle cx="8.5" cy="8.5" r="1"/>

                                </svg>

                            </div>


                            <div class="information-label">
                                Trạng thái
                            </div>


                            <div class="information-value">

                                <c:choose>

                                    <c:when test="${product.status == 1}">

                                        <span class="status status-active">
                                            Còn hàng
                                        </span>

                                    </c:when>

                                    <c:otherwise>

                                        <span class="status status-inactive">
                                            Ngừng bán
                                        </span>

                                    </c:otherwise>

                                </c:choose>

                            </div>

                        </div>

                    </div>



                    <section class="description-section">

                        <div class="description-title">
                            Mô tả sản phẩm
                        </div>


                        <c:choose>

                            <c:when test="${not empty product.description}">

                                <p class="description-content">
                                    ${product.description}
                                </p>

                            </c:when>

                            <c:otherwise>

                                <p class="description-content">
                                    Sản phẩm hiện chưa có mô tả chi tiết.
                                </p>

                            </c:otherwise>

                        </c:choose>

                    </section>



                    <div class="detail-actions">


                        <a
                                href="${pageContext.request.contextPath}/product"
                                class="action-button back-button">

                            <svg viewBox="0 0 24 24"
                                 fill="none"
                                 stroke-width="2"
                                 stroke-linecap="round"
                                 stroke-linejoin="round">

                                <path d="M19 12H5"/>
                                <path d="m12 19-7-7 7-7"/>

                            </svg>

                            Quay lại sản phẩm

                        </a>


                        <a
                                href="${pageContext.request.contextPath}/home"
                                class="action-button home-button">

                            <svg viewBox="0 0 24 24"
                                 fill="none"
                                 stroke-width="2"
                                 stroke-linecap="round"
                                 stroke-linejoin="round">

                                <path d="m3 11 9-8 9 8"/>
                                <path d="M5 10v10h14V10"/>
                                <path d="M9 20v-6h6v6"/>

                            </svg>

                            Trang chủ

                        </a>


                    </div>


                </div>


            </section>


        </c:when>



        <c:otherwise>


            <section class="not-found">

                <h2>
                    Không tìm thấy sản phẩm
                </h2>

                <p>
                    Sản phẩm bạn đang tìm kiếm không tồn tại hoặc đã bị xóa.
                </p>

                <a
                        href="${pageContext.request.contextPath}/product"
                        class="action-button back-button">

                    ← Quay lại danh sách sản phẩm

                </a>

            </section>


        </c:otherwise>


    </c:choose>


</main>


</body>

</html>