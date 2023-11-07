const std = @import("std");

fn fizzbuzz(x: usize) []const u8 {
    if (x % 3 == 0 and x % 5 == 0) {
        return "fizzbuzz";
    } else if (x % 3 == 0) {
        return "fizz";
    } else if (x % 5 == 0) {
        return "buzz";
    } else {
        const allocation = std.heap.page_allocator;
        const x_str = std.fmt.allocPrint(allocation, "{}", .{x}) catch "wtf";
        return x_str;
    }
}

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("{s}\n", .{fizzbuzz(1)});
    try stdout.print("{s}\n", .{fizzbuzz(3)});
    try stdout.print("{s}\n", .{fizzbuzz(6)});
    try stdout.print("{s}\n", .{fizzbuzz(5)});
    try stdout.print("{s}\n", .{fizzbuzz(10)});
    try stdout.print("{s}\n", .{fizzbuzz(15)});

    try bw.flush(); // don't forget to flush!
}

test "simple test" {}
