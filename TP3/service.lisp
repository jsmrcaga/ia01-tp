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
			(push selectedIngred *BF*)

			(if (y-or-n-p "Ajouter un autre ingredient?")
			    (progn
	    			(getFirstIngredients)
	    		)
	  			
			)

		)		


)

(defun verifyFacts (ingredient)
	(let (
		
		(answer NIL)
		(quantite NIL)
		(allIngred T)
		(currentItem NIL)
		(itemTemp NIL)
		)
	(dolist (currentIngredient (cadr (assoc ingredient *BR*)))

		(if  (not (equal NIL (assoc (car currentIngredient) *BF*)))
						;Explication du if:

							;si l'assoc retourne qq chose: l'ingredient existe dans la base de faits

						;*******************
						;	Si l'ingredient est dans la base de faits
						;*******************
						(progn
							(if (>= (cadr (assoc (car currentIngredient) *BF*)) (cadr currentIngredient)) ;si la qtte est superieure a la regle
								;on utilise cadr pour prendre la valeur numerique de quantite sans parentheses
								(
									;all good
									)


								(progn
										;PAS ASSEZ DE L'INGREDIENT
									;(print "Vous n'avez pas assez de ")
									;(princ (car currentIngredient))
									
									(return-from verifyFacts NIL) ;juste pour "break" le loop
									)

								)
						)

						;*******************
						;	Si l'ingredient n'est pas dans la base de faits
						;*******************
						(progn
							(print "Possedez-vous du ")
							(princ currentIngredient)
							(princ "? Y/N")
							(setq answer (read-line))

							;check bonne reponse SIMPLE
							(if (or (not (equal answer "Y")) (not (equal answer "N"))) 
								(progn
									(print "Seulement Y ou N")
									(setq answer (read-line))
								)

							)

							(if (equal answer "Y") 
								(progn
									(push currentIngredient currentItem)
									(print "Quelle quantite possedez-vous?")
									(setq quantite (read-line))
									(push quantite currentItem)
									(push currentItem *BF*)
									(setq quantite NIL)
								)

								;else si la reponse est NON
								(progn
									;SI ON NA PAS LINGREDIENT ON CHECK SIL EST DANS LA BR POUR VOIR SI ON PEUT LE CONSTRUIRE
										(if (not (equal NIL (assoc (car currentIngredient) *BR*))) ;donc s'il existe dans les recettes
											
											(progn
												(if (equal (verifyFacts (car currentIngredient)) T) 
													(progn
														(push currentIngredient *BF*)
														)
												(
													setq allIngred NIL
													)

												)
											)

											(progn
												(push 0 itemTemp)
												(push (car currentIngredient) itemTemp)
												(push itemTemp *BF*)
												(setq itemTemp NIL)
												(return)
											)

										)
								)
							)
					




						);FIN SI L'INGREDIENT NEST PAS DANS LA BASE DES FAITS
					)

		) ;fin do list

		(if (equal allIngred T)
			(return-from verifyFacts T)
			(return-from verifyFacts NIL)
		)
	)
	
)