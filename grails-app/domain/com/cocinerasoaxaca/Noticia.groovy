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

    static hasMany = [media : NoticiaMedia]

    static embedded = ['traduccionEspanol', 'traduccionIngles']

    static constraints = {
        tipo inList: ['Artículo', 'Boletín', 'Noticia']
        ubicacionImagen size:5..10000, nullable:true, blank:true
        autor nullable:true, blank:true, size:5..400
        lugar size:5..250, nullable:true, blank:true
        longitud nullable:true, blank:true
        latitud nullable:true, blank:true
        traduccionEspanol validator: { val, obj ->
            if(val.titulo == null || val.contenido == null) {
                return 'traduccionNoticia.null'
            } else if((val.titulo.size() < 5 || val.titulo.size() > 400) || (val.contenido.size() < 5 || val.contenido.size() > 50000)) {
                return 'traduccionNoticia.size'
            }
        }
        traduccionIngles nullable:true, blank:true
    }

    static mapping = {
        sort fechaPublicacion:'desc'
    }

    static class NoticiaTraduccion {
        String titulo
        String subtitulo
        String contenido

        static constraints = {
            titulo size:5..200, nullable:true, blank:true
            subtitulo size:5..350, nullable:true, blank:true
            contenido size:50..18000, nullable:true, blank:true
        }
    }
}

