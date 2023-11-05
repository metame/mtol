#include <httplib.h>

int main(void) {

  using namespace httplib;

  Server svr;

  svr.Get("/hello", [](const httplib::Request &, httplib::Response &res) {
    res.set_content("Hello World!", "text/plain");
  });


  svr.listen("0.0.0.0", 3000);
}
