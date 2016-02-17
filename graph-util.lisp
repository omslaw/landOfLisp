;; from chap 7 and this can be used later to create graphs

;; these two params are just examples to use
(defparameter *wizard-nodes* '((living-room (you are in the living-room.
					     a wizard is snorning loudly on the couch.))
			       (garden (you are in a beautiful garden.
					there is a well in front of you.))
			       (attic (you are in the attic. there
				       is a giant welding torch in the corner.))))

(defparameter *wizard-edges* '((living-room (garden west door)
				(attic upstairs ladder))
			       (garden (living-room east door))
			       (attic (living-room downstairs ladder))))


;; converting node identifiers
(defun dot-name (exp)
  (substitute-if #\_ (complement #'alphanumericp) (prin1-to-string exp)))

;; adding labels to graph nodes
(defparameter *max-label-length* 30)
(defun dot-label (exp)
  (if exp 
      (let ((s (write-to-string exp :pretty nil)))
	(if (> (length s) *max-label-length*)
	    (concatenate 'string (subseq s 0 (- *max-label-length* 3)) "...")
	    s))
      ""))

;; generating the DOT information for the nodes
(defun nodes->dot (nodes)
  (mapc (lambda (node)
	  (fresh-line)
	  (princ (dot-name (car node)))
	  (princ "[label=\"")
	  (princ (dot-label node))
	  (princ "\"];"))
	nodes))

;; converting edges into DOT format
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

;; generating all the DOT data
(defun graph->dot (nodes edges)
  (princ "digraph{")
  (nodes->dot nodes)
  (edges->dot edges)
  (princ "}"))

;; turning the DOT into a picture
(defun dot->png (fname thunk)
  (with-open-file (*standard-output*
		   fname 
		   :direction :output 
		   :if-exists :supersede)
    (funcall thunk))
  (ext:shell (concatenate 'string "dot -Tpng -O " fname)))

;; creating a picture of our graph
;; this ties all the pieces together
(defun graph->png (fname nodes edges)
  (dot->png fname
	    (lambda ()
	      (graph->dot nodes edges))))

;; to create the actual png you would write this in the console
;;
;; (graph->png "wizard.dot" *wizard-nodes* *wizard-edges*)
;;




;; the above did directed graphs with arrows pointing both way. 
;; to create an undirected graph, just lines connecting the nodes 

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
  (princ "graph{")  ;; note it's graph and not digraph (directional graph lol)
  (nodes->dot nodes)
  (uedges->dot edges)
  (princ "}"))

(defun ugraph->png (fname nodes edges)
  (dot->png fname
	    (lambda ()
	      (ugraph->dot nodes edges))))

;; now to create the undirectional graph the command is below
;;
;; (ugraph->png "uwizard.dot" *wizard-nodes* *wizard-edges*)
;;


	     
;; (ugraph->png "utest.dot" *wizard-nodes* *wizard-edges*)


  





