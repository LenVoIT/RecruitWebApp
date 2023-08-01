/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.pojo;

import java.io.Serializable;
import java.util.Set;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "curriculum_vitae")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CurriculumVitae.findAll", query = "SELECT c FROM CurriculumVitae c"),
    @NamedQuery(name = "CurriculumVitae.findById", query = "SELECT c FROM CurriculumVitae c WHERE c.id = :id"),
    @NamedQuery(name = "CurriculumVitae.findByCareerGoals", query = "SELECT c FROM CurriculumVitae c WHERE c.careerGoals = :careerGoals"),
    @NamedQuery(name = "CurriculumVitae.findByDegreeDetail", query = "SELECT c FROM CurriculumVitae c WHERE c.degreeDetail = :degreeDetail"),
    @NamedQuery(name = "CurriculumVitae.findByExperienceDetail", query = "SELECT c FROM CurriculumVitae c WHERE c.experienceDetail = :experienceDetail"),
    @NamedQuery(name = "CurriculumVitae.findBySkill", query = "SELECT c FROM CurriculumVitae c WHERE c.skill = :skill"),
    @NamedQuery(name = "CurriculumVitae.findByForeignLanguage", query = "SELECT c FROM CurriculumVitae c WHERE c.foreignLanguage = :foreignLanguage")})
public class CurriculumVitae implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 500)
    @Column(name = "CareerGoals")
    private String careerGoals;
    @Size(max = 500)
    @Column(name = "DegreeDetail")
    private String degreeDetail;
    @Size(max = 500)
    @Column(name = "ExperienceDetail")
    private String experienceDetail;
    @Size(max = 500)
    @Column(name = "Skill")
    private String skill;
    @Size(max = 200)
    @Column(name = "ForeignLanguage")
    private String foreignLanguage;
    @OneToMany(mappedBy = "cvId")
    private Set<CandidateJob> candidateJobSet;
    @JoinColumn(name = "Candidate_ID", referencedColumnName = "ID")
    @ManyToOne
    private Candidate candidateID;
    @Column(name = "CV_link")
    private String cvLink;
    @Transient
    private MultipartFile file;
    @Column(name = "IsDeleted")
    private Integer isDeleted;

    public CurriculumVitae() {
    }

    public CurriculumVitae(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCareerGoals() {
        return careerGoals;
    }

    public void setCareerGoals(String careerGoals) {
        this.careerGoals = careerGoals;
    }

    public String getDegreeDetail() {
        return degreeDetail;
    }

    public void setDegreeDetail(String degreeDetail) {
        this.degreeDetail = degreeDetail;
    }

    public String getExperienceDetail() {
        return experienceDetail;
    }

    public void setExperienceDetail(String experienceDetail) {
        this.experienceDetail = experienceDetail;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getForeignLanguage() {
        return foreignLanguage;
    }

    public void setForeignLanguage(String foreignLanguage) {
        this.foreignLanguage = foreignLanguage;
    }

    @XmlTransient
    public Set<CandidateJob> getCandidateJobSet() {
        return candidateJobSet;
    }

    public void setCandidateJobSet(Set<CandidateJob> candidateJobSet) {
        this.candidateJobSet = candidateJobSet;
    }

    public Candidate getCandidateID() {
        return candidateID;
    }

    public void setCandidateID(Candidate candidateID) {
        this.candidateID = candidateID;
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
        if (!(object instanceof CurriculumVitae)) {
            return false;
        }
        CurriculumVitae other = (CurriculumVitae) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vtl.pojo.CurriculumVitae[ id=" + id + " ]";
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @return the cvLink
     */
    public String getCvLink() {
        return cvLink;
    }

    /**
     * @param cvLink the cvLink to set
     */
    public void setCvLink(String cvLink) {
        this.cvLink = cvLink;
    }

    /**
     * @return the isDeleted
     */
    public Integer getIsDeleted() {
        return isDeleted;
    }

    /**
     * @param isDeleted the isDeleted to set
     */
    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
    
}
