package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import groovy.sql.Sql

class ActividadController {

    def sessionFactory

    @Secured('ROLE_ADMIN')
    def index() {
        println '\n\nIn action index controller actividad'
        if(!params.max) {
            params.max = 10
        }
        [actividades: Actividad.findAll(params), actividadCount: Actividad.count(), params:[max:params.max, offset:params.offset]]
    }

    @Secured('ROLE_ADMIN')
    def create(Actividad actividad) {
        println '\n\nIn action create controller actividad'
        if(request.method == 'POST') {
            println params
            actividad.fechaPublicacion = new Date()
            if(actividad.save()) {

                if(session.media.size() > 0) {
                    def sesion = sessionFactory.currentSession
                    def query = "INSERT INTO actividad_media(version, tipo, actividad_id, ubicacion, datos_autor, traduccion_espanol_pie_media, traduccion_ingles_pie_media) VALUES"
                    session.media.each {
                        query = query + " (0,'" + it.tipo + "', " + actividad.id + ", '" + it.ubicacion + "', '" + it.datosAutor + "', '" + it.traduccionEspanol.pieMedia + "', '" + it.traduccionIngles.pieMedia +  "'),"
                    }
                    query = query.substring(0, query.size() - 1) + ";"
                    def sqlQuery = sesion.createSQLQuery(query)
                    sqlQuery.executeUpdate()
                }
                
                session.media = null
                redirect action:'index'
                return
            }
        } else {
            session.media = new ArrayList<ActividadMedia>()
        }

        [actividad:actividad]
    }

    @Secured('ROLE_ADMIN')
    def update(Actividad actividad) {
        println '\n\nIn action update controller actividad'
        if(request.method == 'POST') {
            actividad.properties = params
            println actividad.traduccionEspanol.titulo
            actividad = actividad.save(flush:true)
            println actividad.save(flush:true)
            println actividad.traduccionEspanol.titulo
            if(actividad.save(flush:true)) {
                redirect action:'index', params:[max:params.max, offset:params.offset]
                return
            }
        }
        [actividad:actividad, medias: ActividadMedia.findAll { eq('actividad', actividad)}, params:[max:params.max, offset:params.offset]]
    }

    @Secured('ROLE_ADMIN')
    def delete() {
        println '\n\nIn action delete controller actividad'
        def query = 'DELETE FROM ActividadMedia where actividad.id = ' + Long.parseLong(params.id)
        def update = ActividadMedia.executeUpdate(query)
        query = 'DELETE FROM Actividad where id = ' + Long.parseLong(params.id)
        update = Actividad.executeUpdate(query)
        redirect action:'index', params:params
    }

    @Secured('ROLE_ADMIN')
    def addMedia() {
        println '\n\nIn action addMedia controller actividad'
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
        }
    }

    @Secured('ROLE_ADMIN')
    def saveMedia(ActividadMedia actividadMedia) {
        println '\n\nIn action saveMedia controller actividad'
        if(actividadMedia.save()) {
            response.status = 200
            render(contentType: "application/json") {
                actividad(
                    id: actividadMedia.id,
                    tipo: actividadMedia.tipo, 
                    ubicacion: actividadMedia.ubicacion, 
                    'traduccionEspanol.pieMedia': actividadMedia.traduccionEspanol.pieMedia,
                    'traduccionIngles.pieMedia': actividadMedia.traduccionEspanol.pieMedia,
                    datosAutor: actividadMedia.datosAutor
                )
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def updateMedia() {
        println '\n\nIn action updateMedia controller actividad'
        def update = ActividadMedia.executeUpdate(
            'update ActividadMedia set ' +  
            'tipo=:tipo, ' + 
            'ubicacion=:ubicacion, ' + 
            'traduccionEspanol.pieMedia=:pieEspanol, ' + 
            'traduccionIngles.pieMedia=:pieIngles, ' + 
            'datosAutor=:datosAutor ' + 
            'where id=:id', 
            [tipo: params.tipo,
             ubicacion: params.ubicacion,
             pieEspanol: params['traduccionEspanol.pieMedia'],
             pieIngles: params['traduccionIngles.pieMedia'],
             datosAutor: params.datosAutor,
             id: Long.parseLong(params.id)])
        if(update > 0) {
            response.status = 200
            render(contentType: 'application/json') {
                actividad(id: params.id,
                    tipo: params.tipo, 
                    ubicacion: params.ubicacion, 
                    'traduccionEspanol.pieMedia': params['traduccionEspanol.pieMedia'],
                    'traduccionIngles.pieMedia': params['traduccionIngles.pieMedia'],
                    datosAutor: params.datosAutor)
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def deleteMedia() {
        println '\n\nIn action deleteMedia controller actividad'
        def update = ActividadMedia.executeUpdate('delete from ActividadMedia where id=:id', [id:Long.parseLong(params.id)])
        if(update > 0) {
            response.status = 200
        } else {
            response.status = 204
        }
    }

    @Secured('permitAll')
    def show(Actividad actividad) {
        println '\n\nIn action show controller actividad'
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
        println '\n\nIn action list controller actividad'
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT-5:00"));
        Date currentDate = calendar.getTime();
        Calendar cal = Calendar.getInstance();
        cal.setTime(currentDate);
        String month = cal.get(Calendar.MONTH).toString();
        println 'month value'
        println month

        def actividadesMap = []

        def actividades = Actividad.findAllByFechaInicioGreaterThanEquals(Date.parse("yyyy-MM-dd hh:mm:ss", "2018-"  + month + "-1 0:00:00"))

        actividades.each {
            actividadesMap.add([id:it.id, titulo: it.traduccionEspanol.titulo, fechaInicio: it.fechaInicio, fechaFinal: it.fechaFinal, lugar:it.lugar])
        }

        [actividades:actividadesMap]
    }
}
