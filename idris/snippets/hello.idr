module Main

import Fizzbuzz

intid : Integral a => a -> a
intid x = x

negativeNumber : Integral a => a
negativeNumber = -42

main : IO ()
main = putStrLn (fizzbuzz 3)
