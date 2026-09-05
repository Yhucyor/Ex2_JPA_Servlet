package thuc.ute.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import thuc.ute.entity.User;

@WebServlet("/waiting")
public class WaitingController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws IOException {

        HttpSession session =
                req.getSession(false);

        if (session == null
                || session.getAttribute("account") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/login"
            );

            return;
        }

        User user =
                (User) session.getAttribute("account");

        // Phân quyền theo roleid
        // roleid = 1: Admin       -> Trang quản trị
        // roleid = 2: Manager     -> Trang quản trị
        // roleid = 3: User        -> Trang chủ
        // roleid = 4: Guest       -> Trang chủ (chỉ xem)

        int roleid = user.getRoleid();

        switch (roleid) {

            case 1: // Admin
            case 2: // Manager
                // Chuyển đến trang quản trị
                resp.sendRedirect(
                        req.getContextPath()
                                + "/admin/categories"
                );
                break;

            case 3: // User
            case 4: // Guest
            default:
                // Chuyển đến trang Home
                resp.sendRedirect(
                        req.getContextPath()
                                + "/home"
                );
                break;
        }
    }
}