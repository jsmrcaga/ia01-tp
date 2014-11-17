; TODO:
; 	- Ajouter APPEND a chaque fonction pour eliminer les sous-listes
; 	- Finir les dernieres modifs

(defun reverseA (arg1 arg2 arg3) ()
	(list arg3 arg2 arg1)
)

(defun reverseB (L)
	(cond
		((= (length L) 1) L)
		((= (length L) 2) (list (cadr L) (car L)))
		((= (length L) 3) (list (caddr L) (cadr L) (car L)))
	)
)

(defun reverseC (L)( ; attention ! il-y-a une erreur !
	if (> (length L) 1) ; condition
		(list (reverseC (cdr L)) (car L)) ; then
		(car L) ; else
	)
)

(defun double(L)
	(if (LISTP L)
		(if (> (length L) 0) ; condition
			(append (list (car L) (car L)) (double (cdr L))) ; then
			(car L) ; else
		)
		(NIL);else
	)
)

(defun doublebis(L)
	(if (LISTP L)
		(if (> (length L) 0) ; condition
			(append
				(if (listp (car L))
					(list (doublebis (car L)))
					(list (car L) (car L))
				)
				(doublebis (cdr L))
			)
			(car L)
		)
		L
	)
)

(defun monAppend (L M)
	(append L M)
)

(defun myEqual(A B)
	(COND
		((and (listp A) (listp B)) 
	 		(EQUAL A B)
	 	)
	 	((and (atom A) (atom B)) 
	 		(EQ A B)
	 	)
	)

)
