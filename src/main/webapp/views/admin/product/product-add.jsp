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

    <title>Thêm sản phẩm</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/admin.css">

</head>

<body>


<%@ include file="../category/common/sidebar.jspf" %>


<div class="main-wrapper">


    <header class="topbar">

        <div>

            <span class="topbar-label">
                Biểu mẫu
            </span>

            <strong>
                Thêm sản phẩm
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
                    Product
                </p>

                <h1>
                    Tạo sản phẩm mới
                </h1>

                <p class="page-description">
                    Nhập thông tin sản phẩm, chọn danh mục và tải ảnh đại diện từ máy.
                </p>

            </div>

        </section>



        <section class="panel product-form-panel">


            <form action="${pageContext.request.contextPath}/admin/product/insert"
                  method="post"
                  enctype="multipart/form-data"
                  class="product-form">


                <div class="product-form-grid">


                    <label class="form-field product-form-full">

                        <span>
                            Tên sản phẩm
                        </span>

                        <input type="text"
                               name="productName"
                               placeholder="Ví dụ: ASUS Vivobook 15"
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
                               placeholder="Ví dụ: 18500000"
                               required>

                    </label>



                    <label class="form-field">

                        <span>
                            Số lượng
                        </span>

                        <input type="number"
                               name="quantity"
                               min="0"
                               value="0"
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


                            <option value=""
                                    selected
                                    disabled>

                                -- Chọn danh mục --

                            </option>


                            <c:forEach items="${listCategory}"
                                       var="category">

                                <option value="${category.categoryid}">

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
                                       checked>

                                Hoạt động

                            </label>


                            <label class="radio-line">

                                <input type="radio"
                                       name="status"
                                       value="0">

                                Khóa

                            </label>


                        </div>

                    </div>



                    <label class="form-field product-form-full">

                        <span>
                            Ảnh sản phẩm
                        </span>

                        <input type="file"
                               name="imageFile"
                               id="imageFile"
                               accept="image/png,image/jpeg,image/webp"
                               onchange="previewProductImage(event)">

                        <small class="form-hint">
                            Hỗ trợ PNG, JPG, JPEG hoặc WEBP.
                        </small>

                    </label>



                    <div class="form-field product-form-full"
                         id="imagePreviewArea"
                         style="display:none;">

                        <span>
                            Xem trước ảnh
                        </span>


                        <div class="add-image-preview">

                            <img id="imagePreview"
                                 src=""
                                 alt="Ảnh xem trước">

                        </div>

                    </div>



                    <label class="form-field product-form-full">

                        <span>
                            Mô tả sản phẩm
                        </span>

                        <textarea name="description"
                                  class="form-textarea"
                                  rows="6"
                                  placeholder="Nhập mô tả sản phẩm"></textarea>

                    </label>


                </div>



                <div class="form-actions">


                    <button type="submit"
                            class="primary-button">

                        Thêm sản phẩm

                    </button>


                    <button type="reset"
                            class="secondary-button"
                            onclick="resetProductForm()">

                        Nhập lại

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



<script>

    function previewProductImage(event) {

        const file =
            event.target.files[0];

        const previewArea =
            document.getElementById(
                "imagePreviewArea"
            );

        const preview =
            document.getElementById(
                "imagePreview"
            );


        if (!file) {

            previewArea.style.display =
                "none";

            preview.src = "";

            return;
        }


        const reader =
            new FileReader();


        reader.onload =
            function (e) {

                preview.src =
                    e.target.result;

                previewArea.style.display =
                    "grid";

            };


        reader.readAsDataURL(file);
    }


    function resetProductForm() {

        const previewArea =
            document.getElementById(
                "imagePreviewArea"
            );

        const preview =
            document.getElementById(
                "imagePreview"
            );


        previewArea.style.display =
            "none";

        preview.src = "";
    }

</script>


</body>

</html>