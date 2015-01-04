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
		(currentItem NIL)
		(selectedIngred NIL)
		(ingredBase '(
			sucre
			oeuf
			farine
			lait
			beurre))
		)

		(print "Merci de donner le poids de chacun des ingredients suivant en votre possession (0 si vous n'en avez pas)")
		(dolist (current ingredBase)
			; On pose la question pour chaque ingrédient standard
			(push current currentItem)
			(print current)
			(princ "? ")

			; Réponse de l'utilisateur
			(push (parse-integer (read-line)) currentItem)

			; Push dans la BF
			(princ (reverse currentItem))
			(if (assoc (car (reverse currentItem)) *BF*)
				(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree.")
				(push (reverse currentItem) *BF*)
				)

			(setq currentItem NIL)
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
							(print "Possedez-vous ")
							(princ (cadr currentIngredient))
							(princ " de ")
							(princ (car currentIngredient))
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
									(setq quantite (parse-integer (read-line)))
									(push quantite currentItem)
									(push (reverse currentItem) *BF*)
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

(defun askForDishFeatures ()
	; Type de plat
	(print "Vous cherchez... ")
	(print "	1. un petit_dejeuner")
	(print "	2. une entree")
	(print "	3. un plat")
	(print "	4. un fromage")
	(print "	5. un gouter")
	(print "	6. un dessert")
	(print "	7. peu importe ")
	(let ((choice (parse-integer (read-line))))
		(cond
			((eq choice 1)
				(push '(+categorie petit_dejeuner) *BF*))
			((eq choice 2)
				(push '(+categorie entree) *BF*))
			((eq choice 3)
				(push '(+categorie plat) *BF*))
			((eq choice 4)
				(push '(+categorie fromage) *BF*))
			((eq choice 5)
				(push '(+categorie gouter) *BF*))
			((eq choice 6)
				(push '(+categorie dessert) *BF*))
			(T
				(push '(+categorie tout) *BF*))
		)
	)

	; Difficulté de la réalisation
	(print "Quelle difficulte souhaitez-vous au maximum ?")
	(print "	1. tres facile")
	(print "	2. facile")
	(print "	3. moyen/un peu difficile")
	(print "	4. difficile/peu importe")
	(let ((choice (parse-integer (read-line))))
		(cond
			((eq choice 1)
				(push '(+difficulte 1) *BF*))
			((eq choice 2)
				(push '(+difficulte 2) *BF*))
			((eq choice 3)
				(push '(+difficulte 3) *BF*))
			(T
				(push '(+difficulte 4) *BF*))
		)
	)

	; Temps de preparation (+t_preparation 10)
	(print "Quelle difficulte souhaitez-vous au maximum ?")
	(print "	1. court (< 20 min)")
	(print "	2. moyen (< 40 min)")
	(print "	3. long")
	(let ((choice (parse-integer (read-line))))
		(cond
			((or (eq choice 1) (and (> choice 3)(<= 20)))
				(push '(+t_preparation court) *BF*))
			((or (eq choice 2) (and (> choice 20)(< 40)))
				(push '(+t_preparation moyen) *BF*))
			(T
				(push '(+t_preparation long) *BF*))
		)
	)
)