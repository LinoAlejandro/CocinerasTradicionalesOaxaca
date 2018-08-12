package com.cocinerasoaxaca

class ActividadMedia {

    String tipo
    String ubicacion
    String pieMedia
    String lenguaje

    static belongsTo = [actividad:Actividad]

    static constraints = {
        ubicacion size:5..5000
        tipo inList: ['imagen', 'video']
        pieMedia nullable:true, blank:true, size:5..5000
    }
}
