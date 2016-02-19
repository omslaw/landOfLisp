;; the utility created in chap 7
(load "graph-util")

;; defining the global variables
(defparameter *congestion-city-nodes* nil)
(defparameter *congestion-city-edges* nil)
(defparameter *visited-nodes* nil)
(defparameter *node-num* 30)
(defparameter *edge-num* 45)
(defparameter *worm-num* 3)
(defparameter *cop-odds* 15) ;; 1 in 15 chance for a cop

;; generating random edges
(defun random-node ()
  (1+ (random *node-num*)))

(defun edge-pair (a b)
  (unless (eql a b)
    (list (cons a b) (cons b a))))

(defun make-edge-list ()
  (apply #'append (loop repeat *edge-num*
			collect (edge-pair (random-node) (random-node)))))



(make-edge-list)


(random 30)









