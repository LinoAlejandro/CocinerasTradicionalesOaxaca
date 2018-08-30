package com.cocinerasoaxaca
import grails.databinding.BindingFormat

class CocinerasConcurso {
    String numeroConvocatoria
	@BindingFormat("dd-MM-yyyy'T'hh:mm")
	Date fechaInicio
	@BindingFormat("dd-MM-yyyy'T'hh:mm")
	Date fechafinal
	String lugar
	String latitud
	String longitud

    static hasMany = [registros:Inscripcion]

    static constraints = {
    	numeroConvocatoria matches:'^[\\d]{4}$'
    	fechaInicio validator: { val ->
    		return (val <= fechafinal)
    	}
    	lugar size:5..250
    }
}
