;Recursivite sur les elements pour trouver les profondeurs des recettes
; + qtte des elements pour faire le 0+ du moteur
;Appareil => on ajoute des melanges "naturels" pour les recettes en tant que mini recettes.
(setq ingBase '())
(setq listeEnum ())
(setq baseFaits NIL)
(setq baseNonFaits NIL)


(setq *ingredBase* '(
	 (sucre)
	 (oeuf)
	 (sel)
	 (poivre)
	 (farine)
	 (eau)
	 (lait)


	)
)
;Template listOfIngredients

;********************************
;		CHANGER POUR PATH LOCAL
;********************************
(load "C:/Users/Jo Colina/Documents/UTC/IA01/ia01-tp/TP3/br.lisp")
(load "C:/Users/Jo Colina/Documents/UTC/IA01/ia01-tp/TP3/service.lisp")
(load "C:/Users/Jo Colina/Documents/UTC/IA01/ia01-tp/TP3/selector.lisp")


(defun main ()

	(printExplanation)
	(getFirstIngredients)
	(beginExploration)

)

(defun beginExploration ()
	(let (
		(allIngred T)
		(answer NIL)
		(currentItem NIL)
		(quantite NIL)
		)

			(dolist (current *BR*)
				(setq allIngred T) ;on initialise allIngred pour tourner la boucle
				(dolist (currentIngredient (cadr current)) ;on prend les ingredients de chaque recette

					(if (not (equal NIL (assoc (car currentIngredient) baseFaits)))
						;*******************
						;	Si l'ingredient est dans la base de faits
						;*******************
						(progn
							(if (>= (cadr (assoc (car currentIngredient) baseFaits)) (cadr currentIngredient))
								;on utilise cadr pour prendre la valeur numerique de quantite sans parentheses
								(
									;all good
									)

								(
									(print "Vous n'avez pas assez de ")
									(princ (car currentIngredient))
									(return) ;juste pour "break" le loop
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
									; (push currentItem baseFaits)
									)

								;else
								(progn
										(setq allIngred NIL)
										(return) ;on break le loop, pas besoin de continuer sur cette recette si pas l'ingredient
									)
								)




						)
					)

				)
			)
		)

)









