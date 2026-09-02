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

    <title>Shop - Trang chủ</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #ffffff;
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
            box-shadow: 0 10px 22px rgba(37, 99, 235, 0.22);
        }

        .logo-icon svg,
        .search-submit svg,
        .account-button svg {
            stroke: currentColor;
        }

        .logo-icon svg {
            width: 24px;
            height: 24px;
            color: #ffffff;
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
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .search-form:focus-within {
            border-color: #0b63f6;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.10);
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
            cursor: pointer;
        }

        .search-submit:hover {
            color: #0b63f6;
        }

        .search-submit svg {
            width: 23px;
            height: 23px;
        }

        .account-button {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            color: #0f172a;
            transition: color 0.2s ease, background 0.2s ease;
        }

        .account-button:hover {
            color: #0b63f6;
            background: #eff6ff;
        }

        .account-button svg {
            width: 26px;
            height: 26px;
        }

        .hero-section,
        .product-section {
            width: 95%;
            max-width: 1500px;
            margin-right: auto;
            margin-left: auto;
        }

        .hero-section {
            margin-top: 18px;
            margin-bottom: 18px;
        }

        .hero-banner {
            overflow: hidden;
            border-radius: 22px;
            background: #dbeafe;
            box-shadow: 0 20px 44px rgba(15, 23, 42, 0.10);
        }

        .hero-banner a,
        .hero-banner img {
            display: block;
        }

        .hero-banner img {
            width: 100%;
            height: clamp(220px, 24vw, 360px);
            aspect-ratio: 3 / 1;
            object-fit: cover;
            object-position: center center;
            transition: transform 0.35s ease;
        }

        .hero-banner:hover img {
            transform: scale(1.01);
        }

        .product-section {
            padding-bottom: 46px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(5, minmax(0, 1fr));
            gap: 16px 20px;
        }

        .product-card {
            min-width: 0;
            overflow: hidden;
            border: 1px solid #e6edf7;
            border-radius: 14px;
            background: #ffffff;
            box-shadow: 0 10px 28px rgba(15, 23, 42, 0.04);
            transition: transform 0.22s ease, box-shadow 0.22s ease, border-color 0.22s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
            border-color: #bfdbfe;
            box-shadow: 0 18px 38px rgba(15, 23, 42, 0.10);
        }

        .product-image-box {
            width: 100%;
            height: 150px;
            padding: 16px 18px 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
        }

        .product-image-link {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: contain;
            transition: transform 0.25s ease;
        }

        .product-card:hover .product-image {
            transform: scale(1.055);
        }

        .no-image {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 7px;
            color: #94a3b8;
            font-size: 13px;
        }

        .no-image svg {
            width: 40px;
            height: 40px;
            stroke: #cbd5e1;
        }

        .product-content {
            padding: 11px 26px 20px;
        }

        .product-name {
            min-height: 42px;
            margin: 0 0 8px;
            display: flex;
            align-items: flex-end;
            font-size: 16px;
            font-weight: 500;
            line-height: 1.35;
            color: #071333;
        }

        .product-name a {
            display: -webkit-box;
            overflow: hidden;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            transition: color 0.2s ease;
        }

        .product-name a:hover {
            color: #0b63f6;
        }

        .product-price {
            font-size: 18px;
            font-weight: 700;
            color: #005cff;
        }

        .empty-state {
            min-height: 280px;
            padding: 48px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-align: center;
            border: 1px solid #e6edf7;
            border-radius: 16px;
            background: linear-gradient(135deg, #f8fafc, #eff6ff);
            color: #64748b;
        }

        .empty-state svg {
            width: 58px;
            height: 58px;
            stroke: #94a3b8;
        }

        .empty-state-title {
            font-size: 19px;
            font-weight: 700;
            color: #334155;
        }

        @media (max-width: 1200px) {
            .header-container,
            .hero-section,
            .product-section {
                width: 94%;
            }

            .nav-menu {
                gap: 26px;
            }

            .search-form {
                width: 260px;
            }

            .product-grid {
                grid-template-columns: repeat(4, minmax(0, 1fr));
            }
        }

        @media (max-width: 980px) {
            .nav-menu {
                display: none;
            }

            .hero-banner img {
                height: clamp(200px, 30vw, 320px);
                aspect-ratio: 3 / 1;
                object-position: center center;
            }

            .product-grid {
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }
        }

        @media (max-width: 760px) {
            .search-form {
                display: none;
            }

            .logo {
                font-size: 25px;
            }

            .hero-banner {
                border-radius: 16px;
            }

            .hero-banner img {
                height: clamp(180px, 34vw, 250px);
                aspect-ratio: 3 / 1;
                object-position: center center;
            }

            .product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 480px) {
            .header-container {
                height: 66px;
            }

            .logo-icon {
                width: 36px;
                height: 36px;
                border-radius: 9px;
            }

            .hero-section {
                margin-top: 12px;
                margin-bottom: 14px;
            }

            .hero-banner img {
                height: clamp(165px, 42vw, 220px);
                aspect-ratio: 16 / 7.5;
                object-position: center center;
            }

            .product-grid {
                grid-template-columns: 1fr;
            }

            .product-image-box {
                height: 210px;
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
            <span>Shop</span>
        </a>

        <nav class="nav-menu" aria-label="Điều hướng chính">
            <a href="${pageContext.request.contextPath}/home"
               class="nav-link active">
                Trang chủ
            </a>

            <a href="${pageContext.request.contextPath}/product"
               class="nav-link">
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
            <form class="search-form"
                  action="${pageContext.request.contextPath}/product"
                  method="get">
                <input type="text"
                       name="keyword"
                       placeholder="Tìm kiếm sản phẩm..."
                       aria-label="Tìm kiếm sản phẩm">

                <button type="submit"
                        class="search-submit"
                        aria-label="Tìm kiếm">
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

<main>
    <section class="hero-section">
        <div class="hero-banner">
            <a href="${pageContext.request.contextPath}/product"
               aria-label="Khám phá sản phẩm">
                <img src="${pageContext.request.contextPath}/assets/image/headerhome.png"
                     alt="Top 10 Newest Product">
            </a>
        </div>
    </section>

    <section class="product-section" aria-label="Sản phẩm mới nhất">
        <c:choose>
            <c:when test="${empty latestProducts}">
                <div class="empty-state">
                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke-width="1.7"
                         stroke-linecap="round"
                         stroke-linejoin="round"
                         aria-hidden="true">
                        <path d="M3 7 12 3l9 4-9 4-9-4Z"/>
                        <path d="M3 7v10l9 4 9-4V7"/>
                        <path d="M12 11v10"/>
                    </svg>

                    <div class="empty-state-title">
                        Chưa có sản phẩm
                    </div>

                    <div>
                        Hiện chưa có sản phẩm nào để hiển thị.
                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <div class="product-grid">
                    <c:forEach items="${latestProducts}"
                               var="product">
                        <article class="product-card">
                            <div class="product-image-box">
                                <c:choose>
                                    <c:when test="${not empty product.image}">
                                        <a class="product-image-link"
                                           href="${pageContext.request.contextPath}/product/detail?id=${product.productId}">
                                            <c:choose>
                                                <c:when test="${fn:startsWith(product.image, 'http://')
                                                        or fn:startsWith(product.image, 'https://')}">
                                                    <img src="${product.image}"
                                                         alt="${product.productName}"
                                                         class="product-image"
                                                         onerror="this.onerror=null; this.src='https://placehold.co/400x300?text=No+Image';">
                                                </c:when>

                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/image?fname=${product.image}"
                                                         alt="${product.productName}"
                                                         class="product-image"
                                                         onerror="this.onerror=null; this.src='https://placehold.co/400x300?text=No+Image';">
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                    </c:when>

                                    <c:otherwise>
                                        <div class="no-image">
                                            <svg viewBox="0 0 24 24"
                                                 fill="none"
                                                 stroke-width="1.7"
                                                 stroke-linecap="round"
                                                 stroke-linejoin="round"
                                                 aria-hidden="true">
                                                <rect x="3" y="4" width="18" height="16" rx="2"/>
                                                <circle cx="8.5" cy="9" r="1.5"/>
                                                <path d="m21 15-5-5L5 20"/>
                                            </svg>
                                            Chưa có ảnh
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="product-content">
                                <h2 class="product-name">
                                    <a href="${pageContext.request.contextPath}/product/detail?id=${product.productId}"
                                       title="${product.productName}">
                                        ${product.productName}
                                    </a>
                                </h2>

                                <div class="product-price">
                                    <fmt:formatNumber value="${product.price}"
                                                      type="number"
                                                      groupingUsed="true"
                                                      maxFractionDigits="0" />đ
                                </div>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </section>
</main>

</body>
</html>
