;Recursivite sur les elements pour trouver les profondeurs des recettes
; + qtte des elements pour faire le 0+ du moteur
;Appareil => on ajoute des melanges "naturels" pour les recettes en tant que mini recettes.
(setq *BaseResult* NIL)
(setq *BF* '((EAU 20000)(SEL 50)))
(setq *QuestionOk* NIL)



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

	(print "Voulez-vous qu'on vous demande s'il manque des ingrédients ? Y/N")
	(let (answer)
		(setq answer (read-line))

		; Check reponse correcte
		(loop while (and (not (equal answer "Y")) (not (equal answer "N"))) do
				(print "Seulement Y ou N ")
				(setq answer (read-line))
			)

		(if (equal answer "Y")
			(setq *QuestionOk* T)
			(setq *QuestionOk* NIL)
		)
	)

	;(setq *BF* '((+T_PREPARATION MOYEN) (+DIFFICULTE 2) (+CATEGORIE GOUTER) (GRAINS_DE_SUCRE 100) (BEURRE 500) (LAIT 500) (FARINE 500) (OEUF 500) (SUCRE 500) (EAU 20000) (SEL 50)))
	(setq *BF* '((lait 500)
			(gousse_vanille 1)
			(jaune_oeuf 4)
			(sucre 60)
			(maizena 20)
			(+t_preparation 15)
			(+difficulte 2)))
	(print *BF*)
	(beginExploration)
	(print *BF*)


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
				(print "")
				(print "recette")
				(print current)
				(print "BF")
				(print *BF*)
				(read-line)
				(dolist (currentIngredient (cadr current)) ;on prend les ingredients de chaque recette
					(if (or (equal (string (symbol-name (car currentIngredient))) "+T_PREPARATION")
							(equal (string (symbol-name (car currentIngredient))) "+DIFFICULTE")
							(equal (string (symbol-name (car currentIngredient))) "+CATEGORIE"))
						(progn
							(print (string (symbol-name (car currentIngredient))))
							(if (handleException currentIngredient) (return))
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
								(progn
									;all good
									(print "Il y a X et en qtte suffisante: ")
									(princ currentIngredient)
									)


								(progn
										;PAS ASSEZ DE L'INGREDIENT
									(print "Vous n'avez pas assez de ")
									(princ (car currentIngredient))
									(setq allIngred NIL)
									(return) ;juste pour "break" le loop
									)

								)
						)

						;*******************
						;	Si l'ingredient n'est pas dans la base de faits
						;*******************
						(progn

							(if (and *QuestionOk* (askQuestion currentIngredient)) 
								()

								;else si la reponse est NON
								(progn
									;SI ON NA PAS LINGREDIENT ON CHECK SIL EST DANS LA BR POUR VOIR SI ON PEUT LE CONSTRUIRE
										(if (and (equal NIL (assoc (car currentIngredient) *BF*)) 
											(not (equal NIL (assoc (car currentIngredient) *BR*)))
											) ;donc s'il existe dans les recettes
											
											(if (equal (verifyFacts (car currentIngredient)) T) 
												(progn

													(if (assoc (car currentIngredient) *BF*)
														(progn
															(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree. M123")
															(print currentIngredient)
														)
														(push currentIngredient *BF*)
														)
														;(push currentIngredient *BF*)
														)
												(
													setq allIngred NIL
													)

												)

											(progn
												(push 0 itemTemp)
												(push (car currentIngredient) itemTemp)
												(if (assoc itemTemp *BF*)
													(progn
														(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree. M141")
														(print itemTemp)
													)
													(push itemTemp *BF*)
													)
												; (push itemTemp *BF*)
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

						(if (assoc (car (list (car current) (car (cddr current)))) *BF*)
							(progn
								(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree. M170")
								(print (list (car current) (car (cddr current))))
							)
							(push (list (car current) (car (cddr current))) *BF*)
							)
						;(push (list (car current) (car (cddr current))) *BF* )
						)
					(progn
						(if (assoc (list (car current) 0) *BF*)
							(progn
								(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree. M180")
								(print (list (car current) 0))
							)
							(push (list (car current) 0) *BF*)
							)
						;(push (list (car current) 0) *BF* )
						)
					)


			)
		)

)









