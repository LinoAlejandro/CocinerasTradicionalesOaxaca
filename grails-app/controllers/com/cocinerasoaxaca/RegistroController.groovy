package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured
import java.security.MessageDigest
import grails.converters.JSON
import javax.servlet.http.Cookie
import javax.servlet.http.HttpServletRequest
import java.util.ArrayList

class RegistroController {

	def sessionFactory

	@Secured('permitAll')
	def iniciarRegistro() {
		println '\n\nIn iniciar registro action'
		ArrayList<Cookie> cookies = getCookies(request)
		println 'checking cookies size'
		println cookies.size()
		if(cookies.size() > 0) {
			redirect action:'registroPlatillos'
			return
		}
		if(request.method == 'POST') {
			def ubicacion = request.getServletContext().getRealPath("/") + 'pass.txt'
			File file = new File(ubicacion)

			String passSha1 = file.text

			MessageDigest sha1 = MessageDigest.getInstance('SHA1')
			byte[] bytes = sha1.digest(params.pass?.getBytes())
			def pass = new BigInteger(1, bytes).toString(16)

			println pass
			println passSha1

			println 'checking pass'
			if(pass == passSha1) {
				println 'success'
				session.registro = true
				println 'accesing registro cocinera'
				redirect action:'registroCocinera'
				return
			} else {
				println 'error'
				flash.message = 'Su clave de acceso a cambiado o es incorrecta, intente de nuevo'
				return
			}
		}
	}

	@Secured('permitAll')
	def registroCocinera(Cocinera cocinera) {
		println '\n\nIn registro cocineras action'
		ArrayList<Cookie> cookies = getCookies(request)
		println 'checking cookies size'
		println cookies.size()
		if(cookies.size() > 0) {
			redirect action:'registroPlatillos'
			return
		} else if(!session.registro) {
			redirect action:'iniciarRegistro'
			flash.message = 'Su clave de acceso a cambiado o es incorrecta, intente de nuevo'
			return
		}
		if(request.method == 'POST') {
			def file = params.file
			println params.file
			println file
			cocinera.fechaRegistro = new Date()
			cocinera.isActiva = false
			println (cocinera.validate() && file && file.getOriginalFilename())
			println (cocinera.validate())
			println cocinera.errors
			println file
			println file.getOriginalFilename() == ''
			
			if(cocinera.validate() && file && file.getOriginalFilename()) {
				println 'checking file original name'
				def originalFilename = file.getOriginalFilename()
				println originalFilename
				def path = request.getServletContext().getRealPath("/") + "archivosCocineras"
				def dest = new File(path, '')

				if(!dest.exists())
					dest.mkdirs()

				def destination = new File(dest, params.curp + "." + (file.getOriginalFilename().split('\\.')[1]))
				file.transferTo(destination)

				cocinera.ubicacionArchivo = destination.getAbsolutePath()

				println cocinera.ubicacionArchivo

				println '\nvalidation data'
				println cocinera.validate()
				println cocinera.errors.getClass().getCanonicalName()
				println cocinera.errors
				def user = new User(username:cocinera.curp, password:cocinera.curp)

				if(cocinera.save()) {
					println cocinera.nombres.split(' ')
					println 'cocinera primer nombre'
					println cocinera.nombres.split(' ')[0]
					Cookie cookieCocineraId = new Cookie('cocineraId', cocinera.id.toString())
					Cookie cookieCocineraNombre = new Cookie('cocineraNombre', cocinera.nombres.split(' ')[0])

					cookieCocineraId.setMaxAge(43200)
					cookieCocineraNombre.setMaxAge(43200)

					cookieCocineraId.setPath('/')
					cookieCocineraNombre.setPath('/')

					response.addCookie cookieCocineraId
					response.addCookie cookieCocineraNombre

					redirect action:'registroPlatillos'
				}
			}
		}
		[cocinera:cocinera]	
	}

