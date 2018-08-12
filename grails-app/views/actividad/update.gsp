<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title></title>
    <asset:stylesheet href="froala/froala_editor.pkgd.min.css" />
    <asset:stylesheet href="froala/froala_style.min.css" />
  </head>
  <body>
    <div class="container pt-4">
      <div class="h2 mb-3 text-center">
        Modificar Actividad
      </div>
      <g:form name="formcreate" action="update">
        <input type="hidden" name="id" value="${this.actividad?.id}">
        <input type="hidden" name="fechaPublicacion" value="${this.actividad?.fechaPublicacion}">
        <div class="row justify-content-center pt-2">
          <div class="col-md-10">
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" name="titulo" value="${this.actividad?.titulo}" class="form-control">
            </div>
            <div class="form-group">
              <label for="fechaInicio">Fecha de inicio</label>
              <input type="date" id="fechaInicioPublicado" value="${this.actividad?.fechaInicio?.format('yyyy-MM-dd')}" class="form-control" />
              <input type="hidden" id="fechaInicio"name="fechaInicio" value="${this.actividad?.fechaInicio}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="fechaFinal">Fecha final</label>
              <input type="date" id="fechaFinalPublicado" value="${this.actividad?.fechaFinal?.format('yyyy-MM-dd')}" class="form-control" />
              <input type="hidden" id="fechaFinal" name="fechaFinal" value="${this.actividad?.fechaFinal}" class="for m-control" />
            </div>
            <div class="form-group">
              <label for="horaInicio">Hora de inicio</label>
              <input type="time" value="${this.actividad?.horaInicio}" name="horaInicio" class="form-control" />
            </div>
            <div class="form-group">
              <label for="horaFinal">Hora de finalización</label>
              <input type="time" value="${this.actividad?.horaFinal}" name="horaFinal" class="form-control" />
            </div>
            <div class="">
              <div class="h4">
                Datos de la ubicación
              </div>
              <div class="form-group">
                <label for="lugar">Lugar</label>
                <input type="text" name="lugar" value="${this.actividad?.lugar}" class="form-control">
              </div>
              <div class="form-group">
                <label for="latitud">Latitud</label>
                <input id="fechaNacimiento" type="number" step="any" name="latitud" value="${this.actividad?.latitud}" class="form-control">
              </div>
              <div class="form-group">
                <label for="longitud">Longitud</label>
                <input type="number" name="longitud" step="any" value="${this.actividad?.longitud}" class="form-control">
              </div>
            </div>
            <div class="container">
              <div class="h4">
                Imagenes y videos
              </div>
              <div class="">
                <table class="table">
                  <thead class="thead-dark">
                    <tr>
                      <th>Tipo</th>
                      <th>Ubicación de la media</th>
                      <th>Pié de Media</th>
                      <th></th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <g:each var="item" in="${this.actividad.media}">
                      <tr>
                        <td>
                          ${item.tipo}
                        </td>
                        <td>
                          ${item.ubicacion}
                        </td>
                        <td>
                          ${item.pieMedia}
                        </td>
                        <td>
                          <g:link action="updateMedia" params="[id:item.id]">Modificar</g:link>
                        </td>
                        <td>
                          <g:link action="deleteMedia" params="[id:item.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
              <div class="mb-4">
                <g:link action="saveMedia" class="btn btn-primary btn-md" params="[actividadObject:this.actividad?.id]"> Agregar nueva media </g:link>
              </div>
            </div>

            <div class="container">
              <div class="h4">
                Lista de traducciones
              </div>
              <div class="">
                <table class="table">
                  <thead class="thead-dark">
                    <tr>
                      <th>Titulo</th>
                      <th>Lenguaje</th>
                      <th></th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <g:each var="item" in="${this.actividad.traducciones}">
                      <tr>
                        <td>
                          ${item.titulo}
                        </td>
                        <td>
                          ${item.lenguaje}
                        </td>
                        <td>
                          <g:link action="updateTraduccion" params="[id:item.id]">Modificar</g:link>
                        </td>
                        <td>
                          <g:link action="deleteTraduccion" params="[id:item.id]">Eliminar</g:link>
                        </td>
                      </tr>
                    </g:each>
                  </tbody>
                </table>
              </div>
              <div class="mb-4">
                <g:link action="agregarTraduccion" class="btn btn-primary btn-md" params="[actividadObject:this.actividad?.id]"> Agregar nueva traducción </g:link>
              </div>
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Modificar" class="btn btn-primary btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <g:if test="${this.actividad}">
      <div class="box box-danger">
        <g:eachError bean="${this.actividad}" var="error">
          <li class="d-block mx-auto text-center">
            <g:if test="${error in org.springframework.validation.FieldError}">
              "${error.field}"
            </g:if><g:message error="${error}"/>
          </li>
          <script type="text/javascript">
  		      var field = document.getElementById('${error.getField()}')
  		      field.classList.add('border-danger')
		    </script>
        </g:eachError>
      </div>
    </g:if>
    <asset:javascript src="custom/cocinera/create.js"/>
    <script type="text/javascript">
      var form = document.getElementById("formcreate")
      form.addEventListener("submit", function() {
          var fechaInicioPublicado = document.getElementById("fechaInicioPublicado")
          var fechaInicio = document.getElementById("fechaInicio")
          fechaInicio.value = fechaInicioPublicado.value + " 00:00:00.000"

          var fechaFinalPublicado = document.getElementById("fechaFinalPublicado")
          var fechaFinal = document.getElementById("fechaFinal")
          fechaFinal.value = fechaFinalPublicado.value + " 00:00:00.000"
      })
    </script>
    <asset:javascript src="froala/froala_editor.pkgd.min.js" />
    <script type="text/javascript">
        $(function() { $('textarea').froalaEditor() });
    </script>

  </body>
</html>
