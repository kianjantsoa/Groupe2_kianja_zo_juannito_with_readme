Fichier à lire pour le projet grails lecoincoin

Membres du groupe 2 :

Randrianarisamy Kianjantsoa Jolivot
Ratovoniony H. Juannito
Razafimanantsoa Zo Hery Ny Aina Dominique

Remarques:
Les collections postman sont dans ce projet :
-api_lecoincoin_annonce.postman_collection.json
-api_lecoincoin_user.postman_collection.json

Travails effectuées:

_ Réalisation du Back End:

	-Couche de sécurité ajoutée pour  seul le modérateur/administrateur puisse y accéder
	-Identification / Déconnexion (Acces a l'interface Back End par une page de connexion)
	-Visualisation des utilisateurs/ annonces
	-Creation / Mise a jour / Suppression d'un ou de plusieurs utilisateurs / annonces
	-Téléchargement d'une ou de plusieurs illustrations pour les annonces( Creation / Mise a jour)

_ Réalisation du Front End:

	-Access a la page du Front End par le lien ci-après : "http://localhost:8081/home"
	-Page d'accueil avec la listes de toutes les annonces
	-"Section Recherche" pour une recherche par titre / description d'une ou plusieurs annonces spécifiques
	-Detail de chaque annonce disponible  et toutes les illustrations reliés à celle-ci au click du bouton "Voir detail" sur chaque annonce

_Réalisation API Rest:
-Connexion:
Tous les requêtes api devraient avoir une Authorization grace au token reçu après avoir fait une authentification sur "htp://localhost:8081/api/login" en entrant username et le password.
La saisie des informations se fera dans l'onglet Headers et on entre les informations suivantes:
KEY: Authorization
VALUE: "Bearer " + TOKEN reçu

KEY: Accept
VALUE: text/json ou text/xml -> pour recevoir les résultats au format JSON ou/et XML

	-concernant l'entité USER: 
	L'accès au API  pour la méthode GET(recuperation d'un seul user)  /PUT /PATCH /DELETE est sur "http://localhost:8081/api/user" 
	Pour la méthode
	*GET(récupérer un User) :
	 il faut comme paramètre id et dans le header , il faut ajouter le Header accept (json ou xml)
	 
	*PUT(update User avec tous ses attribut) :
	 il faut comme paramètre id ,et dans le body RAW de type json composé de 
		- username
		- password
		- enabled
		- accountLocked
		- accountExpired
		- passwordExpired
	L'URL pour utiliser la fonction PUT se fait à cette URL: "http://localhost:8081/api/user/$id" où $id est l'id de l'user à modifier
 
	
	*PATCH(update User avec les attribut que vous voulez modifier)
	 il faut comme paramètre id ,et dans le body RAW de type json composé de 
		- username
		- password
		- enabled
		- accountLocked
		- accountExpired
		- passwordExpired
	L'URL pour utiliser la fonction PUT se fait à cette URL: "http://localhost:8081/api/user/$id" où $id est l'id de l'user à modifier
	
	*DELETE(supprimer un user)
	 il faut comme paramètre id user (que vous voulez supprimer)
	L'URL pour utiliser la fonction DELETE se fait à cette URL: "http://localhost:8081/api/user/$id" où $id est l'id de l'user à supprimer
	
	L'accès au API pour la méthode GET(recuperation de tous les users) et POST est sur "http://localhost:8081/api/users"
	Pour la méthode :
	* GET (permettant de récupérer tous les users):
		il faut comme paramètre "max" (nombre de ligne que vous voulez récupérer)
	
	* POST(creation d'une nouvelle User) :
		il faut comme paramètre
		- username
		- password
		Et dans le body RAW de type json ,il nous faut un paramètre
			roleId [soit role_admin(1),role_modo(2), role_user(3)]
			
			
	- Concernant l'entité Annonce
	L'accès au API  pour la méthode GET(recuperation d'un seul annonce)  /PUT /PATCH /DELETE est sur "http://localhost:8081/api/annonce"
	Pour la méthode
	*GET(récupérer une annonce) :
	 il faut comme paramètre id et dans le header , il faut ajouter le Header accept (json ou xml)
	
	*PUT(update Annonce avec tous ses attribut) :
	 il faut comme paramètre id ,et dans le body RAW de type json composé de 
		- title
		- description
		- price
		- status
 	 L'URL pour utiliser la fonction ANNONCE se fait à cette URL: "http://localhost:8081/api/annonce/$id" où $id est l'id de l'annonce à modifier

	 *PATCH(update Annonce avec les attribut que vous voulez modifier)
	  il faut comme paramètre id ,et dans le body RAW de type json composé de 
		- title
		- description
		- price
		- status
	L'URL pour utiliser la fonction ANNONCE se fait à cette URL: "http://localhost:8081/api/annonce/$id" où $id est l'id de l'annonce à modifier

	 
	 *DELETE(supprimer une Annonce)
	  il faut comme paramètre id annonce (que vous voulez supprimer)
	L'URL pour utiliser la fonction PUT se fait à cette URL: "http://localhost:8081/api/annonce/$id" où $id est l'id de l'annonce à supprimer
	  
	L'accès au API pour la méthode GET(recuperation de tous les Annonces) et POST(creation d'une nouvelle Annonce est sur "http://localhost:8081/api/annonces" 
 
	* GET (permettant de récupérer tous les Annonces):
		il faut comme paramètre "max" (nombre de ligne que vous voulez récupérer)
	
	* POST(creation d'une nouvelle Annonce) :
		il faut comme paramètre
		- authorId
		- title
		- description
		- price
		- status

		Et dans le body form-data de type file(qui permet de choisir les fichiers illustrations que vous ajouter) ,il nous faut un paramètre(key)
		- files