<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title>Actividades</title>
  </head> 
  <body>
    <div class="container mb-5">
      <div class="row cabin">
        <div class="col-lg-12">
          <div class="display-4 mt-4">
            Actividades
          </div>
        </div>
        <div class="col-md-12"> 
          <table class="table mt-4 mb-5 table-striped" data-aos="flip-up">
            <thead>
              <tr class="h3 lobster">
                <th scope="col">Título</th>
                <th scope="col">Fecha de publicación</th>
                <th scope="col">Fecha de inicio</th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody class="cabin">
              <g:each var="actividad" in="${actividades}">
                <tr id="${actividad.id}">
                  <td class="align-middle">
                    ${actividad.traduccionEspanol.titulo}
                  </td>
                  <td class="align-middle">
                    ${actividad.fechaPublicacion}
                  </td>
                  <td class="align-middle">
                    ${actividad.fechaInicio}
                  </td>
                  <td class="align-middle">
                    ${actividad.traduccionIngles?.titulo ? 
                    raw('<div class="text-success">Cuenta con traducción</div>') : 
                    raw('<div class="text-danger">Falta por traducir</div>')}
                  </td>
                  <td>
                    <g:link class="btn btn-danger" action="delete" id="${actividad.id}" params="${params}">Eliminar</g:link>
                  </td>
                  <td>
                    <g:link class="btn btn-secondary" action="update" id="${actividad.id}" params="${params}">Modificar</g:link>
                  </td>
                  <td> 
                    <button class="btn bg-blue text-light" onclick="clicked(this)" data-toggle="modal" data-target="#exampleModal">
                      Agregar media
                    </button>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>   
        <div class="col-md-12">
          <g:link action="create" class="btn bg-purple text-light cabin btn-md">Crear nueva actividad</g:link>
        </div>
      </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-title" >
              <div class="d-flex justify-content-between">
                <div class="h1 lobster"  id="agregarMediaModialLabel">
                  Agregue media a su noticia
                  <i class="far fa-images text-purple"></i>
                </div>
                <div>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">
                      &times;
                    </span>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-body">
            <input type="hidden" name="id" id="idActividad">
            <div id="hidden"></div>
            <div class="row cabin">
              <div class="form-group col-md-6">
                <label for="">Pie de media [Español] </label>
                <input type="text" class="form-control" name="traduccionEspanol.pieMedia" id="pieMediaEspanol"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Pie de media [Inglés] </label>
                <input type="text" class="form-control" name="traduccionIngles.pieMedia" id="pieMediaIngles"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Ubicación</label>
                <input type="text" class="form-control" name="ubicación" id="ubicacion"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Tipo</label>
                <select name="tipo" id="tipo" class="form-control">
                  <option value="imagen">Imágen</option>
                  <option value="video">Video</option>
                </select>
              </div>
              <div class="form-group col-md-6">
                <label for="">Autor</label>
                <input type="text" class="form-control" name="datosAutor" id="datosAutor"/>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="addMedia()">Crear</button>
          </div>
        </div>
      </div>
    </div>
    <div class="container mb-4 mt-2">
      <div class="row justify-content-center">
        <div class="col text-center paginate">
          <g:paginate next="Siguiente" prev="Previo"
                    maxsteps="10" controller="actividad"
                    action="index" total="${actividadCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      var idActividad = document.getElementById('idActividad')
      function clicked(el) {
          idActividad.value = el.parentNode.parentNode.id
      }

      function addMedia() {

          var pieMediaEspanol = document.getElementById('pieMediaEspanol')
          var pieMediaIngles = document.getElementById('pieMediaIngles')
          var ubicacion = document.getElementById('ubicacion')
          var tipo = document.getElementById('tipo')
          var datosAutor = document.getElementById('datosAutor')

          var url = "${createLink(action:'saveMedia')}"
          var data = {
              actividad: idActividad.value,
              'traduccionEspanol.pieMedia': pieMediaEspanol.value,
              'traduccionIngles.pieMedia': pieMediaIngles.value,
              ubicacion: ubicacion.value,
              tipo: tipo.value,
              datosAutor: datosAutor.value
          }
          console.log(data)

          $.post(url, data, function(data, status ){
              var hidden = document.getElementById('hidden')
              hidden.innerHTML = ''
              var div = document.createElement('div')
              div.classList.add('mb-4')

              if(status == 'success') { 
                  div.innerHTML = 'El elemento de media ha sido exitosamente almacenado'
                  div.classList.add('alert-success')
              } else {
                  div.innerHTML = 'Existe un error en los datos de entrada, para mas información consulte su manual de usuario'
                  div.classList.add('alert-danger')
              }
              hidden.appendChild(div)
          })
      }
    </script>
  </body>
</html>
