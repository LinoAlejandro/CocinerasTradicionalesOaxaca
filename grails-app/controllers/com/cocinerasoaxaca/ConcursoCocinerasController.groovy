package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import java.security.MessageDigest

class ConcursoCocinerasController {

	def sessionFactory

	@Secured('ROLE_ADMIN')
    def index() {
        println '\n\nIn index action'
    	if(!params) {
    		params.max = 10
    	}

    	[convocatorias:CocinerasConcurso.list(params), convocatoriasCount:CocinerasConcurso.count()]
    }

    @Secured('ROLE_ADMIN')
    def create() {
        def convocatoria = new CocinerasConcurso(params)
        println '\n\nIn create action concurso cocinera controller'
    	if(request.method ==  'POST') {
			def file = request.getFile('file')
    		if(file && (file.getOriginalFilename() != '')) {
                def sesion = sessionFactory.currentSession
                def ubicacion = request.getServletContext().getRealPath("/") + "convocatoria"
                File fileDest = new File(ubicacion,"")

                if(!fileDest.exists())
                    fileDest.mkdirs()

                def destination = new File(fileDest, params.numeroConvocatoria + "-" + params.anioConvocatoria + ".pdf")                    
                params.ubicacionArchivo = destination.getAbsolutePath()

                def insertionQuery = "INSERT INTO cocineras_concurso(version, fecha_inicio, anio_convocatoria, lugar, latitud, longitud, fecha_final, numero_convocatoria, ubicacion_archivo) " +
                    "VALUES(0, '" +
                    params.fechaInicio + "', " +
                    params.anioConvocatoria + ", '" +
                    params.lugar + "', '" +
                    params.latitud + "', '" + 
                    params.longitud + "', '" +
                    params.fechaFinal + "', " +
                    params.numeroConvocatoria + ", '" +
                    params.ubicacionArchivo + "');"

                def sqlQueryInsertion = sesion.createSQLQuery(insertionQuery)

                if(sqlQueryInsertion.executeUpdate() > 0) {

                    def convocatoriaSql = sesion.createSQLQuery('SELECT * FROM cocineras_concurso ORDER BY id desc limit 1')
                    convocatoria = convocatoriaSql.with {
                        addEntity(CocinerasConcurso)
                        list()
                    }

                    convocatoria = convocatoria[0]

                    file.transferTo(destination)

                    if(session.concursos.size() > 0) {
                        def query = "INSERT INTO concurso(descripcion, version, convocatoria_id) VALUES"
                        session.concursos.each {
                            query = query + "('" + it.descripcion + "', 0, " + convocatoria.id.toString() + ")," 
                        }

                        query = query.substring(0, query.size() -1) + ";"
                        def sqlQuery = sesion.createSQLQuery(query)
                        def totalInsertionsConcursoTb = sqlQuery.executeUpdate()
                        println 'Total of rows inserted in concurso table'
                        println totalInsertionsConcursoTb
                    }
	    	    	
	    	    	session.concursos = null
	    	    	redirect action:'index'
	    	    	return
	    	    }
        	}
		} else {
			session.concursos = new ArrayList<Concurso>()
		}
    	[convocatoria:convocatoria]
    }

