#lang plai

(require "grammars.rkt")
(define (elige f)
  (match f
    ['+ +]
    ['- -]
    ['* *]
    ['/ /]))

(define (parse expr)
  (match expr
    [(? symbol?) (id expr)]
    [(? number?) (num expr)]
    [(list 'with (list id value) body)
     (with id (parse value) (parse body))]
    [(list f izq der)
     (binop (elige f) (parse izq) (parse der))]
    ))
