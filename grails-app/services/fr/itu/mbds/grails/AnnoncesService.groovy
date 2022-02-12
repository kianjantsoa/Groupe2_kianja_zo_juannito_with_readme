package fr.itu.mbds.grails

import grails.gorm.transactions.Transactional

@Transactional
class AnnoncesService {

    def findAllByTitleLikeAndDescriptionLike(String title  , String description , Integer max , Integer offset) {
        if(title == null)
            title = ""
        if(description == null)
            description = ""
        return Annonce.findAllByTitleIlikeAndDescriptionIlike("%"+title+"%","%"+description+"%" ,
                [max: max, offset: offset])
        //return Annonce.findAllByTitleIlikeAndDescriptionIlike("%"+title+"%","%"+description+"%" )
    }

    def getResult(String title  , String description , Integer max , Integer offset){
        return Annonce.findAllByTitleIlikeAndDescriptionIlike("%"+title+"%","%"+description+"%").size()
    }
}
