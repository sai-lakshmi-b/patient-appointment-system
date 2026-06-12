package com.healthcare.servlet;

import com.healthcare.dao.UserDAO;
import com.healthcare.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email    = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.loginUser(email, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loggedUser", user);
            session.setAttribute("userId",   user.getId());
            session.setAttribute("userName", user.getName());
            session.setAttribute("userRole", user.getRole());

            String role = user.getRole();
            if (role.equals("ADMIN")) {
                res.sendRedirect("admin/dashboard");
            } else if (role.equals("DOCTOR")) {
                res.sendRedirect("doctor/dashboard");
            } else {
                res.sendRedirect("patient/appointments");
            }

        } else {
            req.setAttribute("error", "Invalid email or password!");
            req.getRequestDispatcher("/login.jsp").forward(req, res);
        }
    }
}