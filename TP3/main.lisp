;Template des regles
("Nom de la regle" ((qtteElement element) (qtteElement2 element2) (qtteElement3 element3)) "resultat")

;Recursivite sur les elements pour trouver les profondeurs des recettes
; + qtte des elements pour faire le 0+ du moteur
;Appareil => on ajoute des melanges recursifs pour les recettes en tant que mini recettes.

;Template listOfIngredients
(defun getRecipe (listOfRecipes nameRecipe) 

	(assoc nameRecipe listOfRecipes)

	
)

(defun verifyFacts () 


	)

(defun getFirstIngredients () 

	(print "Veuillez entrer les ingredients que vous possedez")


	

)

(defun printIngred (lettre)

	(dolist (current listOfRecipes)

		(dolist (currentIngredient (cadr current))

			(princ (cadr currentIngredient))

			)

		)
	
)

(defun printExplanation () 

	(print "Bienvenue au Systeme Expert de Cuisine!")
	(print "Grace a ce systeme vous pourrez trouver des recettes a partir des ingredients que vous possedez et du temps que vous comptez consacrer a la preparation de la recette")
	(print "Veuillez donc nous indiquer les ingredients que vous voulez choisir en commencant par taper la premiere lettre du nom")
	(print "On vous proposera donc une liste d'ingredients, il suffira de taper le numero de lingredient correspondant")
	(print "On vous demandera ensuite la qtte que vous en possedez, liquides en ml, solides en grammes, et autres en unites")

	

)

