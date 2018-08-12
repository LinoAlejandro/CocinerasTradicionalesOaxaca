<!DOCTYPE html>
<html>
  <head>
    <g:if test="${session.language == 'Español'}">
      <meta name="layout" content="user"/>
    </g:if>
    <g:if test="${session.language == 'English'}">
      <meta name="layout" content="userEnglish"/>
    </g:if>
    <meta charset="utf-8" />
    <title>${cocinera.nombre}</title>
  </head>
  <body>
    <div class="container pt-5">
      <div class="row justify-content-center align-items-center">
        <g:if test="${cocinera.ubicacionImagen}">
          <div class="col-md-5">
            <img class="img-thumbnail" src="${cocinera.ubicacionImagen}"/>
          </div>
        </g:if>
        <div class="col-md-7">
          <div class="text-center display-4 py-3">
            ${cocinera.nombre}
          </div>
          <div class="container box-purp py-3">
            <div class="row justify-content-center">
              <div class="col-md-12 h2">
                Relevant data
              </div>
              <div class="col-md-4">
                <label for="region">Region:</label>
                ${cocinera.region}
              </div>
              <div class="col-md-4">
                <label for="municipio">Town:</label>
                ${cocinera.municipio}
              </div>
              <g:if test="${cocinera.agencia}">
                <div class="col-md-4">
                  <label for="agencia">Ministration:</label>
                  ${cocinera.agencia}
                </div>
              </g:if>
              <g:if test="${cocinera.etnia}">
                <div class="col-md-4">
                  <label for="etnia">Ethnicity:</label>
                  ${cocinera.etnia}
                </div>
              </g:if>
              <g:if test="${cocinera.lenguaMadre}">
                <div class="col-md-4">
                  <label for="lenguaMadre">Mother tongue:</label>
                  ${cocinera.lenguaMadre}
                </div>
              </g:if>
              <g:if test="${cocinera.dialecto}">
                <div class="col-md-4">
                  <label for="dialecto">Dialect:</label>
                  ${cocinera.dialecto}
                </div>
              </g:if>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-12 box-green  py-3">
          <div class="h1">
            Dishes
          </div>
          <div class="container">
            <div class="row justify-content-center align-items-center">
              <g:each var="platillo" in="${platillos}">
                <g:if test="${platillo.ubicacionmedia}">
                  <div class="col-md-5">
                    <img class="img-thumbnail" src="${platillo.ubicacionmedia}"/>
                  </div>
                </g:if>
                <div class="col-md-7">
                  <div>
                    <span class="h2">${platillo.nombrePlatillo}</span>
                  </div>
                  <div class="my-3">
                    <span class="text-muted">Type of dish:</span> <span>${platillo.tipoPlatillo == 'cotidiano' ? 'Daily':'Ceremonial'}</span>
                    <div class="">
                      <span class="text-muted">Convocatory number:</span> <span>${platillo.convocatoria}</span>
                    </div>
                  </div>
                  <div class="">
                    <span class="h5 mb-2">Ingredients:</span>
                    ${raw(platillo.ingredientes)}
                  </div>
                  <g:if test="${platillo.premio}">
                    <div class="">
                      <span class="text-info">*This dish has won:</span>
                      ${platillo.premio}
                    </div>
                  </g:if>
                </div>
              </g:each>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row justify-content-center">
        <g:if test="${cocinera.latitud}">
          <div class="col-md-12 box-purp py-4">
            <div id="map" class="w-100" style="height:400px"></div>
            <script>
              function initMap() {
                var uluru = {lat: ${cocinera.latitud}, lng: ${cocinera.longitud}};
                var map = new google.maps.Map(document.getElementById('map'), {
                  zoom: 8,
                  center: uluru
                });
                var marker = new google.maps.Marker({
                  position: uluru,
                  map: map
                });
              }
            </script>
            <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCn71Ee6ZgJFHnvVbzNk3mA0W9kWVDe3-0&callback=initMap">
            </script>
          </div>
        </g:if>
      </div>
    </div>
    <div class="container mt-3">
      <div class="row">
        <a href="https://www.facebook.com/sharer/sharer.php?u=${request.getRequestURL().replaceAll(':','%3A').replaceAll('/','%2F')}3&amp;src=sdkpreparse" target="_blank" class="btn btn-primary">
          <i class="fab fa-facebook"></i>
          Share
        </a>
      </div>
    </div>
  </body>
</html>
