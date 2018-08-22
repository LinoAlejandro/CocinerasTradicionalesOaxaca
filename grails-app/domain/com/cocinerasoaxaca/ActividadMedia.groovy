package com.cocinerasoaxaca

class ActividadMedia {

    String tipo
    String ubicacion
    ActividadMediaTraduccion traduccionEspanol
    ActividadMediaTraduccion traduccionIngles

    static belongsTo = [actividad:Actividad]

    static embedded = ['traduccionEspanol', 'traduccionIngles']

    static constraints = {
        ubicacion size:5..5000
        tipo inList: ['imagen', 'video']
        traduccionEspanol validator : { val, obj ->
            if(val.pieMedia == null) {
                return 'traduccionEspanol.pieMedia.null'
            }
        }
        actividad nullable:true, blank:true
    }
}

class ActividadMediaTraduccion {
    String pieMedia

    static constraints = {
        pieMedia nullable:true, blank:true, size:5..5000
    }
}
