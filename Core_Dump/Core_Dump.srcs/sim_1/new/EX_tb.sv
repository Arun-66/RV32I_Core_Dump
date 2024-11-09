`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2024 19:00:09
// Design Name: 
// Module Name: EX_tb
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


module EX_tb;

reg [31:0] rs1_data,rs2_data,EX_Imm,PC_Curr;
reg PC_Src,ALU_Src,Branch_Control;
reg [4:0] ALU_Control;
reg [2:0] func3;
wire[31:0] ALU_out,Added_PC_from_Branch;
EX_Stage#(32)EX_Test(rs1_data,rs2_data,EX_Imm,PC_Curr,
    PC_Src,ALU_Src,Branch_Control,
    ALU_Control,
    func3,
    Branch_out,
    ALU_out,Added_PC_from_Branch);
initial begin
    #1
    PC_Src = 0;
    ALU_Src = 0;
    rs1_data = 12;
    rs2_data = 6;
    EX_Imm = 1;
    PC_Curr = 1;
    ALU_Control = 0;
    func3 = 0;
    Branch_Control = 0;
    #5
    Compare(rs1_data+rs2_data,ALU_out,"Add");
    ALU_Control = ALU_Control+1;
    #5
    Compare(rs1_data-rs2_data,ALU_out,"Sub");
    ALU_Control = ALU_Control+1;
    #5
    Compare(rs1_data&rs2_data,ALU_out,"And");
    ALU_Control = ALU_Control+1;
    #5
    Compare((12|6),ALU_out,"or");
    ALU_Control = ALU_Control+1;
    #5
    Compare((12^6),ALU_out,"xor");
    ALU_Control = ALU_Control+1;
    #5
    Compare((12>>6),ALU_out,"SRL");
    ALU_Control = ALU_Control+1;
    #5
    Compare((12>>>6),ALU_out,"SRA");   
    $stop;
end
task Compare(input [31:0] dataexp,dataout,input string optype);
    if(dataexp == dataout)
        $display("%s success",optype);
    else    
        $display("%s failed",optype);
endtask
endmodule
