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
        Lista de administradores
      </div>
    </div>
    <div class="container">
      <div class="row justify-content-center">
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th>Nombre</th>
              <th>Apellido Paterno</th>
              <th>Apellido Materno</th>
              <th>Username</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <g:each var="item" in="${this.admins}">
              <tr>
                <td>
                  ${item.nombre}
                </td>
                <td>
                  ${item.apPaterno}
                </td>
                <td>
                  ${item.apMaterno}
                </td>
                <td>
                  ${item.username}
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
    <div class="container">
      <g:link action="create" class="btn btn-outline-dark btn-md">Crear nuevo administrador</g:link>
    </div>
  </body>
</html>
