(cons 1 (cons 2 (cons 3 nil)))
(cons 1 (cons 2 3))

'(1 . (2 . (3 . nil)))

(cons 2 3)
(cdr (cons 2 3))

;; important if creating an infinite loop for list DO THIS FIRST for better printing
(setf *print-circle* t)
(defparameter foo '(1 2 3))
(setf (cddr foo) foo)

(defparameter *drink-order* '((bill . double-espresso)
			      (lisa . small-drip-coffee)
			      (john . medium-latte)))

(assoc 'lisa *drink-order*)

(push '(lisa . large-mocha-with-whipped-cream) *drink-order*)
(assoc 'lisa *drink-order*)

(defparameter *house* '((walls (mortar (cement)
				(water)
				(sand))
			 (bricks))
			(windows (glass)
			 (frame)
			 (curtains))
			(roof (shingles)
			 (chimney))))

*house*
(assoc 'walls *house*)

;; graphviz stuff

(defparameter *wizard-nodes* '((living-room (you are in the living-room.
					     a wizard is snoring loudly on the couch.))
			       (garden (you are in a beautiful garden. 
					there is a well in front of you.))
			       (attic (you are in the attic. there
				       is a giant welding torch in the corner.))))

(defparameter *wizard-edges* '((living-room (garden west door)
				(attic upstairs ladder))
			       (garden (living-room east door))
			       (attic (living-room downstairs ladder))))


(defun dot-name (exp)
  (substitute-if #\_ (complement #'alphanumericp) (prin1-to-string exp)))

(dot-name 'living-room)
(dot-name 'foo!)
(dot-name '24)
(substitute-if #\e #'digit-char-p "I'm a l33t hack3r!")
(substitute-if 0 #'oddp '(1 2 3 4 5 6 7 8))
(complement #'alphanumericp)

(defparameter *max-label-length* 30)

(defun dot-label (exp)
  (if exp
      (let ((s (write-to-string exp :pretty nil)))
	(if (> (length s) *max-label-length*)
	  (concatenate 'string (subseq s 0 (- *max-label-length* 3)) "...")
	  s))
  ""))


(defun nodes->dot (nodes)
  (mapc (lambda (node)
	  (fresh-line)
	  (princ (dot-name (car node)))
	  (princ "[label=\"")
	  (princ (dot-label node))
	  (princ "\"];"))
	nodes))

(defun edges->dot (edges)
  (mapc (lambda (node)
	  (mapc (lambda (edge)
		  (fresh-line)
		  (princ (dot-name (car node)))
		  (princ "->")
		  (princ (dot-name (car edge)))
		  (princ "[label=\"")
		  (princ (dot-label (cdr edge)))
		  (princ "\"];"))
		(cdr node)))
	edges))

(defun graph->dot (nodes edges)
  (princ "digraph{")
  (nodes->dot nodes)
  (edges->dot edges)
  (princ "}"))

(defun dot->png (fname thunk)
  (with-open-file (*standard-output*
		   fname
		   :direction :output
		   :if-exists :supersede)
    (funcall thunk))
  (ext:shell (concatenate 'string "dot -Tpng -O " fname)))

;; writing to a file
(with-open-file (my-stream
		 "testfile.txt"
		 :direction :output
		 :if-exists :supersede)
  (princ"Hello File!" my-stream))

(let ((cigar 5))
  cigar)

;; to actually create the png file
(graph->png "wizard.dot" *wizard-nodes* *wizard-edges*)

;; function to tie together all the pieces
(defun graph->png (fname nodes edges)
  (dot->png fname 
	    (lambda ()
	      (graph->dot nodes edges))))

;; to draw undirected graphs
(defun uedges->dot (edges)
  (maplist (lambda (1st)
	     (mapc (lambda (edge)
		     (unless (assoc (car edge) (cdr 1st))
		       (fresh-line)
		       (princ (dot-name (caar 1st)))
		       (princ "--")
		       (princ (dot-name (car edge)))
		       (princ "[label=\"")
		       (princ (dot-label (cdr edge)))
		       (princ "\"];")))
		   (cdar 1st)))
	   edges))

(defun ugraph->dot (nodes edges)
  (princ "graph{")
  (nodes->dot nodes)
  (uedges->dot edges)
  (princ "}"))

(defun ugraph->png (fname nodes edges)
  (dot->png fname
	    (lambda ()
	      (ugraph->dot nodes edges))))

(ugraph->png "uwizard.dot" *wizard-nodes* *wizard-edges*)














