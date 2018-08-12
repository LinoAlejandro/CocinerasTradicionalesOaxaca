package com.cocinerasoaxaca

class Actividad {
    Date fechaPublicacion
    Date fechaInicio
    Date fechaFinal
    Float latitud
    Float longitud
    String lugar
    Collection media
    ActividadTraduccion traduccionEspanol
    ActividadTraduccion traduccionIngles

    static hasMany = [ media:ActividadMedia]
    static embedded = ['traduccionEspanol', 'traduccionIngles']

    static constraints = {
        latitud nullable:true, blank:true
        longitud nullable:true, blank:true
        lugar size:5..500, nullable:true, blank:true
        traduccionEspanol nullable:true, blank:true
        traduccionIngles nullable:true, blank:true
    }

    static mapping = {
        sort 'fechaInicio'
    }
}

class ActividadTraduccion {
    String titulo
    String contenido

    static constraints = {
      titulo size:0..900
      contenido size:10..20000
    }
}
