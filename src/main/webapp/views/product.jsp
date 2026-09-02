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

    <title>Shop - Sản phẩm</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background:
                    radial-gradient(circle at left bottom, rgba(219, 234, 254, 0.9), transparent 26%),
                    radial-gradient(circle at right bottom, rgba(191, 219, 254, 0.65), transparent 24%),
                    #ffffff;
            color: #0f172a;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        button,
        input,
        select {
            font: inherit;
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
        .account-button svg,
        .filter-icon,
        .sidebar-row svg {
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

        .search-form-disabled {
            background: #f8fafc;
            opacity: 0.72;
        }

        .search-form-disabled input,
        .search-form-disabled button {
            cursor: not-allowed;
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

        .page-shell {
            width: 95%;
            max-width: 1500px;
            margin: 18px auto 46px;
        }

        .page-hero {
            min-height: 124px;
            padding: 28px 38px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            overflow: hidden;
            position: relative;
            border-radius: 18px;
            background:
                    radial-gradient(circle at 72% 10%, rgba(255, 255, 255, 0.9), transparent 19%),
                    linear-gradient(135deg, #eff6ff 0%, #dbeafe 58%, #bfdbfe 100%);
            box-shadow: 0 16px 36px rgba(15, 23, 42, 0.07);
        }

        .page-hero::before {
            content: "";
            position: absolute;
            right: -8%;
            bottom: -68%;
            width: 62%;
            height: 150%;
            border-radius: 50%;
            border: 1px solid rgba(255, 255, 255, 0.72);
        }

        .page-hero::after {
            content: "";
            position: absolute;
            right: 34px;
            top: 22px;
            width: 160px;
            height: 80px;
            opacity: 0.55;
            background-image: radial-gradient(#ffffff 1.8px, transparent 1.8px);
            background-size: 18px 18px;
        }

        .page-title {
            margin: 0 0 10px;
            position: relative;
            z-index: 1;
            font-size: 40px;
            line-height: 1.1;
            font-weight: 800;
            color: #071333;
        }

        .page-subtitle {
            margin: 0;
            position: relative;
            z-index: 1;
            max-width: 620px;
            font-size: 15px;
            line-height: 1.6;
            color: #475569;
        }

        .content-layout {
            margin-top: 24px;
            display: grid;
            grid-template-columns: 300px minmax(0, 1fr);
            gap: 34px;
            align-items: start;
        }

        .sidebar {
            overflow: hidden;
            border: 1px solid #e6edf7;
            border-radius: 14px;
            background: rgba(255, 255, 255, 0.96);
            box-shadow: 0 16px 40px rgba(15, 23, 42, 0.06);
        }

        .filter-section {
            padding: 20px 18px;
            border-bottom: 1px solid #e6edf7;
        }

        .filter-section:last-child {
            border-bottom: 0;
        }

        .filter-title {
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            font-size: 16px;
            font-weight: 700;
            color: #0f172a;
        }

        .filter-title-main {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .filter-icon {
            width: 18px;
            height: 18px;
            color: #0b63f6;
        }

        .collapse-icon {
            width: 26px;
            height: 2px;
            border-radius: 999px;
            background: #cbd5e1;
            font-size: 0;
        }

        .sidebar-list {
            display: grid;
            gap: 8px;
        }

        .sidebar-row {
            min-height: 42px;
            padding: 0 12px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-radius: 8px;
            color: #1e293b;
            font-size: 14px;
            transition: background 0.2s ease, color 0.2s ease;
        }

        .sidebar-row:hover,
        .sidebar-row.active {
            background: #eff6ff;
            color: #0b63f6;
        }

        button.sidebar-row {
            width: 100%;
            border: 0;
            background: transparent;
            cursor: pointer;
            text-align: left;
        }

        .sidebar-row.is-disabled {
            cursor: not-allowed;
            color: #64748b;
            opacity: 0.72;
        }

        .sidebar-row.is-disabled:hover {
            background: transparent;
            color: #64748b;
        }

        .sidebar-row svg {
            width: 19px;
            height: 19px;
            flex-shrink: 0;
        }

        .sidebar-label {
            min-width: 0;
            flex: 1;
        }

        .sidebar-count {
            min-width: 28px;
            height: 24px;
            padding: 0 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 7px;
            background: #eaf2ff;
            color: #0b63f6;
            font-size: 13px;
            font-weight: 600;
        }

        .coming-soon {
            min-width: 48px;
            height: 24px;
            padding: 0 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 7px;
            background: #f1f5f9;
            color: #64748b;
            font-size: 12px;
            font-weight: 600;
        }

        .range-track {
            height: 8px;
            margin: 4px 8px 20px;
            position: relative;
            overflow: hidden;
            border-radius: 999px;
            background: #e2e8f0;
        }

        .range-track::before {
            content: "";
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            background: linear-gradient(90deg, #93c5fd, #bfdbfe);
        }

        .range-values {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 10px;
        }

        .range-box {
            min-height: 48px;
            padding: 8px 10px;
            border: 1px solid #dbe4f0;
            border-radius: 8px;
            background: #ffffff;
        }

        .range-label {
            margin-bottom: 2px;
            font-size: 12px;
            color: #64748b;
        }

        .range-price {
            font-size: 15px;
            font-weight: 700;
            color: #1e293b;
        }

        .filter-note {
            margin-top: 12px;
            font-size: 12px;
            line-height: 1.45;
            color: #94a3b8;
        }

        .static-control {
            width: 100%;
            min-height: 44px;
            padding: 0 12px;
            display: flex;
            align-items: center;
            border: 1px solid #dbe4f0;
            border-radius: 8px;
            background: #f8fafc;
            color: #64748b;
            cursor: default;
            user-select: none;
        }

        .products-area {
            min-width: 0;
        }

        .product-toolbar {
            min-height: 44px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px;
        }

        .product-count {
            color: #475569;
            font-size: 15px;
        }

        .product-count strong {
            color: #0f172a;
        }

        .sort-box {
            min-width: 260px;
            height: 44px;
            padding: 0 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            border: 1px solid #dbe4f0;
            border-radius: 10px;
            background: #ffffff;
            color: #475569;
            font-size: 14px;
        }

        .sort-box strong {
            color: #0f172a;
            font-weight: 500;
        }

        .sort-box.is-disabled {
            cursor: default;
            background: #f8fafc;
            opacity: 0.78;
            user-select: none;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 18px;
        }

        .product-card {
            min-width: 0;
            overflow: hidden;
            border: 1px solid #e6edf7;
            border-radius: 12px;
            background: #ffffff;
            box-shadow: 0 14px 34px rgba(15, 23, 42, 0.05);
            transition: transform 0.22s ease, box-shadow 0.22s ease, border-color 0.22s ease;
        }

        .product-card:hover {
            transform: translateY(-4px);
            border-color: #bfdbfe;
            box-shadow: 0 18px 42px rgba(15, 23, 42, 0.10);
        }

        .image-box {
            height: 180px;
            padding: 18px 22px 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
        }

        .image-link {
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
            transform: scale(1.05);
        }

        .no-image {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 8px;
            color: #94a3b8;
            font-size: 13px;
        }

        .no-image svg {
            width: 42px;
            height: 42px;
            stroke: #cbd5e1;
        }

        .product-content {
            padding: 14px 18px 18px;
        }

        .product-name {
            min-height: 22px;
            margin: 0 0 6px;
            font-size: 15px;
            line-height: 1.45;
            font-weight: 600;
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

        .product-category {
            min-height: 19px;
            margin-bottom: 8px;
            color: #64748b;
            font-size: 13px;
        }

        .product-meta {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 14px;
        }

        .product-price {
            color: #005cff;
            font-size: 18px;
            font-weight: 800;
        }

        .status-active,
        .status-inactive {
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }

        .status-active {
            color: #16a34a;
        }

        .status-inactive {
            color: #dc2626;
        }

        .empty-state {
            min-height: 330px;
            padding: 48px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-align: center;
            border: 1px solid #e6edf7;
            border-radius: 14px;
            background: rgba(255, 255, 255, 0.94);
            color: #64748b;
        }

        .empty-state svg {
            width: 58px;
            height: 58px;
            stroke: #94a3b8;
        }

        .empty-title {
            font-size: 19px;
            font-weight: 700;
            color: #334155;
        }

        .pagination {
            margin-top: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .pagination a,
        .pagination span {
            min-width: 42px;
            height: 42px;
            padding: 0 12px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #e0e8f3;
            border-radius: 10px;
            background: #ffffff;
            color: #0f172a;
            font-size: 15px;
            font-weight: 600;
            box-shadow: 0 8px 18px rgba(15, 23, 42, 0.04);
        }

        .pagination a:hover {
            color: #0b63f6;
            border-color: #bfdbfe;
        }

        .pagination .active {
            color: #ffffff;
            border-color: #0b63f6;
            background: #0b63f6;
            box-shadow: 0 10px 24px rgba(37, 99, 235, 0.24);
        }

        .pagination .disabled {
            color: #94a3b8;
            background: #f8fafc;
        }

        @media (max-width: 1200px) {
            .header-container,
            .page-shell {
                width: 94%;
            }

            .nav-menu {
                gap: 26px;
            }

            .search-form {
                width: 260px;
            }

            .content-layout {
                grid-template-columns: 270px minmax(0, 1fr);
                gap: 24px;
            }
        }

        @media (max-width: 980px) {
            .nav-menu {
                display: none;
            }

            .content-layout {
                grid-template-columns: 1fr;
            }

            .sidebar {
                display: none;
            }

            .product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 720px) {
            .search-form,
            .sort-box {
                display: none;
            }

            .page-hero {
                min-height: 110px;
                padding: 24px;
                border-radius: 14px;
            }

            .page-title {
                font-size: 30px;
            }

            .product-toolbar {
                margin-bottom: 14px;
            }

            .product-grid {
                grid-template-columns: 1fr;
            }

            .image-box {
                height: 220px;
            }
        }

        @media (max-width: 480px) {
            .header-container {
                height: 66px;
            }

            .logo {
                font-size: 25px;
            }

            .logo-icon {
                width: 36px;
                height: 36px;
                border-radius: 9px;
            }

            .page-shell {
                margin-top: 14px;
            }

            .page-title {
                font-size: 28px;
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
    <section class="page-hero">
        <h1 class="page-title">
            Tất cả sản phẩm
        </h1>

        <p class="page-subtitle">
            Khám phá toàn bộ sản phẩm công nghệ chất lượng, chính hãng tại Shop.
        </p>
    </section>

    <div class="content-layout">
        <aside class="sidebar" aria-label="Bộ lọc sản phẩm">
            <section class="filter-section">
                <div class="filter-title">
                    <span class="filter-title-main">
                        <svg class="filter-icon"
                             viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="2"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <rect x="4" y="4" width="6" height="6" rx="1"/>
                            <rect x="14" y="4" width="6" height="6" rx="1"/>
                            <rect x="4" y="14" width="6" height="6" rx="1"/>
                            <rect x="14" y="14" width="6" height="6" rx="1"/>
                        </svg>
                        Danh mục
                    </span>
                    <span class="collapse-icon" aria-hidden="true"></span>
                </div>

                <div class="sidebar-list">
                    <a class="sidebar-row active"
                       href="${pageContext.request.contextPath}/product">
                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="1.8"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <path d="M4 7h12v10H4z"/>
                            <path d="M16 11h3l2 3v3h-5z"/>
                            <circle cx="7" cy="18" r="1.5"/>
                            <circle cx="18" cy="18" r="1.5"/>
                        </svg>
                        <span class="sidebar-label">Tất cả sản phẩm</span>
                        <span class="sidebar-count">${totalProducts}</span>
                    </a>

                    <button class="sidebar-row is-disabled"
                            type="button"
                            disabled>
                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="1.8"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <rect x="4" y="5" width="16" height="10" rx="1"/>
                            <path d="M8 19h8"/>
                            <path d="M12 15v4"/>
                        </svg>
                        <span class="sidebar-label">Laptop</span>
                        <span class="coming-soon">sắp có</span>
                    </button>

                    <button class="sidebar-row is-disabled"
                            type="button"
                            disabled>
                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="1.8"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <rect x="8" y="3" width="8" height="18" rx="2"/>
                            <path d="M11 18h2"/>
                        </svg>
                        <span class="sidebar-label">Điện thoại</span>
                        <span class="coming-soon">sắp có</span>
                    </button>

                    <button class="sidebar-row is-disabled"
                            type="button"
                            disabled>
                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="1.8"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <path d="M4 13a8 8 0 0 1 16 0"/>
                            <path d="M4 13v4a2 2 0 0 0 2 2h1v-6H4z"/>
                            <path d="M20 13v4a2 2 0 0 1-2 2h-1v-6h3z"/>
                        </svg>
                        <span class="sidebar-label">Tai nghe</span>
                        <span class="coming-soon">sắp có</span>
                    </button>

                    <button class="sidebar-row is-disabled"
                            type="button"
                            disabled>
                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="1.8"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <circle cx="12" cy="12" r="5"/>
                            <path d="M9 2h6"/>
                            <path d="M9 22h6"/>
                            <path d="M8 4 7 8"/>
                            <path d="m16 4 1 4"/>
                            <path d="m8 20-1-4"/>
                            <path d="m16 20 1-4"/>
                        </svg>
                        <span class="sidebar-label">Đồng hồ thông minh</span>
                        <span class="coming-soon">sắp có</span>
                    </button>

                    <button class="sidebar-row is-disabled"
                            type="button"
                            disabled>
                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="1.8"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <path d="M4 13a8 8 0 0 1 16 0"/>
                            <path d="M4 13v4a2 2 0 0 0 2 2h1v-6H4z"/>
                            <path d="M20 13v4a2 2 0 0 1-2 2h-1v-6h3z"/>
                        </svg>
                        <span class="sidebar-label">Phụ kiện</span>
                        <span class="coming-soon">sắp có</span>
                    </button>
                </div>
            </section>

            <section class="filter-section">
                <div class="filter-title">
                    <span class="filter-title-main">
                        <svg class="filter-icon"
                             viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="2"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <path d="m4 14 4-4 4 4 8-8"/>
                            <path d="M20 6v6h-6"/>
                        </svg>
                        Khoảng giá
                    </span>
                    <span class="collapse-icon" aria-hidden="true"></span>
                </div>

                <div class="range-track" aria-hidden="true"></div>

                <div class="range-values">
                    <div class="range-box">
                        <div class="range-label">Từ</div>
                        <div class="range-price">0 đ</div>
                    </div>

                    <div class="range-box">
                        <div class="range-label">Đến</div>
                        <div class="range-price">50.000.000 đ</div>
                    </div>
                </div>

                <div class="filter-note">
                    Bộ lọc giá sẽ hoạt động khi có xử lý backend.
                </div>
            </section>

            <section class="filter-section">
                <div class="filter-title">
                    <span class="filter-title-main">
                        <svg class="filter-icon"
                             viewBox="0 0 24 24"
                             fill="none"
                             stroke-width="2"
                             stroke-linecap="round"
                             stroke-linejoin="round">
                            <path d="M3 7h12"/>
                            <path d="M3 12h8"/>
                            <path d="M3 17h4"/>
                            <path d="m17 8 3 3 3-3"/>
                            <path d="M20 11V4"/>
                            <path d="m17 16 3-3 3 3"/>
                            <path d="M20 13v7"/>
                        </svg>
                        Sắp xếp
                    </span>
                    <span class="collapse-icon" aria-hidden="true"></span>
                </div>

                <div class="static-control" aria-label="Sắp xếp sản phẩm">
                    Mới nhất
                </div>

                <div class="filter-note">
                    Hiện đang dùng thứ tự mới nhất từ hệ thống.
                </div>
            </section>
        </aside>

        <section class="products-area" aria-label="Danh sách sản phẩm">
            <div class="product-toolbar">
                <div class="product-count">
                    Hiển thị <strong>${fn:length(products)}</strong> trên <strong>${totalProducts}</strong> sản phẩm
                </div>

                <div class="sort-box is-disabled" aria-disabled="true">
                    <span>Sắp xếp theo</span>
                    <strong>Mới nhất</strong>
                </div>
            </div>

            <c:choose>
                <c:when test="${empty products}">
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

                        <div class="empty-title">
                            Chưa có sản phẩm
                        </div>

                        <div>
                            Hiện chưa có sản phẩm nào để hiển thị.
                        </div>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="product-grid">
                        <c:forEach items="${products}"
                                   var="product">
                            <article class="product-card">
                                <div class="image-box">
                                    <c:choose>
                                        <c:when test="${not empty product.image}">
                                            <c:choose>
                                                <c:when test="${fn:startsWith(product.image, 'http://')
                                                        or fn:startsWith(product.image, 'https://')}">
                                                    <c:set var="imageUrl"
                                                           value="${product.image}" />
                                                </c:when>

                                                <c:otherwise>
                                                    <c:set var="imageUrl"
                                                           value="${pageContext.request.contextPath}/image?fname=${product.image}" />
                                                </c:otherwise>
                                            </c:choose>

                                            <a class="image-link"
                                               href="${pageContext.request.contextPath}/product/detail?id=${product.productId}">
                                                <img src="${imageUrl}"
                                                     class="product-image"
                                                     alt="${product.productName}"
                                                     onerror="this.onerror=null; this.src='https://placehold.co/400x300?text=No+Image';">
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

                                    <div class="product-category">
                                        <c:if test="${not empty product.category}">
                                            ${product.category.categoryname}
                                        </c:if>
                                    </div>

                                    <div class="product-meta">
                                        <div class="product-price">
                                            <fmt:formatNumber value="${product.price}"
                                                              type="number"
                                                              groupingUsed="true"
                                                              maxFractionDigits="0" />đ
                                        </div>

                                        <c:choose>
                                            <c:when test="${product.status == 1}">
                                                <span class="status-active">Còn hàng</span>
                                            </c:when>

                                            <c:otherwise>
                                                <span class="status-inactive">Ngừng bán</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>

            <c:if test="${totalPages > 1}">
                <nav class="pagination" aria-label="Phân trang">
                    <c:choose>
                        <c:when test="${currentPage > 1}">
                            <a href="${pageContext.request.contextPath}/product?page=1"
                               aria-label="Trang đầu">
                                &laquo;
                            </a>
                        </c:when>

                        <c:otherwise>
                            <span class="disabled">&laquo;</span>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="1"
                               end="${totalPages}"
                               var="pageNumber">
                        <c:choose>
                            <c:when test="${pageNumber == currentPage}">
                                <span class="active">${pageNumber}</span>
                            </c:when>

                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/product?page=${pageNumber}">
                                    ${pageNumber}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${currentPage < totalPages}">
                            <a href="${pageContext.request.contextPath}/product?page=${totalPages}"
                               aria-label="Trang cuối">
                                &raquo;
                            </a>
                        </c:when>

                        <c:otherwise>
                            <span class="disabled">&raquo;</span>
                        </c:otherwise>
                    </c:choose>
                </nav>
            </c:if>
        </section>
    </div>
</main>

</body>
</html>

