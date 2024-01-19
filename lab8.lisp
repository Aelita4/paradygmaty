(defclass book ()
    ((title :initarg :title :accessor book-title)
    (author :initarg :author :accessor book-author)
    (publisher :initarg :publisher :accessor book-publisher)
    (pub-year :initarg :pub-year :accessor book-pub-year)
    (isbn :initarg :isbn :accessor book-isbn))
)

(defparameter *lista* '())

(defmethod add-book ()
    (let (
        (title "")
        (author "")
        (publisher "")
        (pub-year "")
        (isbn ""))

        (write-line "Tytuł: ")
        (setf title (read))
        (write-line "Autor: ")
        (setf author (read))
        (write-line "Wydawca: ")
        (setf publisher (read))
        (write-line "Rok wydania: ")
        (setf pub-year (read))
        (write-line "ISBN: ")
        (setf isbn (read))
    
        (let ((book
            (make-instance 'book
                :title title
                :author author
                :publisher publisher
                :pub-year pub-year
                :isbn isbn
            )))
            (push book *lista*)   
        )
    )
)

(defun search-by-isbn (isbn)
    (let ((found-book nil))
        (dolist (book *lista*)
            (when (equal isbn (book-isbn book))
                (setf found-book book)
            )
        )
        found-book
    )
)

;; (defun delete-book (isbn)
;;     (dotimes (i (length *lista*))
;;         (princ (book-isbn (nth i *lista*)))
;;         (write-line "")
;;         (when (equal isbn (book-isbn (nth i *lista*)))
;;             (setf *lista* (remove (nth i *lista*) *lista*))
;;         )
;;     )
;; )

(defun delete-book (isbn)
    (dolist (book *lista*)
        (when (equal isbn (book-isbn book))
            (setf *lista* (remove book *lista*))
        )
    )
    ;; (setf *lista* (delete-book2 isbn *lista*))
)

(defun list-all-books ()
    (dolist (book *lista*)
        (princ (book-title book))
        (princ " | ")
        (princ (book-author book))
        (princ " | ")
        (princ (book-publisher book))
        (princ " | ")
        (princ (book-pub-year book))
        (princ " | ")
        (princ (book-isbn book))
        (write-line "")
    )
)

(defun display-book (book)
    (princ (book-title book))
    (princ " | ")
    (princ (book-author book))
    (princ " | ")
    (princ (book-publisher book))
    (princ " | ")
    (princ (book-pub-year book))
    (princ " | ")
    (princ (book-isbn book))
    (write-line "")
)

(add-book) ;; 1 2 3 4 5
(add-book) ;; A B C D E
(list-all-books)
(delete-book 'E)
(write-line "")
(list-all-books)
(display-book (search-by-isbn '5))