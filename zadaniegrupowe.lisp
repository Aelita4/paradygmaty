; 18. Ułożyć procedurę (podstaw a b l), która w podanej strukturze l każde wystąpienie elementu b
; zastępuje elementem a.

(defun podstaw (a b l)
    (cond
        ((null l) nil)
        ((atom l) "Nie jest lista")
        ((eq (car l) b) (cons a (podstaw a b (cdr l))))
        (t (cons (car l) (podstaw a b (cdr l))))
    )
)


(print "Zadanie 18. zastepowanie elementow")
(print "Podaj znak ktory bedzie podstawiany: ")
(finish-output) ;; Linuxowa wersja (sbcl) wymaga tego, inaczej nie wystwietla sie tekst przed readem
(defvar a (read))
(print "Podaj znak ktory bedzie zamieniany: ")
(finish-output)
(defvar b (read))
(print "Podaj liste: ")
(finish-output)
(defvar l (read))

(print (podstaw a b l))

; 19. Podaj definicję predykatu (sasiednie? a b l), który jest prawdziwy, jeśli element a i element b
; sąsiadują na liście l.

(defun sasiednie? (a b l)
    (cond
        ((null l) nil)
        ((atom l) "Nie jest lista")
        ((and (eq (car l) a) (eq (nth 1 l) b)) t)
        ((and (eq (car l) b) (eq (nth 1 l) a)) t)
        (t (sasiednie? a b (cdr l)))
    )
)

(print "Zadanie 19. sasiady")
(print "Podaj a: ")
(finish-output)
(defvar a1 (read))
(print "Podaj b: ")
(finish-output)
(defvar b1 (read))
(print "Podaj liste: ")
(finish-output)
(defvar l1 (read))

(print (sasiednie? a1 b1 l1))