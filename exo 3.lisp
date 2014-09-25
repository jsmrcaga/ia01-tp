(defun nom (personne)
  (car personne
  )
  )

(defun prenom (personne)
  (cadr personne
  )
  )

(defun ville (personne)
  (caddr personne
  )
  )

(defun age (personne)
  (cadddr personne
  )
  )

(defun nombre-livres (personne)
  (cadr (cdddr personne)
  )
  )

(defun FB1 (Base) ; affiche toutes les personnes
  Base
  )

(defun FB2 (Base) ; affiche les personnes qui s'appellent Perrot
  (if (not (null Base))
      (cons (if (eq (nom (car Base)) 'Perrot)
          (car Base)
        )
       (FB2 (cdr Base))
     )
  )
)

(defun FB3 () ; retourne la liste des personnes dont le nom est précisé en argument
  )

(defun FB4 () ; retourne la première personne qui a X ans (X = un argument) ou nil
  )

(defun FB5 () ; retourne la première personne qui possède moins de 100 livres ou nil
  )

(defun FB6 () ; calcule et retourne la moyenne des âges des personnes de la famille X (X = un argument)
  )
