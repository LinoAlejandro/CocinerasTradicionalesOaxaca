package com.cocinerasoaxaca

class Inscripcion {
	Date fechaInscripcion
	Collection ayudantes
	Collection equipoMayor
	Collection platillos

	static belongsTo = [cocinera:Cocinera, convocatoria:CocinerasConcurso]

	static hasMany = [ayudantes:String , equipoMayor:String, platillos:Platillo]

    static constraints = {
    }
}
