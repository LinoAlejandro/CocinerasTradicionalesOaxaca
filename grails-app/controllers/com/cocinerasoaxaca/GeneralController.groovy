package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured
import java.util.Calendar
import java.util.TimeZone
import grails.converters.JSON

@Secured('permitAll')
class GeneralController {
    def springSecurityService

    @Secured('permitAll')
    def index() {
        if(springSecurityService.currentUser) {
            redirect action:'indexAdmin'
            return
        }

        if(params.language) {
            session.language = params.language
        }
/*
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT-5:00"));
        Date currentDate = calendar.getTime();
        Calendar cal = Calendar.getInstance();
        cal.setTime(currentDate);
        String month = cal.get(Calendar.MONTH).toString();
        println 'month value'
        println month
        println '\n\n\n'

        def actividadesMap = []
        def noticiasMap = []

        def actividades = Actividad.findAllByFechaInicioGreaterThanEquals(Date.parse("yyyy-MM-dd hh:mm:ss", "2018-"  + month + "-1 0:00:00"))
        def noticias = Noticia.findAllByTipo('Noticia',[max:10])

        def cocineras = Cocinera.findAll([max:10])
        println '\n\nChecking noticias content\n\n'
        noticias.each {
          def translate = NoticiaTraduccion.findByNoticiaAndLenguaje(it, session.language ? session.language : 'Español')
          Calendar year = Calendar.getInstance()
          year.setTime(it.fechaPublicacion)
          noticiasMap.add([id:it.id, titulo:translate.titulo, contenido:translate.contenido, fechaPublicacion:it.fechaPublicacion, anio:year.get(Calendar.YEAR), mes:year.get(Calendar.MONTH), dia:year.get(Calendar.DAY_OF_MONTH), ubicacionImagen:it.ubicacionImagen])
          println it.id
          println translate.titulo
          println translate.contenido
          println it.fechaPublicacion
          println '\n\n'
        }
*/
        def actividadesMap = []
        def noticiasMap = []
        def cocineras = []
        [actividades:actividadesMap, noticias:noticiasMap, cocineras:cocineras]
    }

    @Secured('permitAll')
    def englishIndex() {

    }

    @Secured('permitAll')
    def franceIndex() {

    }

    @Secured('permitAll')
    def germanIndex() {

    }

    def cleanData() {

    }


    @Secured('ROLE_ADMIN')
    def indexAdmin() { }
}
