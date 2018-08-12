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
        Lista de actividades
      </div>
    </div>
    <div class="container">
      <div class="row">
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th>Título</th>
              <th>Fecha de publicación</th>
              <th>Fecha de inicio</th>
              <th>Fecha final</th>
              <th></th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <g:each var="item" in="${this.actividades}">
              <tr>
                <td>
                  ${item.titulo}
                </td>
                <td>
                  ${item.fechaPublicacion.format('yyyy-MM-dd')}
                </td>
                <td>
                  ${item.fechaInicio.format('yyyy-MM-dd')}
                </td>
                <td>
                  ${item.fechaFinal.format('yyyy-MM-dd')}
                </td>
                <td>
                  <g:link action="update" params="[id:item.id]">Modificar</g:link>
                </td>
                <td>
                  <g:link action="delete" params="[id:item.id]">Eliminar</g:link>
                </td>
                <td>
                  <g:link action="agregarTraduccion" params="[actividadObject:item.id, offset:params.offset]">Agregar Traducción</g:link>
                </td>
              </tr>
            </g:each>
          </tbody>
        </table>
      </div>
    </div>
    <div class="container">
      <g:link action="create" class="btn btn-outline-dark btn-md">Crear nueva actividad</g:link>
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
                    maxsteps="10" controller="actividad"
                    action="index" total="${actividadCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
