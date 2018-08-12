package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured
import java.text.SimpleDateFormat

class NoticiaController {

    @Secured('ROLE_ADMIN')
    def index() {
        Noticia.withSession {
            it.flush()
            it.clear()
        }
        if(!params.max) {
            params.max = 10
        }
        [noticias: Noticia.list(params), noticiaCount: Noticia.count()]
    }

    @Secured('ROLE_ADMIN')
    def create(Noticia noticia, NoticiaTraduccion traduccion) {
        if(request.method == 'POST') {
            noticia.fechaPublicacion = new Date()
            traduccion.titulo = noticia.titulo
            traduccion.noticia = noticia
            traduccion.lenguaje = 'Español'
            if(noticia.validate() && traduccion.validate()) {
                noticia.save(flush:true)
                traduccion.save(flush:true)
                redirect action:'index'
                return
            }
        }
        [noticia:noticia, traduccion:traduccion]
    }

    @Secured('ROLE_ADMIN')
    def agregarTraduccion(NoticiaTraduccion traduccion) {
      if(request.method == 'POST') {
          def noticia = Noticia.get(params.noticiaObject)
          traduccion.noticia = noticia
          if(traduccion.validate()) {
              def noticiaValidacion = NoticiaTraduccion.findByNoticiaAndLenguaje(noticia, traduccion.lenguaje)
              if(!noticiaValidacion) {
                  traduccion.save(flush:true)
                  redirect action:'update', params:[id:traduccion.noticia.id]
                  return
              }
          }
      }
      params.noticiaObject = params.noticiaObject
      params.offset = params.offset
      [traduccion:traduccion]
    }

    @Secured('ROLE_ADMIN')
    def update(Noticia noticia) {
        if(request.method == 'POST') {
            noticia.properties = params
            if(noticia.save(flush:true)) {
                redirect action:'index'
            }
        }
        [noticia:noticia]
    }

    @Secured('ROLE_ADMIN')
    def updateTraduccion(NoticiaTraduccion traduccion) {
        if(request.method == 'POST') {
            traduccion.properties = params
            if(traduccion.save(flush:true)) {
                redirect action:'update', params:[id:traduccion.noticia.id]
            }
        }
        [traduccion:traduccion]
    }

    @Secured('ROLE_ADMIN')
    def deleteTraduccion(NoticiaTraduccion traduccion) {
        def noticia = traduccion.noticia
        traduccion.delete(flush:true)
        redirect action:'update', params:[id:noticia.id]
    }

    @Secured('ROLE_ADMIN')
    def delete(Noticia noticia) {
        noticia.delete(flush:true)
        if(noticia) {
            response.status = 200
        } else {
            response.status = 400
        }
    }

    @Secured('ROLE_ADMIN')
    def saveMedia(NoticiaMedia media) {
        NoticiaMedia.withSession {
            it.flush()
            it.clear()
        }
        if(request.method == 'POST') {
            media.noticia = Noticia.get(params.noticiaObject)
            if(media.save(flush:true)) {
                redirect action: "update", id: media.noticia.id
                return
            }
        }
        [noticiaObject:params.noticiaObject, media:media]
    }

    @Secured('ROLE_ADMIN')
    def updateMedia(NoticiaMedia media) {
        if(request.method == 'POST') {
            media.properties = params
            if(media.save(flush:true)) {
                def noticia = media.noticia
                redirect action: "update", params: [id:noticia.id]
                return
            }
        }
        [media:media]
    }

    @Secured('ROLE_ADMIN')
    def deleteMedia(NoticiaMedia media) {
        def noticia = Noticia.get(media.noticia.id)
        media.delete(flush:true)
        NoticiaMedia.withSession {
            it.flush()
            it.clear()
        }
        redirect action: "update", params: [id:noticia.id]
    }

    /*
    @Secured('permitAll')
    def list() {
        Noticia.withSession {
            it.flush()
            it.clear()
        }

        if(!params.max) {
            params.max=10
        }

        def noticiasMap = []
        def noticias = Noticia.list(params)

        noticias.each {
            def map = [noticia:it, traduccion:NoticiaTraduccion.findByNoticiaAndLenguaje(it, session.language)]
            noticiasMap.add(map)
        }

        [noticias: noticiasMap, noticiaCount: Noticia.count()]
    }*/

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
