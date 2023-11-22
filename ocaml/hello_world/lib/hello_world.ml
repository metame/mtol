let world = "Hello World!"

type greeting = {
    greeting : string;
  } [@@deriving yojson]

let get_greeting name =
  {greeting = "Hello " ^ name ^ "!"}
  |> greeting_to_yojson
  |> Yojson.Safe.to_string

type named = {
    name : string;
  } [@@deriving yojson]

let try_json s =
  try Ok (Yojson.Safe.from_string s)
  with Yojson.Json_error msg -> Error msg

let get_name body =
  body
  |> try_json
  |> fun j -> Result.bind j named_of_yojson
  |> Result.map (fun n -> n.name)
