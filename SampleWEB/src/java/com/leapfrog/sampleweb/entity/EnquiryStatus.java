/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author zak
 */
@Entity
@Table(name = "tbl_enquiry_status")
@NamedQueries({
    @NamedQuery(name = "EnquiryStatus.findAll", query = "SELECT e FROM EnquiryStatus e")})
public class EnquiryStatus implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "enquiry_status_id")
    private Integer enquiryStatusId;
    @Basic(optional = false)
//    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "type")
    private String type;
    @Basic(optional = false)
//    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "color")
    private String color;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "enquiryStatus")
    private Collection<Enquiry> enquiryCollection;

    public EnquiryStatus() {
    }

    public EnquiryStatus(Integer enquiryStatusId) {
        this.enquiryStatusId = enquiryStatusId;
    }

    public EnquiryStatus(Integer enquiryStatusId, String type, String color) {
        this.enquiryStatusId = enquiryStatusId;
        this.type = type;
        this.color = color;
    }

    public Integer getEnquiryStatusId() {
        return enquiryStatusId;
    }

    public void setEnquiryStatusId(Integer enquiryStatusId) {
        this.enquiryStatusId = enquiryStatusId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Collection<Enquiry> getEnquiryCollection() {
        return enquiryCollection;
    }

    public void setEnquiryCollection(Collection<Enquiry> enquiryCollection) {
        this.enquiryCollection = enquiryCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (enquiryStatusId != null ? enquiryStatusId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EnquiryStatus)) {
            return false;
        }
        EnquiryStatus other = (EnquiryStatus) object;
        if ((this.enquiryStatusId == null && other.enquiryStatusId != null) || (this.enquiryStatusId != null && !this.enquiryStatusId.equals(other.enquiryStatusId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.leapfrog.sampleweb.entity.EnquiryStatus[ enquiryStatusId=" + enquiryStatusId + " ]";
    }
    
}
