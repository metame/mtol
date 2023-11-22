let fizzbuzz x =
  match x with
  | x when x mod 3 = 0 && x mod 5 = 0 -> "fizzbuzz"
  | x when x mod 3 = 0 -> "fizz"
  | x when x mod 5 = 0 -> "buzz"
  | _ -> string_of_int x
