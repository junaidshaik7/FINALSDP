package com.klef.jfsd.springboot.model;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "mentor_table")
public class Mentor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name = "mentor_id")
    private int id;

    @Column(name = "mentor_name", nullable = false, length = 50)
    private String name;

    @Column(name = "mentor_gender", nullable = false, length = 20)
    private String gender;

    @Column(name = "mentor_dob", nullable = false, length = 20)
    private String dateOfBirth;

    @Column(name = "mentor_department", nullable = false, length = 50)
    private String department;

    @Column(name = "mentor_salary", nullable = false)
    private double salary;

    @Column(name = "mentor_email", nullable = false, unique = true, length = 50)
    private String email;

    @Column(name = "mentor_password", nullable = false, length = 50)
    private String password;

    @Column(name = "mentor_location", nullable = false, length = 50)
    private String location;

    @Column(name = "mentor_contact", nullable = false, unique = true, length = 20)
    private String contact;

    @Column(name = "mentor_status", nullable = false, length = 50)
    private String status;
    
    @OneToMany(mappedBy = "mentor", cascade = CascadeType.ALL)
    private List<StudentProject> studentProjects;

    public List<StudentProject> getStudentProjects() {
        return studentProjects;
    }

    public void setStudentProjects(List<StudentProject> studentProjects) {
        this.studentProjects = studentProjects;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
