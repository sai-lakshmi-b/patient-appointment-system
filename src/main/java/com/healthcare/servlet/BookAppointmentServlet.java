package com.healthcare.servlet;

import com.healthcare.dao.AppointmentDAO;
import com.healthcare.dao.UserDAO;
import com.healthcare.model.Appointment;
import com.healthcare.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class BookAppointmentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            res.sendRedirect("/login");
            return;
        }

        UserDAO userDAO = new UserDAO();
        req.setAttribute("doctors", userDAO.getAllDoctors());
        req.getRequestDispatcher("/book.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("loggedUser");

        int doctorId           = Integer.parseInt(req.getParameter("doctorId"));
        String appointmentDate = req.getParameter("appointmentDate");
        String timeSlot        = req.getParameter("timeSlot");
        String notes           = req.getParameter("notes");

        Appointment a = new Appointment();
        a.setPatientId(user.getId());
        a.setDoctorId(doctorId);
        a.setAppointmentDate(appointmentDate);
        a.setTimeSlot(timeSlot);
        a.setNotes(notes);

        AppointmentDAO dao = new AppointmentDAO();
        if (dao.bookAppointment(a)) {
            res.sendRedirect("/patient/appointments?success=booked");
        } else {
            req.setAttribute("error", "This time slot is already taken. Please choose another.");
            UserDAO userDAO = new UserDAO();
            req.setAttribute("doctors", userDAO.getAllDoctors());
            req.getRequestDispatcher("/book.jsp").forward(req, res);
        }
    }
}