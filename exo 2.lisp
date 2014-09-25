(defun list-paire (l)
  (mapcar #'
    (lambda (l) (list l l))
    l
    )
)