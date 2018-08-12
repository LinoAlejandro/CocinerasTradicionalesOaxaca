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
        Crear nueva noticia
      </div>
      <g:form name="name" action="create">
        <div class="row justify-content-center pt-2">
          <div class="col-md-10">
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" name="noticia.titulo" value="${this.noticia?.titulo}" class="form-control">
            </div>
            <div class="form-group">
              <label for="tipo">Tipo</label>
              <select name="noticia.tipo" class="form-control">
                <option value="noticia">Noticia</option>
                <option value="boletin">Boletín</option>
              <select>
            </div>
            <div class="form-group">
              <label for="contenido">Contenido</label>
              <textarea type="text" name="traduccion.contenido" class="form-control">
                ${this.traduccion?.contenido}
              </textarea>
            </div>
            <div class="form-group">
              <label for="ubicacionImagen">Imagen de portada</label>
              <input type="text" name="noticia.ubicacionImagen" value="${this.noticia?.ubicacionImagen}" class="form-control">
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Crear Nuevo" class="btn btn-primary btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <asset:javascript src="froala/froala_editor.pkgd.min.js" />

    <script type="text/javascript">
        $(function() { $('textarea').froalaEditor() });
    </script>
    <g:if test="${this.noticia}">
      <div class="box box-danger">
        <g:eachError bean="${this.noticia}" var="error">
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
