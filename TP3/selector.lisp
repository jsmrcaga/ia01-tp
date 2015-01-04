(defun printIngred (lettre)

	(let (
		(dejaUtilise NIL)
		(index 0)
		(currentItem NIL)
		(selectedIngred NIL)
		(listOfItems NIL)
		) ; fin dec var


		(dolist (current *BR*) ;on prend la liste des recettes (regles) et on tourne dolist dessus (var current)

			(dolist (currentIngredient (cadr current)) 	;on prend tous les ingredients de la recette actuelle (cadr current) 
														;et on tourne dessus pour afficher ceux qui commencent par la lettre indiquee
				;TO DO:
				;Enlenver le deuxieme \										
				(if (equal lettre (string (char (symbol-name (car currentIngredient)) 0))) ; car de currentIng est le nom, et cdr est la qtte
					(progn
						(if (member (car currentIngredient) dejaUtilise) () ;s'il nest pas deja utilise
						(progn
							(push (car currentIngredient) currentItem)
							(push index currentItem)
							(push currentItem listOfItems)
							(setq currentItem NIL)
							(print index)
        					(princ ": ")
							(setq index (+ index 1))
        					(princ (car currentIngredient))
							(push (car currentIngredient) dejaUtilise)
							)
						)
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
			(princ selectedIngred)
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


