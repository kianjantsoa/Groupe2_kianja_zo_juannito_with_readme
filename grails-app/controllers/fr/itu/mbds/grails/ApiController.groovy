package fr.itu.mbds.grails

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.http.HttpServletResponse

@Secured('ROLE_ADMIN')
class ApiController {
UserService userService
AnnonceService annonceService
//    Singleton : GET / PUT / PATCH / DELETE
    def user() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                renderThis(userInstance, request.getHeader("Accept"))
                break
            case "PUT" :
                if(!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = User.get(params.id)
                if(!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                userInstance.setUsername(request.getJSON().username)
                userInstance.setPassword(request.getJSON().password)
                userInstance.setEnabled(request.getJSON().enabled)
                userInstance.setAccountLocked(request.getJSON().accountLocked)
                userInstance.setAccountExpired(request.getJSON().accountExpired)
                userInstance.setPasswordExpired(request.getJSON().passwordExpired)
                userInstance.save(flush: true , failOnError: true )
                return response.status =  HttpServletResponse.SC_OK
                break

            case "PATCH":
                if(!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = User.get(params.id)
                if(!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                if(request.getJSON().username)
                    userInstance.setUsername(request.getJSON().username)
                if(request.getJSON().password)
                    userInstance.setPassword(request.getJSON().password)
                if(request.getJSON().enabled)
                    userInstance.setEnabled(request.getJSON().enabled)
                if(request.getJSON().accountLocked)
                    userInstance.setAccountLocked(request.getJSON().accountLocked)
                if(request.getJSON().accountExpired)
                    userInstance.setAccountExpired(request.getJSON().accountExpired)
                if(request.getJSON().passwordExpired)
                    userInstance.setPasswordExpired(request.getJSON().passwordExpired)
                userInstance.save(flush: true , failOnError: true )
                return response.status =  HttpServletResponse.SC_OK
                break

            case "DELETE":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = User.get(params.id)
                if(!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                def userRole = UserRole.findByUser(userInstance)
                if(!userRole)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                userRole.delete(flush: true , failOnError: true)
                userInstance.delete(flush: true , failOnError: true)
                return response.status =  HttpServletResponse.SC_OK
                break

            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    Collection : GET / POST
    def users() {
        switch (request.getMethod()){
            case "GET" :
                def page = [
                    max: Math.min(Integer.parseInt(params.max) ?: 10, 100),
                    offset: 0
            ]
            def users = userService.list(page)
            renderThis(users,request.getHeader("Accept"))
            return response.status =  HttpServletResponse.SC_OK
            break

            case "POST" :
                def userInstance = new User(username: params.username, password: params.password,flush: true)
                def userSaved = userInstance.save(flush: true , failOnError: true)
                def roleInstance = Role.get(request.getJSON().roleId)
                def userRoleInstance = new UserRole(
                        role: roleInstance,
                        user: userSaved
                )
                userRoleInstance.save(flush: true, failOnError: true)
                return response.status = HttpServletResponse.SC_CREATED
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
    }

//    Singleton : GET / PUT / PATCH / DELETE
    def annonce() {
        switch (request.getMethod()){
            case "GET" :
                if(!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                renderThis(annonceInstance, request.getHeader("Accept"))
                break

            case "DELETE":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if(!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                annonceInstance.delete(flush: true , failOnError: true)
                return response.status = 200
                break

            case "PUT":
                if(!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if(!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                annonceInstance.setTitle(request.getJSON().title)
                annonceInstance.setDescription(request.getJSON().description)
                annonceInstance.setPrice((float)request.getJSON().price)
                annonceInstance.setStatus(request.getJSON().status)
                annonceInstance.save(flush : true, failOnError: true)
                return response.status =  HttpServletResponse.SC_OK
                break

            case "PATCH" :
                if(!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if(!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                if(request.getJSON().title)
                    annonceInstance.setTitle(request.getJSON().title)
                if(request.getJSON().description)
                    annonceInstance.setDescription(request.getJSON().description)
                if(request.getJSON().price)
                    annonceInstance.setPrice((float) request.getJSON().price)
                if(request.getJSON().status)
                    annonceInstance.setStatus(request.getJSON().status)
                annonceInstance.save(flush: true , failOnError : true)
                return response.status =  HttpServletResponse.SC_OK
                break

            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

//    Collection : GET / POST
    def annonces() {
        switch (request.getMethod()){
            case "GET" :
                def page  = [
                        max: Math.min(Integer.parseInt(params.max) ?: 10, 100),
                        offset: 0
                ]
                def annonceList = annonceService.list(page)
                renderThis(annonceList, request.getHeader("Accept"))
                return response.status = 200
            case "POST" :
                def author = User.get(params.authorId)
                if(!author)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                def annonceInstance = new Annonce()
                annonceInstance.setTitle(params.title)
                annonceInstance.setDescription(params.description)
                annonceInstance.setPrice(Float.parseFloat(params.price))
                annonceInstance.setStatus(Boolean.parseBoolean( params.status))
                List illustrationList = []
                try{
                    def files = request.getFiles("files")
                    if(files != null){
                        def pathImage = grailsApplication.config.getProperty('illustrations.path')
                        files.each {
                            oneFile ->
                                String filename = oneFile.getOriginalFilename()
                                println(pathImage  + filename)
                                println(pathImage + File.separatorChar + filename)

                                oneFile.transferTo(new File(pathImage  +""+ filename))
                                Illustration illu=new Illustration()
                                illu.annonce = annonceInstance
                                illu.filename =   filename
                                if(!filename.isEmpty())
                                    illustrationList.add(illu)
                        }
                    }
                }
                catch (Exception ex){
                    ex.printStackTrace()
                }
                if(!illustrationList.isEmpty()){
                    annonceInstance.illustrations = illustrationList
                }
                author.addToAnnonces(annonceInstance)
                author.save(flush: true, failOnError: true)
                return response.status = HttpServletResponse.SC_CREATED

            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }

    }


    
    def renderThis(Object instance, String accept)
    {
        switch(accept)
        {
            case "xml":
            case "text/xml":
            case "application/xml":
                render instance as XML
                break
            case "json":
            case "text/json":
            case "application/json":
                render instance as JSON
                break
        }
    }
}
