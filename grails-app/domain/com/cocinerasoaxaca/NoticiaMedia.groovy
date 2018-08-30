package com.cocinerasoaxaca

class NoticiaMedia {

    String tipo
    String ubicacion
    TraduccionMedia traduccionIngles
    TraduccionMedia traduccionEspanol
    String datosAutor

    static belongsTo = [ noticia:Noticia ]

    static embedded = ['traduccionEspanol', 'traduccionIngles']
    
    static constraints = {
        ubicacion size:5..5000
        tipo inList: ['imagen', 'video']
        traduccionIngles nullable:true, blank:true
        traduccionEspanol nullable:true, blank:true
        datosAutor nullable:true, blank:true, size:5..400
        noticia nullable:true, blank:true
    }

    static class TraduccionMedia {
        String pieMedia

        static constraints = {
            pieMedia size:5..500
        }
    }
}

