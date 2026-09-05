<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Chỉnh sửa sản phẩm</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/admin.css">

</head>

<body>


<%@ include file="../common/sidebar.jspf" %>


<div class="main-wrapper">


    <header class="topbar">

        <div>

            <span class="topbar-label">
                Biểu mẫu
            </span>

            <strong>
                Chỉnh sửa sản phẩm
            </strong>

        </div>


        <a href="${pageContext.request.contextPath}/admin/products"
           class="topbar-action">

            Danh sách

        </a>

    </header>



    <main class="content">


        <section class="page-heading compact-heading">

            <div>

                <p class="eyebrow">
                    Product #${product.productId}
                </p>

                <h1>
                    Cập nhật sản phẩm
                </h1>

                <p class="page-description">
                    Chỉnh sửa thông tin, hình ảnh, danh mục và trạng thái của sản phẩm.
                </p>

            </div>

        </section>



        <section class="panel product-form-panel">


            <div class="current-product">


                <c:choose>


                    <c:when test="${not empty product.image}">


                        <c:choose>


                            <c:when test="${fn:startsWith(product.image, 'http://')
                                            or fn:startsWith(product.image, 'https://')}">

                                <c:set var="currentImageUrl"
                                       value="${product.image}"/>

                            </c:when>


                            <c:otherwise>

                                <c:url value="/image"
                                       var="currentImageUrl">

                                    <c:param name="fname"
                                             value="${product.image}"/>

                                </c:url>

                            </c:otherwise>


                        </c:choose>


                        <img src="${currentImageUrl}"
                             class="product-preview-image"
                             alt="${product.productName}">


                    </c:when>


                    <c:otherwise>

                        <div class="product-preview-placeholder">
                            No image
                        </div>

                    </c:otherwise>


                </c:choose>



                <div class="current-product-info">

                    <span>
                        Đang chỉnh sửa
                    </span>

                    <strong>
                        <c:out value="${product.productName}"/>
                    </strong>

                    <small>
                        ID: ${product.productId}
                    </small>

                </div>


            </div>



            <form action="${pageContext.request.contextPath}/admin/product/update"
                  method="post"
                  enctype="multipart/form-data"
                  class="product-form">


                <input type="hidden"
                       name="productId"
                       value="${product.productId}">



                <div class="product-form-grid">


                    <label class="form-field product-form-full">

                        <span>
                            Tên sản phẩm
                        </span>

                        <input type="text"
                               name="productName"
                               value="${product.productName}"
                               placeholder="Nhập tên sản phẩm"
                               required
                               autofocus>

                    </label>



                    <label class="form-field">

                        <span>
                            Giá
                        </span>

                        <input type="number"
                               name="price"
                               min="0"
                               step="0.01"
                               value="${product.price}"
                               placeholder="Nhập giá sản phẩm"
                               required>

                    </label>



                    <label class="form-field">

                        <span>
                            Số lượng
                        </span>

                        <input type="number"
                               name="quantity"
                               min="0"
                               value="${product.quantity}"
                               placeholder="Nhập số lượng"
                               required>

                    </label>



                    <label class="form-field">

                        <span>
                            Danh mục
                        </span>

                        <select name="categoryId"
                                class="form-select"
                                required>


                            <c:forEach items="${listCategory}"
                                       var="category">


                                <option
                                        value="${category.categoryid}"
                                        ${category.categoryid == product.category.categoryid
                                                ? 'selected'
                                                : ''}>

                                    <c:out value="${category.categoryname}"/>

                                </option>


                            </c:forEach>


                        </select>

                    </label>



                    <div class="form-field">

                        <span>
                            Trạng thái
                        </span>


                        <div class="status-options">


                            <label class="radio-line">

                                <input type="radio"
                                       name="status"
                                       value="1"
                                       ${product.status == 1 ? 'checked' : ''}>

                                Hoạt động

                            </label>


                            <label class="radio-line">

                                <input type="radio"
                                       name="status"
                                       value="0"
                                       ${product.status == 0 ? 'checked' : ''}>

                                Khóa

                            </label>


                        </div>

                    </div>



                    <label class="form-field product-form-full">

                        <span>
                            Chọn ảnh mới
                        </span>

                        <input type="file"
                               name="imageFile"
                               accept="image/png,image/jpeg,image/webp">

                        <small class="form-hint">
                            Nếu không chọn ảnh mới thì hệ thống sẽ giữ nguyên ảnh hiện tại.
                        </small>

                    </label>



                    <label class="form-field product-form-full">

                        <span>
                            Mô tả sản phẩm
                        </span>

                        <textarea name="description"
                                  class="form-textarea"
                                  rows="6"
                                  placeholder="Nhập mô tả sản phẩm"><c:out value="${product.description}"/></textarea>

                    </label>


                </div>



                <div class="form-actions">


                    <button type="submit"
                            class="primary-button">

                        Lưu thay đổi

                    </button>


                    <button type="reset"
                            class="secondary-button">

                        Khôi phục

                    </button>


                    <a href="${pageContext.request.contextPath}/admin/products"
                       class="text-button">

                        Quay lại

                    </a>


                </div>


            </form>


        </section>


    </main>


</div>


</body>

</html>