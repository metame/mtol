Definition x := 10.
Print x.

Definition inc_nat (x : nat) : nat := x + 1.

Compute inc_nat x.

Compute (1 + 1).

Check tt.

About plus.

Compute plus 1 1.

Check plus.

Print true.

(* Coq in a hurry *)
Definition add5 a b c d e := a + b + c + d + e.
Check add5.
Compute add5 1 1 1 1 1. 

Require Import Arith.

Print pred.
Print Init.Nat.pred.

SearchPattern (nat -> nat -> bool).

Compute Nat.eqb 0 (Nat.modulo x 3).

SearchPattern (bool -> bool).

Print Nat.eqb.

Require Import Strings.String.

Open Scope string_scope.

Print nil.

SearchPattern (nat -> string).

Definition fizzbuzz x :=
  match (Nat.modulo x 3, Nat.modulo x 5) with
  | (0, 0) => "fizzbuzz"
  | (0, _) => "fizz"
  | (_, 0) => "buzz"
  | _ => "neither fizz nor buzz"
  end.

Check fizzbuzz.

Require Import List.
Definition tests := 3::5::15::6::10::1::nil.
Check nil.
Compute map fizzbuzz tests.