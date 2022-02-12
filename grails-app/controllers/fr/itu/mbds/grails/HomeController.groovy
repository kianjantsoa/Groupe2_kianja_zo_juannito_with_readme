package fr.itu.mbds.grails

import org.springframework.web.servlet.ModelAndView

class HomeController {
    AnnonceService annonceService
    AnnoncesService annoncesService
    def index(Integer max)
    {
        params.max = Math.min(max ?: 12, 100)
        if(params.title == null)
            params.title = ""
        if(params.description == null)
            params.description = ""
        def offs = Integer.getInteger(params.offset)
        def compte = annoncesService.getResult(params.title , params.description , params.max ,offs)
        respond annoncesService.findAllByTitleLikeAndDescriptionLike(params.title , params.description , params.max ,offs ), model:[annonceCount: compte]

    }

    def detail(){
        def id = params.id
        respond annonceService.get(id)
     }
}
