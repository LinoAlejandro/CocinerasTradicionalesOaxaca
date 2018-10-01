package com.cocinerasoaxaca
import grails.databinding.BindingFormat

class CocinerasConcurso {
    Integer numeroConvocatoria
    String anioConvocatoria
	@BindingFormat("yyyy-MM-dd'T'HH:mm")
	Date fechaInicio
	@BindingFormat("yyyy-MM-dd'T'HH:mm")
	Date fechaFinal
	String lugar
	String latitud
	String longitud
    String ubicacionArchivo
    Collection registros
    Collection concursos

    static hasMany = [registros:Inscripcion, concursos:Concurso]

    static constraints = {
        anioConvocatoria matches:'^[\\d]{4}$'
    	fechaInicio validator: { val, obj ->
    		return (val <= obj.fechaFinal)
    	}
    	lugar size:5..250
        ubicacionArchivo nullable:true, blank:true, size:5..500
    }

    static mapping = {
        sort numeroConvocatoria:'desc'
    }
}
