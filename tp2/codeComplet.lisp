(defun switchJ (joueur) ; retourne l’autre joueur que joueur
	(cond
		((eq joueur 'J1) (return-from switchJ 'J2))
		((eq joueur 'J2) (return-from switchJ 'J1))
	)
)

(defun conclusion (joueur liste1 liste2 liste3)
	(let
		((c1 ()) (c2 ()) (c3 ()) )

		; on récupère les conclusions des sous-listes
		(if (listp (car liste1))
			(setq c1 (caddr (car liste1)))
			(setq c1 (caddr liste1))
			)
		(if (listp (car liste2))
			(setq c2 (caddr (car liste2)))
			(setq c2 (caddr liste2))
			)
		(if (listp (car liste3))
			(setq c3 (caddr (car liste3)))
			(setq c3 (caddr liste3))
			)

		; on conclut en fonction des conclusions des sous arbres
		(cond
			((eq 0 (+ c1 c2 c3)) (return-from conclusion 0))
			((eq 6 (+ c1 c2 c3)) (return-from conclusion 2))
			((and (eq joueur 'J1) (>= (+ c1 c2 c3) 3) (not (eq 1 (* c1 c2 c3)))) (return-from conclusion 2))
			((and (eq joueur 'J1) (eq 0 (* c1 c2 c3)) (eq 2 (+ c1 c2 c3)) (or (eq 2 c1) (eq 2 c2) (eq 2 c3))) (return-from conclusion 2))
			((and (eq joueur 'J2) (eq 0 (* c1 c2 c3))) (return-from conclusion 0))
			(T (return-from conclusion 1))
		)
	)
)


(defun creerListe (joueur nbAllu)
        (let (
            (concl NIL)
            (liste1 NIL)
            (liste2 NIL)
            (liste3 NIL)
            (nbAlluIni nbAllu)
            (joueurSuivant (switchJ joueur))
            );fin var let
        
        (cond
            ((and (eq joueur 'J1)(<= nbAllu 3)(>= nbAllu 1)) ; si on est dans un état final : l'IA gagne
                    (setq concl 2) ; c'est un cas favorable du point de vue de l'ordinateur !
                    (setq nbAllu 0)
                    (return-from creerListe
                        (list nbAllu joueurSuivant concl) ; on retourne (0 J2 2)
                    )
            )

            ((and (eq joueur 'J2)(<= nbAllu 3)(>= nbAllu 1))  ; si on est dans un état final : le joueur gagne
                    (setq concl 0) ; c'est un cas défavorable du point de vue de l'ordinateur
                    (setq nbAllu 0)
                    (return-from creerListe
                        (list nbAllu joueurSuivant concl) ; on retourne (0 J1 0)
                    )
            )

            (T (let ( ;si on est dans le cas normal (il reste plus de 3 allumettes)
                    (liste1 (creerListe joueurSuivant (- nbAllu 1)))
                    (liste2 (creerListe joueurSuivant (- nbAllu 2)))
                    (liste3 (creerListe joueurSuivant (- nbAllu 3)))
                    (concl ())
                    )
                    ; on tire la conclusion des 3 sous arbres qu'on vient d'explorer
                    (setq concl (conclusion joueur liste1 liste2 liste3))
                    (return-from creerListe
                        (list (list nbAlluIni joueur concl) liste1 liste2 liste3)
                    )
                ) ; fin let
            );fin default
        );fin cond
    ) ; fin let
) ; fin fonction


(defun allumettesRestantes (possibilite)
    (if (listp (car possibilite)) ; si on nous donne une liste de possibilités
        (return-from allumettesRestantes (car (car possibilite)))
        (return-from allumettesRestantes (car possibilite)) ; si on nous donne juste un état (final)
    )
)

(defun getSsArbre (possibilite conclusion)
    (let 
        (
            (nbAllumALaisser NIL) ; car du sous-arbre avec la conclusion voulue
        )
        (dolist (ssArbre (cdr possibilite)) ; pour chaque sous arbre possible, on regarde la conclusion
            (if (not (LISTP (car ssArbre))) ; 
                (if (eq (car ssArbre) conclusion)
                    (setq nbAllumALaisser (car ssArbre)) ; si c'est la conclusion attendue, on retourne ce sous-arbre
                )
                (if (eq (caddr (car ssArbre)) conclusion)
                    (setq nbAllumALaisser (car ssArbre)) ; si c'est la conclusion attendue, on retourne ce sous-arbre
                )
            )
        )
        (return-from getSsArbre (assoc nbAllumALaisser possibilite))
    )
)

(defun jeuAllumettes ()
   (let ((reponse 'J0) ; le joueur qui commence (ORDI / MOI)
        (aQui2Jouer 'J0) ; la "personne" a qui c'est de jouer (J1 / J2)
        (nbAllum 5) ; le nombre d'allumettes au départ
        (possibilite ()) ; l'arbre des possibilités
        (repAllum 0) ; le nb d'allumettes que l'utilisateur veut retirer
        (tempsDattente 2) ; durée des sleep
        (onSestDejaMoque NIL) ; pour ne se moquer de l'utilisateur qu'une seule fois
        )

        (print "Jeu des allumettes")
        (print "Qui commence ? ORDI/MOI")
        (setq reponse (read-line))
        
        (loop while (and (not (equal reponse "ORDI")) (not (equal reponse "MOI"))) ; blindage
            do (print "Mauvaise réponse ! ORDI/MOI")
            (setq reponse (read-line))
        )

        (print "Combien d'allumettes ? (entre 5 et 20)")
        (setq nbAllum (parse-integer (read-line)))
        (loop while (or (> nbAllum 20) (< nbAllum 5)) ; blindage
            do (setq nbAllum (parse-integer (read-line)))
        )

        (print "Calcul de l'arbre possibilités...")
        (if (equal reponse "ORDI")
            (setq possibilite (creerListe 'J1 nbAllum))
            (setq possibilite (creerListe 'J2 nbAllum))
        )

        (sleep tempsDattente)
        ; (print possibilite)

        (cond
           ((equal reponse "ORDI") (setq aQui2Jouer 'J1))
           ((equal reponse "MOI") (setq aQui2Jouer 'J2))
           )

        (print "Début du jeu !")
        (sleep tempsDattente)

        (loop while (not (eq (allumettesRestantes possibilite) 0)) ; tant qu'il reste des allumettes en jeu
            do (progn
                (print "Nombre d'allumettes restantes :")
                (print (allumettesRestantes possibilite))
                (sleep tempsDattente)
                (if (eq aQui2Jouer 'J1)
                    (progn ; dans le cas où c'est à l'ordi de jouer
                        ; (print "Ordi de jouer")
                        (cond ; l'ordinateur prend sa décision (nombre d'allumettes à retirer)
                            ((equal (cdar possibilite) (list 'J1 2)) ; si on sait qu'on va gagner
                                (if (not onSestDejaMoque) ; on affiche ce message une seule fois
                                    (progn
                                        (print "Je vais gagner ! Héhéhé ^^")
                                        (sleep tempsDattente)
                                        (setq onSestDejaMoque T)
                                    )
                                )
                                ; on choisit le sous-arbre où on est sûr de gagner
                                ; donc on retire (nbd'allumettesrestantes -nbd'alumetteesàlaisserpourquelecassoitfavorable)
                                (setq repAllum (- (allumettesRestantes possibilite) (allumettesRestantes (getSsArbre possibilite 2))))
                            )
                            ((equal (cdar possibilite) (list 'J1 1))
                                ; (print "Bon bah on va bien voir...")
                                ; si il y a un sous arbre où on gagne on le prend, sinon on joue un pour gagner du temps
                                (if (getSsArbre possibilite 2)
                                    (setq repAllum (- (allumettesRestantes possibilite) (allumettesRestantes (getSsArbre possibilite 2))))
                                    (setq repAllum 1)
                                )
                            )
                            ((equal (cdar possibilite) (list 'J1 0))
                                ; (print "Je vais perdre ! Nooooooon !!!")
                                (setq repAllum 1)
                            )
                        )
                        (if (or (> repAllum 3) (< repAllum 1)) ; si le nombre d'allumettes choisi par l'ordi n'est pas correct
                            (print "Erreur de fonctionnement, l'ordinateur essaye de tricher !")
                            )

                        ; on va éliminer les parties de l'arbre de possibilité qui ne sont plus utiles
                        (pop possibilite)
                        (cond ; selon le nombre d'allumettes retirées
                            ((eq repAllum 1) 
                                (print "Je retire une allumette")
                                (setq possibilite (car possibilite)))
                            ((eq repAllum 2) 
                                (print "Je retire deux allumettes")
                                (setq possibilite (cadr possibilite)))
                            ((eq repAllum 3) 
                                (print "Je retire trois allumettes")
                                (setq possibilite (caddr possibilite)))
                        )
                        (setq aQui2Jouer (switchJ aQui2Jouer)) ; on change le joueur
                    )
                    ( ; dans le cas où c'est à l'utilisateur de jouer
                        if (> (allumettesRestantes possibilite) 3)
                            (progn
                                ; (print "utilisateur de jouer")

                                (print "Combien d'allumettes voulez vous retirer ? (entre 1 et 3)")
                                (setq repAllum (parse-integer (read-line)))
                                (when (or (> repAllum 3) (< repAllum 1)) ; blindage
                                    (setq repAllum (parse-integer (read-line)))
                                )

                                ; on va éliminer les parties de l'arbre de possibilité qui ne sont plus utiles
                                (pop possibilite)
                                (cond ; sur le nombre d'allumettes retirées
                                    ((eq repAllum 1) (setq possibilite (car possibilite)))
                                    ((eq repAllum 2) (setq possibilite (cadr possibilite)))
                                    ((eq repAllum 3) (setq possibilite (caddr possibilite)))
                                )
                                (setq aQui2Jouer (switchJ aQui2Jouer))
                            )
                    )
                ) ; fin if des utilisateurs
            ) ; fin progn
            ; (print possibilite)
        ) ; fin loop

        ; le jeu est terminé
        (cond ; sur le résultat à la fin
            ((equal possibilite '(0 J1 0))
                (print "Il reste moins de 3 allumettes !")
                (sleep tempsDattente)
                (print "On considère que vous les retirez toutes")
                (print "donc vous avez gagné, bravo !")
                )
            ((equal possibilite '(0 J2 2)) 
                (print "Il reste moins de 3 allumettes et c'est à l'ordinateur de jouer...")
                (sleep tempsDattente)
                (print "Il vient de toutes les prendre")
                (print "donc vous avez perdu, désolé...")
                )
        )
   )
)


(defun afficherListe (liste)
    (let ((prefixe 0))
        (format t "~S~%" (car liste)) ; on affiche le premier élément de la liste, qui est un cas particulier
        (printTree (cdr liste) (+ prefixe 1)) ; on afficher le reste de la liste
    )
)

(defun printTree (liste prefixe)
    (dolist (elemListe liste) ; pour chaque élément de la liste
        (if (and (listp elemListe) (listp (car elemListe))) ; si on est avec un état possédant des successeurs
            (progn
                (dotimes (i prefixe)
                    (format t "|~T~T~T") ; on affiche le nombre de préfixes qu'il faut
                )
                (format t "~S~%" (car elemListe)) ; on affiche l'état actuel
                (printTree (cdr elemListe) (+ prefixe 1)) ; on affiche les suivant avec une indentation de plus
            )
            (progn ; si on est avec un état sans successeur
                (dotimes (i prefixe)
                    (format t "|~T~T~T")
                )
                (format t "~S" elemListe) ; on l'affiche avec le nb de préfixe utiles
                (cond
                    ((equal elemListe '(0 J1 0)) (format t " l'ordinateur perd~%" elemListe))
                    ((equal elemListe '(0 J2 2)) (format t " l'ordinateur gagne~%" elemListe))
                )
            )
        )
    )
)


(defun exploreLargeur (nbAllu joueur)
	(setq etatInit (list 0 nbAllu joueur))
	(setq flagFirst 0)
	(setq listeComplete '())
	(setq listeActuelle '())
	(setq etatActuel (list 0 nbAllu joueur)) ;on affecte l'etat initial a etatActuel vu qu'on commencera par lui
	(setq a_visiter '())
			
	(setq a_visiter  (list etatActuel))


	(loop while (not (eq a_visiter NIL)) do
		
		(setq etatActuel (car a_visiter)) ;on affecte le premier etat de a_visiter a l'etatActuel
		(setq listeActuelle (list etatActuel))

				(dotimes (i 3)
					(if (> (- (cadr etatActuel) i) 0 )(progn
					
							(setq listeAppend (list (+ (car etatActuel) 1) (- (cadr etatActuel) (+ 1 i)) (setq joueur (switchJ joueur)) ))
							
							(if (and (= 3 (list-length listeActuelle)) (not (listp (car listeActuelle)))) (progn ;on verifie pour la premiere insertion
									;(format t "Entre en premiere insertion~%")
									(setq listeActuelle (list listeActuelle listeAppend))

									(if (not (= (cadr listeAppend) 0))(
										setq a_visiter (list a_visiter listeAppend)
									))

								)(progn ;else pour les insertions suivantes

									;(format t "Entre en insertion 2~%")
									(setq listeActuelle (append listeActuelle (list listeAppend)))
									
									(if (not (= (cadr listeAppend) 0))(progn ;par-ce qu'il est inutile de visiter un etat qui a 0 allumettes

											;(format t "Entre en a_visiter:~S~%" a_visiter)
											(setq a_visiter (append a_visiter (list listeAppend)))
										))
								)) 

					)( progn;else
						(setq listeAppend (list (+ (car etatActuel) 1) 0 (setq joueur (switchJ joueur)) )) ; on met le nombre d'allumettes a 0	
						(setq listeActuelle (append listeActuelle (list listeAppend)))
						)
					)
			
					;(format t "ListeActuelle:~S~%~%" listeActuelle)
					;(format t "Liste a_visiter:~S~%~%" a_visiter)
				)

				(if (= flagFirst 0) (progn
						;(format t "Liste Complete NIL~%")

						(setq listeComplete (list listeActuelle))
						(setq flagFirst 1)
					)(progn
						;(format t "Liste Complete !NIL~%")
						;(format t "Liste Complete Pre-aff: ~S~%" listeComplete)
						(setq listeComplete (append listeComplete (list listeActuelle)))
						;(format t "Liste Complete Post-aff: ~S~%" listeComplete)
					)
				)
								
				;(format t "Liste Complete fin dotimes:~S~%" listeComplete)

				(setq listeActuelle '()) ;on reinit listeActuelle
				(pop a_visiter) ;on retire l'etat qu'on visite actuellement de a_visiter

				;(format t "A_visiter:~S~%~%-----------------------~%" a_visiter)
				)

	(return-from exploreLargeur listeComplete)
)





(defun assocList (listCle listeRecherche)(
	if (listp listeRecherche) (progn

		(dolist (elRecherche listeRecherche)
			(if (equal (car elRecherche) listCle)(

				return-from assocList elRecherche

				))

			)
			
		)(progn

		(print "listeRecherche n'est pas une liste")
		(return-from assocList) 
		)
	)
)



(defun afficherListeLargeur (liste)
    (let ((prefixe 0))
        (printTreel (car liste) liste prefixe) ; on afficher le reste de la liste
    )
)

(defun printTreel (pere liste prefixe)
    (if (listp (car pere))
        (progn ; si on est avec un état possédant des successeurs
            (dotimes (i prefixe)
                (format t "|~T~T~T") ; on affiche le nombre de préfixes qu'il faut
            )
            (format t "~S~%" (cdar pere)) ; on affiche l'état actuel (sans écrire le car qui est le numéro de tour)

            ; on va afficher les états suivants
            (if (eq (cadr (cadr pere)) 0) ; si le premier successeur est un EF, l'assoc n'existe pas
            	(printTreel (cadr pere) liste (+ prefixe 1))
	            (printTreel (assocList (cadr pere) liste) liste (+ prefixe 1))
            )
            (if (eq (cadr (caddr pere)) 0) ; idem, soit on affiche juste l'EF, soit on affiche le successeur et des successeurs
            	(printTreel (caddr pere) liste (+ prefixe 1))
	            (printTreel (assocList (caddr pere) liste) liste (+ prefixe 1))
            )
            (if (eq (cadr (cadddr pere)) 0) ; idem
            	(printTreel (caddr pere) liste (+ prefixe 1))
	            (printTreel (assocList (cadddr pere) liste) liste (+ prefixe 1))
            )
        )
        (progn ; si on est avec un état sans successeur (Etat Final)
            (dotimes (i prefixe) ; on affiche le nombre de préfixes nécessaires
                (format t "|~T~T~T")
            )
            (format t "~S" (cdr pere)) ; on affiche l'état Final
            (cond
                ((equal (cdr pere) '(0 J1)) (format t " l'ordinateur perd~%" pere))
                ((equal (cdr pere) '(0 J2)) (format t " l'ordinateur gagne~%" pere))
                (T (format t "~%" pere))
            )
        )
    )
)



(defun exploreBDF (etatInit liste_possibilites)  
	 (setq a_visit (list etatInit)); liste des visites à faire, forme :(sommet parent grand-parent ...)
	 (setq deja_visite ())
	 

	 (print "Debut de l'exploration de l'arbre")
	 (loop
		 (if (not (eq a_visit NIL))

		(progn
			(format t "Entre dans le if~%")
			(setq actuel (car a_visit))
			(format t "Actuel:~S~% " actuel)
			 (print actuel) 
			 (push actuel deja_visite) 
			 (dolist (fils (cdr (assocList actuel liste_possibilites))) 
				 (if (not (member fils deja_visite))
					 (if (not (eq (cadr fils) 0)) 
						 (progn
						 	(setq a_visit (append a_visit (list (append (list fils) (list actuel)))))
						 (format t "Nouveau a_visit ~S~%" a_visit)
						 )
						; on ajoute (fils acutel) en fin de liste 
						 (progn ;else
						 (setq a_visit ()) ; on vide la liste 
						 (setq resultat (append (list actuel))) 
						 ) 
					 ) 
				 ) 
			 )
			 (pop a_visit) ; on enlève le premier élément de la liste
		 )
		 (progn
			 (print "Fini ! Voilà le résultat : ")
			 (if resultat 
				 (print (reverse resultat)); on inverse le chemin, et on l'affiche
				 NIL ; on retourne NIL si on a pas trouvé la sortie 
			 )
			 (return)
			 )
		 )
	 )
)