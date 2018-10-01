<!DOCTYPE html>
<g:set var="format" value="yyyy-MM-dd'T'hh:mm"/>
<html>
<head>
  <meta name="layout" content="basic">
  <title>
  	Registrar platillos
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
				<div class="display-3 lobster text-center lobster" >
					Agregue sus platillos (2/3)
					<div class="lead cabin mt-4">
					*Empiece por dar click en el botón azul "Agregar un nuevo platillo a la lista"
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container mb-5">
		<div class="row">
			<div class="col-lg-12">
				<div class="display-4 cabin mt-4">
					Lista de platillos de ${cocineraData.get(1).value}
				</div>
				<table class="table table-striped mb-5 mt-4 text-dark cabin rounded">
					<thead class="">
						<tr class="h3 lobster">
							<th scope="col">Nombre</th>
							<th scope="col">Tipo</th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody id="tablaPlatillos">
						<g:each var="mapPlatillo" in="${mapPlatillos}">
							<tr id="${mapPlatillo.platillo.id}">
								<td class="align-middle">${mapPlatillo.platillo.nombre}</td>
								<input type="hidden" value="${mapPlatillo.platillo.tipoPreparacion}">
								<input type="hidden" value="${mapPlatillo.platillo.origen}">
								<input type="hidden" value="${mapPlatillo.platillo.rendimiento}">
								<input type="hidden" value="${mapPlatillo.platillo.consumo}">
								<td class="align-middle">${mapPlatillo.platillo.tipoPlatillo}</td>
								<input type="hidden" value="${mapPlatillo.platillo.historia}">
								<input type="hidden" value="${mapPlatillo.platillo.razonPorPlatillo}">
								<input type="hidden" value="${mapPlatillo.platillo.modoPreparacion}">
								<input type="hidden" value="${mapPlatillo.platillo.formaConsumirPlatillo}">
								<input type="hidden" value="${mapPlatillo.ingredientes}">
								<td>
									<button type="button" class="btn btn-danger" onclick="deletePlatillo(this)">Eliminar</button>
								</td>
								<td>
									<button type="button" class="btn btn-secondary" onclick="setUpdateData(this)" data-toggle="modal" data-target="#modalUpdatePlatillo">Modificar</button>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<div id="messagePlatillos">
					<g:if test="${mapPlatillos.size() == 0}">
						<div class="my-5 display-4 text-center cabin text-secondary">
							Lista vacia
						</div>
					</g:if>
				</div>
			</div>
		</div>
		<div class="row cabin ml-1" >
			<a class="btn bg-purple text-light btn-md" href="${createLink(action:'inscribirConvocatoria')}">Continuar registro</a>
			<button type="button" class="btn bg-blue text-light ml-2 btn-md" data-toggle="modal" data-target="#modalAgregarPlatillo">
				Agregar un nuevo platillo a la lista
			</button>
		</div>
	</div>

	<div class="modal fade" id="modalAgregarPlatillo" tabindex="-1" aria-hidden="true" aria-labelledby="modalAgregarPlatilloLabel" role="dialog">
		<div class="modal-dialog modal-xl" role="document"> 
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						<div class="d-flex justify-content-between">
							<div class="h1 lobster"  id="modalAgregarPlatilloLabel">
								Agregue un platillo a su lista
								<i class="fas fa-utensils text-purple"></i>
							</div>
							<div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">
										&times;
									</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="row" id="formularioCreate">
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Nombre</label>
								<input type="text" class="form-control" name="nombre" id="nombre">
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Tipo de preparacion</label>
								<input type="text" class="form-control" name="tipoPreparacion" id="tipoPreparacion">
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Origen</label>
								<input type="text" class="form-control" name="origen" id="origen">
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Rendimiento</label>
								<input type="text" class="form-control" name="rendimiento" id="rendimiento">
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Consumo</label>
								<input type="text" class="form-control" name="consumo" id="consumo"></input> 
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Tipo de platillo </label>
								<select type="text" class="form-control" name="tipoPlatillo" id="tipoPlatillo">
									<option value="Cotidiano">Cotidiano</option>
									<option value="Ceremonial">Ceremonial</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Historia</label>
								<textarea class="form-control" name="historia" id="historia" rows=5></textarea> 
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Razón para escoger este platillo</label>
								<textarea class="form-control" name="razonPorPlatillo" id="razonPorPlatillo" rows=5></textarea>
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Modo de preparación</label>
								<textarea class="form-control" name="modoPreparacion" id="modoPreparacion" rows=5></textarea>
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Forma de consumir el platillo</label>
								<textarea class="form-control" name="formaConsumirPlatillo" id="formaConsumirPlatillo" rows=5></textarea>
							</div>
						</div>
						<div class="col-lg-12">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>Ingrediente</th>
										<th>Porción</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="tablaIngredientes">
								</tbody>
							</table>
							<div class="row">
								<div class="col-lg-6 form-group"> 
									<label for="">Nombre del ingrediente</label>
									<input type="text" id="nombreIngrediente" class="form-control">
								</div>
								<div class="col-lg-6 form-group"> 
									<label for="">Porción del ingrediente</label>
									<input type="text" id="porcionIngrediente" class="form-control">
								</div>
							</div>
						</div>
						<div id="hidden" class="col-lg-12 mx-auto px-2">
						</div>
						<div class="col-lg-12">
							<button class="btn btn-secondary" onclick="addIngrediente()">Agregar ingrediente</button>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
					<button type="button" class="btn bg-blue text-light" onclick="addPlatillo()">Agregar platillo</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalUpdatePlatillo" tabindex="-1" aria-hiddden="true" aria-labelledby="modalUpdatePlatilloLabel" role="dialog">
		<div class="modal-dialog modal-xl" role="document"> 
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title" id="modalAgregarPlatilloLabel">
						<div class="d-flex justify-content-between">
							<div class="h1 lobster ">
								Modifique un platillo
								<i class="fas fa-utensils text-purple"></i>
							</div>
							<div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">
										&times;
									</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="row" id="formularioUpdate">
						<input type="hidden" id="idPlatillo">
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Nombre</label>
								<input type="text" class="form-control" name="nombre" id="nombreUpdate" />
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Tipo de preparacion</label>
								<input type="text" class="form-control" name="tipoPreparacion" id="tipoPreparacionUpdate">
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Origen</label>
								<input type="text" class="form-control" name="origen" id="origenUpdate">
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Rendimiento</label>
								<input type="text" class="form-control" name="rendimiento" id="rendimientoUpdate">
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Consumo</label>
								<input type="text" class="form-control" name="consumo" id="consumoUpdate"></input> 
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Tipo de platillo </label>
								<select type="text" class="form-control" name="tipoPlatillo" id="tipoPlatilloUpdate">
									<option value="Cotidiano">Cotidiano</option>
									<option value="Ceremonial">Ceremonial</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Historia</label>
								<textarea class="form-control" name="historia" id="historiaUpdate" rows=5></textarea> 
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Razón para escoger este platillo</label>
								<textarea class="form-control" name="razonPorPlatillo" id="razonPorPlatilloUpdate" rows=5></textarea>
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Modo de preparación</label>
								<textarea class="form-control" name="modoPreparacion" id="modoPreparacionUpdate" rows=5></textarea>
							</div>
						</div>
						<div class="col-lg-6 mt-2">
							<div class="form-group">
								<label for="">Forma de consumir el platillo</label>
								<textarea class="form-control" name="formaConsumirPlatillo" id="formaConsumirPlatilloUpdate" rows=5></textarea>
							</div>
						</div>
						<div class="col-lg-12">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>Ingrediente</th>
										<th>Porción</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="tablaIngredientesUpdate">
								</tbody>
							</table>
							<div class="row">
								<div class="col-lg-6 form-group"> 
									<label for="">Nombre del ingrediente</label>
									<input type="text" id="nombreIngredienteUpdate" class="form-control">
								</div>
								<div class="col-lg-6 form-group"> 
									<label for="">Porción del ingrediente</label>
									<input type="text" id="porcionIngredienteUpdate" class="form-control">
								</div>
							</div>
						</div>
						<div id="hiddenUpdate">
						</div>
						<div class="col-lg-12">
							<button class="btn btn-secondary" onclick="addIngredienteUpdate(this)">Agregar ingrediente</button>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
					<button type="button" class="btn bg-blue text-light" onclick="upgradePlatillo()">Actualizar platillo</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
			
			var tablaPlatillos = document.getElementById('tablaPlatillos')
			var tablaIngredientes = document.getElementById('tablaIngredientes')
			var nombreIngrediente = document.getElementById('nombreIngrediente')
			var porcionIngrediente = document.getElementById('porcionIngrediente')

			var nombre = document.getElementById('nombre')
			var tipoPlatillo = document.getElementById('tipoPlatillo')
			var historia = document.getElementById('historia')
			var razonPorPlatillo = document.getElementById('razonPorPlatillo')
			var modoPreparacion = document.getElementById('modoPreparacion')
			var formaConsumirPlatillo = document.getElementById('formaConsumirPlatillo')
			var tipoPreparacion = document.getElementById('tipoPreparacion')
			var origen = document.getElementById('origen')
			var rendimiento = document.getElementById('rendimiento')
			var consumo = document.getElementById('consumo')
			var hidden = document.getElementById('hidden')

			var tablaIngredientesUpdate = document.getElementById('tablaIngredientesUpdate')
			var nombreIngredienteUpdate = document.getElementById('nombreIngredienteUpdate')
			var porcionIngredienteUpdate = document.getElementById('porcionIngredienteUpdate')

			var nombreUpdate = document.getElementById('nombreUpdate')
			var tipoPreparacionUpdate = document.getElementById('tipoPreparacionUpdate')
			var origenUpdate = document.getElementById('origenUpdate')
			var rendimientoUpdate = document.getElementById('rendimientoUpdate')
			var consumoUpdate = document.getElementById('consumoUpdate')
			var tipoPlatilloUpdate = document.getElementById('tipoPlatilloUpdate')
			var historiaUpdate = document.getElementById('historiaUpdate')
			var razonPorPlatilloUpdate = document.getElementById('razonPorPlatilloUpdate')
			var modoPreparacionUpdate = document.getElementById('modoPreparacionUpdate')
			var formaConsumirPlatilloUpdate = document.getElementById('formaConsumirPlatilloUpdate')
			var hiddenUpdate = document.getElementById('hiddenUpdate')

			var idPlatillo = document.getElementById('idPlatillo')

			var messagePlatillos = document.getElementById('messagePlatillos')

			function addIngrediente() {
					if(nombreIngrediente.value && porcionIngrediente.value) {
							var tr = document.createElement('tr')

							var nombreIngredienteTd = document.createElement('td')
							var porcion = document.createElement('td')
							var eliminar = document.createElement('td')

							var deleteButton = document.createElement('button')
							deleteButton.classList.add('btn')
							deleteButton.classList.add('btn-danger')
							deleteButton.innerHTML = 'Eliminar'

							deleteButton.setAttribute('onclick', 'deleteIngrediente(this)')

							nombreIngredienteTd.innerHTML = nombreIngrediente.value
							porcion.innerHTML = porcionIngrediente.value

							eliminar.appendChild(deleteButton)

							tr.appendChild(nombreIngredienteTd)
							tr.appendChild(porcion)
							tr.appendChild(eliminar)

							tablaIngredientes.appendChild(tr)
					}
			}

			function addPlatillo() {
					var formularioCreate = document.getElementById('formularioCreate')
					console.log(formularioCreate.getElementsByTagName('input'))
					var ingredientes = []
					var tdElementsTablaIngredientes = tablaIngredientes.getElementsByTagName('tr')
					for (var i = 0; i < tdElementsTablaIngredientes.length; i++) {
							var tdElements = tdElementsTablaIngredientes[i].getElementsByTagName('td')
							var ingredienteString = tdElements[0].innerHTML.replace(',', '') + "|" + tdElements[1].innerHTML.replace(',', '')
							ingredientes.push(ingredienteString)
					}

					var url = '${createLink(action:"addPlatillo")}'
					var data = {
							nombre: nombre.value,
							tipoPlatillo: tipoPlatillo.value,
							historia: historia.value,
							razonPorPlatillo: razonPorPlatillo.value,
							modoPreparacion: modoPreparacion.value,
							formaConsumirPlatillo: formaConsumirPlatillo.value,
							tipoPreparacion: tipoPreparacion.value,
							origen: origen.value,
							rendimiento: rendimiento.value,
							consumo: consumo.value,
							ingredientes: ingredientes,
							cocinera: ${cocineraData.get(0).value}
					}

					console.log(data)

					$.post(url, data, function(data, status) {
							console.log(data, status)
							hidden.innerHTML =''
							var div = document.createElement('div')
							div.classList.add('alert')

							if(status == 'success') {

									var tr = document.createElement('tr')
									tr.id = data.platilloJSON.id			

									var nombrePlatilloTd = document.createElement('td') //elemento visible-
									nombrePlatilloTd.classList.add('align-middle')

									/*Elementos no visibles*/
									var tipoPreparacionElm = document.createElement('input')
									var origenElm = document.createElement('input')
									var rendimientoElm = document.createElement('input')
									var consumoElm = document.createElement('input')

									var tipoPlatilloElm = document.createElement('td') //elemento visible
									tipoPlatilloElm.classList.add('align-middle')

									/*Elementos no visibles*/
									var historiaElm = document.createElement('input')
									var razonPorPlatilloElm = document.createElement('input')
									var modoPreparacionElm = document.createElement('input')
									var formaConsumirPlatilloElm = document.createElement('input')
									var ingredientesElm = document.createElement('input') //Consideraciones

									var eliminar = document.createElement('td') //elemento visible
									var modificar = document.createElement('td') //elemento visible

									nombrePlatilloTd.innerHTML = data.platilloJSON.nombre
									tipoPreparacionElm.value = data.platilloJSON.tipoPreparacion
									origenElm.value = data.platilloJSON.origen
									rendimientoElm.value = data.platilloJSON.rendimiento
									consumoElm.value = data.platilloJSON.consumo
									tipoPlatilloElm.innerHTML = data.platilloJSON.tipoPlatillo
									historiaElm.value = data.platilloJSON.historia
									razonPorPlatilloElm.value = data.platilloJSON.razonPorPlatillo
									modoPreparacionElm.value = data.platilloJSON.modoPreparacion
									formaConsumirPlatilloElm.value = data.platilloJSON.formaConsumirPlatillo
									ingredientesElm.value = "[" + data.platilloJSON.ingredientes + "]"

									tipoPreparacionElm.setAttribute('type', 'hidden')
									origenElm.setAttribute('type', 'hidden')
									rendimientoElm.setAttribute('type', 'hidden')
									consumoElm.setAttribute('type', 'hidden')
									historiaElm.setAttribute('type', 'hidden')
									razonPorPlatilloElm.setAttribute('type', 'hidden')
									modoPreparacionElm.setAttribute('type', 'hidden')
									formaConsumirPlatilloElm.setAttribute('type', 'hidden')
									ingredientesElm.setAttribute('type', 'hidden')

									var deleteButton = document.createElement('button')
									deleteButton.classList.add('btn')
									deleteButton.classList.add('btn-danger')
									deleteButton.innerHTML = 'Eliminar'

									deleteButton.setAttribute('onclick', 'deletePlatillo(this)')

									var updateButton = document.createElement('button')
									updateButton.classList.add('btn')
									updateButton.classList.add('btn-secondary')
									updateButton.innerHTML = 'Modificar'

									updateButton.setAttribute('onclick', 'setUpdateData(this)')
									updateButton.setAttribute('data-toggle', 'modal')
									updateButton.setAttribute('data-target', '#modalUpdatePlatillo')

									tr.appendChild(nombrePlatilloTd)
									tr.appendChild(tipoPreparacionElm)
									tr.appendChild(origenElm)
									tr.appendChild(rendimientoElm)
									tr.appendChild(consumoElm)
									tr.appendChild(tipoPlatilloElm)
									tr.appendChild(historiaElm)
									tr.appendChild(razonPorPlatilloElm)
									tr.appendChild(modoPreparacionElm)
									tr.appendChild(formaConsumirPlatilloElm)
									tr.appendChild(ingredientesElm)
									eliminar.appendChild(deleteButton)
									tr.appendChild(eliminar)
									modificar.appendChild(updateButton)
									tr.appendChild(modificar)

									tablaPlatillos.appendChild(tr)

									div.classList.add('alert-success')
									div.innerHTML = 'El platillo se ha almacenado exitosamente'

									tablaIngredientes.innerHTML = ""
									nombre.value = ""
									nombre.value = ""
									historia.value = ""
									razonPorPlatillo.value = ""
									modoPreparacion.value = ""
									formaConsumirPlatillo.value = ""
									tipoPreparacion.value = ""
									origen.value = ""
									rendimiento.value = ""
									consumo.value = ""

									messagePlatillos.innerHTML = ''
							} else {
									div.classList.add('alert-danger')
									div.innerHTML = 'El platillo no se ha almacenado, consulte el manual de usuario otorgado para más información'
							}

							hidden.appendChild(div)
					})
			}

			function deletePlatillo(elm) {
					var parent = elm.parentNode.parentNode
					var idParent = parent.id
					console.log(idParent)
					var url = "${createLink(action:'deletePlatillo')}"
					var data = {
							id:idParent
					}
					$.post(url, data, function(data, status) {
							if(status == 'success') {
									parent.parentNode.removeChild(parent)
							} else {
								console.log('delete error')
							}
					})
			}

			function deleteIngrediente(elm) {
					console.log(elm.parentNode.parentNode)
					console.log(tablaIngredientes)
					tablaIngredientes.removeChild(elm.parentNode.parentNode)
			}

			function setUpdateData(elm) {
					var parent = elm.parentNode.parentNode
					var childs = parent.children
					console.log(childs)
					console.log('father and dish id')
					console.log(parent.id)
					idPlatillo.value = parent.id
					nombreUpdate.value = childs[0].innerHTML
					tipoPreparacionUpdate.value = childs[1].value
					origenUpdate.value = childs[2].value
					rendimientoUpdate.value = childs[3].value
					consumoUpdate.value = childs[4].value
					tipoPlatilloUpdate.value = childs[5].innerHTML
					historiaUpdate.value = childs[6].value
					razonPorPlatilloUpdate.value = childs[7].value
					modoPreparacionUpdate.value = childs[8].value
					formaConsumirPlatilloUpdate.value = childs[9].value

					var ingredientes = childs[10].value
					console.log(ingredientes)
					ingredientes = ingredientes.substring(1, ingredientes.length-1)
					ingredientes = ingredientes.split(', ').join(',')
					console.log(ingredientes)

					var ingredientesArray

					tablaIngredientesUpdate.innerHTML = ''

					if(ingredientes) {
							ingredientesArray = ingredientes.split(',')

							for(var i = 0; i < ingredientesArray.length; i++) {
									var ingrediente = ingredientesArray[i].split('|')
									console.log(ingrediente)
									var tr = document.createElement('tr')
									var nombre = document.createElement('td')
									var porcion = document.createElement('td')

									var eliminar = document.createElement('td')

									var deleteButton = document.createElement('button')
									deleteButton.classList.add('btn')
									deleteButton.classList.add('btn-danger')
									deleteButton.innerHTML = 'Eliminar'

									deleteButton.setAttribute('onclick', 'deleteIngredienteUpdate(this)')

									eliminar.appendChild(deleteButton)

									nombre.innerHTML = ingrediente[0]
									porcion.innerHTML = ingrediente[1]

									tr.appendChild(nombre)
									tr.appendChild(porcion)
									tr.appendChild(eliminar)

									tablaIngredientesUpdate.appendChild(tr)
							}
					}
			}

			function deleteIngredienteUpdate(elm) {
					var parent = elm.parentNode.parentNode
					var tds = parent.getElementsByTagName('td')
					var parentRow = document.getElementById(idPlatillo.value)
					var ingredientesInput = parentRow.children[10]
					console.log("Checking parent row")
					console.log(parentRow)
					console.log("Checking ingredientesInput")
					console.log(ingredientesInput)
					var tdsContent = tds[0].innerHTML + '|'  + tds[1].innerHTML
					console.log(tds[0].innerHTML)
					console.log(tds[1].innerHTML)
					console.log(tdsContent)
					console.log(idPlatillo.value)

					var url = '${createLink(action:"deleteIngrediente")}'
					var data = {
							ingredienteString: tdsContent,
							idPlatillo: idPlatillo.value
					}

					$.post(url, data, function(data, status) {
							console.log(data, status)
							if(status == 'success') {
									parent.parentNode.removeChild(parent)
									var tr = tablaIngredientesUpdate.getElementsByTagName('tr')
									var ingredientesNuevosString = "["
									for (var i = 0; i < tr.length; i++) {
											var tds = tr[i].getElementsByTagName('td')
											ingredientesNuevosString += tds[0].innerHTML + "|" + tds[1].innerHTML + ","
									}
									ingredientesNuevosString += "]"
									ingredientesNuevosString = ingredientesNuevosString.replace(",]", "]")
									//ingredientesNuevosString = ingredientesNuevosString.replace(", ]", "]") *validate case
									console.log('checking data tds integrity')
									console.log(tds)
									ingredientesInput.value = ingredientesNuevosString
									console.log(ingredientesNuevosString)
									console.log(ingredientesInput.value)
							}
					})
			}

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
