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

    <title>Quản lý sản phẩm</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/admin.css">

</head>

<body>


<%@ include file="../category/common/sidebar.jspf" %>


<div class="main-wrapper">


    <header class="topbar">

        <div>

            <span class="topbar-label">
                Trang quản trị
            </span>

            <strong>
                Quản lý sản phẩm
            </strong>

        </div>


        <a href="${pageContext.request.contextPath}/admin/products"
           class="topbar-action">

            Làm mới

        </a>

    </header>



    <main class="content">


        <section class="page-heading">

            <div>

                <p class="eyebrow">
                    CRUD Product
                </p>

                <h1>
                    Danh sách sản phẩm
                </h1>

                <p class="page-description">
                    Theo dõi, tìm kiếm và quản lý các sản phẩm trong hệ thống.
                </p>

            </div>


            <a href="${pageContext.request.contextPath}/admin/product/add"
               class="primary-button">

                <span>+</span>

                Thêm sản phẩm

            </a>

        </section>



        <section class="panel">


            <div class="panel-toolbar">

                <div>

                    <h2>
                        Bảng sản phẩm
                    </h2>

                    <p>
                        <span id="visibleCount">0</span>
                        sản phẩm đang hiển thị
                    </p>

                </div>



                <div class="product-filter-group">


                    <label class="filter-box">

                        <span>
                            Danh mục
                        </span>


                        <select id="categoryFilter"
                                onchange="filterProducts()">

                            <option value="">
                                Tất cả danh mục
                            </option>

                        </select>

                    </label>



                    <label class="search-box">

                        <span>
                            Tìm kiếm
                        </span>


                        <input type="text"
                               id="productSearch"
                               placeholder="Nhập tên sản phẩm..."
                               oninput="filterProducts()">

                    </label>


                </div>

            </div>



            <div class="table-wrap">


                <table class="category-table"
                       id="productTable">


                    <thead>

                    <tr>

                        <th>
                            STT
                        </th>

                        <th>
                            Ảnh
                        </th>

                        <th>
                            Tên sản phẩm
                        </th>

                        <th>
                            Danh mục
                        </th>

                        <th>
                            Giá
                        </th>

                        <th>
                            Số lượng
                        </th>

                        <th>
                            Mô tả
                        </th>

                        <th>
                            Trạng thái
                        </th>

                        <th>
                            Ngày tạo
                        </th>

                        <th>
                            Hành động
                        </th>

                    </tr>

                    </thead>



                    <tbody>


                    <c:forEach items="${listProduct}"
                               var="product"
                               varStatus="stt">


                        <c:set var="categoryName"
                               value=""/>


                        <c:if test="${not empty product.category}">

                            <c:set var="categoryName"
                                   value="${product.category.categoryname}"/>

                        </c:if>



                        <tr class="product-row"
                            data-category="${categoryName}">


                            <td class="index-cell">

                                ${stt.index + 1}

                            </td>



                            <td>


                                <c:choose>


                                    <c:when test="${not empty product.image}">


                                        <c:choose>


                                            <c:when test="${fn:startsWith(product.image, 'http://')
                                                            or fn:startsWith(product.image, 'https://')}">

                                                <c:set var="productImageUrl"
                                                       value="${product.image}"/>

                                            </c:when>


                                            <c:otherwise>

                                                <c:url value="/image"
                                                       var="productImageUrl">

                                                    <c:param name="fname"
                                                             value="${product.image}"/>

                                                </c:url>

                                            </c:otherwise>


                                        </c:choose>


                                        <img src="${productImageUrl}"
                                             class="category-image"
                                             alt="${product.productName}">


                                    </c:when>


                                    <c:otherwise>

                                        <div class="image-placeholder">

                                            No image

                                        </div>

                                    </c:otherwise>


                                </c:choose>


                            </td>



                            <td class="product-name">

                                <strong>
                                    <c:out value="${product.productName}"/>
                                </strong>

                                <span class="product-id">
                                    ID: ${product.productId}
                                </span>

                            </td>



                            <td>

                                <c:choose>


                                    <c:when test="${not empty product.category}">

                                        <span class="product-category">

                                            <c:out value="${product.category.categoryname}"/>

                                        </span>

                                    </c:when>


                                    <c:otherwise>

                                        <span class="product-category product-category-empty">

                                            Chưa phân loại

                                        </span>

                                    </c:otherwise>


                                </c:choose>

                            </td>



                            <td class="product-price-admin">

                                <fmt:formatNumber
                                        value="${product.price}"
                                        type="number"
                                        groupingUsed="true"
                                        maxFractionDigits="0"
                                />

                                ₫

                            </td>



                            <td>

                                <c:choose>


                                    <c:when test="${product.quantity > 0}">

                                        <span class="quantity-value">

                                            ${product.quantity}

                                        </span>

                                    </c:when>


                                    <c:otherwise>

                                        <span class="quantity-empty">

                                            0

                                        </span>

                                    </c:otherwise>


                                </c:choose>

                            </td>



                            <td class="product-description-admin">


                                <c:choose>


                                    <c:when test="${not empty product.description}">


                                        <c:choose>


                                            <c:when test="${fn:length(product.description) > 60}">

                                                <c:out value="${fn:substring(product.description, 0, 60)}"/>...

                                            </c:when>


                                            <c:otherwise>

                                                <c:out value="${product.description}"/>

                                            </c:otherwise>


                                        </c:choose>


                                    </c:when>


                                    <c:otherwise>

                                        Chưa có mô tả

                                    </c:otherwise>


                                </c:choose>

                            </td>



                            <td>

                                <c:choose>


                                    <c:when test="${product.status == 1}">

                                        <span class="status-badge status-active">

                                            Hoạt động

                                        </span>

                                    </c:when>


                                    <c:otherwise>

                                        <span class="status-badge status-inactive">

                                            Khóa

                                        </span>

                                    </c:otherwise>


                                </c:choose>

                            </td>



                            <td class="created-date">

                                <c:choose>


                                    <c:when test="${not empty product.createdDate}">

                                        ${product.createdDate}

                                    </c:when>


                                    <c:otherwise>

                                        —

                                    </c:otherwise>


                                </c:choose>

                            </td>



                            <td>

                                <div class="action-group">


                                    <c:url value="/admin/product/edit"
                                           var="editUrl">

                                        <c:param name="id"
                                                 value="${product.productId}"/>

                                    </c:url>


                                    <c:url value="/admin/product/delete"
                                           var="deleteUrl">

                                        <c:param name="id"
                                                 value="${product.productId}"/>

                                    </c:url>



                                    <a href="${editUrl}"
                                       class="icon-button edit-button"
                                       title="Sửa sản phẩm">

                                        Sửa

                                    </a>



                                    <a href="${deleteUrl}"
                                       class="icon-button delete-button"
                                       title="Xóa sản phẩm"
                                       data-delete-url="${deleteUrl}"
                                       data-product-name="${product.productName}"
                                       onclick="openDeleteModal(this); return false;">

                                        Xóa

                                    </a>


                                </div>

                            </td>


                        </tr>


                    </c:forEach>



                    <c:if test="${empty listProduct}">

                        <tr>

                            <td colspan="10">

                                <div class="empty-state">

                                    <strong>
                                        Chưa có sản phẩm nào
                                    </strong>

                                    <span>
                                        Hãy thêm sản phẩm đầu tiên để bắt đầu quản lý.
                                    </span>

                                </div>

                            </td>

                        </tr>

                    </c:if>


                    </tbody>


                </table>


            </div>


        </section>


    </main>


