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

(defun FB3 (nomP base) ; retourne la liste des personnes dont le nom est précisé en argument
  (if (> (length base) 0)
    (if (eq (nom (car base)) nomP)
        (append (list (car base)) (FB3 nomP (cdr base))) ;then
        (FB3 nomP (cdr base));else
    );then
    NIL
  )
)


(defun FB4 (Xans base) ; retourne la première personne qui a X ans (X = un argument) ou nil
  (if (> (length base) 0)
    (if (eq (age (car base)) Xans)
      (car base)
      (FB4 Xans (cdr base))
    )
    NIL
  )
)

(defun FB5 (base) ; retourne la première personne qui possède moins de 100 livres ou nil
  (if (> (length base) 0)
    (if (< (nombre-livres (car base)) 100)
      (car base)
      (FB5 (cdr base))
    )
    NIL
  )
)

(defun FB6 (X base) ; calcule et retourne la moyenne des âges des personnes de la famille X (X = un argument)
  (setq personnes (FB3 X base))
  (setq somme 0)
  (setq nb 0)
  (dolist (personne personnes) ; pour chaque élément de la liste personneS on exécute la boucle. <=> foreach personneS as personne
    (setq somme (+ somme (age personne)))
    (setq nb (+ nb 1))
  )
  (/ somme nb)
)