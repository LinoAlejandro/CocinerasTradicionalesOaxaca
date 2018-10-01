<!DOCTYPE html>
<g:set var="format" value="yyyy-MM-dd'T'HH:mm"/>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta name="layout" content="admin"/>
    <meta charset="utf-8" />
    <title>Actualizar noticia</title>
    <asset:stylesheet href="richText/richtext.min.css" />
  </head>
  <body>
    <div class="container pt-4">
      <div class="row">
        <div class="col-md-12 display-3 text-center lobster">
          Actualizar Noticia
          <i class="far fa-newspaper text-purple"></i>
        </div>
      </div>
      <g:form name="formcreate" action="update">
        <input type="hidden" name="max" value="${params.max}" />
        <input type="hidden" name="offset" value="${params.offset}" />
        <input type="hidden" name="id" value="${noticia.id}" />
        <div class="row justify-content-center pt-2 cabin">
          <div class="col-md-12 row">
            <div class="form-group col-md-12">
              <label for="titulo">Título</label>
              <input type="text" name="traduccionEspanol.titulo" value="${noticia?.traduccionEspanol?.titulo}" class="form-control" />
            </div>
            <div class="form-group col-md-12">
              <label for="traduccionEspanol.subtitulo">Subtítulo</label>
              <textarea name="traduccionEspanol.subtitulo" class="form-control">${noticia?.traduccionEspanol?.subtitulo}</textarea>
            </div>
            <div class="form-group col-md-12">
              <label for="contenido">Descripción</label>
              <textarea class="contentEspanol" name="traduccionEspanol.contenido" class="form-control">
                ${raw(noticia?.traduccionEspanol?.contenido)}
              </textarea>
            </div>
            <div class="form-group col-md-6">
              <label for="">Tipo</label>
              <select name="tipo" id="tipoNoticia" class="form-control">
                <option value="Artículo">Artículo</option>
                <option value="Boletín">Boletín</option>
                <option value="Noticia">Noticia</option>
              </select>
              <script type="text/javascript">
                  $(document).ready(function() {
                      var tipoNoticia = document.getElementById('tipoNoticia')
                      var tipoTexto = "${noticia.tipo}"
                      if(tipoTexto == "Artículo") {
                          tipoNoticia.selectedIndex = 0
                      } else if(tipoTexto == "Boletín") {
                          tipoNoticia.selectedIndex = 1
                      } else {
                          tipoNoticia.selectedIndex = 2
                      }
                  })
                </script>
            </div>
            <div class="form-group col-md-6">
              <label for="">Imágen de Portada</label>
              <input type="text" name="ubicacionImagen" class="form-control" value="${noticia.ubicacionImagen}"/>
            </div>
            <hr class="my-3 bg-dark">
            <div class="h1 col-md-12 lobster text-center">
              Datos de la traduccion <strong>[Inglés]</strong>
            </div>
            <div class="form-group col-md-12">
              <label for="titulo">Título</label>
              <input type="text" name="traduccionIngles.titulo" value="${noticia?.traduccionIngles?.titulo}" class="form-control" />
            </div>
            <div class="form-group col-md-12">
              <label for="raduccionIngles.subtitulo">Subtítulo</label>
              <textarea name="traduccionIngles.subtitulo" class="form-control">${noticia?.traduccionIngles?.subtitulo}</textarea>
            </div>
            <div class="form-group col-md-12">
              <label for="contenido">Descripción</label>
              <textarea class="contentIngles" name="traduccionIngles.contenido" class="form-control">
                ${raw(noticia?.traduccionIngles?.contenido)}
              </textarea>
            </div>
            <hr class="my-3 bg-dark">
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
              <div id="map" class="w-100" style="height:400px"></div>
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
                  <g:each var="media" in="${medias}">
                    <tr id="${media.id}">
                      <td>${media.traduccionEspanol.pieMedia}</td>
                      <input type="hidden" value="${media.traduccionIngles?.pieMedia}">
                      <td>${media.ubicacion}</td>
                      <td>${media.tipo}</td>
                      <input type="hidden" value="${media.datosAutor}">
                      <td>
                        <button type="button" class="btn btn-secondary" onclick="setUpdateData(this)" data-toggle="modal" data-target="#updateMediaModal">Actualizar</button>
                      </td>
                      <td>
                        <button type="button" class="btn btn-danger" onclick="deleteMedia(this)">Eliminar</button>
                      </td>
                    </tr>
                  </g:each>
                </tbody>
              </table>
            </div>
            <div class="form-group col-md-12">
              <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#saveModal">
                Agregar media
              </button>
              <input type="submit" name="" value="Actualizar" class="btn bg-purple text-light btn-md">
            </div>
          </div>
        </div>
      </g:form>
    </div>

    <div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-title" >
              <div class="d-flex justify-content-between">
                <div class="h1 lobster"  id="exampleModalLabel">
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
            <button type="button" class="btn bg-purple text-light" onclick="saveMedia()">Crear</button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="updateMediaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-title" >
              <div class="d-flex justify-content-between">
                <div class="h1 lobster"  id="exampleModalLabel">
                  Actualozar media
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
            <div id="hiddenUpdate"></div>
            <input type="hidden" id="idNoticiaMedia" />
            <div class="row cabin">
              <div class="form-group col-md-6">
                <label for="">Pie de media [Español] </label>
                <input type="text" class="form-control" name="traduccionEspanol.pieMedia" id="pieMediaEspanolUpdate"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Pie de media [Inglés] </label>
                <input type="text" class="form-control" name="traduccionIngles.pieMedia" id="pieMediaInglesUpdate"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Ubicación</label>
                <input type="text" class="form-control" name="ubicación" id="ubicacionUpdate"/>
              </div>
              <div class="form-group col-md-6">
                <label for="">Tipo</label>
                <select name="tipo" id="tipoUpdate" class="form-control" >
                  <option value="imagen">Imágen</option>
                  <option value="video">Video</option>
                </select>
              </div>
              <div class="form-group col-md-6">
                <label for="">Autor</label>
                <input type="text" class="form-control" id="datosAutorUpdate">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn bg-purple text-light" onclick="updateMedia()">Actualizar</button>
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

      function saveMedia() {
            var url = '${createLink(action:"saveMedia")}'

            var datos = {
              noticia: ${noticia.id},
              'traduccionEspanol.pieMedia': pieMediaEspanol.value,
              'traduccionIngles.pieMedia': pieMediaIngles.value,
              ubicacion: ubicacion.value,
              tipo: tipo.value,
              datosAutor: datosAutor.value
            }

            $.post(url, datos, function(data, status) {
                hidden.innerHTML = ''
                var alert = document.createElement('div')
                alert.classList.add('mb-4')

                if(status == 'success') {
                    var tr = document.createElement('tr')

                    var pie = document.createElement('td')
                    var ubicacion = document.createElement('td')
                    var tipo = document.createElement('td')
                    var tdModificar = document.createElement('td')
                    var tdEliminar = document.createElement('td')

                    var input = document.createElement('input')
                    input.setAttribute('type', 'hidden')
                    input.value = data.noticia['traduccionIngles.pieMedia'] ? data.noticia['traduccionIngles.pieMedia'] : ''

                    var input2 = document.createElement('input')
                    input2.setAttribute('type', 'hidden')
                    input2.value = data.noticia.datosAutor ? data.noticia.datosAutor : ''

                    var modificar = document.createElement('button')
                    var eliminar = document.createElement('button')

                    modificar.setAttribute('type', 'button')
                    modificar.classList.add('btn')
                    modificar.classList.add('btn-secondary')
                    modificar.setAttribute('onclick', 'setUpdateData(this)')
                    modificar.setAttribute('data-toggle', 'modal')
                    modificar.setAttribute('data-target','#updateMediaModal')
                    modificar.innerHTML = 'Actualizar'

                    eliminar.setAttribute('type', 'button')
                    eliminar.classList.add('btn')
                    eliminar.classList.add('btn-danger')
                    eliminar.setAttribute("onclick", "deleteMedia(this)")
                    eliminar.innerHTML = 'Eliminar'

                    tdModificar.appendChild(modificar)
                    tdEliminar.appendChild(eliminar)

                    pie.innerHTML = data.noticia['traduccionEspanol.pieMedia']
                    ubicacion.innerHTML = data.noticia.ubicacion
                    tipo.innerHTML = data.noticia.tipo

                    tr.appendChild(pie)
                    tr.appendChild(input)
                    tr.appendChild(ubicacion)
                    tr.appendChild(tipo)
                    tr.appendChild(input2)
                    tr.appendChild(tdModificar)
                    tr.appendChild(tdEliminar)
                    tr.id = data.noticia.id

                    mediaTable.appendChild(tr)

                    alert.classList.add('alert-success')
                    alert.innerHTML = 'Media agregada'

                } else if(status == 'nocontent') {
                    
                    alert.classList.add('alert-danger')
                    alert.innerHTML = 'Algún dato de ingreso es incorrecto, revise su manual de usuario para mayor información'
                    
                }

                hidden.appendChild(alert)
            })
        }

      var idNoticiaMedia = document.getElementById('idNoticiaMedia')
      var pieMediaEspanolUpdate = document.getElementById('pieMediaEspanolUpdate')
      var pieMediaInglesUpdate = document.getElementById('pieMediaInglesUpdate')
      var ubicacionUpdate = document.getElementById('ubicacionUpdate')
      var tipoUpdate = document.getElementById('tipoUpdate')
      var datosAutorUpdate = document.getElementById('datosAutorUpdate')
      var hiddenUpdate = document.getElementById('hiddenUpdate')

      function setUpdateData(elm) {
          var tr = elm.parentNode.parentNode
          var childs = tr.children
          idNoticiaMedia.value = tr.id
          pieMediaEspanolUpdate.value = childs[0].innerHTML
          pieMediaInglesUpdate.value = childs[1].value
          ubicacionUpdate.value = childs[2].innerHTML
          tipoUpdate.selectedIndex =  childs[3].innerHTML == 'imagen' ? "0" : "1"
          datosAutorUpdate.value = childs[4].value
      }

      function deleteMedia(elm) {
          var id = elm.parentNode.parentNode.id
          var url = '${createLink(action:"deleteMedia")}'
          $.post(url, {id:id} , function(data, status) {
              if(status == 'success') {
                  var tr = elm.parentNode.parentNode
                  tr.parentNode.removeChild(tr)
              }
          })
      }

      function updateMedia() {
          var div = document.createElement('div')
          div.classList.add('mb-4')
          hiddenUpdate.innerHTML = ''
          var url = '${createLink(action:"updateMedia")}'
          var datos = {
              id: idNoticiaMedia.value,
              'traduccionEspanol.pieMedia': pieMediaEspanolUpdate.value,
              'traduccionIngles.pieMedia': pieMediaInglesUpdate.value,
              ubicacion: ubicacionUpdate.value,
              tipo: tipoUpdate.value,
              datosAutor: datosAutorUpdate.value
          }

          $.post(url, datos, function(data, status){

              if(status == 'success') {
                  var tr = document.getElementById(data.noticia.id)
                  var childs = tr.children

                  childs[0].innerHTML = data.noticia['traduccionEspanol.pieMedia']
                  childs[1].value = data.noticia['traduccionIngles.pieMedia']
                  childs[2].innerHTML = data.noticia.ubicacion
                  childs[3].innerHTML = data.noticia.tipo
                  childs[4].value = data.noticia.datosAutor

                  div.classList.add('alert-success')
                  div.innerHTML = 'Media actualizada'
              } else {

                  div.classList.add('alert-danger')
                  div.innerHTML = "ERROR al momento de actualizar, consulte su manual de usuario"

              }

              hiddenUpdate.appendChild(div)
          })
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
