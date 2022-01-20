package projet_itu_grails

import fr.itu.mbds.grails.Annonce
import fr.itu.mbds.grails.Illustration
import fr.itu.mbds.grails.Role
import fr.itu.mbds.grails.User
import fr.itu.mbds.grails.UserRole

class BootStrap {

    def init = { servletContext ->

        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleModo = new Role(authority: 'ROLE_MODO').save()

        def userAdmin = new User(username: "admin", password: "admin").save()
        def userModo = new User(username: "modo", password: "modo").save()

        UserRole.create(userAdmin, roleAdmin, true)
        UserRole.create(userModo, roleModo, true)

        ["Alice", "Bob", "Charly", "David", "Etienne"].each {
            String uName ->
                def userInstance = new User(username: uName, password: "password")
                (1..5).each {
                    Integer annonceIdx ->
                        def annonceInstance = new Annonce(
                                title: "Title $uName $annonceIdx",
                                description: "Description $uName $annonceIdx",
                                price: 100 * annonceIdx,
                                status: Boolean.TRUE)
                        (1..3).each {
                            Integer illustrationIdx ->
                                annonceInstance.addToIllustrations(new Illustration(filename: "grails.svg"))
                        }
                        userInstance.addToAnnonces(annonceInstance)
                }
                userInstance.save(flush:true, failOnError: true)
        }

        assert User.count == 7
        assert Role.count == 2
        assert Annonce.count == 25
        assert Illustration.count == 75


    }
    def destroy = {

    }
}
