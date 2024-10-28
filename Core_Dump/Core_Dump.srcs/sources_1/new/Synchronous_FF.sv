`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 14:01:34
// Design Name: 
// Module Name: Synchronous_FF
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


module Synchronous_FF(
    input d,
    input clk,reset,
    output reg q
);
always_ff@(posedge clk)begin
    if(reset)begin
        q <= 0;
    end
    else begin 
        q <=d;
    end
end
endmodule
