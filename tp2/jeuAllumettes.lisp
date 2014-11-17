(defun jeuAllumettes
	(let ((reponse 'J0)
		(nbAllum 0)
		(possibilite ()))

		(print "Jeu des allumettes")
		(print "Qui commence ? ORDI/MOI")
		; reponse XXX
		(while (and (not (eq reponse 'ORDI)) (not (eq reponse 'MOI)))
			; reponse XXX
			)

		(print "Combien d'allumettes ? (entre 0 et 20)")
		; reponse XXX
		(while (or (> reponse 20)) (<= reponse 0))
			; reponse XXX
			)

		(print "Calcul de l'arbre posibilités...")
		(if (eq reponse 'ORDI)
			(setq possibilite (creerListe 'J1 nbAllum))
			(setq possibilite (creerListe 'J2 nbAllum))
			)

		
	)
)