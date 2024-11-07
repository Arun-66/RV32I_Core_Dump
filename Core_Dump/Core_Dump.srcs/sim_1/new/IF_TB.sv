`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2024 21:48:35
// Design Name: 
// Module Name: IF_TB
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


module IF_TB;
    reg [31:0] Added_PC_from_Jump, Added_PC_from_Branch; // Define these as reg to drive values
    reg clk, reset, PC_Select, Jump_Sel;
    wire [31:0] Inst, PC_Temp;

    // Instantiate the IF_Stage
    IF_Stage if1(Added_PC_from_Jump, Added_PC_from_Branch, clk, reset, PC_Select, Jump_Sel, Inst, PC_Temp);

    // Clock generation
    initial begin 
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        PC_Select = 0;
        Jump_Sel = 0;
        Added_PC_from_Jump = 32'h00000008;   // Example values, can be modified
        Added_PC_from_Branch = 32'h00000004; // Example values, can be modified
        // Apply reset
        #5 reset = 0;

        #10 $display("Instruction = %h, PC_Temp = %h", Inst, PC_Temp);

        // Wait some time and stop
        #100 $stop;
    end
endmodule
