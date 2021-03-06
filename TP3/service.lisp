(defun printExplanation () 

	(print "Bienvenue au Systeme Expert de Cuisine!")
	(print "Grace a ce systeme vous pourrez trouver des recettes a partir des ingredients que vous possedez et du temps que vous comptez consacrer a la preparation de la recette")
	(print "Veuillez donc nous indiquer les ingredients que vous voulez choisir en commencant par taper la premiere lettre du nom")
	(print "On vous proposera donc une liste d'ingredients, il suffira de taper le numero de lingredient correspondant")
	(print "On vous demandera ensuite la qtte que vous en possedez, liquides en ml, solides en grammes, et autres en unites")
	NIL
)


(defun getFirstIngredients () 

	(let (
		(currentItem NIL)
		(ingredBase '(sucre oeuf farine lait beurre))
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
			(add2BF (reverse currentItem))

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

		(dolist (currentIngredient (cadr (assoc ingredient *BR*))) ; pour chaque ingrédient de la recette courante
			(if (or (equal (string (symbol-name (car currentIngredient))) "+T_PREPARATION")
								(equal (string (symbol-name (car currentIngredient))) "+DIFFICULTE")
								(equal (string (symbol-name (car currentIngredient))) "+CATEGORIE"))
				; si c'est une exception
				; si ça ne correspond pas à la BF (= aux souhaits de l'utilisateur), on quitte
				(if (handleException currentIngredient) (return))

				; sinon, si c'est un ingrédient normal
				(progn
					(if  (not (equal NIL (assoc (car currentIngredient) *BF*)))
						; si l'assoc retourne qq chose : l'ingredient existe dans la base de faits

						;*******************
						;	Si l'ingredient est dans la base de faits
						;*******************
							(if (>= (cadr (assoc (car currentIngredient) *BF*)) (cadr currentIngredient)) ;si la qtte est superieure a la regle

								; (on utilise cadr pour prendre la valeur numerique de quantite sans parentheses)
								() ; all good


								; il n'y a pas assez de l'ingrédient actuel
								(return-from verifyFacts NIL) ;juste pour "break" le loop
							)

						;*******************
						;	Si l'ingredient n'est pas dans la base de faits
						;*******************
							(if (and *QuestionOk* (askQuestion currentIngredient)) ; si en posant la question on obtient l'ingrédient
								() ; then, all ok !

								;else si la reponse est NON (= il n'y en a pas assez / on ne pose pas la question)
								; ---> on check si il est dans la BR pour voir si on peut fabriquer l'ingrédient courant
									 ; càd s'il existe dans les recettes et n'existe pas dans la BF
								(if (and (equal NIL (assoc (car currentIngredient) *BF*))
									(not (equal NIL (assoc (car currentIngredient) *BR*)))
									)
									
									; on regarde si on peut effectivement le fabriquer
									(if (equal (verifyFacts (car currentIngredient)) T)
										; si oui, on met à jour la valeur
										(progn
											(if (assoc (car currentIngredient) *BF*)
												(setq *BF* (remove (assoc (car currentIngredient) *BF*) *BF*))
											)
											(add2BF currentIngredient)
										)
										(setq allIngred NIL)
									)

									; s'il n'est pas "fabriquable" c'est la fin des haricots, on ne peut rien faire...
									(return-from verifyFacts NIL)

								)
							)
					); FIN IF l'ingrédient est/n'est pas dans la BF
				); FIN PROGN
			) ; FIN IF c'est une exception ou un ingrédiant normal
		) ; FIN DOLIST

		; si tous les ingrédients de la recette sont OK, la recette est vérifiée (= faisable)
		(if (equal allIngred T)
			T
			NIL
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
				(add2BF '(+categorie petit_dejeuner)))
			((eq choice 2)
				(add2BF '(+categorie entree)))
			((eq choice 3)
				(add2BF '(+categorie plat)))
			((eq choice 4)
				(add2BF '(+categorie fromage)))
			((eq choice 5)
				(add2BF '(+categorie gouter)))
			((eq choice 6)
				(add2BF '(+categorie dessert)))
			(T
				(add2BF '(+categorie tout)))
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
				(add2BF '(+difficulte 1)))
			((eq choice 2)
				(add2BF '(+difficulte 2)))
			((eq choice 3)
				(add2BF '(+difficulte 3)))
			(T
				(add2BF '(+difficulte 4)))
		)
	)

	; Temps de preparation (+t_preparation 10)
	(print "Quel temps de preparation souhaitez-vous au maximum ?")
	(print "	1. court (< 20 min)")
	(print "	2. moyen (< 40 min)")
	(print "	3. long")
	(let ((choice (parse-integer (read-line))))
		(cond
			((or (eq choice 1) (and (> choice 3)(<= 20)))
				(add2BF '(+t_preparation court)))
			((or (eq choice 2) (and (> choice 20)(< 40)))
				(add2BF '(+t_preparation moyen)))
			(T
				(add2BF '(+t_preparation long)))
		)
	)
)

(defun askQuestion (&optional ingredient)
	; demande si l'ingrédient est dans la possession de l'utilisateur
	; ajoute l'information à la *BF*
	; retourne T si il en possède, NIL sinon
	; Attention ! Prérequis : ingredient NE FAIT PAS PARTIE DE *BF*
	(let (answer qte)
		(write-char #\space) ; retour à la ligne sans print

		(if (eq (cadr ingredient) 1)
			(progn ; si on fait la phrase au singulier
				(princ "Possedez-vous un(e) ")
				(princ (car ingredient))
				(princ " ? Y/N ")
				(setq answer (read-line))

				; Check reponse correcte
				(loop while (and (not (equal answer "Y")) (not (equal answer "N"))) do
						(print "Seulement Y ou N ")
						(setq answer (read-line))
					)

				; Push *BF*
				(if (equal answer "Y")
					(progn
						(add2BF (list (car ingredient) 1))
						(setq qte 1)
					)
					(progn
						(add2BF (list (car ingredient) 0))
						(setq qte 0)
					)
					)
				)
			(progn ; si on la fait au pluriel
				(princ "Possedez-vous de la/du ")
				(princ (car ingredient))
				(princ " ? Indiquez une quantite ")
				(setq qte (parse-integer (read-line)))

				; Check reponse correcte
				(loop while (< qte 0) do
					(print "Rentrez un nombre positif svp ")
					(setq qte (parse-integer (read-line)))
					)

				(if (eq qte NIL)
					(setq qte 0))

				; push BF
				(add2BF (list (car ingredient) qte))
			)
		)

		(if (>= qte (cadr ingredient))
			T
			NIL
		)
	)
)

(defun handleException (currentIngredient)

	(if (equal (string (symbol-name (car currentIngredient))) "+T_PREPARATION")
		(cond
			( (and (equal (string (cadr (assoc 'T_PREPARATION *BF*))) "COURT") (> (cadr currentIngredient) 20))
				(return-from handleException T)
			)
			( (and (equal (string (cadr (assoc 'T_PREPARATION *BF*))) "MOYEN") (> (cadr currentIngredient) 40))
				(return-from handleException T)
			)
		)
	)

	(if (and (equal (string (symbol-name (car currentIngredient))) "+DIFFICULTE")
		(> (cadr (assoc '+DIFFICULTE *BF*)) (cadr currentIngredient)) ;Si la difficulte est inferieure a celle de la recette
		)
		(progn 
			(if (not (equal (cadr (assoc '+DIFFICULTE *BF*)) 4)) ; Si ce n'est pas 4 on quitte la boucle
				(return-from handleException T)
			)
		)
	)

	; (if (and (equal (string (symbol-name (car currentIngredient))) "+CATEGORIE")
	; 	(not (equal (string (cadr (assoc '+CATEGORIE *BF*))) (string (cadr currentIngredient)))) ;Si la categorie n'est pas la meme
	; 	)
	; 	(progn 
	; 		(if (not (equal (string (cadr (assoc '+CATEGORIE *BF*))) "TOUT")) ; Si ce n'est pas tout on quitte la boucle
	; 			(return-from handleException T)
	; 			)
	; 	)
	; )	
)

(defun add2BF (ingredient)
	(if (listp ingredient)
		(if (eq (length ingredient) 2)
			(if (assoc (car ingredient) *BF*)
				(progn
					(print "Attention, ce truc est deja dans la BF. Action d'ajout ignoree !")
					(print ingredient)
				)
				(progn
					(push ingredient *BF*)
					(if (and (assoc '+CATEGORIE (cadr (assoc (car ingredient) *BR*))) (not (eq (cadr ingredient) 0)))
						(push (car ingredient) *BaseResult*)
					)
				)
			)
			(progn
				(print "Erreur, l'ingredient n'est pas de la forme (igredient qte)")
				(print ingredient)
			)
		)
		(progn
			(print "Erreur, ingredient n'est pas une liste")
			(print ingredient)
		)
	)
)

(defun showFinishedRecipes()
	(let (
		(index 0)
		(recipesOrder NIL)
		(recipeChosen NIL)
		(subRecipes NIL)
		)

		(if *BaseResult*
			(progn
				(print "Choisissez la recette a afficher grace au numero!")
				(dolist (currentRecipe *BaseResult*)
					(if currentRecipe
						(progn
							(print index)
							(princ ": ")
							(princ currentRecipe)
							(push (list index currentRecipe) recipesOrder)
							(setq index (+ index 1))
						)
						()
					)
				)

				(print "Entrez le numero de la recette a afficher: ")
				(setq recipeChosen (parse-integer (read-line)))
				(setq recipeChosen (cadr (assoc recipeChosen recipesOrder)))
				


				(setq subRecipes (searchIngredients recipeChosen))
				(push recipeChosen subRecipes)
				(dolist (currentRecipe subRecipes)
					(if currentRecipe
						(progn
								(print "Pour faire ")
								(princ currentRecipe)
								(princ " vous aurez besoin de:")

									(dolist (currentIngredient (cadr (assoc currentRecipe *BR*)))
										(print currentIngredient)
										)
								(print "*******************")
						)
						()
					)
				)
			)
			(print "Le SE n'a pas trouve de recette !")
		)
	)
)

(defun searchIngredients (recipe)
	(let (
		(tempList NIL)
		)

		(dolist (currentIngredient (cadr (assoc recipe *BR*)))
			(if (assoc (car currentIngredient) *BR*)
				(progn

					(push (car currentIngredient) tempList)
					(push (cadr (searchIngredients (car currentIngredient))) tempList)

				)
			)
		)

		tempList

	)
)
