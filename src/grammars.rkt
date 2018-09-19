#lang plai

(define-type WAE
  [id (i symbol?)]
  [num (n number?)]
  [binop (b procedure?) (izq WAE?) (der WAE?)]
  [with (id symbol?) (value WAE?) (body WAE?)])
