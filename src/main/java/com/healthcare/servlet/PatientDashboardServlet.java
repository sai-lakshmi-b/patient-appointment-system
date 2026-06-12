package com.healthcare.servlet;

import com.healthcare.dao.AppointmentDAO;
import com.healthcare.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class PatientDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            res.sendRedirect("/login");
            return;
        }

        User user = (User) session.getAttribute("loggedUser");

        AppointmentDAO dao = new AppointmentDAO();
        req.setAttribute("appointments", dao.getAppointmentsByPatient(user.getId()));

        req.getRequestDispatcher("/my-appointments.jsp").forward(req, res);
    }
}