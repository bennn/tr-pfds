#lang racket/base
(require (prefix-in : "../private/unsafe-trie.rkt")
         (only-in "../private/unsafe-trie.rkt" Mt?)
         racket/contract/base)

(define-values (mk-Trie Trie-real Trie?)
  (let ()
    (struct Trie (real)) 
    (values Trie Trie-real Trie?)))

(define (lookup keys map) (:lookup keys (Trie-real map)))
(define (bind lok v map) (mk-Trie (:bind lok v (Trie-real map))))
(define (trie lst) (mk-Trie (:trie lst)))
(define (insert lstv lstk tri) (mk-Trie (:insert lstv lstk (Trie-real tri))))
(define (tries lstv lstk) (mk-Trie (tries lstv lstk)))
(provide
 (contract-out
  [lookup (-> (listof any/c) Trie? any/c)]
  [bind (-> (listof any/c) any/c Trie? Trie?)]
  [trie (-> (listof (listof any/c)) Trie?)]
  [insert (-> (listof any/c) (listof (listof any/c)) Trie? Trie?)]
  [tries (-> (listof any/c) (listof (listof any/c)) Trie?)])
 Mt? Trie?)
