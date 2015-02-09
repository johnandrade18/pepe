/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pepe.jpa.entities;

import java.io.Serializable;
import java.util.List;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Windows 8
 */
@Entity
@Table(name = "tipo_resultado_aprendizaje")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoResultadoAprendizaje.findAll", query = "SELECT t FROM TipoResultadoAprendizaje t"),
    @NamedQuery(name = "TipoResultadoAprendizaje.findByIdTipoResultadoAprendizaje", query = "SELECT t FROM TipoResultadoAprendizaje t WHERE t.idTipoResultadoAprendizaje = :idTipoResultadoAprendizaje"),
    @NamedQuery(name = "TipoResultadoAprendizaje.findByTipoResultadoAprendizaje", query = "SELECT t FROM TipoResultadoAprendizaje t WHERE t.tipoResultadoAprendizaje = :tipoResultadoAprendizaje")})
public class TipoResultadoAprendizaje implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_tipo_resultado_aprendizaje")
    private Integer idTipoResultadoAprendizaje;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipo_resultado_aprendizaje")
    private String tipoResultadoAprendizaje;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idTipoResultadoAprendizaje")
    private List<ResultadoAprendizaje> resultadoAprendizajeList;

    public TipoResultadoAprendizaje() {
    }

    public TipoResultadoAprendizaje(Integer idTipoResultadoAprendizaje) {
        this.idTipoResultadoAprendizaje = idTipoResultadoAprendizaje;
    }

    public TipoResultadoAprendizaje(Integer idTipoResultadoAprendizaje, String tipoResultadoAprendizaje) {
        this.idTipoResultadoAprendizaje = idTipoResultadoAprendizaje;
        this.tipoResultadoAprendizaje = tipoResultadoAprendizaje;
    }

    public Integer getIdTipoResultadoAprendizaje() {
        return idTipoResultadoAprendizaje;
    }

    public void setIdTipoResultadoAprendizaje(Integer idTipoResultadoAprendizaje) {
        this.idTipoResultadoAprendizaje = idTipoResultadoAprendizaje;
    }

    public String getTipoResultadoAprendizaje() {
        return tipoResultadoAprendizaje;
    }

    public void setTipoResultadoAprendizaje(String tipoResultadoAprendizaje) {
        this.tipoResultadoAprendizaje = tipoResultadoAprendizaje;
    }

    @XmlTransient
    public List<ResultadoAprendizaje> getResultadoAprendizajeList() {
        return resultadoAprendizajeList;
    }

    public void setResultadoAprendizajeList(List<ResultadoAprendizaje> resultadoAprendizajeList) {
        this.resultadoAprendizajeList = resultadoAprendizajeList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoResultadoAprendizaje != null ? idTipoResultadoAprendizaje.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoResultadoAprendizaje)) {
            return false;
        }
        TipoResultadoAprendizaje other = (TipoResultadoAprendizaje) object;
        if ((this.idTipoResultadoAprendizaje == null && other.idTipoResultadoAprendizaje != null) || (this.idTipoResultadoAprendizaje != null && !this.idTipoResultadoAprendizaje.equals(other.idTipoResultadoAprendizaje))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.pepe.jpa.entities.TipoResultadoAprendizaje[ idTipoResultadoAprendizaje=" + idTipoResultadoAprendizaje + " ]";
    }
    
}
