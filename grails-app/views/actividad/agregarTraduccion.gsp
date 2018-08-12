<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title>Agregar Traducción</title>
    <asset:stylesheet href="froala/froala_editor.pkgd.min.css" />
    <asset:stylesheet href="froala/froala_style.min.css" />
  </head>
  <body>
    <div class="container pt-4">
      <div class="h2 mb-3 text-center">
        Agregar traducción
      </div>
      <g:form name="formcreate" action="agregarTraduccion">
      <input type="hidden" name="actividadObject" value="${this.params.actividadObject}">
        <div class="row justify-content-center pt-2">
          <div class="col-md-10">
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" name="titulo" value="${this.traduccion?.titulo}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="contenido">Descripción</label>
              <textarea type="text" name="contenido" class="form-control">
                ${this.traduccion?.contenido}
              </textarea>
            </div>
            <div class="form-group">
              <label for="tipo">Lenguaje</label>
              <select name="lenguaje" class="form-control">
                <option value="English">English</option>
                <option value="Français">Français</option>
                <option value="Deutsch">Deutsch</option>
              </select>
            </div>
            <div class="form-group">
              <input type="submit" class="btn btn-outline-dark" value="Agregar Traducción" />
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <g:if test="${this.traduccion}">
      <div class="box box-danger">
        <g:eachError bean="${this.traduccion}" var="error">
          <li class="d-block mx-auto text-center">
            <g:if test="${error in org.springframework.validation.FieldError}">
              "${error.field}"
            </g:if><g:message error="${error}"/>
          </li>
        </g:eachError>
      </div>
    </g:if>

    <asset:javascript src="froala/froala_editor.pkgd.min.js" />

    <script type="text/javascript">
        $(function() { $('textarea').froalaEditor() });
    </script>
  </body>
</html>
