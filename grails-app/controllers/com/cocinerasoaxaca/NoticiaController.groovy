package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured
import java.text.SimpleDateFormat
import grails.converters.JSON

class NoticiaController {

    @Secured('ROLE_ADMIN')
    def index() {
        if(!params.max) {
            params.max = 10
        }
        [noticias: Noticia.list(params), noticiaCount: Noticia.count(), params:params]
    }

    @Secured('ROLE_ADMIN')
    def create(Noticia noticia) {
        if(request.method == 'POST') {
            noticia.fechaPublicacion = new Date()
            if(noticia.save()) {
                println session.mediaNoticia.size()
                session.mediaNoticia.each {
                    it.noticia = noticia
                    println it.save()
                }
                session.mediaNoticia = null
                redirect action:'index'
                return
            }
        } else {
            session.mediaNoticia = []
        }

        [noticia:noticia]
    }

    @Secured('ROLE_ADMIN')
    def update(Noticia noticia) {
        if(request.method == 'POST') {
            noticia.properties = params
            if(noticia.save(flush:true)) {
                redirect action:'index'
                return
            }
        }
        if(noticia) {
            [noticia:noticia, medias: NoticiaMedia.findAll { eq('noticia', noticia)} ]
        }
    }

    @Secured('ROLE_ADMIN')
    def delete(Noticia noticia) {
        noticia.delete(flush:true)
        redirect action:'index', params:params
    }

