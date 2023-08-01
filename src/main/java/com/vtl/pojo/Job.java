/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.pojo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "job")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Job.findAll", query = "SELECT j FROM Job j"),
    @NamedQuery(name = "Job.findById", query = "SELECT j FROM Job j WHERE j.id = :id"),
    @NamedQuery(name = "Job.findByName", query = "SELECT j FROM Job j WHERE j.name = :name"),
    @NamedQuery(name = "Job.findByDescription", query = "SELECT j FROM Job j WHERE j.description = :description"),
    @NamedQuery(name = "Job.findBySalaryFrom", query = "SELECT j FROM Job j WHERE j.salaryFrom = :salaryFrom"),
    @NamedQuery(name = "Job.findBySalaryTo", query = "SELECT j FROM Job j WHERE j.salaryTo = :salaryTo"),
    @NamedQuery(name = "Job.findByEndDate", query = "SELECT j FROM Job j WHERE j.endDate = :endDate"),
    @NamedQuery(name = "Job.findByQuantity", query = "SELECT j FROM Job j WHERE j.quantity = :quantity"),
    @NamedQuery(name = "Job.findByDegreeRequired", query = "SELECT j FROM Job j WHERE j.degreeRequired = :degreeRequired"),
    @NamedQuery(name = "Job.findByAgeTo", query = "SELECT j FROM Job j WHERE j.ageTo = :ageTo"),
    @NamedQuery(name = "Job.findByAgeFrom", query = "SELECT j FROM Job j WHERE j.ageFrom = :ageFrom"),
    @NamedQuery(name = "Job.findByIsChecked", query = "SELECT j FROM Job j WHERE j.isChecked = :isChecked"),
    @NamedQuery(name = "Job.findBySexRequired", query = "SELECT j FROM Job j WHERE j.sexRequired = :sexRequired"),
    @NamedQuery(name = "Job.findByProbationaryPeriod", query = "SELECT j FROM Job j WHERE j.probationaryPeriod = :probationaryPeriod"),
    @NamedQuery(name = "Job.findByBenefit", query = "SELECT j FROM Job j WHERE j.benefit = :benefit"),
    @NamedQuery(name = "Job.findByPosition", query = "SELECT j FROM Job j WHERE j.position = :position"),
    @NamedQuery(name = "Job.findByType", query = "SELECT j FROM Job j WHERE j.type = :type"),
    @NamedQuery(name = "Job.findByCity", query = "SELECT j FROM Job j WHERE j.city = :city"),
    @NamedQuery(name = "Job.findByAddress", query = "SELECT j FROM Job j WHERE j.address = :address"),
    @NamedQuery(name = "Job.findByCreatedDate", query = "SELECT j FROM Job j WHERE j.createdDate = :createdDate"),
    @NamedQuery(name = "Job.findByExperienceRequired", query = "SELECT j FROM Job j WHERE j.experienceRequired = :experienceRequired")})
