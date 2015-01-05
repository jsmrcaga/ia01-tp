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

	(printExplanation)
	(getFirstIngredients)
	(askForLetter)
	(askForDishFeatures)

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
	; (setq *BF* '((EAU 20000)(SEL 50)(blanc_oeuf 1)
	; 		(extrait_vanille 5)
	; 		(sucre 150)
	; 		(pate_sablee 1)
	; 		(plaque_de_four 1)
	; 		(noix_de_coco_rapee 100)
	; 		(beurre 100)
	; 		(chocolat_noir 400)
	; 		;(mascarpone 300)
	; 		(fromage_blanc 200)
	; 		(oeuf 5)
	; 		(moule_rond 1)
	; 		(rouleau_a_patisserie 1)
	; 		(beurre 100)
	; 		(farine 300)
	; 		(GRAINS_DE_SUCRE 50)
	; 		(creme_liquide 500)
	; 		(jus_citron 30)
	; 		(thermometre_cuisine 1)
	; 		(passoire 1)
	; 		(gaze 1)
	; 		(+t_preparation LONG)
	; 		(+difficulte 4)
	; 		(+categorie tout)))

	(print "Voici la base de faits actuelle : ")
	(print *BF*)

	(beginExploration)
	(showFinishedRecipes)

	NIL

)

(defun beginExploration ()

	(dolist (current *BR*)

		(if (not (equal NIL (assoc (car current) *BF*))) ()

		;***********************************************
		;	ON TEST SI LA RECETTE COMPLETE EXISTE DEJA
		;***********************************************
			;Sinon on appelle verifyFacts pour vérifer la recette

			(if (equal (verifyFacts (car current)) T) 
				(progn
					(add2BF (list (car current) (caddr current)))
				)
				(add2BF (list (car current) 0))
			)
		)
	)
)








