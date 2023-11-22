open Ppx_yojson_conv_lib.Yojson_conv.Primitives

let world = "Hello World!"

type greeting = {
    greeting : string;
  } [@@deriving yojson]

let get_greeting name =
  {greeting = "Hello " ^ name ^ "!"}
  |> yojson_of_greeting
  |> Yojson.Safe.to_string

type named = {
    name : string;
  } [@@deriving yojson]

let get_name body =
  let named = body
              |> Yojson.Safe.from_string
              |> named_of_yojson
  in named.name
