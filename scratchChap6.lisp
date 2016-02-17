;; Chapter 6 work area

(print "foo")
(progn (print "this")
       (print "is")
       (print "a")
       (print "test"))
;; prin1 puts everything on one line
(progn (prin1 "this")
       (prin1 "is")
       (prin1 "a")
       (prin1 "test"))

(defun say-hello ()
  (print "Please type your name:")
  (let ((name (read)))
    (print "Nice to meet you, ")
    (print name)))
(say-hello)

(defun test ()
  (print "asdf"))
(test)

(defun add-five ()
  (print "please enter a number:")
  (let ((num (read)))
    (print "When I ad five I get")
    (print (+ num 5))))

(add-five)

(print '3)
(print '3.3)
(print 'foo)
(print '"foo")
(print '#\a)

(progn (princ "This sent will be interuppted")
       (princ #\newline)
       (princ "by an annoying newling character."))

(progn (princ "asdf")
       (princ "  ")
       (princ "second line"))

(defun say-hello () 
  (princ "Please type your anems:")
  (let ((name (read-line)))
    (princ "Nice to meet you, ")
    (princ name)))
(say-hello)

'(+ 1 2) ; data mode
(+ 1 2) ; code mode

(defparameter *foo* '(+ 1 2))
(eval *foo*)

(defun game-repl () 
  (loop (print (eval (read)))))

(game-repl)

;; for the wizard game
(defun game-repl ()
  (let ((cmd (game-read)))
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl))))
;; for the wizard game
(defun game-read ()
  (let ((cmd (read-from-string
	      (concatenate 'string "(" (read-line) ")"))))
    (flet ((quote-it (x)
	     (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))

;; safe commands for the wizards game
(defparameter *allowed-commands* '(look walk pickup inventory))
(defun game-eval (sexp)
  (if (member (car sexp) *allowed-commands*)
      (eval sexp)
      '(i do not know that command.)))

