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

