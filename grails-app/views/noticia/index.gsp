<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title></title>
  </head>
  <body>
    <div class="container mt-3">
      <div class="mb-3 h2">
        Lista de noticias
      </div>
    </div>
    <div class="container">
      <div class="row justify-content-center">
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th>Título</th>
              <th>Fecha de publicación</th>
              <th>Tipo</th>
              <th></th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <g:set var="cont" value="${0}" />
            <g:each var="item" in="${this.noticias}">
              <tr id="id${cont}">
                <td>
                  ${item.titulo}
                </td>
                <td>
                  ${item.fechaPublicacion.format('yyyy-MM-dd')}
                </td>
                <td>
                  ${item.tipo}
                </td>
                <td>
                  <g:link action="update" params="[id:item.id]">Modificar</g:link>
                </td>
                <td>
                  <button type="button" name="button" class="btn btn-outline-primary btn-sm" onclick="myFunction(${item.id}, id${cont})">Eliminar</button>
                </td>
                <td>
                  <g:link action="agregarTraduccion" params="[noticiaObject:item.id, offset:params.offset]">Agregar Traducción</g:link>
                </td>
              </tr>
              <g:set var="cont" value="${cont+1}" />
            </g:each>
            <script>
                function myFunction(idValue, idTag) {
                    $.post("${createLink(controller:'noticia', action: 'delete')}",
                    { id:idValue },
                    function(data, status){
                        if(status=='success') {
                            idTag.parentNode.removeChild(idTag)
                        }
                    });
                };
            </script>
          </tbody>
        </table>
      </div>
    </div>
    <div class="container">
      <g:link action="create" class="btn btn-outline-dark btn-md">Crear nueva noticia</g:link>
    </div>
    <style media="screen">
      .paginate a {
        color: black;
        padding-left: 5px;
        padding-right: 5px;
      }
    </style>
    <div class="container mb-4 mt-2">
      <div class="row justify-content-center">
        <div class="col text-center paginate">
          <g:paginate next="Siguiente" prev="Previo"
                    maxsteps="10" controller="noticia"
                    action="index" total="${noticiaCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
