package thuc.ute.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import thuc.ute.entity.User;
import thuc.ute.service.IUserService;
import thuc.ute.service.impl.UserServiceImpl;
import thuc.ute.utils.EmailUtils;
import thuc.ute.utils.OtpUtil;

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final IUserService userService =
            new UserServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher(
                "/views/forgot-password.jsp"
        ).forward(req, resp);
    }

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String email =
                req.getParameter("email");

        if (email == null
                || email.trim().isEmpty()) {

            req.setAttribute(
                    "alert",
                    "Vui lòng nhập email"
            );

            req.getRequestDispatcher(
                    "/views/forgot-password.jsp"
            ).forward(req, resp);

            return;
        }

        User user =
                userService.findByEmail(
                        email.trim()
                );

        if (user == null) {

            req.setAttribute(
                    "alert",
                    "Email không tồn tại trong hệ thống"
            );

            req.getRequestDispatcher(
                    "/views/forgot-password.jsp"
            ).forward(req, resp);

            return;
        }

        String otp =
                OtpUtil.generateOtp();

        user.setOtp(otp);

        user.setOtpExpiry(
                LocalDateTime.now()
                        .plusMinutes(5)
        );

        userService.update(user);

        try {

            EmailUtils.sendOtp(
                    user.getEmail(),
                    otp
            );

            req.getSession()
                    .setAttribute(
                            "forgotEmail",
                            user.getEmail()
                    );

            resp.sendRedirect(
                    req.getContextPath()
                            + "/forgot-password/verify"
            );

        } catch (MessagingException e) {

            e.printStackTrace();

            req.setAttribute(
                    "alert",
                    "Không thể gửi OTP qua email"
            );

            req.getRequestDispatcher(
                    "/views/forgot-password.jsp"
            ).forward(req, resp);
        }
    }
}