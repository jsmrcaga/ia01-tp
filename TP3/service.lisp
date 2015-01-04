(defun printExplanation () 

	(print "Bienvenue au Systeme Expert de Cuisine!")
	(print "Grace a ce systeme vous pourrez trouver des recettes a partir des ingredients que vous possedez et du temps que vous comptez consacrer a la preparation de la recette")
	(print "Veuillez donc nous indiquer les ingredients que vous voulez choisir en commencant par taper la premiere lettre du nom")
	(print "On vous proposera donc une liste d'ingredients, il suffira de taper le numero de lingredient correspondant")
	(print "On vous demandera ensuite la qtte que vous en possedez, liquides en ml, solides en grammes, et autres en unites")
	NIL
)

(defun getRecipe (*BR* nameRecipe) 

	(assoc nameRecipe *BR*)

	
)


(defun getFirstIngredients () 

	(let (
		(currentItem NIL)
		(selectedIngred NIL)
		(ingredBase '(
			sucre
			oeuf
			farine
			lait
			beurre))
		)

		(print "Merci de donner le poids de chacun des ingredients suivant en votre possession (0 si vous n'en avez pas)")
		(dolist (current ingredBase)
			; On pose la question pour chaque ingrédient standard
			(push current currentItem)
			(print current)
			(princ "? ")

			; Réponse de l'utilisateur
			(push (parse-integer (read-line)) currentItem)

			; Push dans la BF
			(princ (reverse currentItem))
			(if (assoc (car (reverse currentItem)) *BF*)
				(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree.")
				(push (reverse currentItem) *BF*)
				)

			)
		
			(print "Choisissez un ingredient en inserant le numero correspondant: ")
			(push (cadr (assoc (parse-integer (read-line)) listOfItems)) selectedIngred)
			;on utilise cadr pour recuperer le nom sans parentheses
			;on parse le int lu de la ligne 

			(print "Quelle quantite possedez-vous?")
			(push (parse-integer (read-line)) selectedIngred)
			(print "Ingredient Selectionne: ")
			(princ selectedIngred)
			(push selectedIngred *BF*)

			(if (y-or-n-p "Ajouter un autre ingredient?")
			    (progn
	    			(getFirstIngredients)
	    		)
	  			
			)

		)

			(setq currentItem NIL)
		)
	)
)

(defun verifyFacts () 
	(dolist (currentRecipe *BR*)
		
		(if (member currentRecipe listOfFacts) () (
			progn

				(dolist (currentIngredient (cadr currentRecipe)) 
					(if (not (member currentIngredient listOfFacts))
					(progn ;then
						(prin1 "Est-ce que vous possedez du ")
						(princ currentIngredient)
						(prin1 "?")
						)
					(;else
						)

					)	

				)
		))

	)
)