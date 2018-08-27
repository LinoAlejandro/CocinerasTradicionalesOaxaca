package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured
import java.text.SimpleDateFormat
import java.text.DateFormat
import grails.converters.JSON

class ActividadController {

    @Secured('ROLE_ADMIN')
    def index() {
        if(!params.max) {
            params.max = 10
        }
        [actividades: Actividad.findAll(params), actividadCount: Actividad.count()]
    }

    @Secured('ROLE_ADMIN')
    def create(Actividad actividad) {
        if(request.method == 'POST') {
            actividad.fechaPublicacion = new Date()
            if(actividad.save()) {
                session.media.each {
                    it.actividad = actividad
                    it.save()
                }
                session.media = null
                redirect action:'index'
                return
            }
        } else {
            session.media = []
        }

        [actividad:actividad]
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
        [actividad:actividad, medias: ActividadMedia.findAll { eq('actividad', actividad)} ]
    }

    @Secured('ROLE_ADMIN')
    def delete(Actividad actividad) {
        actividad.delete(flush:true)
        redirect action:'index'
    }

    @Secured('ROLE_ADMIN')
    def addMedia() {
        def actividadMedia = new ActividadMedia(params)
        if(actividadMedia.validate()) {
            session.media.add(actividadMedia)
            response.status = 200
            render(contentType: "application/json") {
                actividad(tipo: actividadMedia.tipo, 
                    ubicacion: actividadMedia.ubicacion, 
                    'traduccionEspanol.pieMedia':actividadMedia.traduccionEspanol.pieMedia)
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def saveMedia() {
        println params
        def actividadMedia = new ActividadMedia(params)
        if(actividadMedia.save()) {
            response.status = 200
            render(contentType: "application/json") {
                actividad(id: actividadMedia.id,
                    tipo: actividadMedia.tipo, 
                    ubicacion: actividadMedia.ubicacion, 
                    'traduccionEspanol.pieMedia':actividadMedia.traduccionEspanol.pieMedia,
                    'traduccionIngles.pieMedia':actividadMedia.traduccionEspanol.pieMedia,
                    datosAutor:actividadMedia.datosAutor)
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def updateMedia(ActividadMedia actividadMedia) {
        actividadMedia.properties = params
        println params
        if(actividadMedia.save(flush:true)) {
            response.status = 200
            render(contentType: 'application/json') {
                actividad(id: actividadMedia.id,
                    tipo: actividadMedia.tipo, 
                    ubicacion: actividadMedia.ubicacion, 
                    'traduccionEspanol.pieMedia': actividadMedia.traduccionEspanol.pieMedia,
                    'traduccionIngles.pieMedia': actividadMedia.traduccionIngles.pieMedia,
                    datosAutor:actividadMedia.datosAutor)
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def deleteMedia(ActividadMedia actividadMedia) {
        if(!actividadMedia.delete(flush:true)) {
            response.status = 200
        } else {
            response.status = 204
        }
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
    def list() {
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
