<!doctype html>
<g:set var="format" value="yyyy-MM-dd'T'HH:mm"/>
<html>
  <head>
  	<meta name="layout" content="admin">
  	<meta charset="utf-8">
  	<title>Crear convocatoria</title>
  </head>
  <body>
  	<div class="container pt-4">
      <div class="row">
    		<div class="col-md-12 display-3 text-center lobster">
          Crear convocatoria
          <i class="fas fa-bullhorn text-purple"></i>
        </div>
      </div>
      <g:uploadForm name="formcreate" action="create" enctype="multipart/form-data" useToken="true">
				<div class="row justify-content-center"> 
					<div class="col-md-12 cabin row">
						<div class="col-md-6 form-group ">
							<label for="">Número de convocatoria</label>
							<input type="number" name="numeroConvocatoria" class="form-control" value="${convocatoria?.numeroConvocatoria}">
						</div>
						<div class="col-md-6 form-group ">
							<label for="">Año de la convocatoria</label>
							<input id="anioConvocatoria" type="number" name="anioConvocatoria" class="form-control" value="${convocatoria?.anioConvocatoria}">
						</div>
						<script type="text/javascript">
							var anioConvocatoria = document.getElementById('anioConvocatoria')
							anioConvocatoria.value = (new Date()).getFullYear()
						</script>
						<div class="col-md-6 form-group ">
							<label for="">Fecha Inicio</label>
							<input type="datetime-local" name="fechaInicio" class="form-control" value="${convocatoria?.fechaInicio ? convocatoria?.fechaInicio.format(format) : new Date().format(format)}">
						</div>
						<div class="col-md-6 form-group ">
							<label for="">Fecha final</label>
							<input type="datetime-local" name="fechaFinal" class="form-control" value="${convocatoria?.fechaFinal ? convocatoria?.fechaFinal.format(format) : new Date().format(format)}">
						</div>
						<div class="col-md-6 form-group "> 
							<label for="archivo">Subir archivo de la convocatoria</label>
							<input type="file" name="file" id="file" class="form-control">
						</div>
						<div class="col-md-6 form-group ">
							<label for="">Lugar</label>
							<input type="text" name="lugar" value="${convocatoria?.lugar}" class="form-control">
						</div>
						<div class="col-md-12 form-group ">
							<input type="text" id="pac-input" />
							<div id="map" style="height: 450px"></div>
						</div>
						<input type="hidden" name="latitud" id="lat" />
						<input type="hidden" name="longitud" id="lon" />
            <hr />
            <div class="col-md-12">
              <div class="h1 lobster text-center">
                Tabla de concursos
              </div>
              <table class="table table-striped">
                <thead class="">
                  <tr class="lobster h4">
                    <th scope="col">Descripción</th>
                  </tr>
                </thead>
                <tbody id="tbody">
                  <g:each var="concurso" in="${session.concursos}">
                    <tr>
                      <td>${concurso.descripcion}</td>
                    </tr>
                  </g:each>
                </tbody>
              </table>
            </div>
            <div class="col-md-12 form-group  row">
              <div class="col-md-8 text-left">
                <input type="text" name="descripcion" id="descripcion" class="form-control" placeholder="Nombre del concurso">  
              </div>
              <div class="col-md-2 text-left">
                <button type="button" class="btn bg-blue text-light px-4" onclick="addConcurso()">Vincular</button>
              </div>
              <div class="col-md-2">
                <div id="hidden">
                </div>
              </div>
            </div>
            <script>
              var descripcion = document.getElementById('descripcion')
              var tbody = document.getElementById('tbody')
              var hidden = document.getElementById('hidden')

              function addConcurso() {
                  var url = "${createLink(action:'addConcurso')}"
                  console.log(url)
                  var data = {
                      descripcion: descripcion.value,
                  }

                  $.post(url, data, function(data, status) {
                      hidden.innerHTML = ''
                      var div = document.createElement('div')
                      div.classList.add('p-1')
                      div.classList.add('rounded')
                      if(status == 'success') {  
                          var tr = document.createElement('tr')
                          var td = document.createElement('td')

                          td.innerHTML = data.concursoJSON.descripcion

                          tr.appendChild(td)
                          tbody.appendChild(tr)

                          
                          div.classList.add('alert-success')
                          div.innerHTML = 'Concurso almacenado'
                          
                      } else {
                          div.classList.add('alert-danger')
                          div.innerHTML = 'ERROR! revisar manual de usuario'
                      }

                      hidden.appendChild(div)
                  })
              }

            </script>
						<div class="col-md-6 form-group ">
							<button class="btn bg-purple text-light">Crear</button>
						</div>
					</div>
				</div>
			</g:uploadForm>
  	</div>

    <g:if test="${this.convocatoria}">
      <div class="box box-danger">
        <g:eachError bean="${this.convocatoria}" var="error">
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

  	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBCjGKKCJZYfvAWDd-35EupFSIWDJjB5zk&libraries=places"></script>

     <script type="text/javascript">
        var position = {lat: ${convocatoria?.latitud ?: 17.0669}, lng: ${convocatoria?.longitud ?: -96.7203} }

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