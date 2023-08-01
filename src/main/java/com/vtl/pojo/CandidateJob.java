/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "candidate_job")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CandidateJob.findAll", query = "SELECT c FROM CandidateJob c"),
    @NamedQuery(name = "CandidateJob.findById", query = "SELECT c FROM CandidateJob c WHERE c.id = :id"),
    @NamedQuery(name = "CandidateJob.findByAppliedDate", query = "SELECT c FROM CandidateJob c WHERE c.appliedDate = :appliedDate"),
    @NamedQuery(name = "CandidateJob.findByIsApplied", query = "SELECT c FROM CandidateJob c WHERE c.isApplied = :isApplied"),
    @NamedQuery(name = "CandidateJob.findByIsLiked", query = "SELECT c FROM CandidateJob c WHERE c.isLiked = :isLiked")})
public class CandidateJob implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "AppliedDate")
    @Temporal(TemporalType.DATE)
    private Date appliedDate;
    @Column(name = "IsApplied")
    private Integer isApplied;
    @Column(name = "IsLiked")
    private Integer isLiked;
    @JoinColumn(name = "Candidate_ID", referencedColumnName = "ID")
    @ManyToOne
    @JsonIgnore
    private Candidate candidateID;
    @JoinColumn(name = "CV_ID", referencedColumnName = "ID")
    @ManyToOne
    @JsonIgnore
    private CurriculumVitae cvId;
    @JoinColumn(name = "Job_ID", referencedColumnName = "ID")
    @ManyToOne
    @JsonIgnore
    private Job jobID;

    public CandidateJob() {
    }

    public CandidateJob(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAppliedDate() {
        return appliedDate;
    }

    public void setAppliedDate(Date appliedDate) {
        this.appliedDate = appliedDate;
    }

    public Integer getIsApplied() {
        return isApplied;
    }

    public void setIsApplied(Integer isApplied) {
        this.isApplied = isApplied;
    }

    public Integer getIsLiked() {
        return isLiked;
    }

    public void setIsLiked(Integer isLiked) {
        this.isLiked = isLiked;
    }

    public Candidate getCandidateID() {
        return candidateID;
    }

    public void setCandidateID(Candidate candidateID) {
        this.candidateID = candidateID;
    }

    public CurriculumVitae getCvId() {
        return cvId;
    }

    public void setCvId(CurriculumVitae cvId) {
        this.cvId = cvId;
    }

    public Job getJobID() {
        return jobID;
    }

    public void setJobID(Job jobID) {
        this.jobID = jobID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CandidateJob)) {
            return false;
        }
        CandidateJob other = (CandidateJob) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vtl.pojo.CandidateJob[ id=" + id + " ]";
    }
    
}
