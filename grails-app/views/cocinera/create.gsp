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
        Crear nueva cocinera
      </div>
      <g:form name="formcreate" action="create">
        <div class="row justify-content-center pt-2">
          <div class="col-md-6">
            <div class="form-group">
              <label for="nombre">Nombre Completo</label>
              <input type="text" name="nombre" value="${this.cocinera?.nombre}" class="form-control">
            </div>
            <div class="form-group">
              <label for="ubicacionImagen">Imagen de portada</label>
              <input type="text" name="ubicacionImagen" value="${this.cocinera?.ubicacionImagen}" class="form-control">
            </div>
            <div class="form-group">
              <label for="region">Region</label>
              <input type="text" name="region" value="${this.cocinera?.region}" class="form-control">
            </div>
            <div class="form-group">
              <label for="municipio">Municipio</label>
              <input type="text" name="municipio" value="${this.cocinera?.municipio}" class="form-control">
            </div>
            <div class="form-group">
              <label for="agencia">Agencia</label>
              <input type="text" name="agencia" value="${this.cocinera?.agencia}" class="form-control">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="etnia">Etnia</label>
              <input type="text" name="etnia" value="${this.cocinera?.etnia}" class="form-control">
            </div>
            <div class="form-group">
              <label for="lenguaMadre">Lengua Madre</label>
              <input type="text" name="lenguaMadre" value="${this.cocinera?.lenguaMadre}" class="form-control">
            </div>
            <div class="form-group">
              <label for="dialecto">Dialecto</label>
              <input type="text" name="dialecto" value="${this.cocinera?.dialecto}" class="form-control">
            </div>
            <div class="form-group">
              <label for="latitud">Latitúd</label>
              <input type="number" name="latitud" step="any" value="${this.cocinera?.latitud}" class="form-control">
            </div>
            <div class="form-group">
              <label for="longitud">Longitúd</label>
              <input type="number" name="longitud" step="any" value="${this.cocinera?.longitud}" class="form-control">
            </div>
            <div class="form-group">
              <input type="submit" value="Crear Nuevo" class="btn btn-primary btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <g:if test="${this.cocinera}">
      <div class="box box-danger">
        <g:eachError bean="${this.cocinera}" var="error">
          <li class="d-block mx-auto text-center">
            <g:if test="${error in org.springframework.validation.FieldError}">
              "${error.field}"
            </g:if><g:message error="${error}"/>
          </li>
        </g:eachError>
      </div>
    </g:if>
  </body>
</html>
