package com.cocinerasoaxaca
import grails.databinding.BindingFormat

class Cocinera {
    Date fechaRegistro
    String nombres
    String apellidos
    @BindingFormat("yyyy-MM-dd'T'HH:mm")
    Date fechaNacimiento

    String ubicacionFotoPerfil

    Integer telefonoFijo
    Integer telefonoCelular
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

    String vestimentaRegional
    String actividadPreponderante
    String descripcionComoAprendioCocinar
    String quienLeEnsenoCocinar
    String aQuienEnsenoCocinar

    Collection platillos
    Collection inscripciones

    static hasMany = [platillos:Platillo, inscripciones:Inscripcion]

    static constraints = {
        nombres size:5..450
        apellidos size:5..450
        fechaNacimiento max:new Date()
        telefonoFijo validator:{ val
            return (val.size() > 6 && val.size() < 13)
        }
        telefonoCelular validator:{ val
            return (val.size() >= 10)
        }
        correoElectronico email:true
        regionGeografica size:5..250
        municipio size:5..250
        agencia size:5..250
        calle size:5..250
        noExt size:5..250
        noInt size:5..250
        etnia size:5..350
        lenguaMadre size:5..350
        dialecto size:5..350
        vestimentaRegional size:5..1000
        actividadPreponderante size:5..1000
        descripcionComoAprendioCocinar size:5..1000
        quienLeEnsenoCocinar size:5..1000
        aQuienEnsenoCocinar size:5..1000
    }
}