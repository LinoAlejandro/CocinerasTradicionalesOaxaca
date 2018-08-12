package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured

class CocineraController {

    @Secured('ROLE_ADMIN')
    def index() {
        Cocinera.withSession {
            it.flush()
            it.clear()
        }
        Noticia.withSession {
            it.flush()
            it.clear()
        }
        Actividad.withSession {
            it.flush()
            it.clear()
        }
        Admin.withSession {
            it.flush()
            it.clear()
        }
        if(!params.max) {
            params.max = 10
        }
        [cocineras: Cocinera.list(params), cocinerasCount: Cocinera.count()]
    }

    @Secured('ROLE_ADMIN')
    def create(Cocinera cocinera) {
        if(request.method == 'POST') {
            if(cocinera.save(flush:true)) {
                redirect action:'index'
            }
        }
        [cocinera:cocinera]
    }

    @Secured('ROLE_ADMIN')
    def update(Cocinera cocinera) {
        if(request.method == 'POST') {
            cocinera.properties = params
            if(cocinera.save(flush:true)) {
                redirect action:'index'
                return
            }
        }
        [cocinera:cocinera]
    }

    @Secured('ROLE_ADMIN')
    def delete(Cocinera cocinera) {
        cocinera.delete(flush:true)
        redirect action:'index'
    }

    @Secured('ROLE_ADMIN')
    def saveMedia(CocineraMedia media) {
        CocineraMedia.withSession {
            it.flush()
            it.clear()
        }
        if(request.method == 'POST') {
            media.cocinera = Cocinera.get(params.cocineraObject)
            if(media.save(flush:true)) {
                redirect action: "update", id: media.cocinera.id
                return
            }
        }
        [cocineraObject:params.cocineraObject, media:media]
    }

    @Secured('ROLE_ADMIN')
    def updateMedia(CocineraMedia media) {
        if(request.method == 'POST') {
            media.properties = params
            if(media.save(flush:true)) {
                def cocinera = media.cocinera
                redirect action: "update", params: [id:cocinera.id]
                return
            }
        }
        [media:media]
    }

    @Secured('ROLE_ADMIN')
    def deleteMedia(CocineraMedia media) {
        def cocinera = Cocinera.get(media.cocinera.id)
        media.delete(flush:true)
        CocineraMedia.withSession {
            it.flush()
            it.clear()
        }
        redirect action: "update", params: [id:cocinera.id]
    }

    @Secured('permitAll')
    def show(Cocinera cocinera) {
        [cocinera:cocinera, platillos:CocineraMedia.findByCocineraAndLenguaje(cocinera, session.language)]
    }

    @Secured('permitAll')
    def list() {
        Cocinera.withSession {
            it.flush()
            it.clear()
        }
        if(!params.max) {
            params.max = 10
        }

        [cocineras: Cocinera.list(params), cocineraCount: Cocinera.count()]
    }
}
