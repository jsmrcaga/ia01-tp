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

					(if (member currentIngredient baseFaits) ;modifier pour associer (lsites avec quantites)
						(progn
							;TO DO
							;tester la quantite
						)

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
									)
								)




						)
					)

				)
			)
		)

)









