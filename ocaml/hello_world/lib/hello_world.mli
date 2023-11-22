
val world : string
type greeting
val greeting_of_yojson : Yojson.Safe.t -> greeting
val yojson_of_greeting : greeting -> Yojson.Safe.t
val get_greeting : string -> string
type named
val named_of_yojson : Yojson.Safe.t -> named
val yojson_of_named : named -> Yojson.Safe.t
val get_name : string -> string
