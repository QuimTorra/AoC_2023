; =========== AOC d2 =========== 
; =========== PART 1 ===========

(defvar maxred 12)
(defvar maxgreen 13)
(defvar maxblue 14)
(defvar total 0)
(defvar game nil)

(defun delimiterp (c) (position c " :;,/"))
(defun split (string &key (delimiterp #'delimiterp))
  (loop :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))

(defun playable (game)
  (defvar ss nil)
  (setq ss (split game))
  (defvar points 0)
  (setq points (parse-integer (nth 1 ss)))
  (loop for i from 2 to (- (length ss) 1)
    do 
      (setq num (parse-integer (nth i ss)))
      (setq i (+ i 1))
      (setq color (nth i ss))
      (cond 
        ((and (string= color "red") (> num maxred))
          (setq points 0)
        )
        ((and (string= color "green") (> num maxgreen))
          (setq points 0)
        )
        ((and (string= color "blue") (> num maxblue))
          (setq points 0)
        )
      )
  )
  points
)

(loop
  (defvar g nil)
  (defvar s 0)
  (setq g (read-line))
  (when (string= g "end") (return total))
  (setq s (playable g))
  (setq total (+ total s))
)
(write total)

; =========== PART 2 ===========

(defvar total 0)
(defvar game nil)

(defun delimiterp (c) (position c " :;,/"))
(defun split (string &key (delimiterp #'delimiterp))
  (loop :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))

(defun power (game)
  (defvar ss nil)
  (setq ss (split game))
  (defvar minred 0)
  (defvar mingreen 0)
  (defvar minblue 0)
  (setq minred 0)
  (setq mingreen 0)
  (setq minblue 0)
  (loop for i from 2 to (- (length ss) 1)
    do 
      (setq num (parse-integer (nth i ss)))
      (setq i (+ i 1))
      (setq color (nth i ss))
      (cond 
        ((and (string= color "red") (> num minred))
          (setq minred num)
        )
        ((and (string= color "green") (> num mingreen))
          (setq mingreen num)
        )
        ((and (string= color "blue") (> num minblue))
          (setq minblue num)
        )
      )
  )
  (* minred minblue mingreen)
)

(loop
  (defvar g nil)
  (defvar s 0)
  (setq g (read-line))
  (when (string= g "end") (return total))
  (setq s (power g))
  (setq total (+ total s))
)
(write total)