public class Job implements Serializable, Comparable<Job> {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 200)
    @Column(name = "Name")
    private String name;
    @Size(max = 500)
    @Column(name = "Description")
    private String description;
    @Column(name = "SalaryFrom")
    private Long salaryFrom;
    @Column(name = "SalaryTo")
    private Long salaryTo;
    @Column(name = "EndDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date endDate;
    @Column(name = "Quantity")
    private Integer quantity;
    @Size(max = 200)
    @Column(name = "DegreeRequired")
    private String degreeRequired;
    @Column(name = "AgeTo")
    private Integer ageTo;
    @Column(name = "AgeFrom")
    private Integer ageFrom;
    @Column(name = "IsChecked")
    private Integer isChecked;
    @Column(name = "IsDeleted")
    private Integer isDeleted;
    @Size(max = 10)
    @Column(name = "SexRequired")
    private String sexRequired;
    @Column(name = "ProbationaryPeriod")
    private Integer probationaryPeriod;
    @Size(max = 500)
    @Column(name = "Benefit")
    private String benefit;
    @Size(max = 45)
    @Column(name = "Position")
    private String position;
    @Size(max = 45)
    @Column(name = "Type")
    private String type;
    @Size(max = 45)
    @Column(name = "City")
    private String city;
    @Size(max = 200)
    @Column(name = "Address")
    private String address;
    @Column(name = "CreatedDate")
    @Temporal(javax.persistence.TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date createdDate;
    @Column(name = "ExperienceRequired")
    @Min(value = 0, message = "month.Err")
    private Integer experienceRequired;
    @OneToMany(mappedBy = "jobID")
    private Set<CandidateJob> candidateJobSet;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "job_major",
            joinColumns = { @JoinColumn(name = "Job_ID")},
            inverseJoinColumns = {@JoinColumn(name = "Major_ID")}
    )
    private Set<Major> majors;
    @JoinColumn(name = "Company_ID", referencedColumnName = "ID")
    @ManyToOne
    private Company companyID;
    @OneToMany(mappedBy = "jobID")
    private Set<JobCategory> jobCategorySet;

    public Job() {
    }

    public Job(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getSalaryFrom() {
        return salaryFrom;
    }

    public void setSalaryFrom(Long salaryFrom) {
        this.salaryFrom = salaryFrom;
    }

    public Long getSalaryTo() {
        return salaryTo;
    }

    public void setSalaryTo(Long salaryTo) {
        this.salaryTo = salaryTo;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getDegreeRequired() {
        return degreeRequired;
    }

    public void setDegreeRequired(String degreeRequired) {
        this.degreeRequired = degreeRequired;
    }

    public Integer getAgeTo() {
        return ageTo;
    }

    public void setAgeTo(Integer ageTo) {
        this.ageTo = ageTo;
    }

    public Integer getAgeFrom() {
        return ageFrom;
    }

    public void setAgeFrom(Integer ageFrom) {
        this.ageFrom = ageFrom;
    }

    public Integer getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(Integer isChecked) {
        this.isChecked = isChecked;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getSexRequired() {
        return sexRequired;
    }

    public void setSexRequired(String sexRequired) {
        this.sexRequired = sexRequired;
    }

    public Integer getProbationaryPeriod() {
        return probationaryPeriod;
    }

    public void setProbationaryPeriod(Integer probationaryPeriod) {
        this.probationaryPeriod = probationaryPeriod;
    }

    public String getBenefit() {
        return benefit;
    }

    public void setBenefit(String benefit) {
        this.benefit = benefit;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getExperienceRequired() {
        return experienceRequired;
    }

    public void setExperienceRequired(Integer experienceRequired) {
        this.experienceRequired = experienceRequired;
    }

    @XmlTransient
    public Set<CandidateJob> getCandidateJobSet() {
        return candidateJobSet;
    }

    public void setCandidateJobSet(Set<CandidateJob> candidateJobSet) {
        this.candidateJobSet = candidateJobSet;
    }


    public Company getCompanyID() {
        return companyID;
    }

    public void setCompanyID(Company companyID) {
        this.companyID = companyID;
    }

    @XmlTransient
    public Set<JobCategory> getJobCategorySet() {
        return jobCategorySet;
    }

    public void setJobCategorySet(Set<JobCategory> jobCategorySet) {
        this.jobCategorySet = jobCategorySet;
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
        if (!(object instanceof Job)) {
            return false;
        }
        Job other = (Job) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vtl.pojo.Job[ id=" + id + " ]";
    }

    /**
     * @return the majors
     */
    public Set<Major> getMajors() {
        return majors;
    }

    /**
     * @param majors the majors to set
     */
    public void setMajors(Set<Major> majors) {
        this.majors = majors;
    }

    @Override
    public int compareTo(Job j) {
         return getCreatedDate().compareTo(j.getCreatedDate());
    }
    
}
