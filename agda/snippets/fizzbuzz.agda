{-# OPTIONS --guardedness #-}

module fizzbuzz where


open import Agda.Builtin.Bool using (Bool; false; true)
open import Agda.Builtin.Int using (Int; primShowInteger; pos)
open import Agda.Builtin.Nat using (_==_)
open import Agda.Builtin.String using (String)
open import Data.Nat using (ℕ; zero)
open import Data.Nat.Show using (show)
open import Data.Nat.DivMod using (_%_)
open import IO

fizzbuzz : ℕ → String
-- fizzbuzz n = if (_%_ x 3) _==_ 0 then "fizz" else primShowInteger (pos n)
fizzbuzz zero = show 0
fizzbuzz (suc m) = show m

main : Main
main = run (putStrLn (fizzbuzz 1))
