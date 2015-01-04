(defun printExplanation () 

	(print "Bienvenue au Systeme Expert de Cuisine!")
	(print "Grace a ce systeme vous pourrez trouver des recettes a partir des ingredients que vous possedez et du temps que vous comptez consacrer a la preparation de la recette")
	(print "Veuillez donc nous indiquer les ingredients que vous voulez choisir en commencant par taper la premiere lettre du nom")
	(print "On vous proposera donc une liste d'ingredients, il suffira de taper le numero de lingredient correspondant")
	(print "On vous demandera ensuite la qtte que vous en possedez, liquides en ml, solides en grammes, et autres en unites")

	

)

(defun getRecipe (*BR* nameRecipe) 

	(assoc nameRecipe *BR*)

	
)


(defun getFirstIngredients () 

	(let (
		(dejaUtilise NIL)
		(index 0)
		(currentItem NIL)
		(selectedIngred NIL)
		(listOfItems NIL)
		) ; fin dec var


		(dolist (current *ingredBase*) 
												
				
				(if (member (car current) dejaUtilise) () ;s'il nest pas deja utilise
					(progn
						(push (car current) currentItem)
						(push index currentItem)
						(push currentItem listOfItems)
						(setq currentItem NIL)
						(print index)
        				(princ ": ")
						(setq index (+ index 1))
        				(princ (car current))
						(push (car current) dejaUtilise)
					)
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
			; (push selectedIngred baseFaits)

		)		


)

(defun verifyFacts () 
	(dolist (currentRecipe *BR*)
		
		(if (member currentRecipe listOfFacts) () (
			progn

				(dolist (currentIngredient (cadr currentRecipe)) 
					(if (not (member currentIngredient listOfFacts))
					(;then
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