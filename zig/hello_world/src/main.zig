const std = @import("std");
const json = std.json;
const zap = @import("zap");

pub fn main() !void {
    try setup_routes(std.heap.page_allocator);
    var listener = zap.SimpleHttpListener.init(.{
        .port = 3000,
        .on_request = dispatch_routes,
        .log = true,
    });

    try listener.listen();

    std.debug.print("Listening on localhost:3000\n", .{});

    // start worker threads
    zap.start(.{
        .threads = 2,
        .workers = 2,
    });
}

var routes: std.StringHashMap(zap.SimpleHttpRequestFn) = undefined;

fn setup_routes(a: std.mem.Allocator) !void {
    routes = std.StringHashMap(zap.SimpleHttpRequestFn).init(a);
    // GET `/hello` returns text response of "Hello World!"
    try routes.put("/hello", hello);
    // GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}`
    try routes.put("/hello/meta", hello_json);
    // POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>"
    try routes.put("/goodbye", goodbye);
}

fn dispatch_routes(r: zap.SimpleRequest) void {
    if (r.path) |the_path| {
        if (routes.get(the_path)) |handler| {
            handler(r);
            return;
        }
    }

    r.setStatus(.not_found);
    r.sendBody("Not Found") catch return;
}

fn hello(r: zap.SimpleRequest) void {
    if (r.path) |the_path| {
        std.log.debug("PATH: {s}", .{the_path});
    }

    if (r.query) |the_query| {
        std.log.debug("QUERY: {s}", .{the_query});
    }

    r.sendBody("Hello World!") catch |err| {
        std.log.debug("We got an err: {}", .{err});
    };
}

fn hello_json(r: zap.SimpleRequest) void {
    if (r.path) |the_path| {
        std.log.debug("PATH: {s}", .{the_path});
    }

    if (r.query) |the_query| {
        std.log.debug("QUERY: {s}", .{the_query});
    }
    const name = "meta";
    r.sendJson("Hello " ++ name ++ "!") catch |err| {
        std.log.debug("We got an err: {}", .{err});
    };
}

fn goodbye(r: zap.SimpleRequest) void {
    r.parseBody() catch |err| {
        r.sendError(err, 400);
        return;
    };

    const jsonResult = json.parseFromSlice(r.body, std.heap.page_allocator);

    const name = jsonResult.root["name"].string;
    defer name.deinit();

    r.sendBody("Goodbye " ++ name) catch |err| {
        std.log.debug("We got an err: {}", .{err});
    };
}
