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
	(setq *BF* '((base_croustillante_noix_de_coco 6)
			(appareil_chocolat 1)
			(moule_rond 1)
			(rouleau_a_patisserie 1)
			(+t_preparation MOYEN)
			(+difficulte 2)
			(+categorie dessert)))
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

				; (print "")
				; (print "recette")
				; (print current)
				; (print "BF")
				; (print *BF*)
				; (read-line)
				(if (not (equal NIL (assoc (car current) *BF*)) )()

					(progn
						;***********************************************
						;	ON TEST SI LA RECETTE COMPLETE EXISTE DEJA
						;***********************************************
							;Sinon on balance la recette dans verifyfacts

							(if (equal (verifyFacts (car current)) T) 
								(progn
									(add2BF (list (car current) (caddr current)))
									)
								(progn
									(add2BF (list (car current) 0))
									)
								)
						);FIN TEST RECETTE COMPLETE

				)


			)
		)

)









