package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured

class ActividadController {

    @Secured('ROLE_ADMIN')
    def index() {
        Actividad.withSession {
            it.flush()
            it.clear()
        }
        if(!params.max) {
            params.max = 10
        }
        [actividades: Actividad.executeQuery('from actividad',params), actividadCount:Actividad.count()]
    }

    @Secured('ROLE_ADMIN')
    def create(Actividad actividad, ActividadTraduccion traduccion) {
        if(request.method == 'POST') {
            actividad.fechaPublicacion = new Date()
            traduccion.titulo = actividad.titulo
            traduccion.actividad = actividad
            traduccion.lenguaje = 'Español'
            if(actividad.validate() && traduccion.validate()) {
                actividad.save(flush:true)
                traduccion.save(flush:true)
                redirect action:'index'
                return
            }
        }
        [actividad:actividad, traduccion:traduccion]
    }

    @Secured('ROLE_ADMIN')
    def update(Actividad actividad) {
        if(request.method == 'POST') {
            actividad.properties = params
            if(actividad.save(flush:true)) {
                redirect action:'index'
                return
            }
        }
        [actividad:actividad]
    }

    @Secured('ROLE_ADMIN')
    def updateTraduccion(ActividadTraduccion traduccion) {
        if(request.method == 'POST') {
            traduccion.properties = params
            if(traduccion.save(flush:true)) {
                redirect action:'update', params:[id:traduccion.actividad.id]
            }
        }
        [traduccion:traduccion]
    }

    @Secured('ROLE_ADMIN')
    def deleteTraduccion(ActividadTraduccion traduccion) {
        def actividad = traduccion.actividad
        traduccion.delete(flush:true)
        redirect action:'update', params:[id:actividad.id]
    }

    @Secured('ROLE_ADMIN')
    def agregarTraduccion(ActividadTraduccion traduccion) {
        if(request.method == 'POST') {
            def actividad = Actividad.get(params.actividadObject)
            traduccion.actividad = actividad
            if(traduccion.validate()) {
                def actividadValidacion = ActividadTraduccion.findByActividadAndLenguaje(actividad, traduccion.lenguaje)
                if(!actividadValidacion) {
                    traduccion.save(flush:true)
                    redirect action:'update', params:[id:traduccion.actividad.id]
                    return
                }
            }
        }
        params.actividadObject = params.actividadObject
        params.offset = params.offset
        [traduccion:traduccion]
    }

    @Secured('ROLE_ADMIN')
    def delete(Actividad actividad) {
        actividad.delete(flush:true)
        redirect action:'index'
    }

    @Secured('ROLE_ADMIN')
    def saveMedia(ActividadMedia media) {
        ActividadMedia.withSession {
            it.flush()
            it.clear()
        }
        if(request.method == 'POST') {
            media.actividad = Actividad.get(params.actividadObject)
            if(media.save(flush:true)) {
                redirect action: "update", id: media.actividad.id
                return
            }
        }
        [actividadObject:params.actividadObject, media:media]
    }

    @Secured('ROLE_ADMIN')
    def updateMedia(ActividadMedia media) {
        if(request.method == 'POST') {
            media.properties = params
            if(media.save(flush:true)) {
                def actividad = media.actividad
                redirect action: "update", params: [id:actividad.id]
                return
            }
        }
        [media:media]
    }

    @Secured('ROLE_ADMIN')
    def deleteMedia(ActividadMedia media) {
        def actividad = Actividad.get(media.actividad.id)
        media.delete(flush:true)
        ActividadMedia.withSession {
            it.flush()
            it.clear()
        }
        redirect action: "update", params: [id:actividad.id]
    }

    @Secured('permitAll')
    def show(Actividad actividad) {
        Actividad.withSession {
            it.flush()
            it.clear()
        }
        [actividad:actividad,
         mediaFotos:ActividadMedia.findAllByActividadAndTipo(actividad,"imagen"),
         mediaVideo:ActividadMedia.findAllByActividadAndTipo(actividad,"video"),
         traduccion:ActividadTraduccion.findByActividadAndLenguaje(actividad, session.language)]
    }

    @Secured('permitAll')
    def list() {/*
        Actividad.withSession {
            it.flush()
            it.clear()
        }
        if(!params.max) {
            params.max=10
        }

        def actividadesMap = []
        def actividades = Actividad.list(params)

        actividades.each {
            def map = [actividad:it, traduccion:ActividadTraduccion.findByActividadAndLenguaje(it, session.language ?: 'Español')]
            actividadesMap.add(map)
        }

        [actividades:actividadesMap, actividadCount: Actividad.count()]*/
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT-5:00"));
        Date currentDate = calendar.getTime();
        Calendar cal = Calendar.getInstance();
        cal.setTime(currentDate);
        String month = cal.get(Calendar.MONTH).toString();
        println 'month value'
        println month
        println '\n\n\n'

        def actividadesMap = []

        def actividades = Actividad.findAllByFechaInicioGreaterThanEquals(Date.parse("yyyy-MM-dd hh:mm:ss", "2018-"  + month + "-1 0:00:00"))

        actividades.each {
            actividadesMap.add([id:it.id, titulo: it.traduccionEspanol.titulo, fechaInicio: it.fechaInicio, fechaFinal: it.fechaFinal, lugar:it.lugar])
        }

        [actividades:actividadesMap]
    }
}
