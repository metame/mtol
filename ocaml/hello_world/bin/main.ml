let text_plain = ("Content-type:", "text/plain")

(* GET `/hello` returns text response of "Hello World!" *)
let hello _ = Dream.respond ~headers:[text_plain] Hello_world.world

(* GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}` *)
let hello_name req = Dream.json @@ Hello_world.get_greeting @@ Dream.param req "name"

(* POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>" *)
let goodbye req =
  let%lwt body = Dream.body req in

  match Hello_world.get_name body with
    | Ok n -> Dream.respond ~headers:[text_plain] @@ "Goodbye " ^ n
    | Error _ -> Dream.respond ~status:(`Bad_Request) @@ "Bad Request: " ^ body

let routes =
  [
    Dream.get "/hello" hello;
    Dream.get "/hello/:name" hello_name;
    Dream.post "/goodbye" goodbye;
  ]

let () = Dream.run ~port:3000 @@ Dream.router routes
