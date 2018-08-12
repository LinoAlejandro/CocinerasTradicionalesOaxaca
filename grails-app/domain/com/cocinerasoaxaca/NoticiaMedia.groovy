package com.cocinerasoaxaca

class NoticiaMedia {

    String tipo
    String ubicacion
    String pieMedia
    TraduccionMedia traduccionIngles
    TraduccionMedia traduccionEspanol

    static embedded = ['traduccionIngles','traduccionEspanol']
    static belongsTo = [ noticia:Noticia ]

    static constraints = {
        ubicacion size:5..5000
        tipo inList: ['imagen', 'video']
        pieMedia nullable:true, blank:true, size:5..5000
        traduccionIngles nullable:true, blank:true
        traduccionEspanol nullable:true, blank:true
    }
}

class TraduccionMedia {
    String pieMedia

    static constraints = {
        pieMedia size:5..500
    }
}
