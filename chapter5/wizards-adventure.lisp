;; Chapter 5 Wizards Adventure Text Game

(defparameter *nodes* '((living-room (you are in the living room.
					  a wizard is snoring loudly on the couch.))
			(garden (you in a beautiful garden.
				     there is a well in front of you.))
			(attic (you are in the attic.
				    there is a giant welding torch in the corner.))))

(defparameter *edges* '((living-room (garden west door)
				     (attic upstairs ladder))
			(garden (living-room east door))
			(attic (living-room downstairs ladder))))



;; test commit
