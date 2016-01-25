;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(+ 1 34)
35


(print "asdf")

"asdf"
"asdf"
(+ 3 (* 2 4))
11

(guess-my-number)
50
50
(smaller)
(defparameter *small* 1)
1
(defparameter *big* 100)
100
(defparameter *foo* 5)
5
*foo*
5

(defparameter *foo* 5)
(defparameter *foo* 7)
*foo*
7

*small*
1

(defun guess-my-number ()
  (ash (+ *small* *big*) -1))
guess-my-number
(ash 11 1)
22
(ash 11 -1)
5
(guess-my-number)
50

(defun return-five ()
  (+ 2 3))
return-five

return-five
return-five
(return-five)
(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))
smaller
(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))
bigger
(bigger)
75
(smaller)
62
(smaller)
56
(defun start-over ()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))
start-over

(let ((a 5)
      (b 6))
  (+ a b))
11
(flet ((f (n)
	  (+ n 10)))
  (f 5))
15
(f 6)
(flet ((f (n)
	  (+ n 10))
       (g (n)
	  (- n 3)))
  (g (f 5)))
12
(labels ((a (n)
	   (+ n 5))
	(b (n)
	   (+ (a n) 6)))
       (b 10))
21

(+ (1 2) 6)
(eq 'fooo 'FoOo)
nil
(eq 'foo 'foo)
t
(eq 'fo 'Fo)
nil
(expt 53 53)
457178469
457178469
(/ 4 6)
0.6666666666666666
(/ 4.0 6)
0.6666666666666666
(princ "adsf")
adsf"adsf"
(princ "He yelled \"Stop that thief!\" from the busy street.")
He yelled "Stop that thief!" from the busy street."He yelled \"Stop that thief!\" from the busy street."
(expt 2 7)
128

