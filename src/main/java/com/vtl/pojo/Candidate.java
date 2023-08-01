/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "candidate")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Candidate.findAll", query = "SELECT c FROM Candidate c"),
    @NamedQuery(name = "Candidate.findById", query = "SELECT c FROM Candidate c WHERE c.id = :id"),
    @NamedQuery(name = "Candidate.findByFullname", query = "SELECT c FROM Candidate c WHERE c.fullname = :fullname"),
    @NamedQuery(name = "Candidate.findByEmail", query = "SELECT c FROM Candidate c WHERE c.email = :email"),
    @NamedQuery(name = "Candidate.findByDateOfBirth", query = "SELECT c FROM Candidate c WHERE c.dateOfBirth = :dateOfBirth"),
    @NamedQuery(name = "Candidate.findByCity", query = "SELECT c FROM Candidate c WHERE c.city = :city"),
    @NamedQuery(name = "Candidate.findByAvatar", query = "SELECT c FROM Candidate c WHERE c.avatar = :avatar"),
    @NamedQuery(name = "Candidate.findByDescription", query = "SELECT c FROM Candidate c WHERE c.description = :description"),
    @NamedQuery(name = "Candidate.findByPhone", query = "SELECT c FROM Candidate c WHERE c.phone = :phone"),
    @NamedQuery(name = "Candidate.findByDegree", query = "SELECT c FROM Candidate c WHERE c.degree = :degree")})
public class Candidate implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 100)
    @Column(name = "Full_name")
    private String fullname;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 45)
    @Column(name = "Email")
    private String email;
    @Column(name = "DateOfBirth")
    @Temporal(javax.persistence.TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date dateOfBirth;
    @Size(max = 30)
    @Column(name = "City")
    private String city;
    @Size(max = 100)
    @Column(name = "Avatar")
    private String avatar;
    @Column(name = "Major")
    private String major;
    @Column(name = "Sex")
    private String sex;
    @Size(max = 300)
    @JsonIgnore
    @Column(name = "Description")
    private String description;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 10)
    @JsonIgnore
    @Column(name = "Phone")
    private String phone;
    @Size(max = 45)
    @JsonIgnore
    @Column(name = "Degree")
    private String degree;
    @OneToMany(mappedBy = "candidateID")
    @JsonIgnore
    private Set<CandidateJob> candidateJobSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "candidateID")
    @JsonIgnore
    private Set<Comment> commentList;
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "candidateID",  fetch = FetchType.EAGER)
    @JsonIgnore
    private Set<CurriculumVitae> curriculumVitaeSet;
    @OneToMany(mappedBy = "candidateID")
    @JsonIgnore
    private Set<CandidateCompany> candidateCompanySet;
    @JoinColumn(name = "User_ID", referencedColumnName = "ID")
    @OneToOne
    @JsonIgnore
    private User userID;
    @ManyToMany
    @JsonIgnore
    @JoinTable(
            name = "candidate_major",
            joinColumns = { @JoinColumn(name = "Candidate_ID")},
            inverseJoinColumns = {@JoinColumn(name = "Major_ID")}
    )
    private Set<Major> majors;
    @OneToMany(mappedBy = "candidateID")
    @JsonIgnore
    private Set<CandidateCategory> candidateCategorySet;
    @Transient
    @JsonIgnore
    
    private MultipartFile file;
    public Candidate() {
    }

    public Candidate(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    @XmlTransient
    public Set<CandidateJob> getCandidateJobSet() {
        return candidateJobSet;
    }

    public void setCandidateJobSet(Set<CandidateJob> candidateJobSet) {
        this.candidateJobSet = candidateJobSet;
    }

    @XmlTransient
    public Set<CurriculumVitae> getCurriculumVitaeSet() {
        return curriculumVitaeSet;
    }

    public void setCurriculumVitaeSet(Set<CurriculumVitae> curriculumVitaeSet) {
        this.curriculumVitaeSet = curriculumVitaeSet;
    }

    @XmlTransient
    public Set<CandidateCompany> getCandidateCompanySet() {
        return candidateCompanySet;
    }

    public void setCandidateCompanySet(Set<CandidateCompany> candidateCompanySet) {
        this.candidateCompanySet = candidateCompanySet;
    }

    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
        this.userID = userID;
    }



    @XmlTransient
    public Set<CandidateCategory> getCandidateCategorySet() {
        return candidateCategorySet;
    }

    public void setCandidateCategorySet(Set<CandidateCategory> candidateCategorySet) {
        this.candidateCategorySet = candidateCategorySet;
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
        if (!(object instanceof Candidate)) {
            return false;
        }
        Candidate other = (Candidate) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vtl.pojo.Candidate[ id=" + id + " ]";
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

    /**
     * @return the commentList
     */
    public Set<Comment> getCommentList() {
        return commentList;
    }

    /**
     * @param commentList the commentList to set
     */
    public void setCommentList(Set<Comment> commentList) {
        this.commentList = commentList;
    }

    /**
     * @return the major
     */
    public String getMajor() {
        return major;
    }

    /**
     * @param major the major to set
     */
    public void setMajor(String major) {
        this.major = major;
    }

    /**
     * @return the sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex the sex to set
     */
    public void setSex(String sex) {
        this.sex = sex;
    }


}
