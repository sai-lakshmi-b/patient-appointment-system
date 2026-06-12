package com.healthcare.servlet;

import com.healthcare.dao.AppointmentDAO;
import com.healthcare.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DoctorDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            res.sendRedirect("/login");
            return;
        }

        User user = (User) session.getAttribute("loggedUser");

        AppointmentDAO dao = new AppointmentDAO();
        req.setAttribute("appointments", dao.getAppointmentsByDoctor(user.getId()));

        req.getRequestDispatcher("/doctor-dashboard.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            res.sendRedirect("/login");
            return;
        }

        int appointmentId = Integer.parseInt(req.getParameter("appointmentId"));
        String status     = req.getParameter("status");

        AppointmentDAO dao = new AppointmentDAO();
        dao.updateStatus(appointmentId, status);

        res.sendRedirect("/doctor/dashboard");
    }
}