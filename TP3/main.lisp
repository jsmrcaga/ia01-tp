;Recursivite sur les elements pour trouver les profondeurs des recettes
; + qtte des elements pour faire le 0+ du moteur
;Appareil => on ajoute des melanges "naturels" pour les recettes en tant que mini recettes.
(setq ingBase '())
(setq listeEnum ())
(setq *BaseResult* NIL)
(setq *BF* NIL)



;Template listOfIngredients

;********************************
;		CHANGER POUR PATH LOCAL
;********************************
; (load "C:/Users/Jo Colina/Documents/UTC/IA01/ia01-tp/TP3/br.lisp")
; (load "C:/Users/Jo Colina/Documents/UTC/IA01/ia01-tp/TP3/service.lisp")
; (load "C:/Users/Jo Colina/Documents/UTC/IA01/ia01-tp/TP3/selector.lisp")
(load "br.lisp")
(load "service.lisp")
(load "selector.lisp")


(defun main ()

	; (printExplanation)
	; (getFirstIngredients)
	; (askForLetter)
	; (askForDishFeatures)
	(setq *BF* '((+T_PREPARATION MOYEN) (+DIFFICULTE 3) (+CATEGORIE DESSERT) (PATE_FEUILLETEE 1) (BEURRE 250) (LAIT 1000) (FARINE 500) (OEUF 12) (SUCRE 500) (SEL 10) (EAU 20000)))
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
					(if (or (equal (string (symbol-name (car currentIngredient))) "+T_PREPARATION")
							(equal (string (symbol-name (car currentIngredient))) "+DIFFICULTE")
							(equal (string (symbol-name (car currentIngredient))) "+CATEGORIE"))
						(progn
							(if (equal (string (symbol-name (car currentIngredient))) "+T_PREPARATION")
								(cond
									( (and (equal (string (cadr (assoc 'T_PREPARATION *BF*))) "COURT") (> (cadr currentIngredient) 20))
										(return)
									)
									( (and (equal (string (cadr (assoc 'T_PREPARATION *BF*))) "MOYEN") (> (cadr currentIngredient) 40))
										(return)
									)
								)
							)

							(if (and (equal (string (symbol-name (car currentIngredient))) "+DIFFICULTE")
								(< (cadr (assoc '+DIFFICULTE *BF*)) (cadr currentIngredient)) ;Si la difficulte est inferieure a celle de la recette
								)
									(progn 
										(if (not (equal (cadr (assoc '+DIFFICULTE *BF*)) 4)) ; Si ce n'est pas 4 on quitte la boucle
											(return)
											)
										)
								)

							(if (and (equal (string (symbol-name (car currentIngredient))) "+CATEGORIE")
									(not (equal (string (cadr (assoc '+CATEGORIE *BF*))) (string (cadr currentIngredient)))) ;Si la categorie n'est pas la meme
								)
									(progn 
										(if (not (equal (string (cadr (assoc '+CATEGORIE *BF*))) "TOUT")) ; Si ce n'est pas tout on quitte la boucle
											(return)
											)
									)
							)	
						)

						(progn

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
									(setq allIngred NIL)
									(return) ;juste pour "break" le loop
									)

								)
						)

						;*******************
						;	Si l'ingredient n'est pas dans la base de faits
						;*******************
						(progn

							(if (askQuestion currentIngredient) 
								(progn
									;(push (car currentIngredient) currentItem)
									(print "Quelle quantite possedez-vous?")
									(setq quantite (parse-integer (read-line)))
									(setq currentItem (list quantite (car currentIngredient)))
									(push (reverse currentItem) *BF*)
									(setq currentItem NIL)
									(setq quantite NIL)
								)

								;else si la reponse est NON
								(progn
									;SI ON NA PAS LINGREDIENT ON CHECK SIL EST DANS LA BR POUR VOIR SI ON PEUT LE CONSTRUIRE
										(if (not (equal NIL (assoc (car currentIngredient) *BR*))) ;donc s'il existe dans les recettes
											
											(if (equal (verifyFacts (car currentIngredient)) T) 
												(progn
														(push currentIngredient *BF*)
														)
												(
													setq allIngred NIL
													)

												)

											(progn
												(push 0 itemTemp)
												(push (car currentIngredient) itemTemp)
												(push itemTemp *BF*)
												(setq itemTemp NIL)
												(setq allIngred NIL)
												(return)
											)

										)
								)
							)
					




						);FIN SI L'INGREDIENT NEST PAS DANS LA BASE DES FAITS
					)
							); FIN PROGN DU DEBUT
					)
					


				)
				;*************************************
				;		FIN DEUXIEME DO LIST
				;*************************************

				(if (equal allIngred T)
					(progn
						(push (list (car current) (car (cddr current))) *BF* )
						)
					)


			)
		)

)









