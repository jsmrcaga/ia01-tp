;Recursivite sur les elements pour trouver les profondeurs des recettes
; + qtte des elements pour faire le 0+ du moteur
;Appareil => on ajoute des melanges "naturels" pour les recettes en tant que mini recettes.
(setq ingBase '())
(setq listeEnum ())
(setq *BF* NIL)
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
	(askForLetter)
	(beginExploration)

)

(defun beginExploration ()
	(let (
		(allIngred T)
		(answer NIL)
		(currentItem NIL)
		(quantite NIL)
		(itemTemp NIL)
		)

			(dolist (current *BR*)
				(setq allIngred T) ;on initialise allIngred pour tourner la boucle

				(dolist (currentIngredient (cadr current)) ;on prend les ingredients de chaque recette

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

								(
										;PAS ASSEZ DE L'INGREDIENT
									;(print "Vous n'avez pas assez de ")
									;(princ (car currentIngredient))
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

							;check bonne reponse
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
									(setq quantite NIL)
									(push currentItem *BF*)
									)

								;else
								(progn
									;SI ON NA PAS LINGREDIENT ON CHECK SIL EST DANS LA BR POUR VOIR SI ON PEUT LE CONSTRUIRE
										(if (not (equal NIL (assoc (car currentIngredient) *BR*))) ;donc s'il existe dans les recettes
											
											(verifyFacts (car currentIngredient))

											(progn
												(push 0 itemTemp)
												(push (car currentIngredient)) itemTemp)
												(push itemTemp *BF*)
												(setq itemTemp NIL)
												(setq allIngred NIL)
												(return)
												)

											)
								)
							);FIN SI L'INGREDIENT NEST PAS DANS LA BASE DES FAITS
					




						)
					)

				)
				;*************************************
				;		FIN DEUXIEME DO LIST
				;*************************************

				(if (equal allIngred T)
					(push (car current) *BF*)
					)


			)
		)

)









