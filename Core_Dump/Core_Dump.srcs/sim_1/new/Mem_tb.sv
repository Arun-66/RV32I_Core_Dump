`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2024 14:11:01
// Design Name: 
// Module Name: Mem_tb
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


module Mem_tb;
reg[31:0] Read_Address,Write_data;
reg[2:0]data_type;
reg read_en,write_en;
wire[31:0] Data_Out;
Ext_Memory mem_test(Read_Address,Write_data,data_type,read_en,write_en,Data_Out);

initial begin
    #1  //Store 1
    Read_Address = 0;
    Write_data = 32'h01;
    data_type = 0;
    write_en = 1;
    read_en = 0;
    #10
    write_en = 0;
    read_en = 1;
    #10 // Storing signed Byte
    Read_Address = 0;
    Write_data = 32'hF1;
    data_type = 0;
    write_en = 1;
    read_en = 0;
    #10
    write_en = 0;
    read_en = 1;
    #10 //Reading Unsigned Byte
    data_type = 3'b100;
    #10
    $stop;
end
endmodule
