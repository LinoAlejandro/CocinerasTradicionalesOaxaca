<!DOCTYPE html>
<g:set var="format" value="yyyy-MM-dd'T'hh:mm"/>
<html>
<head>
  <meta name="layout" content="basic">
  <title>
  	Iniciar Registro
  </title>
  <asset:stylesheet src="registro/base.css" />
</head>
<body>
	<div class="container-fluid bg-dark-purp p-5">
		<div class="row align-items-center justify-content-center text-light " data-aos="flip-up"> 
			<div class="col-xl-4 col-lg-5 col-md-8">
				<asset:image class="img img-fluid " src="logo.png"/>
			</div>
			<div class="col-xl-8 col-lg-7 col-md-8">
				<div class="display-2 lobster text-center lobster" >
					Cree su perfil (1/3)
					<div class="lead cabin mt-4">
						*Rellene el formulario con la información correspondiente
					</div>
				</div>
			</div>
		</div>
	</div>

	<g:form name="formcreate" action="registroCocinera" enctype="multipart/form-data">
			<div class="container">
				<div class="row cabin">
					<div class="col-md-12 rounded rounded px-4 border " id="personalDataContainer">
						<div class="row pt-4">
							<div class="col-md-12 display-3 text-center lobster">
								Datos Personales 
								<i class="fas fa-user-circle text-purple"></i>
							</div>
							<div class="col-md-6 mt-2">
								<div class="form-group">
									<label for="">Nombre(s) *</label>
									<input type="text" class="form-control" name="nombres" value="${cocinera?.nombres}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="form-group">
									<label for="">Apellidos *</label>
									<input type="text" class="form-control" name="apellidos" value="${cocinera?.apellidos}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="form-group">
									<label for="">Fecha de nacimiento *</label>
									<input type="datetime-local" class="form-control" name="fechaNacimiento" value="${cocinera?.fechaNacimiento?.format(format)}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="form-group">
									<label for="">Curp *</label>
									<input type="text" class="form-control" name="curp" value="${cocinera?.curp}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="form-group">
									<label for="">Teléfono fijo</label>
									<input type="number" class="form-control" name="telefonoFijo" value="${cocinera?.telefonoFijo}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="form-group">
									<label for="">Teléfono celular</label>
									<input type="number" class="form-control" name="telefonoCelular"  value="${cocinera?.telefonoCelular}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="form-group">
									<label for="">Correo electrónico</label>
									<input type="email" class="form-control" name="correoElectronico"  value="${cocinera?.correoElectronico}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="form-group">
									<label for="">Suba una foto o archivo pdf de su document oficial de cocinera</label>
									<input type="file" name="file" class="form-control">
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12 rounded rounded px-4 border" id="addressDataContainer">
						<div class="row pt-4"> 
							<div class="col-md-12 display-3 text-center lobster">
								Datos de su domicilio 
								<i class="fas fa-globe-americas text-green"></i>
							</div>
							<div class="col-md-12">
								Puede dar click en su domicilio en el mapa o puede rellenar manualmente los campos
								<input type="text" id="searchParams">
								<div id="map" style="height: 400px" class="mb-4">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<label for="">Región geográfica *</label>
								<select name="regionGeografica" class="form-control">
									<option disabled selected hidden id="comodin">Seleccione la opción correcta</option>
									<option value="Costa" id="Costa">Costa</option>
									<option value="Istmo" id="Istmo">Istmo</option>
									<option value="Sierra Norte" id="Sierra_Norte">Sierra Norte</option>
									<option value="Sierra Sur" id="Sierra_Sur">Sierra Sur</option>
									<option value="Tehuantepec" id="Tehuantepec">Tehuantepec</option>
									<option value="Valles Centrales" id="Valles_Centralles">Valles Centrales</option>
								</select>
								<script type="text/javascript">
										var regionGeografica = '${cocinera?.regionGeografica}'
										var comodin = document.getElementById('comodin')
										if(regionGeografica != '') {
												comodin.removeAttribute('selected')
												regionGeografica = regionGeografica.replace(' ', '_')
												var option = document.getElementById(regionGeografica)
												option.setAttribute('selected', 'selected')
												console.log(regionGeografica)
										}
								</script>
							</div>
							<div class="col-md-6 mt-2">
								<label for="">Municipio *</label>
								<input type="text" class="form-control" name="municipio" value="${cocinera?.municipio}">
							</div>
							<div class="col-md-6 mt-2">
								<label for="">Agencia o Colonia *</label>
								<input type="text" class="form-control" name="agencia" value="${cocinera?.agencia}">
							</div>
							<div class="col-md-6 mt-2">
								<label for="">Calle *</label>
								<input type="text" class="form-control" name="calle" value="${cocinera?.calle}">
							</div>
							<div class="col-md-6 mt-2">
								<label for="">Número interior</label>
								<input type="text" class="form-control" name="noInt" value="${cocinera?.noInt}">
							</div>
							<div class="col-md-6 mt-2">
								<label for="">Número exterior</label>
								<input type="text" class="form-control" name="noExt" value="${cocinera?.noExt}">
							</div>
							<input type="hidden" name="latitud" id="latitud">
							<input type="hidden" name="longitud" id="longitud">
							<div class="col-md-12 h1 mt-4">
								Datos regionales
							</div>
							<div class="col-md-6 mt-2">
								<div class="group-form">
									<label for="">Etnia</label>
									<input type="text" class="form-control" name="etnia" value="${cocinera?.etnia}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="group-form">
									<label for="">Lengua Madre</label>
									<input type="text" class="form-control" name="lenguaMadre" value="${cocinera?.lenguaMadre}">
								</div>
							</div>
							<div class="col-md-6 mt-2">
								<div class="group-form">
									<label for="">Dialecto</label>
									<input type="text" class="form-control" name="dialecto" value="${cocinera?.dialecto}">
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12 rounded rounded px-4 border" id="bioDataContainer">
						<div class="row pt-4">
							<div class="col-md-12 display-3 text-center lobster">
								Datos de vida <i class="fab fa-gratipay text-red"></i>
							</div>
							<div class="col-md-12 mt-2">
								<div class="group-form">
									<label for="">Actividad preponderante</label>
									<textarea class="form-control" name="actividadPreponderante" id="actividadPreponderante" rows="5">${cocinera?.actividadPreponderante}</textarea>
								</div>
							</div>
							<div class="col-md-12 mt-2">
								<div class="group-form">
									<label for="">¿Cómo aprendió a cocinar?</label>
									<textarea class="form-control" name="descripcionComoAprendioCocinar" id="descripcionComoAprendioCocinar" rows="5">${cocinera?.descripcionComoAprendioCocinar}</textarea>
								</div>
							</div>
							<div class="col-md-12 mt-2">
								<div class="group-form">
									<label for="">¿Quién y cómo le enseñó a cocinar?</label>
									<textarea class="form-control" name="quienLeEnsenoCocinar" id="quienLeEnsenoCocinar" rows="5">${cocinera?.quienLeEnsenoCocinar}</textarea>
								</div>
							</div>
							<div class="col-md-12 mt-2">
								<div class="group-form">
									<label for="">¿A quién le ha enseñado a cocinar y cómo lo hizo?</label>
									<textarea class="form-control" name="aQuienEnsenoCocinar" id="aQuienEnsenoCocinar" rows="5">${cocinera?.aQuienEnsenoCocinar}</textarea>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12 my-4 px-4">
						<button class="btn bg-purple btn-lg text-light">Continuar registro</button>
					</div>
				</div>
			</div>
			<script>

					var personalDataContainerHTML = document.getElementById('personalDataContainer')
					var addressDataContainerHTML = document.getElementById('addressDataContainer')
					var bioDataContainerHTML = document.getElementById('bioDataContainer')

					var numberFieldsPersonal = document.getElementById('numberFieldsPersonal')
					var numberFieldsAddress = document.getElementById('numberFieldsAddress')
					var numberFieldsBio = document.getElementById('numberFieldsBio')

					function checkingPersonalData() {
			    		var inputs = personalDataContainerHTML.getElementsByTagName('input')
			    		var total = 0
			    		for (var i = 0; i < inputs.length; i++) {
			    				console.log(inputs[i].value)
			    				if(inputs[i].value) {
			    						total += 1
			    				}
			    		}

			    		numberFieldsPersonal.innerHTML = total
					}

					function checkingAddressData() {
							var inputs = addressDataContainerHTML.getElementsByTagName('input')
			    		var total = 1
			    		for (var i = 0; i < inputs.length; i++) {
			    				console.log(inputs[i].value)
			    				if(inputs[i].value) {
			    						total += 1
			    				}
			    		}

							numberFieldsAddress.innerHTML = total
					}

					function checkingBioData() {
							var inputs = bioDataContainerHTML.getElementsByTagName('textarea')
			    		var total = 0
			    		for (var i = 0; i < inputs.length; i++) {
			    				console.log(inputs[i].value)
			    				if(inputs[i].value) {
			    						total += 1
			    				}
			    		}
			    		console.log(total)

							numberFieldsBio.innerHTML = total
					}

					var inputs = document.querySelectorAll('#personalDataContainer input')
					console.log(inputs)

					for (var i = 0; i < inputs.length; i++) {
							inputs[i].addEventListener('keyup', checkingPersonalData)
							inputs[i].addEventListener('mouseout', checkingPersonalData)
					}

					addressDataContainerHTML.addEventListener('keyup', checkingAddressData)

					bioDataContainerHTML.addEventListener('keyup', checkingBioData)

					$('document').ready(function() {
							checkingPersonalData()
							checkingAddressData()
							checkingBioData()
					})

			</script>
		</div>
	</g:form>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBCjGKKCJZYfvAWDd-35EupFSIWDJjB5zk&libraries=places"></script>

	<script type="text/javascript">
	  var position = {lat: ${cocinera?.latitud ?: 17.0669}, lng: ${cocinera?.longitud ?: -96.7203}} 

	  var marker = new google.maps.Marker({
	      position: position
	  });

	  var map = new google.maps.Map(document.getElementById('map'), {
	      center: position, 
	      zoom: 13
	  });

	  marker.setMap(map);

	  var input = document.getElementById('searchParams');
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
	      var lat = document.getElementById('latitud')
	      var lon = document.getElementById('longitud')

	      lat.value = marker.getPosition().lat().toString()
	      lon.value = marker.getPosition().lng().toString()
	  })
	</script>

	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

  <script type="text/javascript">
		AOS.init({
			easing: 'ease-out-back',
			duration: 1800
		});
	</script>


</body>
</html>