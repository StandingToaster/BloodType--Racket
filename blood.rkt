;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname blood) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;****************************************************
;; Harsimran Kalsi 21014666
;; CS 135 Fall 2022
;; Assignment 02 Question 4
;;****************************************************

;; (can-donate-to/cond? donor recipient) determines if
;; the recipient can accept the donor's blood
;;Examples:
(check-expect (can-donate-to/cond? 'O- 'AB+) true)
(check-expect (can-donate-to/cond? 'B- 'A+) false)
(check-expect (can-donate-to/cond? 'AB+ 'AB+) true)
(check-expect (can-donate-to/cond? 'B- 'B+) true)

;; can-donate-to/cond?: Sym Sym -> Bool
(define (can-donate-to/cond? donor recipient)
  (cond
    [(symbol=? donor 'O-) true]
    [(symbol=? recipient 'AB+) true]
    [(symbol=? recipient donor) true]
    [(symbol=? donor 'O+) (cond
                            [(symbol=? recipient 'A+) true]
                            [(symbol=? recipient 'B+) true]
                            [else false])]
    [(symbol=? donor 'A-) (cond
                            [(symbol=? recipient 'A+) true]
                            [(symbol=? recipient 'AB-) true]
                            [else false])]
    [(symbol=? donor 'B-) (cond
                            [(symbol=? recipient 'B+) true]
                            [(symbol=? recipient 'AB-) true]
                            [else false])]))

;;Tests
(check-expect (can-donate-to/cond? 'O+ 'A+) true)
(check-expect (can-donate-to/cond? 'O+ 'B+) true)
(check-expect (can-donate-to/cond? 'A- 'A+) true)
(check-expect (can-donate-to/cond? 'A- 'AB-) true)
(check-expect (can-donate-to/cond? 'A+ 'A+) true)
(check-expect (can-donate-to/cond? 'O+ 'A-) false)
(check-expect (can-donate-to/cond? 'A- 'B-) false)
(check-expect (can-donate-to/cond? 'B- 'AB-) true)



;; (can-donate-to/bool? donor recipient) determines if
;; the recipient can accept the donor's blood
(check-expect (can-donate-to/bool? 'O- 'AB+) true)
(check-expect (can-donate-to/bool? 'B- 'A+) false)
(check-expect (can-donate-to/bool? 'AB+ 'AB+) true)
(check-expect (can-donate-to/bool? 'B- 'B+) true)

;; can-donate-to/bool?: Sym Sym -> Bool
(define (can-donate-to/bool? donor recipient)
  (or (symbol=? donor 'O-) (symbol=? recipient 'AB+) (symbol=? recipient donor)
      (and (symbol=? donor 'O+) (or (symbol=? recipient 'A+)
                                    (symbol=? recipient 'B+)))
      (and (symbol=? donor 'A-) (or (symbol=? recipient 'A+)
                                    (symbol=? recipient 'AB-)))
      (and (symbol=? donor 'B-) (or (symbol=? recipient 'B+)
                                    (symbol=? recipient 'AB-)))))

;;Tests
(check-expect (can-donate-to/bool? 'O+ 'B+) true)
(check-expect (can-donate-to/bool? 'A- 'A+) true)
(check-expect (can-donate-to/bool? 'A- 'AB-) true)
(check-expect (can-donate-to/bool? 'A+ 'B-) false)
(check-expect (can-donate-to/bool? 'B+ 'AB-) false)
(check-expect (can-donate-to/bool? 'O+ 'O+) true)
(check-expect (can-donate-to/bool? 'O+ 'A-) false)
      
      
      
               
  
    
    
                                                            