</div>



<div class="modal-backdrop"
     id="deleteModal"
     hidden>


    <div class="confirm-dialog"
         role="dialog"
         aria-modal="true"
         aria-labelledby="deleteModalTitle">


        <div class="confirm-icon">
            !
        </div>


        <h2 id="deleteModalTitle">
            Xác nhận xóa sản phẩm
        </h2>


        <p>

            Bạn sắp xóa sản phẩm

            <strong id="deleteProductName"></strong>.

            Thao tác này không thể hoàn tác.

        </p>


        <div class="confirm-actions">


            <button type="button"
                    class="secondary-button"
                    onclick="closeDeleteModal()">

                Hủy

            </button>


            <a href="#"
               class="danger-button"
               id="confirmDeleteButton">

                Xóa sản phẩm

            </a>


        </div>


    </div>


</div>



<script>

    const deleteModal =
        document.getElementById("deleteModal");

    const deleteProductName =
        document.getElementById("deleteProductName");

    const confirmDeleteButton =
        document.getElementById("confirmDeleteButton");


    function openDeleteModal(link) {

        deleteProductName.textContent =
            link.dataset.productName || "sản phẩm này";

        confirmDeleteButton.href =
            link.dataset.deleteUrl;

        deleteModal.hidden = false;

        document.body.classList.add("modal-open");
    }


    function closeDeleteModal() {

        deleteModal.hidden = true;

        confirmDeleteButton.href = "#";

        document.body.classList.remove("modal-open");
    }


    deleteModal.addEventListener(
        "click",
        function (event) {

            if (event.target === deleteModal) {

                closeDeleteModal();

            }

        }
    );


    document.addEventListener(
        "keydown",
        function (event) {

            if (
                event.key === "Escape"
                &&
                !deleteModal.hidden
            ) {

                closeDeleteModal();

            }

        }
    );



    function buildCategoryFilter() {

        const select =
            document.getElementById("categoryFilter");

        const rows =
            document.querySelectorAll(".product-row");

        const categories =
            new Map();


        rows.forEach(
            function (row) {

                const category =
                    (row.dataset.category || "")
                        .trim();


                if (category !== "") {

                    const key =
                        category.toLowerCase();


                    if (!categories.has(key)) {

                        categories.set(
                            key,
                            category
                        );

                    }

                }

            }
        );


        const sortedCategories =
            Array
                .from(categories.entries())
                .sort(
                    function (a, b) {

                        return a[1].localeCompare(
                            b[1],
                            "vi"
                        );

                    }
                );


        sortedCategories.forEach(
            function (entry) {

                const value =
                    entry[0];

                const displayName =
                    entry[1];


                const option =
                    document.createElement("option");


                option.value =
                    value;

                option.textContent =
                    displayName;


                select.appendChild(
                    option
                );

            }
        );
    }



    function updateVisibleCount() {

        const rows =
            document.querySelectorAll(".product-row");


        const visibleRows =
            Array
                .from(rows)
                .filter(
                    function (row) {

                        return row.style.display !== "none";

                    }
                );


        document
            .getElementById("visibleCount")
            .textContent =
            visibleRows.length;
    }



    function filterProducts() {

        const keyword =
            document
                .getElementById("productSearch")
                .value
                .toLowerCase()
                .trim();


        const selectedCategory =
            document
                .getElementById("categoryFilter")
                .value
                .toLowerCase()
                .trim();


        const rows =
            document.querySelectorAll(".product-row");


        rows.forEach(
            function (row) {

                const productNameElement =
                    row.querySelector(".product-name");


                const productName =
                    productNameElement
                        ? productNameElement
                            .textContent
                            .toLowerCase()
                            .trim()
                        : "";


                const productCategory =
                    (row.dataset.category || "")
                        .toLowerCase()
                        .trim();


                const matchesKeyword =
                    productName.includes(keyword);


                const matchesCategory =
                    selectedCategory === ""
                    ||
                    productCategory === selectedCategory;


                row.style.display =
                    matchesKeyword && matchesCategory
                        ? ""
                        : "none";

            }
        );


        updateVisibleCount();
    }


    buildCategoryFilter();

    updateVisibleCount();

</script>


</body>

</html>