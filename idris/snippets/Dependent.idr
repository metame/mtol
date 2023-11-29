module Dependent

import Data.List

isSingleton : Bool -> Type
isSingleton True = Nat
isSingleton False = List Nat

mkSingle : (x : Bool) -> isSingleton x
mkSingle True = 0
mkSingle False = []

data Vect : Nat -> Type -> Type where
   Nil  : Vect Z a
   (::) : a -> Vect k a -> Vect (S k) a

(++) : Vect n a -> Vect m a -> Vect (n + m) a
(++) Nil       ys = ys
(++) (x :: xs) ys = x :: xs ++ ys

filter : (a -> Bool) -> Vect n a -> (p ** Vect p a)
filter p Nil = (_ ** [])
filter p (x :: xs)
    = case filter p xs of
           (_ ** xs') => if p x then (_ ** x :: xs')
                                else (_ ** xs')

sum : List Int -> Int
sum [] = 0
sum (x :: xs) = x + sum xs

head_int : (l: List Int) -> {auto 0 ok : NonEmpty l} -> Int
head_int [] impossible
head_int (x :: _) = x

sumNonEmpty : (l: List Int) -> {auto 0 _ : NonEmpty l} -> Int
sumNonEmpty (x :: xs) = foldl (+) x xs

-- sumNonEmpty : NonEmpty (List Int) -> Int
-- sumNonEmpty (x :: xs) = x + sum xs
