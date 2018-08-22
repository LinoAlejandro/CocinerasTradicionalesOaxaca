<!DOCTYPE html>
<g:set var="format" value="yyyy-MM-dd'T'HH:mm"/>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title>Actualizar una actividad</title>
    <asset:stylesheet href="richText/richtext.min.css" />
  </head>
  <body>
    <div class="container pt-4">
      <div class="h2 mb-3 text-center">
        Actualizar una actividad
      </div>
      <g:form name="formcreate" action="update">
        <input type="hidden" name="id" value="${actividad.id}">
        <div class="row justify-content-center pt-2">
          <div class="col-md-12">
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" name="traduccionEspanol.titulo" value="${actividad.traduccionEspanol?.titulo}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="fechaInicio">Fecha de inicio</label>
              <input id="fechaInicio" type="datetime-local" name="fechaInicio"
              value="${actividad.fechaInicio ? actividad.fechaInicio.format(format) : new Date().format(format)}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="fechaFinal">Fecha final</label>
              <input id="fechaFinal" type="datetime-local" name="fechaFinal" 
              value="${actividad.fechaFinal ? actividad.fechaFinal.format(format) : new Date().format(format)}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="contenido">Descripción</label>
              <textarea class="contentEspanol" type="text" name="traduccionEspanol.contenido" class="form-control">
                ${raw(actividad.traduccionEspanol?.contenido)}
              </textarea>
            </div>
            <hr class="my-3 bg-dark">
            <div class="h4">
              Datos de la traduccion <strong>[Inglés]</strong>
            </div>
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" name="traduccionIngles.titulo" value="${actividad?.traduccionIngles?.titulo}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="contenido">Descripción</label>
              <textarea class="contentIngles" type="text" name="traduccionIngles.contenido" class="form-control">
                ${raw(actividad?.traduccionIngles?.contenido)}
              </textarea>
            </div>
            <hr class="my-3 bg-dark">
            <div class="h4">
              Datos de la ubicación
            </div>
            <div class="form-group">
              <label for="lugar">Nombre de la ubicación</label>
              <input type="text" name="lugar" value="${actividad.lugar}" class="form-control" />
            </div>
            <div class="form-group">
              <input id="lat" name="latitud" type="hidden" />
              <input id="lon" name="longitud" type="hidden" />
              <input id="pac-input" class="controls" type="text" placeholder="Search Box" style="font-size:18px">
              <div id="map" class="w-100" style="height:400px"></div>
            </div>
            <div class="form-group">
              <input type="submit" name="" value="Actualizar" class="btn btn-primary btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <g:if test="${actividad}">
      <div class="box box-danger">
        <g:eachError bean="${actividad}" var="error">
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
    <asset:javascript src="richText/jquery.richtext.js" />
    <script type="text/javascript">
        $(document).ready(function() {
            $('.contentEspanol').richText();
            $('.contentIngles').richText();
        });
    </script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBCjGKKCJZYfvAWDd-35EupFSIWDJjB5zk&libraries=places"></script>

     <script type="text/javascript">
        var position = {lat: ${actividad.latitud ?: 17.0669}, lng: ${actividad?.longitud ?: -96.7203} }
        var marker = new google.maps.Marker({
            position: position
        });

        var map = new google.maps.Map(document.getElementById('map'), {
            center: position,
            zoom: 13
        });

        marker.setMap(map);

        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
            searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function(place) {
                if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                if (place.geometry.viewport) {
                  // Only geocodes have viewport.
                   bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });

        google.maps.event.addListener(map, 'click', function(e) {        
            marker.setPosition({lat:e.latLng.lat(), lng:e.latLng.lng()}) 
        });      

        var formcreate = document.getElementById('formcreate')

        formcreate.addEventListener('submit', function(evt) {
            var lat = document.getElementById('lat')
            var lon = document.getElementById('lon')

            lat.value = marker.getPosition().lat()
            lon.value = marker.getPosition().lng()
        })
    </script>

  </body>
</html>
