`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2024 20:36:26
// Design Name: 
// Module Name: Core_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Core_tb#(parameter Size = 32);
reg clk,reset;
wire [Size-1:0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31;
Core #(32)core(.clk(clk),.reset(reset),
.x0(x0),.x1(x1),.x2(x2),.x3(x3),.x4(x4),.x5(x5),.x6(x6),.x7(x7),.x8(x8),.x9(x9),.x10(x10),
.x11(x11),.x12(x12),.x13(x13),.x14(x14),.x15(x15),.x16(x16),.x17(x17),.x18(x18),.x19(x19),
.x20(x20),.x21(x21),.x22(x22),.x23(x23),.x24(x24),.x25(x25),.x26(x26),.x27(x27),.x28(x28),
.x29(x29),.x30(x30),.x31(x31));

initial begin 
        clk = 0;
        forever #10 clk = ~clk;
    end

initial begin
    reset = 1;
    #5;
    reset = 0;
    #500;
    $stop;
end
endmodule
