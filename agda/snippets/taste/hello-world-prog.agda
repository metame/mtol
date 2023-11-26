{-# OPTIONS --guardedness #-}

module hello-world-prog where

open import IO

main : Main
main = run (putStrLn "Hello, World!")
