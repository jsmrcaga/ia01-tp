(defun printIngred (lettre)
	; retourne une liste (nom_ingred qté)

	(let (
		(dejaUtilise NIL) ; liste des ingrédients déjà affichés
		(index 0) ; numéro d'un ingrédient dans la liste
		(currentItem NIL) ; liste (index nom) d'un ingrédient de l'énumération
		(listOfItems NIL) ; liste de currentItem, contenant tous les ingrédients de l'énumération 
		(selectedIngred NIL) ; liste de l'ingrédient de retour (nom de l'ingrédient quantité)
		) ; fin dec var


		(dolist (current *BR*) ;on prend la liste des recettes (regles) et on tourne dolist dessus (var current)

			(dolist (currentIngredient (caadr current)) 	;on prend tous les nom d'ingredients de la recette actuelle (caadr current) 
															;et on tourne dessus pour afficher ceux qui commencent par la lettre indiquée
				;TO DO:
				;Enlenver le deuxieme \										
				(if (and
						; si currentIng (le nom de l'ingrédient) commence par la lettre cherchée
						(equal lettre (string (char (symbol-name currentIngredient) 0))) ; 
						; et s'il nest pas deja utilise
						(member currentIngredient dejaUtilise)) 
					(progn
						(push currentIngredient currentItem)
						(push index currentItem)
						(push currentItem listOfItems)
						(setq currentItem NIL)
						(print index)
    					(princ ": ")
    					(princ currentIngredient)
						(setq index (+ index 1))
						(push currentIngredient dejaUtilise)
						)
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
		(princ (reverse selectedIngred))
		; (push selectedIngred baseFaits)
	)
)

(defun askForLetter ()
	(let (
		(letter NIL)
		)

			(print "Si vous avez d'autres ingredients a ajouter veuillez indiquer la premiere lettre de l'ingredient (en majuscules)")
			(setq letter (read-line))
			(printIngred letter)
			(if (y-or-n-p "Ajouter un autre ingredient?")
			    (progn
	    			askForLetter()
	    		)
	  			
			)

		)

	)