	@Secured('permitAll')
	def registroPlatillos() {
		println '\n\nIn registro platillos action'
		ArrayList<Cookie> cookies = getCookies(request)
		println 'checking cookies size'
		println cookies.size()
		if (cookies.size() == 0) {
			if(!session.registro) {
				println 'no active session registro'
				redirect action:'iniciarRegistro'
				return 
			}
			println 'no cookies in existance'
			redirect action:'registroCocinera'
			return 
		}
		println '\n\n\n\n\nhere'
		println session.cocinera
		def platillos = Platillo.findAll {
			eq('cocinera.id', Long.parseLong(cookies.get(0).value))
		}

		def mapPlatillos = []
		def sesion = sessionFactory.currentSession

		platillos.each { platillo ->
			def query = "SELECT ingredientes_string FROM platillo_ingredientes where platillo_id = " + platillo.id
			def ingredientes = sesion.createSQLQuery(query).list()
			def platilloIngredientes = [platillo:platillo, ingredientes:ingredientes]
			mapPlatillos.add(platilloIngredientes)
		}

		println 'mapPlatillos content'
		println mapPlatillos

		[mapPlatillos: mapPlatillos, cocineraData:cookies]
	}

	@Secured('permitAll')
	def addPlatillo(Platillo platillo) {
		println '\n\n\n\nIn addPlatillo action in registro controller'
		println 'Printing the platillo'
		platillo.cocinera = Cocinera.get(params.cocinera)
		println platillo
		println 'platillo cocinera'
		println platillo.cocinera
		def ingredientes = params['ingredientes[]']
		ingredientes.each { ingrediente ->
			println ingrediente
			platillo.addToIngredientes(ingrediente)
		}
		println platillo.ingredientes
		println platillo.validate()
		println platillo.errors
		println params
		println 'checking platillo cocinera'
		println platillo.cocinera
		println params.cocinera
		if(params['ingredientes[]']) {
			if(platillo.save(flush:true)) {
				response.status = 200
				render(contentType:'application/json') {
					platilloJSON(id:platillo.id,
						nombre:platillo.nombre,
						tipoPlatillo: platillo.tipoPlatillo,
						historia: platillo.historia ,
						razonPorPlatillo: platillo.razonPorPlatillo ,
						modoPreparacion: platillo.modoPreparacion ,
						formaConsumirPlatillo: platillo.formaConsumirPlatillo ,
						tipoPreparacion: platillo.tipoPreparacion ,
						origen: platillo.origen ,
						rendimiento: platillo.rendimiento ,
						consumo: platillo.consumo,
						ingredientes: platillo.ingredientes
					)
				}
				return
			}
		}

		response.status = 204
		return [] as JSON
	}

	@Secured('permitAll')
	def inscribirConvocatoria() {
		def currentDate = new Date()
		def convocatoria = CocinerasConcurso.find {
			ge('fechaInicio', currentDate)
		}
	}

	@Secured('permitAll')
	def deletePlatillo() {
		if(session.cocinera != params.id) {
			redirect action:'iniciarRegistro'
		}

		def delete = Platillo.executeUpdate('DELETE FROM Platillo where id=:idPlatillo', [idPlatillo:Long.parseLong(params.id)])
		if(delete) {
			response.status = 200
		} else {
			response.status = 204
		}
	}

	@Secured('permitAll')
	def deleteIngrediente() {
		println '\n\n\n\nIn delete ingredientes'
		println params
		def sesion = sessionFactory.currentSession
		def query = 'DELETE FROM platillo_ingredientes where ingredientes_string = "' + params.ingredienteString + '" and platillo_id = ' + params.idPlatillo + ' limit 1'
		println query
		def sqlQuery = sesion.createSQLQuery(query)
		def total = sqlQuery.executeUpdate()
		if(total > 0) {
			response.status = 200
		} else {
			response.status = 204
		}
	}

	private ArrayList<Cookie> getCookies(HttpServletRequest request) {
		println '\n\nIn get cookies'
		ArrayList<Cookie> cookies = request.cookies.findAll { ( it.name == 'cocineraId' || it.name == 'cocineraNombre') }.sort{it.name}
		return cookies
	}
}
