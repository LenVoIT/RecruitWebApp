/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "comment")
public class Comment implements Serializable, Comparable<Comment>{
    
    private static long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "Rating")
    private Integer rating;
    @Size(max = 300)
    @Column(name = "Assessment")
    private String assessment;
    @JoinColumn(name = "Candidate_ID")
    @ManyToOne
    @JsonProperty("candidate")
    private Candidate candidateID;
    @JoinColumn(name = "Company_ID")
    @ManyToOne
    @JsonIgnore
    private Company companyID;
    
    @Column(name = "CreatedDate")
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    private Date createdDate;

    /**
     * @return the serialVersionUID
     */
    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    /**
     * @param aSerialVersionUID the serialVersionUID to set
     */
    public static void setSerialVersionUID(long aSerialVersionUID) {
        serialVersionUID = aSerialVersionUID;
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the rating
     */
    public Integer getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(Integer rating) {
        this.rating = rating;
    }

    /**
     * @return the assessment
     */
    public String getAssessment() {
        return assessment;
    }

    /**
     * @param assessment the assessment to set
     */
    public void setAssessment(String assessment) {
        this.assessment = assessment;
    }

    /**
     * @return the candidateID
     */
    public Candidate getCandidateID() {
        return candidateID;
    }

    /**
     * @param candidateID the candidateID to set
     */
    public void setCandidateID(Candidate candidateID) {
        this.candidateID = candidateID;
    }

    /**
     * @return the companyID
     */
    public Company getCompanyID() {
        return companyID;
    }

    /**
     * @param companyID the companyID to set
     */
    public void setCompanyID(Company companyID) {
        this.companyID = companyID;
    }

    /**
     * @return the createdDate
     */
    public Date getCreatedDate() {
        return createdDate;
    }

    /**
     * @param createdDate the createdDate to set
     */
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public int compareTo(Comment o) {
         return getCreatedDate().compareTo(o.getCreatedDate());
    }
    
    @Override
    public boolean equals(Object obj) {
        return ((Comment) obj).getId().equals(getId());
    }

}
