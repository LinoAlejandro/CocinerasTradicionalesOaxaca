package cocinerastradicionalesoaxaca

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "general", action: "index")
        "/convocatoria"(view:'/convocatoria')
        "/acercade"(view:'/acercade')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
