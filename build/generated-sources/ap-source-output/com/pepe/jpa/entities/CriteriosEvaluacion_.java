package com.pepe.jpa.entities;

import com.pepe.jpa.entities.Competencia;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2015-02-09T14:58:05")
@StaticMetamodel(CriteriosEvaluacion.class)
public class CriteriosEvaluacion_ { 

    public static volatile SingularAttribute<CriteriosEvaluacion, String> estado;
    public static volatile SingularAttribute<CriteriosEvaluacion, String> nombreCriteriosEvaluacion;
    public static volatile SingularAttribute<CriteriosEvaluacion, Integer> idCriteriosEvaluacion;
    public static volatile SingularAttribute<CriteriosEvaluacion, Competencia> idCompetencia;

}