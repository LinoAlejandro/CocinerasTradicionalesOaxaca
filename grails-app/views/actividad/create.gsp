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
        Crear nueva Actividad
      </div>
      <g:form name="formcreate" action="create">
        <div class="row justify-content-center pt-2">
          <div class="col-md-10">
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" name="actividad.titulo" value="${this.actividad?.titulo}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="fechaInicio">Fecha de inicio</label>
              <input type="date" id="fechaInicioPublicado" value="${this.actividad?.fechaInicio?.format('yyyy-MM-dd')}" class="form-control" />
              <input type="hidden" id="fechaInicio" name="actividad.fechaInicio" class="" />
            </div>
            <div class="form-group">
              <label for="fechaFinal">Fecha final</label>
              <input type="date" id="fechaFinalPublicado" value="${this.actividad?.fechaFinal?.format('yyyy-MM-dd')}" class="form-control" />
              <input type="hidden" id="fechaFinal" name="actividad.fechaFinal" class="" />
            </div>
            <div class="form-group">
              <label for="horaInicio">Hora de inicio</label>
              <input type="time" id="horaInicio" value="${this.actividad?.horaInicio}" name="actividad.horaInicio" class="form-control" />
            </div>
            <div class="form-group">
              <label for="horaFinal">Hora de finalización</label>
              <input type="time" value="${this.actividad?.horaFinal}" name="actividad.horaFinal" class="form-control" />
            </div>
            <div class="">
              <div class="h4">
                Datos de la ubicación
              </div>
              <div class="form-group">
                <label for="lugar">Lugar</label>
                <input type="text" name="actividad.lugar" value="${this.actividad?.lugar}" class="form-control">
              </div>
              <div class="form-group">
                <label for="latitud">Latitud</label>
                <input id="fechaNacimiento" type="number" step="any" name="actividad.latitud" value="${this.actividad?.latitud}" class="form-control">
              </div>
              <div class="form-group">
                <label for="longitud">Longitud</label>
                <input type="number" name="actividad.longitud" step="any" value="${this.actividad?.longitud}" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label for="contenido">Descripción</label>
              <textarea type="text" name="traduccion.contenido" class="form-control">
                ${this.traduccion?.contenido}
              </textarea>
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Crear Nuevo" class="btn btn-primary btn-md">
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
    <script type="text/javascript">
      var form = document.getElementById("formcreate")
      form.addEventListener("submit", function() {
          var fechaInicioPublicado = document.getElementById("fechaInicioPublicado")
          var fechaInicio = document.getElementById("fechaInicio")
          var horaInicio = document.getElementById("horaInicio")

          fechaInicio.value = fechaInicioPublicado.value + " " + horaInicio.value + ":00.000"

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
