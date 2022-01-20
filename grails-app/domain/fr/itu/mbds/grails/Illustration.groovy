package fr.itu.mbds.grails

class Illustration {


    // L'accès au fichiers de deux points de vue :
    // 1. On va définir un moyen local d'accéder au fichier (via le systeme de fichier)
    // 2. On va définir un moyen distant d'accéder au fichier (via le réseau)
    String filename

    static belongsTo = [annonce: Annonce]

    static constraints = {
        filename blank: false, nullable: false
    }
}
