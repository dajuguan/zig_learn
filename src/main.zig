const std = @import("std");

fn callPrint(value: anytype) void {
    value.print(); // must exist, checked at compile-time
}

const A = struct {
    x: i32,
    pub fn print(self: A) void {
        std.debug.print("A: {any}\n", .{self.x});
    }
};

const B = struct {
    msg: []const u8,
    pub fn print(self: *B) void {
        std.debug.print("B: {any}\n", .{self.msg});
    }
};

pub fn main() void {
    const a = A{ .x = 123 };
    callPrint(a);

    var b = B{ .msg = "hello" };
    callPrint(&b);
}