    @Secured('ROLE_ADMIN')
    def update() {
        println '\n\nIn update action convocatoria controller'
        println request.method

        def sesion = sessionFactory.currentSession
        def query = 'SELECT * FROM cocineras_concurso where id=' + params.id
        def sqlQuery = sesion.createSQLQuery(query)

        //Retrieving data like this to minimize query usage
        def convocatoria = sqlQuery.with {
            addEntity(CocinerasConcurso)
            list()
        }

        convocatoria = convocatoria[0]

        if(params.numeroConvocatoria && params.anioConvocatoria) {
            println 'it has numero convocatoria and anioConvocatoria parameters'
        }

    	if(request.method ==  'POST') {
            println 'in post method'
            convocatoria.properties = params
            
			def file = request.getFile('file')
            def destination = ''
            def ubicacion = request.getServletContext().getRealPath("/") + "convocatoria"
            File fileDest = new File(ubicacion, "")

    		if(file && (file.getOriginalFilename() != '')) {
                println 'has file parameter'

                println convocatoria.ubicacionArchivo
                def currentFile = new File(convocatoria.ubicacionArchivo)
                println currentFile.exists()
                println currentFile.delete()
	        	
	        	if(!fileDest.exists())
	        		fileDest.mkdirs()
	        	destination = new File(fileDest, params.numeroConvocatoria + "-" + params.anioConvocatoria + ".pdf")
	    	    params.ubicacionArchivo = destination.getAbsolutePath()
        	} else if(params.numeroConvocatoria && params.anioConvocatoria) {
                println 'in has no file, but changing file ubication'
                destination = new File(fileDest, params.numeroConvocatoria + "-" + params.anioConvocatoria + ".pdf")
                params.ubicacionArchivo = destination.getAbsolutePath()
                file = new File(convocatoria.ubicacionArchivo)
            }

            if(session.concursos.size() > 0) {
                def queryInsertConcurso = "INSERT INTO concurso(descripcion, version, convocatoria_id) VALUES"
                session.concursos.each {
                    queryInsertConcurso = queryInsertConcurso + "('" + it.descripcion + "', 0, " + convocatoria.id.toString() + ")," 
                }

                queryInsertConcurso = queryInsertConcurso.substring(0, queryInsertConcurso.size() -1) + ";"
                def sqlQueryInsertConcurso = sesion.createSQLQuery(queryInsertConcurso)
                def totalInsertionsConcursoTb = sqlQueryInsertConcurso.executeUpdate()
                println 'Total of rows inserted in concurso table'
                println totalInsertionsConcursoTb
            }
                    
            def updateQuery = "UPDATE cocineras_concurso SET" +
                " version=" + 0 + 
                " ,fecha_inicio='" + params.fechaInicio + "'" +
                " ,anio_convocatoria=" + params.anioConvocatoria + 
                " ,lugar='" + params.lugar + "'" +
                " ,latitud='" + params.latitud + "'" +
                " ,longitud='" + params.longitud + "'" + 
                " ,fecha_final='" + params.fechaFinal + "'" + 
                " ,numero_convocatoria=" + params.numeroConvocatoria + 
                " ,ubicacion_archivo='" + (params.ubicacionArchivo ?: convocatoria.ubicacionArchivo) + "'" +
                " WHERE id=" + params.id

            def queryUpdate = sesion.createSQLQuery(updateQuery)

            if(queryUpdate.executeUpdate() > 0) {
                if(destination != '') {
                    println file.getClass().getCanonicalName()
                    if(file.getClass().getCanonicalName().equals('java.io.File')) {
                        file.renameTo(destination)
                    } else {
                        file.transferTo(destination)    
                    }
                    
                }
                session.concursos = null
                println 'redirecting to index'
                redirect action:'index'
                return
            }
		} else {
            session.concursos = new ArrayList<Concurso>()
        }

    	[convocatoria:convocatoria, concursos:Concurso.findAll {eq('convocatoria.id', Long.parseLong(params.id))}]
    }

    @Secured('ROLE_ADMIN')
    def delete() {
    	def update = CocinerasConcurso.executeUpdate("delete from CocinerasConcurso where id=?", [Long.parseLong(params.id)])
    	redirect action:'index', params:params
    }

    @Secured('ROLE_ADMIN')
    def addConcurso() {
        println '\n\nIn add Concurso controller'
    	def concurso = new Concurso(params)
        println params
    	if(concurso.validate()) {
    		session.concursos.add(concurso)
    		response.status = 200
    		render(contentType:'application/json') {
    			concursoJSON(descripcion:concurso.descripcion)
    		}
		} else {
			response.status = 204
			return [] as JSON
		}
    }

    @Secured('ROLE_ADMIN')
    def saveConcurso(Concurso concurso) {
    	if(concurso.save()) {
            response.status = 200
            render(contentType: "application/json") {
                concursoJSON(
                    id: concurso.id,
                    descripcion: concurso.descripcion)
            }
        } else {
            response.status = 204
            return [] as JSON
        }
    }

    @Secured('ROLE_ADMIN')
    def deleteConcurso() {
    	def delete = Concurso.executeUpdate('delete from Concurso where id=:id', [id: Long.parseLong(params.id)])
    	if(delete > 0) {
    		response.status = 200
    	} else {
    		response.status = 204
    	}
    }

    @Secured('ROLE_ADMIN') 
    def changePassword() {
        if(params.pass) {
            def ubicacion = request.getServletContext().getRealPath("/") + 'pass.txt'
            File file = new File(ubicacion)

            MessageDigest sha1 = MessageDigest.getInstance('SHA1')
            byte[] bytes = sha1.digest(params.pass.getBytes())
            def pass = new BigInteger(1, bytes).toString(16)
            println pass

            file.text = pass
            
            response.status = 200
        } else {
            response.status = 204
        }
    }
}