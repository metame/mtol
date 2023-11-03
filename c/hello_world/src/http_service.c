#include "fiobj_json.h"
#include "fiobj_str.h"
#include <string.h>
#define FIO_INCLUDE_STR
#include "fio.h"
#include "fio_cli.h"
#include "main.h"

/* TODO: edit this function to handle HTTP data and answer Websocket requests.*/
static void on_http_request(http_s *h) {
  /* set a response and send it (finnish vs. destroy). */
  fio_str_info_s method = fiobj_obj2cstr(h->method);
  puts(method.data);
  fio_str_info_s path = fiobj_obj2cstr(h->path);
  puts(path.data);

  if (strcmp(path.data, "/") == 0) {
    http_send_body(h, "Wow, you hit root!", 18);
  } else if (strcmp(path.data, "/hello") == 0
             && strcmp(method.data, "GET") == 0) {
    http_send_body(h, "Hello World!", 12);
    // fix below to be str contains
  } else if (strstr(path.data, "/hello/") != NULL
             && strcmp(method.data, "GET") == 0) {
    // split the string on 2nd `/` then rest of path is name
    char *hello = strtok(path.data, "/");
    char *name = strtok(NULL, "/");
    puts(hello);
    puts(name);
    char greeting_str[50] = "Hello ";
    strcat(greeting_str, name);
    puts(greeting_str);

    // {"greeting": "Hello <name>"}
    http_set_header(h, HTTP_HEADER_CONTENT_TYPE, http_mimetype_find("json", 4));

    FIOBJ json;
    /* create a new Hash to be serialized for every request */
    FIOBJ hash = fiobj_hash_new2(1);
    FIOBJ key = fiobj_str_new("greeting", 8);
    FIOBJ greeting = fiobj_str_new(greeting_str, strlen(greeting_str));
    fiobj_hash_set(hash, key, greeting);

    json = fiobj_obj2json(hash, 0);
    fio_str_info_s tmp = fiobj_obj2cstr(json);

    http_send_body(h, tmp.data, tmp.len);

    fiobj_free(hash);
    fiobj_free(json);
    fiobj_free(key);
    fiobj_free(greeting);
  } else if (strcmp(path.data, "/goodbye") == 0
             && strcmp(method.data, "POST") == 0) {
    // get json body.name
    FIOBJ body = fiobj_obj2json(h->body, 0);
    puts(fiobj_type_name(body));
    // puts(fiobj_obj2cstr())
    char *name = "jk you didn't implement me";
    http_send_body(h, name, 26);
    fiobj_free(body);
  } else {
    puts(strcmp(path.data, "/hello") == 0 ? "true" : "false");
    puts(strcmp(method.data, "GET") == 0 ? "true" : "false");
  }

  // probably free stuff?
  fio_free(path.data);
  fio_free(method.data);
}

/* starts a listening socket for HTTP connections. */
void initialize_http_service(void) {
  /* listen for inncoming connections */
  if (http_listen(fio_cli_get("-p"), fio_cli_get("-b"),
                  .on_request = on_http_request,
                  .max_body_size = fio_cli_get_i("-maxbd") * 1024 * 1024,
                  .ws_max_msg_size = fio_cli_get_i("-max-msg") * 1024,
                  .public_folder = fio_cli_get("-public"),
                  .log = fio_cli_get_bool("-log"),
                  .timeout = fio_cli_get_i("-keep-alive"),
                  .ws_timeout = fio_cli_get_i("-ping")) == -1) {
    /* listen failed ?*/
    perror("ERROR: facil couldn't initialize HTTP service (already running?)");
    exit(1);
  }
}
