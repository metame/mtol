fun parseint x =
    case Int.fromString x of
        SOME i => i
      | NONE => raise Fail ("err in parseint with arg " ^ x)

fun addparts (e, (curr, max)) =
(* add e until we get a blank string
 * compare against max
 * return max at end *)
    if e = ""
    then
        if curr > max then (0, curr) else (0, max)
    else
        let val i = parseint e
        in (curr + i, max)
        end

fun part1 s =
    (* string.fields needs a char and I'm passing it a non-char *)
    let val l = String.fields (fn c => c = #"\n") s
    in case List.foldl addparts (0, 0) l of
           (_, max) => max
    end

fun readFile filename =
    let val file = TextIO.openIn filename
        val input = TextIO.inputAll file
        val _ = TextIO.closeIn file
    in part1 input
    end
