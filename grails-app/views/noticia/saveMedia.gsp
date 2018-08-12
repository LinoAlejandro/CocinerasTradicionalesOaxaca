<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title></title>
  </head>
  <body>
    <div class="container pt-4">
      <div class="h2 mb-3 text-center">
        Crear nueva imagen o video
      </div>
      <g:form name="formcreate" action="saveMedia">
      <input type="hidden" name="noticiaObject" value="${this.params.noticiaObject}">
        <div class="row justify-content-center pt-2">
          <div class="col-md-10">
            <div class="form-group">
              <label for="tipo">Tipo</label>
              <select name="tipo" class="form-control">
                <option value="imagen">Imagen</option>
                <option value="video">Video</option>
              </select>
            </div>
            <div class="form-group">
              <label for="ubicacion">Link de ubicación</label>
              <input type="text" name="ubicacion" value="${this.media?.ubicacion}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="pieMedia">Pié de media</label>
              <input type="text" name="pieMedia" value="${this.media?.pieMedia}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="lenguaje">Lenguaje</label>
              <select name="lenguaje" class="form-control">
                <option value="Español">Español</option>
                <option value="English">English</option>
                <option value="Français">Français</option>
                <option value="Deutsch">Deutsch</option>
              </select>
            </div>
            <div class="form-group">
              <input type="submit" value="Crear Nuevo" class="btn btn-primary btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <g:if test="${this.media}">
      <div class="box box-danger">
        <g:eachError bean="${this.media}" var="error">
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

  </body>
</html>