'(expt 2 3)
(expt 2 3)
(cons 'chicken 'cat)
(chicken . cat)
(cons 'chicken 'nil)
(chicken)
(cons 'ckck)
(cons 'chicken ())
(chicken)
(cons 'pork '(beef chicken))
(pork beef chicken)
(cons 'beef (cons 'chicken ()))
(beef chicken)
(cons 'pork (cons 'beef (cons 'chicken())))
(pork beef chicken)
(car '(pork beef chicken))
pork
(cdr '(pork beef chicken))
(beef chicken)
(car '(beef chicken))
beef
(car (cdr '(pork beef chicken)))
beef
(cadr '(pork beef chicken))
beef
(list 'pork 'beef 'chicken)
(pork beef chicken)
'(cat (duck bat) ant)
(cat (duck bat) ant)
(car '((peas carrots tomatoes) (pork beef chicken)))
(peas carrots tomatoes)
(cdr '(peas carrots tomatoes))
(carrots tomatoes)
(cdr (car '((peas carrots tomatoes) (pork beef chicken))))
(carrots tomatoes)
(cdar '((peas carrots tomatoes) (pork beef chicken)))
(carrots tomatoes)
(cons (cons 'peas (cons 'carrots (cons 'tomatoes ())))
      (cons (cons 'pork (cons 'beef (cons 'chicken ()))) ()))
((peas carrots tomatoes) (pork beef chicken))
(cddr '((peas carrots tomatoes) (pork beef chicken) duck))
(duck)

(cdr '((peas carrots tomatoes) (pork beef chicken) turtle bird duck))
((pork beef chicken) turtle bird duck)

(turtle bird duck)
(caddr '((peas carrots tomatoes) ( pork beef chicken) turtle duck))
turtle
(car '((peas carrots tomatoes) (pork beef chicken) duck))
(cdr '(peas carrots tomatoes))
(carrots tomatoes)

(cadadr '((peas carrots tomatoes) (pork beef chicken) duck))
beef
(caddr '(1 2 3 4))
3

(cadadr '(1 2 3 4))


(cdr '(2 3 4))
(car '(3 4))
3
(if '()
    'i-am-true
    'i-am-false)
i-am-false
(if '(1)
    'i-am-true
  'i-am-false)
i-am-true





(defun my-length (list)
  (if list
      (1+ (my-length (cdr list)))
    0))
my-length
(my-length '(list with four symbols))
4
(bigger)
59
(start-over)
50
(my-length '((traing dod) (you are) (you)))
3
(cdr '(ks 234))
(234)
(eq '() nil)
t
(eq '() ())
t
(eq '() 'nil)
t





(if (= (+ 1 2) 3)
    'yup
  'nope)
yup
(if (= (+ 1 2) 4)
    'yup
  'nope)
nope
(if (oddp 5)
    'odd
  'even)
odd
(/ 1 0)
(if (oddp 5)
    'odd
  (/ 1 0))
odd
(defvar *number-was-odd* nil)
*number-was-odd*
(if (oddp 5)
    (progn (setf *number-was-odd* t)
	   'odd-number)
  'even-number)
odd-number
*number-was-odd*
t
(defvar *number-is-odd* nil)
(when (oddp 5)
  (setf *number-is-odd* t)
  'odd-number)
odd-number
*number-is-odd*
t
(unless (oddp 4)
  (setf *number-is-odd* nil)
  'even-number)
even-number
*number-is-odd*
nil
(defvar *arch-enemy* nil)
(defun pudding-eater (person)
  (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
	 '(curse you lisp alien - you ate my pudding))
	((eq person 'johnny) (setf *arch-enemy* 'useless-old-johhny)
	 '(i hope you choked on my pudding johnny))
	(t '(why you eat my pudding stranger ?))))





(pudding-eater 'johnny)

(defun pudding-eater (person)
  (case person
    ((henry)  (setf *arch-enemy* 'stupid-lisp-alien)
     '(curse you lisp alien - you ate my pudding))
    ((johnny) (setf *arch-enemy* 'useless-old-johnny)
     '(i hope you choked on my pudding johnny))
    (otherwise '(why you eat my pudding stranger ?))))

(pudding-eater 'johnny)
*arch-enemy*
(pudding-eater
 'sd)
*arch-enemy*
(pudding-eater 'Henry)
(and (oddp 5) (oddp 7) (oddp 9))
(/ 4.0 6)
(expt 53 55)
(+ 2 35)
(or (oddp 4) (oddp 7) (oddp 9))

(defparameter *is-it-even* nil)
*is-it-even*


(or (oddp 4) (setf *is-it-even* t))
*is-it-even*
(defparameter *is-it-even* nil)
(or (oddp 5) (setf *is-it-even* t))
*is-it-even*

(if (member 1 '(3 4 1 5))
    'one-is-in-the-list
    'one-is-not-in-the-list)
(member 1 '(3 4 1 5))
(if (member nil '(3 4 nil 5))
    'nil-in-list
    'nil-not)
(member nil '(3 4 nil 5))

(find-if #'oddp '(2 4 3 5 6 7))
(if (find-if #'oddp '(2 4 5 6))
    'odd
    'no-odd)
(find-if #'null '(2 4 nil 6))

(defparameter *fruit* 'orange)
(cond ((eq *fruit* 'apple) 'its-an-apple)
      ((eq *fruit* 'orange) 'itsanorange))

;; comparing symbols
(equal 'apple 'apple)
;; comparing lists
(equal (list 1 2 3) (list 1 2 3))
;; Identical list created in different ways still compare as teh same
(equal '(1 2 3) (cons 1 (cons 2 (cons 3 ()))))
;; compare integers
(equal 5 5)
;; comparing floating point numbers
(equal 2.5 2.5)
;; comparing strings
(equal "foo" "foo")
;; comparing characters
(equal #\a #\a)

;; using eql to compare numbers and characters instead
(eql 'foo 'foo)
;; comparing numbers
(eql 3.4 3.4)
;; comparing characters
(eql #\a #\a)

;; equalp like equal but can handle some extra difficult cases like strings with diff caps and ints vs floats
;; comparing strings with different CAPS
(equalp "Bob Smith" "bob smith")
;; comparing integers against floating point numbers
(equalp 0 0.0)

;; comparing stuff..you can get by if you use 'eq for comparing symbols and 'equal for everything else


;;;; START OF CHAPTER FIVE

;; this is an association list
(defparameter *nodes* '((living-room (you are in the living-room.
				      a wizard is snoring loudly on the couch.))
			(garden (you are in a beautiful garden.
				 there is a well in front of you.))
			(attic (you are in the attic.
				there is a giant welding torch in the corner.))))









































































