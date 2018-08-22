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
    def saveplatillo(Platillo platillo) {
        Platillo.withSession {
            it.flush()
            it.clear()
        }
        if(request.method == 'POST') {
            platillo.cocinera = Cocinera.get(params.cocineraObject)
            if(platillo.save(flush:true)) {
                redirect action: "update", id: platillo.cocinera.id
                return
            }
        }
        [cocineraObject:params.cocineraObject, platillo:platillo]
    }

    @Secured('ROLE_ADMIN')
    def updateplatillo(Platillo platillo) {
        if(request.method == 'POST') {
            platillo.properties = params
            if(platillo.save(flush:true)) {
                def cocinera = platillo.cocinera
                redirect action: "update", params: [id:cocinera.id]
                return
            }
        }
        [platillo:platillo]
    }

    @Secured('ROLE_ADMIN')
    def deleteplatillo(Platillo platillo) {
        def cocinera = Cocinera.get(platillo.cocinera.id)
        platillo.delete(flush:true)
        Platillo.withSession {
            it.flush()
            it.clear()
        }
        redirect action: "update", params: [id:cocinera.id]
    }

    @Secured('permitAll')
    def show(Cocinera cocinera) {
        [cocinera:cocinera, platillos:Platillo.findByCocineraAndLenguaje(cocinera, session.language)]
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
