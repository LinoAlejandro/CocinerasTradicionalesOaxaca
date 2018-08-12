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
      Lista de Cocineras
      </div>
    </div>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-12">
          <table class="table" id="table_cocineras">
            <thead class="thead-dark">
              <tr>
                <th>Nombre</th>
                <th>Etnia</th>
                <th>Agencia</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <g:each var="item" in="${this.cocineras}">
                <tr>
                  <td>
                    ${item.nombre}
                  </td>
                  <td >
                    ${item.etnia}
                  </td>
                  <td>
                    ${item.agencia}
                  </td>
                  <td>
                    <g:link action="update" params="[id:item.id]">Modificar</g:link>
                  </td>
                  <td>
                    <g:link action="delete" params="[id:item.id]">Eliminar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="container">
      <g:link action="create" class="btn btn-outline-dark btn-md">Crear nueva cocinera</g:link>
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
    <asset:javascript src="/custom/cocinera/index.js" />
  </body>
</html>
