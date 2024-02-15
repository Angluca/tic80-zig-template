const tic = @import("tic80.zig");
//const std = @import("std");

const TICGuy = struct {
    x: i32 = 96,
    y: i32 = 24,
};

var t: u16 = 0;
var mascot: TICGuy = .{};

export fn BOOT() void {}

fn init() void {
}

fn update() void {
    if (tic.btn(0)) {
        mascot.y -= 1;
    }
    if (tic.btn(1)) {
        mascot.y += 1;
    }
    if (tic.btn(2)) {
        mascot.x -= 1;
    }
    if (tic.btn(3)) {
        mascot.x += 1;
    }
    t += 1;
    //tic.trace("trace test " ++ "!!!!!!!!");
}

fn draw() void {
    tic.cls(13);
    tic.spr(@as(i32, 1 + t % 60 / 30 * 2), mascot.x, mascot.y, .{ .w = 2, .h = 2, .transparent = &.{14}, .scale = 3 });
    _ = tic.print("HELLO WORLD!", 84, 84, .{});
}

export fn BDR() void {}

export fn OVR() void {}

export fn TIC() void {
    init();
    defer deinit();
    update();
    draw();
}

fn deinit() void {
}
