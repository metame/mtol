#include <format>
#include <httplib.h>
#include <json.hpp>

int main(void) {

  using namespace httplib;
  using json = nlohmann::json;
  Server svr;

  svr.Get("/hello", [](const Request &, Response &res) {
    res.set_content("Hello World!", "text/plain");
  });

  // GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}`
  svr.Get("/hello/:name", [&](const Request& req, Response &res) {
    auto name = req.path_params.at("name");
    json r;
    r["greeting"] = std::format("Hello {}!", name);

    res.set_content(r.dump(), "application/json");
  });

  // POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>"
  svr.Post("/goodbye", [&](const Request& req, Response &res) {
    auto j3 = json::parse(req.body);
    if (j3["name"].is_string()) {
      std::string name = j3["name"];
      res.set_content(std::format("Goodbye {}", name), "text/plain");
    } else {
      res.status = 400;
    }
  });

  std::cout << "HTTP Server Listening on port 3000" << std::endl;
  svr.listen("0.0.0.0", 3000);
}
