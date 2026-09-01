package thuc.ute.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import thuc.ute.entity.Product;
import thuc.ute.service.IProductService;
import thuc.ute.service.impl.ProductServiceImpl;

@WebServlet("/product/detail")
public class ProductDetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final IProductService productService =
            new ProductServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        if (idParam == null || idParam.isBlank()) {

            resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Thiếu Product ID"
            );

            return;
        }

        try {

            int productId =
                    Integer.parseInt(idParam);

            Product product =
                    productService.findById(productId);

            if (product == null) {

                resp.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Không tìm thấy sản phẩm"
                );

                return;
            }

            req.setAttribute(
                    "product",
                    product
            );

            req.getRequestDispatcher(
                    "/views/product-detail.jsp"
            ).forward(req, resp);

        } catch (NumberFormatException e) {

            resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Product ID không hợp lệ"
            );
        }
    }
}