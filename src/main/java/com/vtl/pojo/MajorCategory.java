/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtl.pojo;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "major_category")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MajorCategory.findAll", query = "SELECT m FROM MajorCategory m"),
    @NamedQuery(name = "MajorCategory.findById", query = "SELECT m FROM MajorCategory m WHERE m.id = :id")})
public class MajorCategory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @JoinColumn(name = "Cate_ID", referencedColumnName = "ID")
    @ManyToOne
    private Category cateID;
    @JoinColumn(name = "Major_ID", referencedColumnName = "ID")
    @ManyToOne
    private Major majorID;

    public MajorCategory() {
    }

    public MajorCategory(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Category getCateID() {
        return cateID;
    }

    public void setCateID(Category cateID) {
        this.cateID = cateID;
    }

    public Major getMajorID() {
        return majorID;
    }

    public void setMajorID(Major majorID) {
        this.majorID = majorID;
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
        if (!(object instanceof MajorCategory)) {
            return false;
        }
        MajorCategory other = (MajorCategory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vtl.pojo.MajorCategory[ id=" + id + " ]";
    }
    
}
