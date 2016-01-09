#lang typed/racket/base
(require (prefix-in : "../trie.rkt")
         typed/racket/unsafe)
(define-type-alias (Key A) (Listof A))

(: lookup : (All (K V) ((Key K) (:Trie K V) -> V)))
(define (lookup keys map) (:lookup keys map))

(: bind : (All (K V) ((Key K) V (:Trie K V) -> (:Trie K V))))
(define (bind lok v map) (:bind lok v map))

(: trie : (All (K) ((Listof (Listof K)) -> (:Trie K Integer))))
(define (trie lst) (:trie lst))

(: insert : 
   (All (K V) ((Listof V) (Listof (Listof K)) (:Trie K V) -> (:Trie K V))))
(define (insert lstv lstk tri) (:insert lstv lstk tri))

(: tries : (All (K V) ((Listof V) (Listof (Listof K)) -> (:Trie K V))))
(define (tries lstv lstk) (:tries lstv lstk))

(: Mt? (-> Any Boolean))
(define Mt? :Mt?)

(unsafe-provide lookup bind trie insert tries Mt?)
