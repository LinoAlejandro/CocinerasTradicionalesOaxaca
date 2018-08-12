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
        Modificar Noticia
      </div>
      <g:form name="name" action="update">
        <input type="hidden" name="id" value="${this.noticia?.id}">
        <input type="hidden" name="fechaPublicacion" value="${this.noticia?.fechaPublicacion}">
        <div class="row justify-content-center pt-2">
          <div class="col-md-10">
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" name="titulo" value="${this.noticia?.titulo}" class="form-control">
            </div>
            <div class="form-group">
              <label for="tipo">Tipo</label>
              <select name="tipo" class="form-control">
                <option value="noticia">Noticia</option>
                <option value="boletin">Boletín</option>
              <select>
            </div>
            <div class="form-group">
              <label for="ubicacionImagen">Imagen de portada</label>
              <input type="text" name="ubicacionImagen" value="${this.noticia?.ubicacionImagen}" class="form-control">
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
                      <th>Ubicación</th>
                      <th>Pie Página</th>
                      <th></th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <g:each var="item" in="${this.noticia.media}">
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
                <g:link action="saveMedia" class="btn btn-primary btn-md" params="[noticiaObject:this.noticia?.id]"> Agregar nueva media </g:link>
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
                      <th>Título</th>
                      <th>Lenguaje</th>
                      <th></th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <g:each var="item" in="${this.noticia.traducciones}">
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
                <g:link action="agregarTraduccion" class="btn btn-primary btn-md" params="[noticiaObject:this.noticia?.id]"> Agregar nueva traducción </g:link>
              </div>
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Modificar" class="btn btn-primary btn-md">
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
