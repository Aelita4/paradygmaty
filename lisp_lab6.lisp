(write-line "")
;; (write (cons '(2 3) '(4 5)))
;; (setq stos nil)

;; (push 10 stos)
;; (push 30 stos)
;; (write stos)
;; (write (pop stos))
;; (write stos)

;; (dotimes (i 10) (print i))

;; (do (
;;     (i 0 (incf i))
;;     (j 10 (decf j)))
;;     ((zerop j) 'done)
;;     (print (+ i j))
;; )

;; (loop for i from 1 to n)

;; (dolist (item '(1 2 3 4)) (print item)) ;; forEach

(defun zad1 (lista1 lista2)
    (append lista1 lista2)
)

(defun zad1_bezappend (lista1 lista2)
    (let ((wynik '()))
        (dolist (i lista1) (push i wynik))
        (dolist (i lista2) (push i wynik))
        (reverse wynik)
    )
)

(print (zad1_bezappend '(1 2 3 4) '(a b c d)))

(defun zad2 (lista)
    (let ((wynik '()))
        (dolist (i lista) (push i wynik))
        wynik
    )
)

(print (zad2 '(1 2 3 4)))

(defun zad3 (lista)
    (let ((odwrocona (zad2 lista)))
        (equal lista odwrocona)
    )
)

(print (zad3 '(k a m i l s l i m a k)))

(defun zad4 (lista)
    (let ((wynik '()))
        (dolist (i lista) (push i wynik))
        (let ((sorted '()))
            (loop while wynik do
                (let ((maxi (car wynik)))
                    (dolist (i wynik) (when (> i maxi) (setq maxi i)))
                    (push maxi sorted)
                    (setq wynik (remove maxi wynik))
                )
            )
            sorted
        )
    )
)

(print (zad4 '(7 2 4 3 9 1 8)))