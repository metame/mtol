module Fizzbuzz

import Data.Vect

export
fizzbuzz : Int -> String
fizzbuzz x with (mod x 3, mod x 5)
  fizzbuzz x | (0, 0) = "fizzbuzz"
  fizzbuzz x | (0, _) = "fizz"
  fizzbuzz x | (_, 0) = "buzz"
  fizzbuzz x | _ = show x
