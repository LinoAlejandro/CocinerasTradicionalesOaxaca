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
    <g:if test="${flash.message}">
      <div class="alert alert-danger">
        ${flash.message}
      </div>
    </g:if>
    <div class="container pt-4">
      <div class="h2 mb-3 text-center">
        Crear nuevo platillo
      </div>
      <g:form name="formcreate" action="saveMedia">
        <input type="hidden" name="cocineraObject" value="${this.params.cocineraObject}" />
        <div class="row justify-content-center pt-2">
          <div class="col-md-10">
            <div class="form-group">
              <label for="nombrePlatillo">Nombre Platillo</label>
              <input type="text" name="nombrePlatillo" class="form-control" value="${this.media?.nombrePlatillo}">
            </div>
            <div class="form-group">
              <label for="ubicacionmedia">Link de imagen</label>
              <input type="text" name="ubicacionmedia" value="${this.media?.ubicacionmedia}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="ingredientes">Ingredientes</label>
              <textarea name="ingredientes" class="form-control" />
                ${this.media?.ingredientes}
              </textarea>
            </div>
            <div class="form-group">
              <label for="tipoPlatillo">Tipo de platillo</label>
              <select name="tipoPlatillo" class="form-control">
                <option value="cotidiano">Cotidiano</option>
                <option value="ceremonial">Ceremonial</option>
              </select>
            </div>
            <div class="form-group">
              <label for="premio">Premio</label>
              <input type="text" name="premio" value="${this.media?.premio}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="convocatoria">Número de convocatoria</label>
              <input type="text" name="convocatoria" value="${this.media?.convocatoria}" class="form-control" />
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

    <asset:javascript src="froala/froala_editor.pkgd.min.js" />

    <script type="text/javascript">
        $(function() { $('textarea').froalaEditor() });
    </script>
  </body>
</html>
