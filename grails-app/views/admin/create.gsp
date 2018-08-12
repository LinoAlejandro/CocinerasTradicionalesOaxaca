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
        Crear nuevo administrador
      </div>
      <g:form name="name" action="create">
        <div class="row justify-content-center pt-2">
          <div class="col-md-6">
            <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" name="nombre" value="${this.admin?.nombre}" class="form-control">
            </div>
            <div class="form-group">
              <label for="apPaterno">Apellido Paterno</label>
              <input type="text" name="apPaterno" value="${this.admin?.apPaterno}" class="form-control">
            </div>
            <div class="form-group">
              <label for="apMaterno">Apellido Materno</label>
              <input type="text" name="apMaterno" value="${this.admin?.apMaterno}" class="form-control">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="username">Nombre de usuario</label>
              <input type="text" name="username" value="${this.admin?.username}" class="form-control">
            </div>
            <div class="form-group">
              <label for="password">Contraseña</label>
              <input type="password" name="password" value="" class="form-control">
            </div>
            <div class="form-group">
              <label for="passwordVerification">Verifique su contraseña</label>
              <input type="password" name="passwordVerification" value="" class="form-control">
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Crear Nuevo" class="btn btn-primary btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <g:if test="${this.admin}">
      <script type="text/javascript">
        var form = document.getElementById("formcreate")
        form.addEventListener("submit", function() {
            var inputfNacimiento = document.getElementById("fechaNacimiento")
            var inputfNacimientoHidden = document.getElementById("fechaNacimientoHidden")
            inputfNacimientoHidden.value = inputfNacimiento.value + " 00:00:00.0"
        })
      </script>
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
