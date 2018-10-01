<!DOCTYPE html>
<g:set var="format" value="yyyy-MM-dd'T'HH:mm"/>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title>Crear noticia</title>
    <asset:stylesheet href="richText/richtext.min.css" />
  </head>
  <body>
    <div class="container pt-4">
      <div class="row">
        <div class="col-md-12 display-3 text-center lobster">
          Crear Noticia
          <i class="far fa-newspaper text-purple"></i>
        </div>
      </div>
      <g:form name="formcreate" action="create">
        <div class="row justify-content-center pt-2 cabin">
          <div class="col-md-12 row">
            <div class="form-group col-md-12">
              <label for="titulo">Título</label>
              <input type="text" name="traduccionEspanol.titulo" value="${noticia?.traduccionEspanol?.titulo}" class="form-control" />
            </div>
            <div class="form-group col-md-12">
              <label for="traduccionEspanol.subtitulo">Subtítulo</label>
              <textarea name="traduccionEspanol.subtitulo" class="form-control"  >${noticia?.traduccionEspanol?.subtitulo}</textarea>
            </div>
            <div class="form-group col-md-12">
              <label for="contenido">Descripción</label>
              <textarea class="contentEspanol" name="traduccionEspanol.contenido" class="form-control" >${raw(noticia?.traduccionEspanol?.contenido)}</textarea>
            </div>
            <div class="form-group col-md-6">
              <label for="">Tipo</label>            
              <select name="tipo" id="tipoNoticia" class="form-control">
                <option value="Artículo">Artículo</option>
                <option value="Boletín">Boletín</option>
                <option value="Noticia">Noticia</option>
              </select>
              <g:if test="${noticia?.tipo}">
                <script type="text/javascript">
                  $(document).ready(function() {
                      var tipoNoticia = document.getElementById('tipoNoticia')
                      tipoNoticia.value = "${noticia.tipo}"
                  })
                </script>
              </g:if>
            </div>
            <div class="form-group col-md-6">
              <label for="">Imágen de Portada</label>
              <input type="text" name="ubicacionImagen" class="form-control"/>
            </div>
            <div class="h1 col-md-12 lobster text-center">
              Datos de la traduccion <strong>[Inglés]</strong>
            </div>
            <div class="form-group col-md-12">
              <label for="titulo">Título</label>
              <input type="text" name="traduccionIngles.titulo" value="${noticia?.traduccionIngles?.titulo}" class="form-control" />
            </div>
            <div class="form-group col-md-12">
              <label for="raduccionIngles.subtitulo">Subtítulo</label>
              <textarea name="traduccionIngles.subtitulo" class="form-control" >${noticia?.traduccionIngles?.subtitulo}</textarea>
            </div>
            <div class="form-group col-md-12">
              <label for="contenido">Descripción</label>
              <textarea class="contentIngles" name="traduccionIngles.contenido" class="form-control">
                ${raw(noticia?.traduccionIngles?.contenido)}
              </textarea>
            </div>
            <div class="h1 col-md-12 lobster text-center">
              Datos de la ubicación
            </div>
            <div class="form-group col-md-12">
              <label for="lugar">Nombre de la ubicación</label>
              <input type="text" name="lugar" value="${noticia?.lugar}" class="form-control" />
            </div>
            <div class="form-group col-md-12">
              <input id="lat" name="latitud" type="hidden" />
              <input id="lon" name="longitud" type="hidden" />
              <input id="pac-input" class="controls" type="text" placeholder="Search Box" style="font-size:18px">
              <div id="map" class="w-100" style="height:400px" data-aos="flip-up"></div>
            </div>
            <div class="h1 col-md-12 lobster text-center">
              Tabla de Media <i class="far fa-images text-purple"></i>
            </div>
            <div class="col-md-12">
              <table class="table table-striped">
                <thead>
                  <tr class="lobster h4">
                    <td scope="col">Pie</td>
                    <td scope="col">Ubicación</td>
                    <td scope="col">Tipo</td>
                  </tr>
                </thead>
                <tbody id="mediaTable">
                  <g:each var="media" in="${session.mediaNoticia}">
                    <tr>
                      <td>${media.traduccionEspanol.pieMedia}</td>
                      <td>${media.ubicacion}</td>
                      <td>${media.tipo}</td>
                    </tr>
                  </g:each>
                </tbody>
              </table>
            </div>
            <div class="form-group col-md-6">
              <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#agregarMediaModial">
                Agregar media
              </button>
              <input type="submit" name="" value="Crear" class="btn bg-purple text-light btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>
    <div class="modal fade" id="agregarMediaModial" tabindex="-1" role="dialog" aria-labelledby="agregarMediaModialLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-title" >
              <div class="d-flex justify-content-between">
                <div class="h1 lobster"  id="agregarMediaModialLabel">
                  Agregue media a su noticia
                  <i class="far fa-images text-purple"></i>
                </div>
                <div>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">
                      &times;
                    </span>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-body">
            <div id="hidden"></div>
            <div class="row cabin">              
              <div class="form-group col-md-6">
                <label for="">Pie de media [Español] </label>
                <input type="text" class="form-control" name="traduccionEspanol.pieMedia" id="pieMediaEspanol"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Pie de media [Inglés] </label>
                <input type="text" class="form-control" name="traduccionIngles.pieMedia" id="pieMediaIngles"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Ubicación</label>
                <input type="text" class="form-control" name="ubicación" id="ubicacion"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Tipo</label>
                <select name="tipo" id="tipo" class="form-control">
                  <option value="imagen">Imágen</option>
                  <option value="video">Video</option>
                </select>
              </div>
              <div class="form-group col-md-6">
                <label for="">Autor</label>
                <input type="text" class="form-control" id="datosAutor">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn bg-purple text-light" onclick="addMedia()">Crear</button>
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
          var url = "${createLink(action:'addMedia')}"
          var datos = {'traduccionEspanol.pieMedia': pieMediaEspanol.value,
              'traduccionIngles.pieMedia': pieMediaIngles.value,
              ubicacion: ubicacion.value,
              tipo: tipo.value,
              datosAutor: datosAutor.value}

          $.post( url, datos, function(data, status) {
                  hidden.innerHTML = ''
                  var alert = document.createElement('div')
                  alert.classList.add('mb-4')
                  if(status == 'success') {
                      var tr = document.createElement('tr')

                      var pie = document.createElement('td')
                      var ubicacion = document.createElement('td')
                      var tipo = document.createElement('td')

                      pie.innerHTML = data.noticia['traduccionEspanol.pieMedia']
                      ubicacion.innerHTML = data.noticia.ubicacion
                      tipo.innerHTML = data.noticia.tipo

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

    <g:if test="${this.noticia}">
      <div class="box box-danger">
        <g:eachError bean="${this.noticia}" var="error">
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
        var position = {lat: ${noticia?.latitud ?: 17.0669}, lng: ${noticia?.longitud ?: -96.7203}} 

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

        searchBox.addListener('places_changed', function() {
            var places = searchBox.getPlaces();

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function(place) {
                if (place.geometry.viewport) {
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
