package com.cocinerasoaxaca

class Platillo {
    String nombrePlatillo
    String ubicacionmedia
    String premio
    String convocatoria
    PlatilloTraduccion traduccionEspanol
    PlatilloTraduccion traduccionIngles

    static belongsTo = [cocinera:Cocinera]

    static embedded = ['traduccionEspanol','traduccionIngles']

    static constraints = {
        nombrePlatillo size:0..1000
        ubicacionmedia nullable:true, size:5..5000
        premio nullable:true, blank:true
        traduccionIngles nullable:true, blank:true
        traduccionEspanol validator: { val, obj ->

            if(val.ingredientes == null) {
                return 'traduccionEspanol.titulo.null'
            } else if (val.tipoPlatillo == null) {
                return 'traduccionEspanol.contenido.null'
            } 
        }
    }
}

class PlatilloTraduccion {
    String ingredientes
    String tipoPlatillo

    static belongsTo = [cocinera:Cocinera]

    static constraints = {
        ingredientes size:0..5000, nullable:true, blank:true
        tipoPlatillo inList: ['cotidiano','ceremonial'], nullable:true, blank:true
    }
}
