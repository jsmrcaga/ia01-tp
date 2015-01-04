(defun printIngred (lettre)

	(let (
		(dejaUtilise NIL)
		(index 0)
		) ; fin dec var


		(dolist (current *BR*) ;on prend la liste des recettes (regles) et on tourne dolist dessus (var current)

			(dolist (currentIngredient (cadr current)) 	;on prend tous les ingredients de la recette actuelle (cadr current) 
														;et on tourne dessus pour afficher ceux qui commencent par la lettre indiquee
				;TO DO:
				;Enlenver le deuxieme \										
				(if (equal lettre (string (char (symbol-name (car currentIngredient)) 0))) ; car de currentIng est le nom, et cdr est la qtte
					(progn
						(if (member (car currentIngredient) dejaUtilise) ()
						(progn
							(print (car currentIngredient))
							(push (car currentIngredient) dejaUtilise)
							)
						)
					)
				)
				

				)

			)

		)		
	
)

(setq *ingredBase* '(
	 (sucre)
	 (oeuf)
	 (sel)
	 (poivre)
	 (farine)
	 (eau)
	 (lait)
	 

	))