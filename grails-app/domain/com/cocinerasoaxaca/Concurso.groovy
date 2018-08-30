package com.cocinerasoaxaca

class Concurso {
	String descripcion
	Collection posiciones

	static belongsTo = [convocatoria:CocinerasConcurso]

	static hasMany = [posiciones:Posicion]

	static constraints = {
		descripcion size:5..250
	}
}
