package fr.itu.mbds.grails

import grails.plugin.springsecurity.annotation.Authorities
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest
import org.springframework.web.servlet.ModelAndView

import javax.servlet.http.Part

import static org.springframework.http.HttpStatus.*


@Secured(['ROLE_ADMIN','ROLE_MODO'])
class AnnonceController {

    AnnonceService annonceService
    UserService userService
    IllustrationService illustrationService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond annonceService.list(params), model:[annonceCount: annonceService.count()]
    }

    def show(Long id) {
        respond annonceService.get(id)
    }

    def create() {
        params.author = userService.list()
        respond new Annonce(params)
    }

    def save(Annonce annonce ) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
           def newAnnonce =  annonceService.save(annonce)
           def imageList = request.getMultiFileMap().get("illustration[]").toList()
            //get upload path
           def path  = grailsApplication.config.getProperty('illustrations.path')
            //upload file
           imageList.each{
                item ->
                    def obj = item
                    obj.transferTo(new File(path+""+obj.filename))
                    def illustration = new Illustration("filename" : obj.filename,"annonce" : newAnnonce.getId())
                    illustrationService.save(illustration)
            }
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        return new ModelAndView("/annonce/edit", [annonce: annonceService.get(id), user:  userService.list()])
    }

    def update(Annonce annonce ) {
         //annonce.price = (int) annonce.price
        if (annonce == null) {
            notFound()
            return
        }
        def path  = grailsApplication.config.getProperty('illustrations.path')
        List<Part> parts = new ArrayList<Part>()
        List<Object> names = new ArrayList< >()
        //get file from view
        for(int i = 0 ; i< annonce.illustrations.size();i++){
            parts.add( request.getPart("ill"+i))
            names.add( request.getPart("ill"+i).fileItem.name)
        }
        //modification des anciennes illustrations
       for(int i = 0 ; i< annonce.illustrations.size();i++){
            def illustration = annonce.illustrations.get(i)
            if(parts.get(i).fileItem.name.isEmpty() == false ||  parts.get(i).fileItem.name.length()!= 0){
                def myObj = new  StandardMultipartHttpServletRequest.StandardMultipartFile(parts.get(i),parts.get(i).fileItem.name)
                //telechargement du fichier
                myObj.transferTo(new File(path+""+myObj.filename))
                illustration.filename = myObj.filename
                illustrationService.save(illustration)
            }
        }

        //nouvelle illustration
        def nbrOfNewImg = java.lang.Integer.parseInt(params.get("nombreNouvelleImage"))


        for(int i = 0 ; i< nbrOfNewImg ; i++){
            def part = request.getPart("newImg"+i)
            def myObj = new  StandardMultipartHttpServletRequest.StandardMultipartFile(part,part.fileItem.name)
            myObj.transferTo(new File(path+""+myObj.filename))
            def illustration = new Illustration("filename" : myObj.filename,"annonce" : annonce.getId())
            illustrationService.save(illustration)
        }


        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            //respond annonce.errors , annonce: annonceService.get(annonce.getId()), user:  userService.list(), view:'edit'
            return new ModelAndView("/annonce/edit", [ erros : annonce.errors,annonce: annonceService.get(annonce.getId()), user:  userService.list()])
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
