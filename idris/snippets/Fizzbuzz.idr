module Fizzbuzz

fizzbuzz : Int -> String
fizzbuzz x =
  if (mod x 3 == 0) && (mod x 5 == 0) then "fizzbuzz" else
  if (mod x 3 == 0) then "fizz" else
  if (mod x 5 == 0) then "buzz" else
  show x
