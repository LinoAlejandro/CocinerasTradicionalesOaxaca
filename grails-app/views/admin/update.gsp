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
        Modificar administrador
      </div>
      <g:form name="name" action="update">
        <div class="row justify-content-center pt-2">
          <input type="hidden" name="id" value="${this.admin?.id}" />
          <div class="col-md-6">
            <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" name="nombre" value="${this.admin?.nombre}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="apPaterno">Apellido Paterno</label>
              <input type="text" name="apPaterno" value="${this.admin?.apPaterno}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="apMaterno">Apellido Materno</label>
              <input type="text" name="apMaterno" value="${this.admin?.apMaterno}" class="form-control" />
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="username">Nombre de usuario</label>
              <input type="disabled" name="username" value="${this.admin?.username}" class="form-control">
            </div>
            <div class="form-group">
              <label for="password">Contraseña</label>
              <input type="password" id="password" name="password" value="${this.admin?.password}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="passwordVerification">Verificar contraseña</label>
              <input type="password" name="passwordVerification" value="${this.admin?.passwordVerification}" class="form-control" />
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Modificar" class="btn btn-primary btn-md" />
            </div>
          </div>
        </div>
      </g:form>
    </div>

    <g:if test="${this.admin}">
        <div class="container">
            <g:eachError bean="${this.admin}" var="error">
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
