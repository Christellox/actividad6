#lang plai

(require "grammars.rkt")
(require "parser.rkt")

(define (subst expr sub-id val)
  (match expr
    [(id i) (if (symbol=? i sub-id) val expr)]
    [(num n) expr]
    [(binop f izq der)
     (binop f
            (subst izq sub-id val)
            (subst der sub-id val))]
    [(with bound-id name-expr body)
     (if (symbol=? bound-id sub-id)
     (with bound-id (subst name-expr sub-id val) body)
     (with  bound-id (subst name-expr sub-id val) (subst body sub-id val)))]))

(define (interp expr)
  (match expr
    [(id i) (error 'interp "Free identifier")]
    [(num n) n]
    [(binop f izq der) (f (interp izq) (interp der))]
    [(with id val body) (interp(subst body id val))]))
