package cocinerastradicionalesoaxaca

import com.cocinerasoaxaca.*
import java.text.SimpleDateFormat

class BootStrap {
    def init = { servletContext ->
        println '\n\nIn bootstrap process'

        def admin = new User(username:'admin', password:'admin').save(flush:true)
        println admin
        def roleAdmin = new Role(authority:'ROLE_ADMIN').save(flush:true)
        def roleCocinera = new Role(authority:'ROLE_COCINERA').save(flush:true)

        def adminUser = new Admin(nombre:'Lino', apPaterno:'Arango', apMaterno:'Cruz', username:'admin', user:admin).save(flush:true)
        println adminUser

        UserRole.create admin, roleAdmin 

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        Actividad.ActividadTraduccion actividad1Traduccion = new Actividad.ActividadTraduccion(
            titulo: 'Esta es la actividad 1',
            contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
            'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
            'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
        )

        def actividad1 = new Actividad(
            fechaPublicacion: new Date(),
            fechaInicio: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-02 12:25:45"),
            fechaFinal: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-03 09:25:45"),
            latitud: '17.066093',
            longitud: '-96.723414',
            lugar: 'Santo Domingo',
            traduccionEspanol: actividad1Traduccion
        ).save()

        def actividad2 = new Actividad(
            fechaPublicacion: new Date(),
            fechaInicio: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-05 13:25:45"),
            fechaFinal: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-06 14:25:45"),
            latitud: '17.066093',
            longitud: '-96.723414',
            lugar: 'Santo Domingo',
            traduccionEspanol:  new Actividad.ActividadTraduccion(
                titulo: 'Esta es la actividad 1',
                contenido:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
            )
        ).save()

        def actividad3 = new Actividad(
            fechaPublicacion: new Date(),
            fechaInicio: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-11 12:25:45"),
            fechaFinal: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-11 11:25:45"),
            latitud: '17.066093',
            longitud: '-96.723414',
            lugar: 'Santo Domingo',
            traduccionEspanol:  new Actividad.ActividadTraduccion(
                titulo: 'Esta es la actividad 1',
                contenido:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
            )
        ).save()

        def actividad4 = new Actividad(
            fechaPublicacion: new Date(),
            fechaInicio: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-21 18:00:00"),
            fechaFinal: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-22 11:00:00"),
            latitud: '17.066093',
            longitud: '-96.723414',
            lugar: 'Santo Domingo',
            traduccionEspanol:  new Actividad.ActividadTraduccion(
                titulo: 'Esta es la actividad 1',
                contenido:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
            )
        ).save()

        def actividad5 = new Actividad(
            fechaPublicacion: new Date(),
            fechaInicio: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-25 14:25:45"),
            fechaFinal: Date.parse("yyyy-MM-dd hh:mm:ss", "2018-08-26 17:23:45"),
            latitud: '17.066093',
            longitud: '-96.723414',
            lugar: 'Santo Domingo',
            traduccionEspanol:  new Actividad.ActividadTraduccion(
                titulo: 'Esta es la actividad 1',
                contenido:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
            )
        ).save()

        def noticia1 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia2 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia3 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia4 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
              traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia5 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 5',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia5Media1 = new NoticiaMedia(
            tipo: 'video',
            ubicacion: 'GOgQLeThJMA',
            noticia: noticia5,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def noticia5Media2 = new NoticiaMedia(
            tipo: 'video',
            ubicacion: 'oRRXPwcYud0',
            noticia: noticia5,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def noticia5Media3 = new NoticiaMedia(
            tipo: 'video',
            ubicacion: 'J5Lb_qIrMoM',
            noticia: noticia5,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def noticia5Media4 = new NoticiaMedia(
            tipo: 'imagen',
            ubicacion: 'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg',
            noticia: noticia5,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def noticia5Media5 = new NoticiaMedia(
            tipo: 'imagen',
            ubicacion: 'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg',
            noticia: noticia5,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def noticia5Media6 = new NoticiaMedia(
            tipo: 'imagen',
            ubicacion: 'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg',
            noticia: noticia5,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def noticia6 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia7 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia8 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia9 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def noticia10 = new Noticia(
            fechaPublicacion:new Date(),
            tipo:'Noticia',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es la noticia 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def articulo1 = new Noticia(
          fechaPublicacion: new Date(),
          tipo:'Artículo',
          ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
          traduccionEspanol: new Noticia.NoticiaTraduccion(
              titulo: 'Esta es el artículo 1',
              contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
              'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
              'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
              )
        ).save()

        def articulo2 = new Noticia(
            fechaPublicacion: new Date(),
            tipo:'Artículo',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es el artículo 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def articulo3 = new Noticia(
            fechaPublicacion: new Date(),
            tipo:'Artículo',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es el artículo 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def articulo4 = new Noticia(
            fechaPublicacion: new Date(),
            tipo:'Artículo',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es el artículo 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def articulo5 = new Noticia(
            fechaPublicacion: new Date(),
            tipo:'Artículo',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es el artículo 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def articulo6 = new Noticia(
            fechaPublicacion: new Date(),
            tipo:'Artículo',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es el artículo 6',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def articulo10Media1 = new NoticiaMedia(
            tipo: 'video',
            ubicacion: 'GOgQLeThJMA',
            noticia: articulo6,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def articulo10Media2 = new NoticiaMedia(
            tipo: 'video',
            ubicacion: 'oRRXPwcYud0',
            noticia: articulo6,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def articulo10Media3 = new NoticiaMedia(
            tipo: 'video',
            ubicacion: 'J5Lb_qIrMoM',
            noticia: articulo6,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def articulo10Media4 = new NoticiaMedia(
            tipo: 'imagen',
            ubicacion: 'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg',
            noticia: articulo6,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def articulo10Media5 = new NoticiaMedia(
            tipo: 'imagen',
            ubicacion: 'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg',
            noticia: articulo6,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def articulo10Media6 = new NoticiaMedia(
            tipo: 'imagen',
            ubicacion: 'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg',
            noticia: articulo6,
            traduccionEspanol: new NoticiaMedia.TraduccionMedia(pieMedia: 'Pie de imagen 3')
        ).save()

        def articulo7 = new Noticia(
            fechaPublicacion: new Date(),
            tipo:'Artículo',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es el artículo 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def articulo8 = new Noticia(
            fechaPublicacion: new Date(),
            tipo:'Artículo',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es el artículo 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        def articulo9 = new Noticia(
            fechaPublicacion: new Date(),
            tipo:'Artículo',
            ubicacionImagen:'https://s3-sa-east-1.amazonaws.com/assets.abc.com.py/2012/03/21/la-noticia-236438_595_366_1.jpg',
            traduccionEspanol: new Noticia.NoticiaTraduccion(
                titulo: 'Esta es el artículo 1',
                contenido: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultricies tellus eget leo vulputate, ut blandit nisi vestibulum. Suspendisse potenti. Nulla facilisi. Etiam ornare interdum turpis, vitae dictum massa dictum non. Nullam luctus laoreet odio, vitae ornare risus. Cras bibendum, sem gravida laoreet aliquet, erat quam consequat nunc, in ullamcorper velit dui non velit. Mauris eu ipsum suscipit, ullamcorper enim vel, lobortis purus. Morbi mauris dui, vehicula quis condimentum eget, rhoncus nec urna. Donec erat sapien, fringilla rhoncus magna in, rhoncus volutpat magna. Aliquam sem ex, maximus sit amet convallis sed, aliquam id odio. Vivamus ut semper augue. Duis eget scelerisque ligula. Suspendisse efficitur consequat tempus. Sed ullamcorper mi hendrerit metus fermentum luctus. Mauris quis bibendum augue.' +
                'Fusce ullamcorper sem at nisi euismod, at pretium quam condimentum. Fusce rutrum eros sit amet diam venenatis gravida. Morbi ac dictum dolor, sed gravida tortor. Fusce nec sapien justo. Vestibulum in porttitor ligula. Aenean id lacus mattis, sagittis massa vel, consectetur mi. Aliquam porta nisi porttitor leo facilisis condimentum. Phasellus porttitor ante eget magna pharetra, in lobortis neque hendrerit. Ut tristique, nibh quis vestibulum dictum, neque magna laoreet est, at rhoncus lorem sem quis velit. Nulla laoreet pretium urna. Sed ultricies sem ut sodales varius. Curabitur non tristique felis. Duis sodales arcu mauris, eget volutpat diam tempus vitae. In sed erat vestibulum dolor feugiat laoreet quis et mauris.' +
                'Etiam ac vestibulum neque. Vestibulum nec mollis tellus. Nam in ultrices mi. Mauris gravida venenatis dui id dignissim. Nulla non enim non mi vestibulum faucibus vel condimentum ex. Aliquam maximus at enim non egestas. Etiam venenatis nulla nulla, vel malesuada metus sagittis sed. Cras molestie magna nibh, sit amet ullamcorper tortor luctus quis. Morbi pretium pulvinar nunc nec feugiat. Aliquam ac augue finibus, pretium odio in, ornare erat. Ut at felis orci. Integer lacus tellus, congue ut   mauris quis, iaculis mollis augue.'
                )
        ).save()

        String fecha2017 = '05-05-2017'
        SimpleDateFormat simpleDateFormat2017 = new SimpleDateFormat('dd-MM-yyyy')
        Date date2017 = simpleDateFormat2017.parse(fecha2017)
        println date2017

        String fecha2018 = '05-05-2018'
        SimpleDateFormat simpleDateFormat2018 = new SimpleDateFormat('dd-MM-yyyy')
        Date date2018 = simpleDateFormat2017.parse(fecha2018)
        println date2018

        String fecha20182 = '05-12-2018'
        SimpleDateFormat simpleDateFormat20182 = new SimpleDateFormat('dd-MM-yyyy')
        Date date20182 = simpleDateFormat2018.parse(fecha20182)
        println date20182

        String fecha2019 = '05-05-2019'
        SimpleDateFormat simpleDateFormat2019 = new SimpleDateFormat('dd-MM-yyyy')
        Date date2019 = simpleDateFormat2019.parse(fecha2019)
        println date2019

        def cocinerasConcurso1 = new CocinerasConcurso(
            numeroConvocatoria: 1,
            anioConvocatoria: "2017",
            fechaInicio: date2017,
            fechaFinal: date2017,
            lugar: "Santo Domingo",
            latitud: "17.065673",
            longitud: " -96.723208",
            ubicacionArchivo: "/home/limbo/Documentos/Programming/Grails/CocinerasTradicionalesOaxaca/src/main/webapp/convocatoria/1-2017.pdf",
            concursos: [new Concurso(descripcion:"Platillo tradicional")]
        ).save()

        def cocinerasConcurso2 = new CocinerasConcurso(
            numeroConvocatoria: 2,
            anioConvocatoria: "2018",
            fechaInicio: date2018,
            fechaFinal: date2018,
            lugar: "Santo Domingo",
            latitud: "17.065673",
            longitud: " -96.723208",
            ubicacionArchivo: "/home/limbo/Documentos/Programming/Grails/CocinerasTradicionalesOaxaca/src/main/webapp/convocatoria/2-2018.pdf",
            concursos: [new Concurso(descripcion:"Platillo tradicional")]
        ).save()

        def cocinerasConcurso3 = new CocinerasConcurso(
            numeroConvocatoria: 3,
            anioConvocatoria: "2018",
            fechaInicio: date20182,
            fechaFinal: date20182,
            lugar: "Santo Domingo",
            latitud: "17.065673",
            longitud: " -96.723208",
            ubicacionArchivo: "/home/limbo/Documentos/Programming/Grails/CocinerasTradicionalesOaxaca/src/main/webapp/convocatoria/3-2018.pdf",
            concursos: [new Concurso(descripcion:"Platillo tradicional")]
        ).save()

        def cocinerasConcurso4 = new CocinerasConcurso(
            numeroConvocatoria: 4,
            anioConvocatoria: "2019",
            fechaInicio: date2019,
            fechaFinal: date2019,
            lugar: "Santo Domingo",
            latitud: "17.065673",
            longitud: " -96.723208",
            ubicacionArchivo: "/home/limbo/Documentos/Programming/Grails/CocinerasTradicionalesOaxaca/src/main/webapp/convocatoria/4-2019.pdf",
            concursos: [new Concurso(descripcion:"Platillo tradicional")]
        ).save()

        println cocinerasConcurso1
        println cocinerasConcurso2
        println cocinerasConcurso3
        println cocinerasConcurso4
    }

    def destroy = {
    }
}
