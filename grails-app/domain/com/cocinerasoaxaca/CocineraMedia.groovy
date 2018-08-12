package com.cocinerasoaxaca

class CocineraMedia {

    String nombrePlatillo
    String ubicacionmedia
    String ingredientes
    String tipoPlatillo
    String premio
    String convocatoria
    String lenguaje

    static belongsTo = [cocinera:Cocinera]

    static constraints = {
        nombrePlatillo size:0..1000
        ubicacionmedia nullable:true, size:5..5000
        ingredientes size:0..5000, nullable:true, blank:true
        tipoPlatillo inList: ['cotidiano','ceremonial']
        premio nullable:true, blank:true
    }
}
