package com.cocinerasoaxaca

class Cocinera {

    String nombre
    String region
    String municipio
    String agencia
    String etnia
    String lenguaMadre
    String dialecto
    Double latitud
    Double longitud
    String ubicacionImagen
    Collection media

    static hasMany = [media:CocineraMedia]

    static constraints = {
        nombre size:0..400
        region size:0..400
        municipio size:0..400
        agencia nullable:true, blank:true, size:0..400
        etnia nullable:true, blank:true, size:0..400
        lenguaMadre nullable:true, blank:true, size:0..400
        dialecto nullable:true, blank:true, size:0..400
        latitud nullable:true, blank:true
        longitud nullable:true, blank:true
        ubicacionImagen nullable:true, blank:true, size:0..2000
    }
}
