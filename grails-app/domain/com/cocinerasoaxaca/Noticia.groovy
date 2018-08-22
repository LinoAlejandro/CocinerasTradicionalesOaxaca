package com.cocinerasoaxaca
class Noticia {
    Date fechaPublicacion
    String tipo
    String ubicacionImagen
    Collection media
    NoticiaTraduccion traduccionEspanol
    NoticiaTraduccion traduccionIngles

    static hasMany = [media:NoticiaMedia]
    static embedded = ['traduccionEspanol', 'traduccionIngles']

    static constraints = {
        ubicacionImagen size:0..10000, nullable:true, blank:true
        tipo inList: ['noticia', 'boletin', 'Artículo', 'Boletín', 'Noticia']
        traduccionIngles nullable:true, blank:true
        traduccionEspanol validator: { val, obj ->
            if(val.titulo == null) {
                return 'traduccionEspanol.titulo.null'
            } else if(val.contenido == null) {
                return 'traduccionEspanol.contenido.null'
            }
        }
    }

    static mapping = {
        titulo size:5..700, nullable:true, blank:true
        sort fechaPublicacion:'desc'
    }
}

class NoticiaTraduccion {
    String titulo
    String contenido

    static constraints = {
        titulo size:0..900, nullable:true, blank:true
        contenido size:0..50000, nullable:true, blank:true
    }
}
