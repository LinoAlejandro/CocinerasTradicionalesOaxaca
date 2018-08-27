package com.cocinerasoaxaca

class Noticia {
    Date fechaPublicacion
    String tipo
    String ubicacionImagen
    String autor
    String lugar
    String longitud
    String latitud
    Collection media
    NoticiaTraduccion traduccionEspanol
    NoticiaTraduccion traduccionIngles

    static hasMany = [media:NoticiaMedia]
    static embedded = ['traduccionEspanol', 'traduccionIngles']

    static constraints = {
        tipo inList: ['Artículo', 'Boletín', 'Noticia']
        ubicacionImagen size:5..10000, nullable:true, blank:true
        autor nullable:true, blank:true, size:5..400
        lugar size:5..250, nullable:true, blank:true
        longitud nullable:true, blank:true
        latitud nullable:true, blank:true
        traduccionEspanol validator: { val, obj ->
            if(val.titulo == null) {
                return 'traduccionEspanol.titulo.null'
            } else if(val.contenido == null) {
                return 'traduccionEspanol.contenido.null'
            }
        }
        traduccionIngles nullable:true, blank:true
    }

    static mapping = {
        sort fechaPublicacion:'desc'
    }
}

class NoticiaTraduccion {
    String titulo
    String subtitulo
    String contenido

    static constraints = {
        titulo size:0..900, nullable:true, blank:true
        subtitulo size:0..1500, nullable:true, blank:true
        contenido size:0..50000, nullable:true, blank:true
    }
}
