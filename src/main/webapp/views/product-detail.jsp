<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>${product.productName}</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            color: #222;
        }

        .container {
            width: 92%;
            max-width: 1200px;
            margin: 30px auto;
        }

        .breadcrumb {
            margin-bottom: 18px;
            color: #666;
            font-size: 14px;
        }

        .breadcrumb a {
            text-decoration: none;
            color: #0066cc;
        }

        .product-detail {
            display: grid;
            grid-template-columns: 45% 55%;

            background: #fff;
            border-radius: 10px;

            overflow: hidden;
            border: 1px solid #e5e5e5;
        }

        /* =========================
           LEFT - IMAGE
           ========================= */

        .product-left {
            padding: 25px;

            border-right: 1px solid #eee;
        }

        .image-box {
            width: 100%;
            height: 430px;

            display: flex;
            justify-content: center;
            align-items: center;

            background: #fafafa;

            border-radius: 8px;
            overflow: hidden;
        }

        .product-image {
            width: 100%;
            height: 100%;

            object-fit: contain;
        }

        .no-image {
            color: #999;
            font-size: 18px;
        }

        /* =========================
           RIGHT - INFORMATION
           ========================= */

        .product-right {
            padding: 30px 35px;
        }

        .product-name {
            font-size: 28px;
            font-weight: 500;

            line-height: 1.4;

            margin: 0 0 18px;
        }

        .category {
            color: #777;
            margin-bottom: 18px;
        }

        .price-box {
            background: #fafafa;

            padding: 18px 20px;

            margin-bottom: 25px;
        }

        .product-price {
            color: #ee4d2d;

            font-size: 32px;
            font-weight: bold;
        }

        .information {
            display: grid;

            grid-template-columns: 140px 1fr;

            row-gap: 18px;

            align-items: center;
        }

        .label {
            color: #777;
        }

        .value {
            font-weight: 500;
        }

        .status-active {
            color: #16a34a;
            font-weight: bold;
        }

        .status-inactive {
            color: #dc2626;
            font-weight: bold;
        }

        .description-box {
            margin-top: 30px;

            border-top: 1px solid #eee;

            padding-top: 20px;
        }

        .description-title {
            font-size: 18px;
            font-weight: bold;

            margin-bottom: 10px;
        }

        .description {
            color: #555;
            line-height: 1.7;
        }

        .actions {
            margin-top: 30px;

            display: flex;
            gap: 12px;
        }

        .btn {
            display: inline-block;

            padding: 12px 22px;

            border-radius: 6px;

            text-decoration: none;

            font-size: 15px;
        }

        .btn-back {
            border: 1px solid #ee4d2d;
            color: #ee4d2d;

            background: #fff;
        }

        .btn-back:hover {
            background: #fff5f2;
        }

        .btn-home {
            background: #ee4d2d;
            color: white;
        }

        .btn-home:hover {
            background: #d84324;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 850px) {

            .product-detail {
                grid-template-columns: 1fr;
            }

            .product-left {
                border-right: none;
                border-bottom: 1px solid #eee;
            }

            .image-box {
                height: 320px;
            }

            .product-right {
                padding: 25px;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <!-- Breadcrumb -->
    <div class="breadcrumb">

        <a href="${pageContext.request.contextPath}/home">
            Trang chủ
        </a>

        &gt;

        <a href="${pageContext.request.contextPath}/product">
            Sản phẩm
        </a>

        &gt;

        ${product.productName}

    </div>


    <div class="product-detail">

        <!-- =========================
             LEFT
             ========================= -->

        <div class="product-left">

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

                        <img
                            src="${imageUrl}"
                            class="product-image"
                            alt="${product.productName}"

                            onerror="
                                this.onerror=null;
                                this.src='https://placehold.co/500x400?text=No+Image';
                            "
                        >

                    </c:when>

                    <c:otherwise>

                        <div class="no-image">
                            Chưa có ảnh sản phẩm
                        </div>

                    </c:otherwise>

                </c:choose>

            </div>

        </div>


        <!-- =========================
             RIGHT
             ========================= -->

        <div class="product-right">

            <h1 class="product-name">
                ${product.productName}
            </h1>


            <div class="category">

                Danh mục:

                <strong>
                    ${product.category.categoryname}
                </strong>

            </div>


            <!-- PRICE -->

            <div class="price-box">

                <span class="product-price">
                    ${product.price} VNĐ
                </span>

            </div>


            <!-- INFORMATION -->

            <div class="information">

                <div class="label">
                    Số lượng
                </div>

                <div class="value">
                    ${product.quantity}
                </div>


                <div class="label">
                    Trạng thái
                </div>

                <div class="value">

                    <c:choose>

                        <c:when test="${product.status == 1}">

                            <span class="status-active">
                                Còn hàng
                            </span>

                        </c:when>

                        <c:otherwise>

                            <span class="status-inactive">
                                Ngừng bán
                            </span>

                        </c:otherwise>

                    </c:choose>

                </div>


                <div class="label">
                    Ngày tạo
                </div>

                <div class="value">
                    ${product.createdDate}
                </div>

            </div>


            <!-- DESCRIPTION -->

            <div class="description-box">

                <div class="description-title">
                    Mô tả sản phẩm
                </div>

                <div class="description">
                    ${product.description}
                </div>

            </div>


            <!-- ACTION -->

            <div class="actions">

                <a
                    href="${pageContext.request.contextPath}/product"
                    class="btn btn-back">

                    ← Danh sách sản phẩm

                </a>

                <a
                    href="${pageContext.request.contextPath}/home"
                    class="btn btn-home">

                    Trang chủ

                </a>

            </div>

        </div>

    </div>

</div>

</body>

</html>
