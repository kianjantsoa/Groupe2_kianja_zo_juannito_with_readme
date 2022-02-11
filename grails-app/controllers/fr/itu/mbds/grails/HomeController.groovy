package fr.itu.mbds.grails

class HomeController {
    AnnonceService annonceService

    def index(Integer max)
    {
        params.max = Math.min(max ?: 12, 100)
        def test = Annonce.findAllByTitleLikeAndDescriptionLike("%%","%%")
        respond annonceService.list(params), model:[annonceCount: annonceService.count()]
    }

    def detail(){
        def id = params.id
        respond annonceService.get(id)
     }
}