    @Secured('ROLE_ADMIN')
    def addMedia() {
        def noticiaMedia = new NoticiaMedia(params)
        if(noticiaMedia.validate()) {
            session.mediaNoticia.add(noticiaMedia)
            response.status = 200
            render(contentType: "application/json") {
                noticia(tipo: noticiaMedia.tipo, 
                    ubicacion: noticiaMedia.ubicacion, 
                    'traduccionEspanol.pieMedia':noticiaMedia.traduccionEspanol.pieMedia)
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def saveMedia() {
        def noticiaMedia = new NoticiaMedia(params)
        println noticiaMedia.validate()
        println noticiaMedia.errors
        if(noticiaMedia.save()) {
            response.status = 200
            render(contentType: "application/json") {
                noticia(id: noticiaMedia.id,
                    tipo: noticiaMedia.tipo, 
                    ubicacion: noticiaMedia.ubicacion, 
                    'traduccionEspanol.pieMedia':noticiaMedia.traduccionEspanol.pieMedia,
                    'traduccionIngles.pieMedia':noticiaMedia.traduccionEspanol.pieMedia,
                    datosAutor:noticiaMedia.datosAutor)
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def updateMedia(NoticiaMedia media) {
        media.properties = params
        println params
        if(media.save(flush:true)) {
            response.status = 200
            render(contentType: 'application/json') {
                noticia(id: media.id,
                    tipo: media.tipo, 
                    ubicacion: media.ubicacion, 
                    'traduccionEspanol.pieMedia': media.traduccionEspanol.pieMedia,
                    'traduccionIngles.pieMedia': media.traduccionIngles.pieMedia,
                    datosAutor: media.datosAutor)
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def deleteMedia(NoticiaMedia media) {
        if(!media.delete(flush:true)) {
            response.status = 200
        } else {
            response.status = 204
        }
    }

    @Secured('permitAll')
    def listarticulos() {
        if(!params.max) {
            params.max = 6
        }

        def articuloCount = 0
        def articulos = null

        if(params.searchParams) {
            if(session.language) {
                articulos = Noticia.findAll(params) {
                    eq('tipo', 'Artículo')
                    and {
                        or {
                            ilike('traduccionIngles.titulo' , "%" + params.searchParams + "%")
                            ilike('traduccionIngles.contenido' , "%" + params.searchParams + "%")
                        }
                    }
                }

                articuloCount = Noticia.createCriteria().list {
                    projections {
                        count()
                    }
                    eq('tipo', 'Artículo')
                    and {
                        or {
                            ilike('traduccionIngles.titulo' , "%" + params.searchParams + "%")
                            ilike('traduccionIngles.contenido' , "%" + params.searchParams + "%")
                        }
                    }
                }

            } else {
                articulos = Noticia.findAll(params) {
                    eq('tipo', 'Artículo')
                    and {
                        or {
                            ilike('traduccionEspanol.titulo' , "%" + params.searchParams + "%")
                            ilike('traduccionEspanol.contenido' , "%" + params.searchParams + "%")
                        }
                    }
                }

                articuloCount = Noticia.createCriteria().list {
                    projections {
                        count()
                    }
                    eq('tipo', 'Artículo')
                    and {
                        or {
                            ilike('traduccionEspanol.titulo' , "%" + params.searchParams + "%")
                            ilike('traduccionEspanol.contenido' , "%" + params.searchParams + "%")
                        }
                    }
                }
            }

        } else {
            articulos = Noticia.findAll(params) {
                tipo == 'Artículo'
            }

            articuloCount = Noticia.createCriteria().list {
                projections {
                    count()
                }
                eq('tipo', 'Artículo')
            }
        }

        articuloCount = articuloCount[0]
        println articuloCount

        def articulosMap = []

        articulos.each {
            articulosMap.add([
                id: it.id,
                titulo: session.language ? it.traduccionIngles.titulo : it.traduccionEspanol.titulo,
                contenido: session.language ? it.traduccionIngles.contenido : it.traduccionEspanol.contenido,
                fechaPublicacion: new SimpleDateFormat('dd-MM-yyyy').format(it.fechaPublicacion),
                ubicacionImagen: it.ubicacionImagen
            ])
        }

        [articulos: articulosMap, articuloCount: articuloCount]
    }

    @Secured('permitAll')
    def listanoticias() {
        if(!params.max) {
            params.max = 6
        }

        def noticiaCount = 0
        def noticias = null

        if(params.searchParams) {
            if(session.language) {
                noticias = Noticia.findAll(params) {
                    eq('tipo', 'Noticia')
                    and {
                        or {
                            ilike('traduccionIngles.titulo' , "%" + params.searchParams + "%")
                            ilike('traduccionIngles.contenido' , "%" + params.searchParams + "%")
                        }
                    }
                }

                noticiaCount = Noticia.createCriteria().list {
                    projections {
                        count()
                    }
                    eq('tipo', 'Noticia')
                    and {
                        or {
                            ilike('traduccionIngles.titulo' , "%" + params.searchParams + "%")
                            ilike('traduccionIngles.contenido' , "%" + params.searchParams + "%")
                        }
                    }
                }

            } else {
                noticias = Noticia.findAll(params) {
                    eq('tipo', 'Noticia')
                    and {
                        or {
                            ilike('traduccionEspanol.titulo' , "%" + params.searchParams + "%")
                            ilike('traduccionEspanol.contenido' , "%" + params.searchParams + "%")
                        }
                    }
                }

                noticiaCount = Noticia.createCriteria().list {
                    projections {
                        count()
                    }
                    eq('tipo', 'Noticia')
                    and {
                        or {
                            ilike('traduccionEspanol.titulo' , "%" + params.searchParams + "%")
                            ilike('traduccionEspanol.contenido' , "%" + params.searchParams + "%")
                        }
                    }
                }
            }

        } else {
            noticias = Noticia.findAll(params) {
                tipo == 'Noticia'
            }

            noticiaCount = Noticia.createCriteria().list {
                projections {
                    count()
                }
                eq('tipo', 'Artículo')
            }
        }

        noticiaCount = noticiaCount[0]

        println noticiaCount

        def noticiasMap = []

        noticias.each {
            noticiasMap.add([
                id: it.id,
                titulo: session.language ? it.traduccionIngles.titulo : it.traduccionEspanol.titulo,
                contenido: session.language ? it.traduccionIngles.contenido : it.traduccionEspanol.contenido,
                fechaPublicacion: new SimpleDateFormat('dd-MM-yyyy').format(it.fechaPublicacion),
                ubicacionImagen: it.ubicacionImagen
            ])
        }

        [noticias: noticiasMap, noticiaCount: noticiaCount]
    }

    @Secured('permitAll')
    def show(Noticia noticia) {

        def sugerencias = Noticia.executeQuery(
          "from Noticia n where " +
              "n.id != :idNoticia " +
              "and n.tipo = :tipo " +
              "order by rand()",
          [idNoticia: noticia.id, tipo:noticia.tipo],
          [max:4]
        )

        def model = [
            noticia:noticia,
            mediaFotos:NoticiaMedia.executeQuery(
                "from NoticiaMedia media where " +
                    "media.noticia.id = :noticiaId and " +
                    "media.tipo = :tipo",
                [noticiaId: noticia.id,
                tipo: 'imagen']),
            mediaVideo:NoticiaMedia.createCriteria().list() {
                and {
                    eq('noticia', noticia)
                    eq('tipo', "video")
                }
            },
            sugerencias: sugerencias
        ]
        
        if(noticia.tipo == "Artículo") {
            render(view: "showarticulo", model: model)
        } else if (noticia.tipo == "boletin" || noticia.tipo == "Boletín") {
            render(view: "showboletin", model: model)
        } else if (noticia.tipo == "noticia" || noticia.tipo == "Noticia") {
            render(view: "shownoticia", model: model)
        }
    }
}
