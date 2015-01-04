;Recursivite sur les elements pour trouver les profondeurs des recettes
; + qtte des elements pour faire le 0+ du moteur
;Appareil => on ajoute des melanges "naturels" pour les recettes en tant que mini recettes.
(setq ingBase '())
(setq listeEnum ())
(setq baseFaits NIL)
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
	

)


(defun verifyFacts () 
	(dolist (currentRecipe *BR*)
		
		(if (member currentRecipe listOfFacts) () (
			progn

				(dolist (currentIngredient (cadr currentRecipe)) 
					(if (not (member currentIngredient listOfFacts))
					(;then
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

(defun getFirstIngredients () 

	(let (
		(dejaUtilise NIL)
		(index 0)
		(currentItem NIL)
		(selectedIngred NIL)
		(listOfItems NIL)
		) ; fin dec var


		(dolist (current *ingredBase*) 
												
				
				(if (member (car current) dejaUtilise) () ;s'il nest pas deja utilise
					(progn
						(push (car current) currentItem)
						(push index currentItem)
						(push currentItem listOfItems)
						(setq currentItem NIL)
						(print index)
        				(princ ": ")
						(setq index (+ index 1))
        				(princ (car current))
						(push (car current) dejaUtilise)
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





