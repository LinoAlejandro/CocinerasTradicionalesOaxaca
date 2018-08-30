package com.cocinerasoaxaca

class Posicion {
	String posicion

	static belongsTo = [concurso:Concurso, platillo:Platillo]
	
    static constraints = {
    }
}
