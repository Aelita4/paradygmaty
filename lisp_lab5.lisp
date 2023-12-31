(write-line "=====")

(write-line "Zadanie 1")
(write (+ 2 (/ (* 3 4) 8)))
(write-line "")

(write-line "Zadanie 2")
(write (+ (sin 12) (cos (mod 256 32))))
(write-line "")

(write-line "Zadanie 3")
(defun suma (a b)
    (+ a b)
)
(write (suma 3 4))
(write-line "")

(write-line "Zadanie 4")
(defun czyparzysta (x)
    (evenp x)
)
(write (czyparzysta 68))
(write-line "")
(write (czyparzysta 69))
(write-line "")

(write-line "Zadanie 5")
(defun silnia (x)
    (if (= x 0) 1 (* x (silnia (- x 1))))
)
(write (silnia 5))
(write-line "")

(write-line "Zadanie 6")
(defun fibonacci (n)
    (cond
        ((= n 0) 1)
        ((= n 1) 1)
        (t (+ (fibonacci (- n 1)) (fibonacci (- n 2))))
    )
)
(write (fibonacci 10))
(write-line "")

(write-line "Zadanie 7")
(defun sumanieparzystych (a b)
    (do (
        (i a (incf i))
        (suma 0)
    )
    ((> i b) suma)
    (when (oddp i) (setq suma (+ suma i)))
    )    
)
(write (sumanieparzystych 1 20))
(write-line "")

(write-line "Zadanie 8")
(defun sumakwadratow (a b)
    (do (
        (i a (incf i))
        (suma 0)
    )
    ((> i b) suma)
    (setq suma (+ suma (* i i)))
    )    
)
(write (sumakwadratow 1 5))
(write-line "")