package com.cocinerasoaxaca
import grails.databinding.BindingFormat

class Cocinera {
    User user
    Date fechaRegistro
    String nombres
    String apellidos
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date fechaNacimiento
    String curp
    String ubicacionFotoPerfil
    String telefonoFijo
    String telefonoCelular
    String correoElectronico
    String regionGeografica
    String municipio
    String agencia
    String calle
    String noExt
    String noInt
    String latitud
    String longitud
    String etnia
    String lenguaMadre
    String dialecto
    String actividadPreponderante
    String descripcionComoAprendioCocinar
    String quienLeEnsenoCocinar
    String aQuienEnsenoCocinar
    Boolean isActiva
    String ubicacionArchivo

    Collection platillos
    Collection inscripciones

    static hasMany = [platillos:Platillo, inscripciones:Inscripcion]

    static constraints = {
        nombres size:5..450
        apellidos size:5..450
        fechaNacimiento max:new Date()
        curp unique:true, size:18..18
        ubicacionFotoPerfil nullable:true, blank:true
        telefonoFijo nullable:true, blank:true, matches:'^[0-9]{7}$'
        telefonoCelular nullable:true, blank:true, matches:'^[0-9]{10}$'
        correoElectronico nullable:true, blank:true, email:true
        regionGeografica size:5..250
        municipio size:5..250
        agencia size:5..250
        calle size:5..250
        noExt nullable:true, blank:true, size:1..10
        noInt nullable:true, blank:true, size:1..10
        latitud nullable:true, blank:true
        longitud nullable:true, blank:true
        etnia nullable:true, blank:true, size:5..350
        lenguaMadre nullable:true, blank:true, size:5..350
        dialecto nullable:true, blank:true, size:5..350
        actividadPreponderante nullable:true, blank:true, size:5..1000
        descripcionComoAprendioCocinar nullable:true, blank:true, size:5..1000
        quienLeEnsenoCocinar nullable:true, blank:true, size:5..1000
        aQuienEnsenoCocinar nullable:true, blank:true, size:5..1000
        user nullable:true, blank:true
        ubicacionArchivo nullable:true, blank:true, size:5..4000
    }
}