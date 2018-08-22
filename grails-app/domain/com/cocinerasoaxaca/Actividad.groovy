package com.cocinerasoaxaca
import grails.databinding.BindingFormat

class Actividad {
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date fechaPublicacion
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date fechaInicio
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date fechaFinal
    String latitud
    String longitud
    String lugar
    Collection media
    ActividadTraduccion traduccionEspanol
    ActividadTraduccion traduccionIngles

    static hasMany = [ media:ActividadMedia ]

    static embedded = ['traduccionEspanol', 'traduccionIngles']

    static constraints = {
        latitud nullable:true, blank:true
        longitud nullable:true, blank:true
        lugar size:5..500
        traduccionIngles nullable:true, blank:true
        traduccionEspanol validator: { val, obj ->
            if(val.titulo == null) {
                return 'traduccionEspanol.titulo.null'
            } else if(val.contenido == null) {
                return 'traduccionEspanol.contenido.null'
            }
        }
    }

    static mapping = {
        sort fechaPublicacion: "desc"
    }
}

class ActividadTraduccion {
    String titulo
    String contenido

    static constraints = {
      titulo size:0..900, nullable:true, blank:true
      contenido size:10..30000, nullable:true, blank:true
    }
}
