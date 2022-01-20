package fr.itu.mbds.grails

class Annonce {

    String      title
    String      description
    Float       price
    Boolean     status = Boolean.FALSE
    Date        dateCreated
    Date        lastUpdated
    List        illustrations

    static hasMany = [illustrations: Illustration]

    static belongsTo = [author: User]

    static constraints = {
        title nullable: false, blank: false
        description nullable: false, blank: false
        price min: 0F, nullable: false
        status nullable: false
    }

    static mapping = {
        description type: 'text'
    }
}
