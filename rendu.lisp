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

(defun reverseC (L)( ; attention ! ya une erreur !
	if (> (length L) 1) ; condition
		(list (reverseC (cdr L)) (car L)) ; then
		(car L) ; else
	)
)

(defun double(L)
	(if (LISTP L)
		(if (> (length L) 0) ; condition
			(list (car L) (car L) (double (cdr L))) ; then
			(car L) ; else
		)
		(NIL);else
	)
)

