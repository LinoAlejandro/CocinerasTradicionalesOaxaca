<!DOCTYPE html>
<g:set var="format" value="yyyy-MM-dd'T'HH:mm"/>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title>Crear actividad</title>
    <asset:stylesheet href="richText/richtext.min.css" />
  </head>
  <body>
    <div class="container pt-4">
      <div class="h2 mb-3 text-center">
        Crear nueva Actividad
      </div>
      <g:form name="formcreate" action="create">
        <div class="row justify-content-center pt-2">
          <div class="col-md-12">
            <div class="form-group">
              <label for="titulo">Título</label>
              <input type="text" name="traduccionEspanol.titulo" value="${actividad?.traduccionEspanol?.titulo}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="fechaInicio">Fecha de inicio</label>
              <input id="fechaInicio" type="datetime-local" name="fechaInicio"
              value="${actividad?.fechaInicio ? actividad?.fechaInicio.format(format) : new Date().format(format)}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="fechaFinal">Fecha final</label>
              <input id="fechaFinal" type="datetime-local" name="fechaFinal" 
              value="${actividad?.fechaFinal ? actividad?.fechaFinal.format(format) : new Date().format(format)}" class="form-control" />
            </div>
            <div class="form-group">
              <label for="contenido">Descripción</label>
              <textarea class="contentEspanol" type="text" name="traduccionEspanol.contenido" class="form-control">
                ${raw(actividad?.traduccionEspanol?.contenido)}
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
              <input type="text" name="lugar" value="${actividad?.lugar}" class="form-control" />
            </div>
            <div class="form-group">
              <input id="lat" name="latitud" type="hidden" />
              <input id="lon" name="longitud" type="hidden" />
              <input id="pac-input" class="controls" type="text" placeholder="Search Box" style="font-size:18px">
              <div id="map" class="w-100" style="height:400px"></div>
            </div>
            <div class="h4">
              Media
            </div>
            <div>
              <table class="table">
                <thead>
                  <tr>
                    <td>Pie</td>
                    <td>Ubicación</td>
                    <td>Tipo</td>
                  </tr>
                </thead>
                <tbody id="mediaTable">
                  <g:each var="media" in="${session.media?}">
                    <tr>
                      <td>${media.traduccionEspanol.pieMedia}</td>
                      <td>${media.ubicacion}</td>
                      <td>${media.tipo}</td>
                    </tr>
                  </g:each>
                </tbody>
              </table>
            </div>
            <div class="form-group">
              <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal">
                Agregar media
              </button>
              <input type="submit" name="" value="Crear" class="btn btn-primary btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Crear elemento de media</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div id="hidden"></div>
            <div class="form-group">
              <label for="">Pie de media [Español] </label>
              <input type="text" class="form-control" name="traduccionEspanol.pieMedia" id="pieMediaEspanol"/>
            </div>
            <div class="form-group">
              <label for="">Pie de media [Inglés] </label>
              <input type="text" class="form-control" name="traduccionIngles.pieMedia" id="pieMediaIngles"/>
            </div>
            <div class="form-group">
              <label for="">Ubicación</label>
              <input type="text" class="form-control" name="ubicación" id="ubicacion"/>
            </div>
            <div class="form-group">
              <label for="">Tipo</label>
              <select name="tipo" id="tipo" class="form-control">
                <option value="imagen">Imágen</option>
                <option value="video">Video</option>
              </select>
            </div>
            <div class="form-group">
              <label for="">Autor</label>
              <input type="text" class="form-control" name="datosAutor" id="datosAutor"/>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="addMedia()">Crear</button>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">

      var pieMediaEspanol = document.getElementById('pieMediaEspanol')
      var pieMediaIngles = document.getElementById('pieMediaIngles')
      var ubicacion = document.getElementById('ubicacion')
      var tipo = document.getElementById('tipo')
      var datosAutor = document.getElementById('datosAutor')
      var mediaTable = document.getElementById('mediaTable')
      var hidden = document.getElementById('hidden')

      function addMedia() {
          $.post("${createLink(action:'addMedia')}" ,
              {'traduccionEspanol.pieMedia': pieMediaEspanol.value,
              'traduccionIngles.pieMedia': pieMediaIngles.value,
              ubicacion: ubicacion.value,
              tipo: tipo.value,
              datosAutor: datosAutor.value} ,
              function(data, status) {
                  hidden.innerHTML = ''
                  var alert = document.createElement('div')
                  alert.classList.add('mb-4')
                  if(status == 'success') {
                      var tr = document.createElement('tr')

                      var pie = document.createElement('td')
                      var ubicacion = document.createElement('td')
                      var tipo = document.createElement('td')

                      pie.innerHTML = data.actividad['traduccionEspanol.pieMedia']
                      ubicacion.innerHTML = data.actividad.ubicacion
                      tipo.innerHTML = data.actividad.tipo

                      tr.appendChild(pie)
                      tr.appendChild(ubicacion)
                      tr.appendChild(tipo)

                      mediaTable.appendChild(tr)

                      alert.classList.add('alert-success')
                      alert.innerHTML = 'Media agregada temporalmente'
                      
                  } else if(status == 'nocontent') {

                      alert.classList.add('alert-danger')
                      alert.innerHTML = 'Algún dato de ingreso es incorrecto, revise su manual de usuario para mayor información'
                  }

                  hidden.appendChild(alert)
              }
          )
      }
    </script>

    <g:if test="${this.actividad}">
      <div class="box box-danger">
        <g:eachError bean="${this.actividad}" var="error">
          <li class="d-block mx-auto text-center">
            <g:if test="${error in org.springframework.validation.FieldError}">
              "${error.field}"
            </g:if><g:message error="${error}"/>
          </li>
          <script type="text/javascript">
  		      //var field = document.getElementById('${error.getField()}')
  		      //field.classList.add('border-danger')
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
        var position = {lat: ${actividad?.latitud ?: 17.0669}, lng: ${actividad?.longitud ?: -96.7203} }

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

            lat.value = marker.getPosition().lat().toString()
            lon.value = marker.getPosition().lng().toString()
        })
    </script>

  </body>
</html>
