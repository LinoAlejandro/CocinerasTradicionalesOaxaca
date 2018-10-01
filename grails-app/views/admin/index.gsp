<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title>Administradores</title>
  </head>
  <body>
    <div class="container mb-5">
      <div class="row cabin">
        <div class="col-lg-12">
          <div class="display-4  mt-4">
            Administradores
          </div>
        </div>
        <div class="col-lg-12">
          <table class="table mt-4 mb-5 table-striped" data-aos="flip-up">
            <thead>
              <tr class="h3 lobster">
                <th scope="col">Nombre</th>
                <th scope="col">Apellido Paterno</th>
                <th scope="col">Apellido Materno</th>
                <th scope="col">Username</th>
                <th scope="col"></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <g:each var="admin" in="${this.admins}">
                <tr>
                  <td>
                    ${admin.nombre}
                  </td>
                  <td>
                    ${admin.apPaterno}
                  </td>
                  <td>
                    ${admin.apMaterno}
                  </td>
                  <td>
                    ${admin.username}
                  </td>
                  <td>
                    <g:link class="btn btn-danger" action="delete" id="${admin.id}" params="${params}">Eliminar</g:link>
                  </td>
                  <td>
                    <g:link class="btn btn-secondary" action="update" id="${admin.id}">Modificar</g:link>
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
        <div class="col-lg-12">
          <g:link action="create" class="btn bg-purple btn-md text-light cabin">Crear nuevo administrador</g:link>
        </div>
      </div>      
    </div>
  </body>
</html>
