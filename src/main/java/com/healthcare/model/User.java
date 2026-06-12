package com.healthcare.model;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String role;
    private String specialization;
    private String phone;
    public User() {}

    public User(int id, String name, String email,
                String role, String specialization, String phone) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
        this.specialization = specialization;
        this.phone = phone;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String s) { this.specialization = s; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
}