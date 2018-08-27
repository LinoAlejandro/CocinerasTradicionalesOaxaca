package com.cocinerasoaxaca
import grails.databinding.BindingFormat

class Cocinera {

    Date fechaRegistro
    String nombres
    String apellidos
    Date fechaNacimiento

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

    Collection platillos

    static hasMany = [platillos:Platillo]


}


/*[Inscripcion]*

    /*Datos de los ayudantes (Nueva clase)*
        String nombreCompleto
        String telefono
        String genero

    /*Lista de platillos (Nueva clase)*
        String nombre
        String tipo

    /*Lista de equipo mayor (Nueva clase)*
        String tipo
        String cantidad

/*[Historia de vida]*
    
    String vestimentaRegional
    String actividadPreponderante
    String descripcionComoAprendioCocinar
    String quienLeEnsenoCocinar
    String aQuienEnsenoCocinar
    
    /*Informacion de la receta*
    String platilloRepresentar
    String razonPorPlatillo
    String formaEnQueSePrepara
    String formaConsumirPlatillo

/*[Receta]*

    String nombrePlatilloReceta
    String tipoPreparacion
    String origen
    String rendimiento
    String consumo

    /*Ingredientes*
        String nombre
        String cantidad

    String modoPreparacion
    String historia

/*[Concursos]*
    Date fecheInscripcion
    String categoria

    /*Ingredientes*
        String nombre
        String cantidad

    String modoDePreparacion
*/