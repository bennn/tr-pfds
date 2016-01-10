#lang racket/base

(require
  racket/contract/base)

(require
  (only-in "../private/unsafe-trie.rkt"
    Mt?)
  (only-in "../private/unsafe-trie.rkt"
    unsafe-lookup
    unsafe-bind
    unsafe-trie
    unsafe-insert
    unsafe-tries))

(define-values (mk-Trie Trie-real Trie?)
  (let ()
    (struct Trie (real)) 
    (values Trie Trie-real Trie?)))

(define (lookup keys map) (unsafe-lookup keys (Trie-real map)))
(define (bind lok v map) (mk-Trie (unsafe-bind lok v (Trie-real map))))
(define (trie lst) (mk-Trie (unsafe-trie lst)))
(define (insert lstv lstk tri) (mk-Trie (unsafe-insert lstv lstk (Trie-real tri))))
(define (tries lstv lstk) (mk-Trie (tries lstv lstk)))
(provide
 (contract-out
  [lookup (-> (listof any/c) Trie? any/c)]
  [bind (-> (listof any/c) any/c Trie? Trie?)]
  [trie (-> (listof (listof any/c)) Trie?)]
  [insert (-> (listof any/c) (listof (listof any/c)) Trie? Trie?)]
  [tries (-> (listof any/c) (listof (listof any/c)) Trie?)])
 Mt? Trie?)
