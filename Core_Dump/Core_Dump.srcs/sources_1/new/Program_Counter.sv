`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 14:16:22
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter#(parameter AddrSize = 32)(
    input logic [AddrSize-1:0]PC_NEXT,
    input logic clk,reset,
    output reg [AddrSize-1:0] PC_Curr
);
always_ff@(posedge clk)begin
    if(reset)begin
        PC_Curr <= 0;
    end
    else begin 
        PC_Curr <= PC_NEXT;
    end
end
endmodule
