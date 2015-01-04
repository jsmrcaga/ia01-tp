(defun printIngred (lettre)
	; ajoute un ingrédient à la *BF*

	(let (
		(dejaUtilise NIL) ; liste des ingrédients déjà affichés
		(index 0) ; numéro d'un ingrédient dans la liste
		(currentItem NIL) ; liste (index nom) d'un ingrédient de l'énumération
		(listOfItems NIL) ; liste de currentItem, contenant tous les ingrédients de l'énumération 
		(selectedIngred NIL) ; liste de l'ingrédient de retour (nom de l'ingrédient quantité)
		) ; fin dec var


		(dolist (current *BR*) ;on prend la liste des recettes (regles) et on tourne dolist dessus (var current)
			(dolist (currentIngredient (cadr current)) 	;on prend tous les nom d'ingredients de la recette actuelle (caadr current) 
															;et on tourne dessus pour afficher ceux qui commencent par la lettre indiquée
				;TO DO:
				;Enlenver le deuxieme \
				(if (and
						; si currentIng (le nom de l'ingrédient) commence par la lettre cherchée
						(equal (char lettre 0) (char (symbol-name (car currentIngredient)) 0))
						; et s'il nest pas deja utilise
						(not (member (car currentIngredient) dejaUtilise))
						; et s'il ne commence pas par +
						(not (equal (char "+" 0) (char (symbol-name (car currentIngredient)) 0)))
						) 
					(progn
						(push (car currentIngredient) currentItem)
						(push index currentItem)
						(push currentItem listOfItems)
						(setq currentItem NIL)
						(print index)
    					(princ ": ")
    					(princ (car currentIngredient))
						(setq index (+ index 1))
						(push (car currentIngredient) dejaUtilise)
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
		(if (assoc (car (reverse selectedIngred)) *BF*)
				(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree.")
				(push (reverse selectedIngred) *BF*)
				)
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
	    			(askForLetter)
	    		)
	  			
			)

		)

	)

(defun add2BF (ingredient)
	(if (assoc ingredient *BF*)
	(progn
		(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree !")
		(print ingredient)
	)
	(push ingredient *BF*)
	)
)