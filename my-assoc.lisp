; Check le premier element de chaque duplet dans a-liste
; Si la cle est la meme, le retour de la fonction est le
; duplet lui meme, permettant ainsi de parcourir une base
; de donnees en duplet

(defun my-assoc(cle liste)
	(declare (special cle))
     (mapcar
      '(lambda (l)
                (if (eq (car l) cle)
				(print l);then
				NIL;else
			))
		liste
	)
)