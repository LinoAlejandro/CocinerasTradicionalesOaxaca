<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title>Convocatorias</title>
  </head>
  <body>
    <div class="container mb-5">
      <div class="row cabin">
        <div class="col-lg-12">
          <div class="display-4 mt-4">
            Convocatorias
          </div>
        </div>
        <div class="col-md-12"> 
          <table class="table mt-4 mb-5 table-striped" data-aos="flip-up">
            <thead>
              <tr class="h3 lobster">
                <th scope="col">Número</th>
                <th scope="col">Año</th>
                <th scope="col">Fecha de inicio</th>
                <th scope="col"></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <g:each var="convocatoria" in="${convocatorias}">
                <tr id="${convocatoria.id}">
                  <td class="align-middle">
                    ${convocatoria.numeroConvocatoria}
                  </td>
                  <td class="align-middle">
                    ${convocatoria.anioConvocatoria}
                  </td>
                  <td class="align-middle">
                    ${convocatoria.fechaInicio}
                  </td>
                  <td>
                    <g:link class="btn btn-danger" action="delete" id="${convocatoria.id}" params="${params}">Eliminar</g:link>
                  </td>
                  <td>
                    <g:link class="btn btn-secondary" action="update" id="${convocatoria.id}">Modificar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
        <div class="col-md-12">
          <div class="row justify-content-center">
            <div class="col-md-4 h2 lobster">
              Contraseña de registro
            </div>
            <div class="col-md-6">
              <input type="pass" class="form-control" id="pass" name="pass" />
            </div>
            <div class="col-md-2 cabin">
              <button type="button" class="btn bg-blue text-light" onclick="changePassword()">Cambiar</button>
            </div>
            <div class="col-md-12" id="hidden">
              
            </div>
          </div>
        </div>
        <div class="col-md-12 mt-5">
          <g:link action="create" class="btn bg-purple btn-md text-light cabin">Crear nueva convocatoria</g:link>
        </div>
      </div>
    </div>
    <div class="container mb-4 mt-2">
      <div class="row justify-content-center">
        <div class="col text-center paginate">
          <g:paginate next="Siguiente" prev="Previo"
                    maxsteps="10" controller="cocinerasConcurso"
                    action="index" total="${convocatoriasCount}" class="mx-auto"/>
        </div>
      </div>
    </div>

    <script type="text/javascript">
        var pass = document.getElementById('pass')
        var hidden = document.getElementById('hidden')

        function changePassword() {
            var url = "${createLink(action:'changePassword')}"
            var data = {
                pass: pass.value
            }           
            console.log(url)
            console.log(data)
            $.post(url, data, function(data, status) {
                console.log(data, status)

                var alert = document.createElement('alert')
                alert.classList.add('alert')
                alert.classList.add('d-block')
                alert.classList.add('mt-4')

                hidden.innerHTML = ''

                if(status == 'success') { 
                    alert.classList.add('alert-success')
                    alert.innerHTML = 'Contraseña modificada'
                    console.log('ok')
                } else {
                    alert.classList.add('alert-danger')
                    alert.innerHTML = 'Algo ha sucedido y no fue posible modificar la contraseña'
                    console.log('not ok')
                }

                hidden.appendChild(alert)

            })
        }
    </script>
  </body>
</html>
