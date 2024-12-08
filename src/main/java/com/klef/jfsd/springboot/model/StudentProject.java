package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import jakarta.persistence.*;

@Entity
public class StudentProject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String projectTitle;
    private String projectDescription;
    private String category;
    private String milestones;
    private String technologiesUsed;
    private int percentageCompletion;
    private Blob pdf;

    @ManyToOne
    @JoinColumn(name = "mentor_id")
    private Mentor mentor;

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProjectTitle() {
        return projectTitle;
    }

    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getMilestones() {
        return milestones;
    }

    public void setMilestones(String milestones) {
        this.milestones = milestones;
    }

    public String getTechnologiesUsed() {
        return technologiesUsed;
    }

    public void setTechnologiesUsed(String technologiesUsed) {
        this.technologiesUsed = technologiesUsed;
    }

    public int getPercentageCompletion() {
        return percentageCompletion;
    }

    public void setPercentageCompletion(int percentageCompletion) {
        this.percentageCompletion = percentageCompletion;
    }

    public Blob getPdf() {
        return pdf;
    }

    public void setPdf(Blob pdf) {
        this.pdf = pdf;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
    }
}
