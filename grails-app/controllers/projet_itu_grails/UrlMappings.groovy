package projet_itu_grails

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        //"/"(controller: 'user', action: 'index')
        "/"(view: "/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
