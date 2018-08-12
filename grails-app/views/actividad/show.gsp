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
    <title>${actividad.titulo}</title>
  </head>
  <body>
    <div class="container mt-5 pt-3 mb-3">
      <div class="row justify-content-center align-items-center">
        <div class="col-md-5 text-left">
          <div class="display-4">
            ${traduccion?.titulo}
          </div>
        </div>
        <div class="col-md-2 text-center">
          <i class="far fa-calendar-alt"></i>
          <div class="">
            ${actividad.fechaInicio.format('dd-MM-yyyy')} -
            ${actividad.fechaFinal.format('dd-MM-yyyy')}
          </div>
        </div>
        <div class="col-md-2 text-center">
          <i class="far fa-clock text-center"></i>
          <div class="">
            ${actividad.horaInicio} -
            ${actividad.horaFinal}
          </div>
        </div>
        <div class="col-md-2 text-center">
          <i class="fas fa-map-marker"></i>
          <div class="">
            ${actividad.lugar}
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-xl-12 mb-5" style="height:5px; background-color:#CB0A60;">
        </div>
        <div class="col-md-12">
          <div class="">
            ${raw(traduccion?.contenido)}
          </div>
        </div>
        <g:if test="${actividad.latitud}">
          <div class="col-md-12">
            <div id="map" class="w-100" style="height:400px"></div>
            <script>
              function initMap() {
                var uluru = {lat: ${actividad.latitud}, lng: ${actividad.longitud}};
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

        <g:if test="${mediaFotos.size() > 0}">
          <div class="col-xl-12 mb-5" style="height:5px; background-color:#CB0A60;">
          </div>
          <div class="col-md-12 box-purp">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <g:set var="counter" value="${0}" />
                <g:each in="${this.mediaFotos}">
                    <li data-target="#carouselExampleIndicators" data-slide-to="${counter}"></li>
                    <g:set var="counter" value="${counter + 1}" />
                </g:each>
              </ol>
              <g:set var="counter" value="${0}" />
              <div class="carousel-inner">
                <g:each var="media" in="${this.mediaFotos}">
                  <g:if test="${counter==0}">
                    <div class="carousel-item active">
                      <img class="d-block w-100" src="${media.ubicacion}">
                      <div class="carousel-caption d-none d-md-block">
                        <p>${media.pieMedia}</p>
                      </div>
                    </div>
                  </g:if>
                  <g:else>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="${media.ubicacion}">
                      <div class="carousel-caption d-none d-md-block">
                        <h5>${media.pieMedia}</h5>
                      </div>
                    </div>
                  </g:else>
                  <g:set var="counter" value="${counter + 1}" />
                </g:each>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
        </g:if>
        <g:if test="${mediaVideo.size() > 0}">
        <div class="col-xl-12 mb-5" style="height:5px; background-color:#CB0A60;">
        </div>
          <div class="col-md-12">
            <div class="container">
              <div class="row">
                <g:each var="media" in="${this.mediaVideo}">
                  <div class="col-md-12 my-2">
                    <div class="embed-responsive embed-responsive-16by9">
                      <iframe class="embed-responsive-item" src="${media.ubicacion}" allowfullscreen></iframe>
                    </div>
                  </div>
                </g:each>
              </div>
            </div>
          </div>
        </g:if>
      </div>
    </div>
    <div class="container mt-5">
      <div class="row">
        <a href="https://www.facebook.com/sharer/sharer.php?u=${request.getRequestURL().replaceAll(':','%3A').replaceAll('/','%2F')}3&amp;src=sdkpreparse" target="_blank" class="btn btn-primary">
          <i class="fab fa-facebook"></i>
          Share
        </a>
      </div>
    </div>
  </body>
</html>
