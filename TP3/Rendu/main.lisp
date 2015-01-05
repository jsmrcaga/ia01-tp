(setq *BaseResult* NIL)
(setq *BF* '((EAU 20000)(SEL 50)))
(setq *QuestionOk* NIL)

;********************************
;		CHANGER POUR PATH LOCAL
;********************************
(load "br.lisp")
(load "fonctions.lisp")

(defun init ()
	(getFirstIngredients)
	(askForLetter)
	(askForDishFeatures)
)

(defun main ()

	(printExplanation)

	(print "Voulez-vous prendre une base de fait prefabriquee (pour faire une demo) ou bien en construire une ? prefabriquer/initialiser")
	(let ((answer (read-line)))

		; Check reponse correcte
		(loop while (and (not (equal answer "prefabriquer")) (not (equal answer "initialiser"))) do
				(print "Seulement prefabriquer ou initialiser ")
				(setq answer (read-line))
			)

		(if (equal answer "initialiser")
			(progn
				(print "Lancement de la fabrication de BF")
				(init)
			)
			(progn
				(print "Preparation de la BF automatiquement")
				(setq *BF* '((EAU 20000)(SEL 50)(blanc_oeuf 1)
					(extrait_vanille 5)
					(sucre 150)
					(pate_sablee 1)
					(plaque_de_four 1)
					(noix_de_coco_rapee 100)
					(beurre 100)
					(chocolat_noir 400)
					(fromage_blanc 200)
					(oeuf 5)
					(moule_rond 1)
					(rouleau_a_patisserie 1)
					(beurre 100)
					(farine 300)
					(GRAINS_DE_SUCRE 50)
					(creme_liquide 500)
					(jus_citron 30)
					(thermometre_cuisine 1)
					(passoire 1)
					(gaze 1)
					(+t_preparation LONG)
					(+difficulte 4)
					(+categorie tout)))
			)
		)
	)


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

	(print "Voici la base de faits actuelle : ")
	(print *BF*)

	(beginExploration)
	(showFinishedRecipes)

	(setq *BaseResult* NIL)
	(setq *BF* '((EAU 20000)(SEL 50)))
	(setq *QuestionOk* NIL)
	NIL

)

(defun beginExploration ()

	(print "Moteur d'inference en fonctionnement...")
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
