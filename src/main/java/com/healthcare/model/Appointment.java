package com.healthcare.model;

public class Appointment {
    private int id;
    private int patientId;
    private int doctorId;
    private String patientName;
    private String doctorName;
    private String specialization;
    private String appointmentDate;
    private String timeSlot;
    private String status;
    private String notes;
    public Appointment() {}
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getPatientId() { return patientId; }
    public void setPatientId(int patientId) { this.patientId = patientId; }

    public int getDoctorId() { return doctorId; }
    public void setDoctorId(int doctorId) { this.doctorId = doctorId; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String n) { this.patientName = n; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String n) { this.doctorName = n; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String s) { this.specialization = s; }

    public String getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(String d) { this.appointmentDate = d; }

    public String getTimeSlot() { return timeSlot; }
    public void setTimeSlot(String t) { this.timeSlot = t; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}