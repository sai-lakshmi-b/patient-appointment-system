package com.healthcare.dao;

import com.healthcare.model.Appointment;
import com.healthcare.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {

    // Book new appointment
    public boolean bookAppointment(Appointment a) {
        if (isSlotTaken(a.getDoctorId(), a.getAppointmentDate(), a.getTimeSlot())) {
            return false;
        }
        String sql = "INSERT INTO appointments(patient_id,doctor_id,appointment_date,time_slot,notes) " +
                "VALUES(?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, a.getPatientId());
            ps.setInt(2, a.getDoctorId());
            ps.setString(3, a.getAppointmentDate());
            ps.setString(4, a.getTimeSlot());
            ps.setString(5, a.getNotes());
            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Check if slot is already taken
    public boolean isSlotTaken(int doctorId, String date, String slot) {
        String sql = "SELECT id FROM appointments WHERE doctor_id=? AND " +
                "appointment_date=? AND time_slot=? AND status='PENDING'";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, doctorId);
            ps.setString(2, date);
            ps.setString(3, slot);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get appointments by patient
    public List<Appointment> getAppointmentsByPatient(int patientId) {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT a.*, u.name as doctor_name, u.specialization " +
                "FROM appointments a JOIN users u ON a.doctor_id = u.id " +
                "WHERE a.patient_id=? ORDER BY a.appointment_date DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, patientId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Appointment a = mapAppointment(rs);
                a.setDoctorName(rs.getString("doctor_name"));
                a.setSpecialization(rs.getString("specialization"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get appointments by doctor
    public List<Appointment> getAppointmentsByDoctor(int doctorId) {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT a.*, u.name as patient_name " +
                "FROM appointments a JOIN users u ON a.patient_id = u.id " +
                "WHERE a.doctor_id=? ORDER BY a.appointment_date ASC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Appointment a = mapAppointment(rs);
                a.setPatientName(rs.getString("patient_name"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get all appointments (admin)
    public List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT a.*, p.name as patient_name, d.name as doctor_name, " +
                "d.specialization FROM appointments a " +
                "JOIN users p ON a.patient_id = p.id " +
                "JOIN users d ON a.doctor_id = d.id " +
                "ORDER BY a.appointment_date DESC";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Appointment a = mapAppointment(rs);
                a.setPatientName(rs.getString("patient_name"));
                a.setDoctorName(rs.getString("doctor_name"));
                a.setSpecialization(rs.getString("specialization"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Update appointment status
    public boolean updateStatus(int appointmentId, String status) {
        String sql = "UPDATE appointments SET status=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, appointmentId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Helper to map ResultSet to Appointment
    private Appointment mapAppointment(ResultSet rs) throws SQLException {
        Appointment a = new Appointment();
        a.setId(rs.getInt("id"));
        a.setPatientId(rs.getInt("patient_id"));
        a.setDoctorId(rs.getInt("doctor_id"));
        a.setAppointmentDate(rs.getString("appointment_date"));
        a.setTimeSlot(rs.getString("time_slot"));
        a.setStatus(rs.getString("status"));
        a.setNotes(rs.getString("notes"));
        return a;
    }
}