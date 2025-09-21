const std = @import("std");

const IntPrint = struct {
    age: i32,
    pub fn print(self: IntPrint) void {
        std.debug.print("hello from int {d} \n", .{self.age});
    }
};

const FloatPrint = struct {
    num: f32,
    pub fn print(self: FloatPrint) void {
        std.debug.print("hello from float {d} \n", .{self.num});
    }
};

const Printer = union(enum) {
    Int: IntPrint,
    Float: FloatPrint,

    pub fn print(self: Printer) void {
        switch (self) {
            inline else => |case| case.print(),
        }
    }
};

fn callPrinter(p: Printer) void {
    p.print();
}

pub fn main() void {
    const p1 = Printer{ .Int = IntPrint{ .age = 32 } };
    const p2 = Printer{ .Float = FloatPrint{ .num = 0.22 } };
    callPrinter(p1);
    callPrinter(p2);
}
