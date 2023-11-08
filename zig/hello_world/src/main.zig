const std = @import("std");
const zap = @import("zap");

pub fn main() !void {
    var listener = zap.SimpleHttpListener.init(.{
        .port = 3000,
        .on_request = on_request,
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

fn on_request(r: zap.SimpleRequest) void {
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
