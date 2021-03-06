/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pepe.jpa.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Windows 8
 */
@Entity
@Table(name = "desercion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Desercion.findAll", query = "SELECT d FROM Desercion d"),
    @NamedQuery(name = "Desercion.findByIdDesercion", query = "SELECT d FROM Desercion d WHERE d.idDesercion = :idDesercion"),
    @NamedQuery(name = "Desercion.findByDesercion", query = "SELECT d FROM Desercion d WHERE d.desercion = :desercion"),
    @NamedQuery(name = "Desercion.findByFecha", query = "SELECT d FROM Desercion d WHERE d.fecha = :fecha")})
public class Desercion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_desercion")
    private Integer idDesercion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "desercion")
    private String desercion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @OneToMany(mappedBy = "idDesercion")
    private List<Usuario> usuarioList;
    @JoinColumn(name = "id_estado", referencedColumnName = "id_estado")
    @ManyToOne(optional = false)
    private Estado idEstado;
    @JoinColumn(name = "id_motivo", referencedColumnName = "id_motivo")
    @ManyToOne(optional = false)
    private Motivo idMotivo;

    public Desercion() {
    }

    public Desercion(Integer idDesercion) {
        this.idDesercion = idDesercion;
    }

    public Desercion(Integer idDesercion, String desercion, Date fecha) {
        this.idDesercion = idDesercion;
        this.desercion = desercion;
        this.fecha = fecha;
    }

    public Integer getIdDesercion() {
        return idDesercion;
    }

    public void setIdDesercion(Integer idDesercion) {
        this.idDesercion = idDesercion;
    }

    public String getDesercion() {
        return desercion;
    }

    public void setDesercion(String desercion) {
        this.desercion = desercion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    @XmlTransient
    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    public Estado getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(Estado idEstado) {
        this.idEstado = idEstado;
    }

    public Motivo getIdMotivo() {
        return idMotivo;
    }

    public void setIdMotivo(Motivo idMotivo) {
        this.idMotivo = idMotivo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDesercion != null ? idDesercion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Desercion)) {
            return false;
        }
        Desercion other = (Desercion) object;
        if ((this.idDesercion == null && other.idDesercion != null) || (this.idDesercion != null && !this.idDesercion.equals(other.idDesercion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.pepe.jpa.entities.Desercion[ idDesercion=" + idDesercion + " ]";
    }
    
}
