fun fizzbuzz x =
    if x mod 3 = 0 andalso x mod 5 = 0 then "fizzbuzz" else
    if x mod 3 = 0 then "fizz" else
    if x mod 5 = 0 then "buzz" else
    Int.toString x
