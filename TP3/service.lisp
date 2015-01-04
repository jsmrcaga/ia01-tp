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

			)
	)
)

(defun verifyFacts () 
	(dolist (currentRecipe *BR*)
		
		(if (member currentRecipe listOfFacts) () (
			progn

				(dolist (currentIngredient (cadr currentRecipe)) 
					(if (not (member currentIngredient listOfFacts))
					(progn ;then
						(prin1 "Est-ce que vous possedez du ")
						(princ currentIngredient)
						(prin1 "?")
						)
					(;else
						)

					)	

				)
		))

	)
)

(defun askForDishFeatures ()
	(print "Vous cherchez... ")
	(print "	1. un petit_dejeuner")
	(print "	2. une entree")
	(print "	3. un plat")
	(print "	4. un fromage")
	(print "	5. un gouter")
	(print "	6. un dessert")
	(print "	7. peu importe")
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
)