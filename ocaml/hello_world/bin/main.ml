(* GET `/hello` returns text response of "Hello World!" *)
let hello _ = Dream.html Hello_world.world

(* GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}` *)
let hello_name req = Dream.json @@ Hello_world.get_greeting @@ Dream.param req "name"

(* POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>" *)
let goodbye req =
  let%lwt body = Dream.body req in

  let _ = {greeting = "wtf"} in

  let name = Hello_world.get_name body in

  Dream.html @@ "Goodbye " ^ name

let routes =
  [
    Dream.get "/hello" hello;
    Dream.get "/hello/:name" hello_name;
    Dream.post "/goodbye" goodbye;
  ]

let () = Dream.run @@ Dream.router routes
