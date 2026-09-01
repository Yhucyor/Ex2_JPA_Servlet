package thuc.ute.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/multiPartServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 25
)
public class MultipartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Part part =
                request.getPart("imageFile");

        if (part == null || part.getSize() == 0) {
            request.setAttribute(
                    "message",
                    "Vui lòng chọn file ảnh để upload."
            );

            request.getRequestDispatcher(
                    "/views/result.jsp"
            ).forward(request, response);

            return;
        }

        String fileName =
                Paths.get(
                        part.getSubmittedFileName()
                ).getFileName().toString();

        String uploadPath =
                getServletContext().getRealPath("/assets/uploads");

        File uploadDir =
                new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        part.write(
                uploadPath
                        + File.separator
                        + fileName
        );

        request.setAttribute(
                "message",
                "Upload thành công: " + fileName
        );

        request.setAttribute(
                "fileName",
                fileName
        );

        request.getRequestDispatcher(
                "/views/result.jsp"
        ).forward(request, response);
    }
}
