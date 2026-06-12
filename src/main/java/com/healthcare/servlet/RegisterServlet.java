package com.healthcare.servlet;

import com.healthcare.dao.UserDAO;
import com.healthcare.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String name  = req.getParameter("name");
        String email = req.getParameter("email");
        String pass  = req.getParameter("password");
        String phone = req.getParameter("phone");

        UserDAO dao = new UserDAO();

        if (dao.emailExists(email)) {
            req.setAttribute("error", "Email already registered!");
            req.getRequestDispatcher("/register.jsp").forward(req, res);
            return;
        }

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(pass);
        user.setPhone(phone);

        if (dao.registerUser(user)) {
            res.sendRedirect("login?success=registered");
        } else {
            req.setAttribute("error", "Registration failed. Try again.");
            req.getRequestDispatcher("/register.jsp").forward(req, res);
        }
    }
}