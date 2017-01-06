/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.sampleweb.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author zak
 */
@Entity
@Table(name = "tbl_isp")
@NamedQueries({
    @NamedQuery(name = "Isp.findAll", query = "SELECT i FROM Isp i")})
public class Isp implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "isp_id")
    private Integer ispId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "value")
    private String value;

    public Isp() {
    }

    public Isp(Integer ispId) {
        this.ispId = ispId;
    }

    public Isp(Integer ispId, String name, String value) {
        this.ispId = ispId;
        this.name = name;
        this.value = value;
    }

    public Integer getIspId() {
        return ispId;
    }

    public void setIspId(Integer ispId) {
        this.ispId = ispId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ispId != null ? ispId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Isp)) {
            return false;
        }
        Isp other = (Isp) object;
        if ((this.ispId == null && other.ispId != null) || (this.ispId != null && !this.ispId.equals(other.ispId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.leapfrog.sampleweb.entity.Isp[ ispId=" + ispId + " ]";
    }
    
}
