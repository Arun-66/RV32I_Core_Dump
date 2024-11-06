`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 21:08:28
// Design Name: 
// Module Name: Core
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


module Core #(parameter Inst_Size=32)(input clk,reset);
wire [Inst_Size-1:0] Inst_IF_ID,PC_4,Added_PC_from_Branch;
wire PC_Select,Jump_Sel;
wire [Inst_Size-1:0] ALU_Out;

IF_Stage #(Inst_Size,Inst_Size) Instruction_Fetch(. Added_PC_from_Jump(ALU_Out),. Added_PC_from_Branch(Added_PC_from_Branch),
.reset(reset),.clk(clk),.Jump_Sel(Jump_Sel),.PC_Select(PC_Select),.Inst(Inst_IF_ID),.PC_Temp(PC_4));

wire Imm_Sel;
wire [Inst_Size-1:0]REG_write_data;
wire [Inst_Size-1:0] REG_rs1_data,REG_rs2_data,Ext_Imm;
wire [6:0]func7;
wire [2:0]func3;
wire [6:0]opcode;

ID_Stage#(Inst_Size) Instruction_Decode (.Inst(Inst_IF_ID),.wr_en(wr_en_REG),.Imm_Sel(Imm_Sel),.write_data(REG_write_data),
.rs1_data(REG_rs1_data),.rs2_data(REG_rs2_data),.Ext_Imm(Ext_Imm),
.func7(func7),.func3(func3),.opcode(opcode));

wire PC_Src,ALU_Src,Branch_Control;
wire [3:0] ALU_Control;

EX_Stage#(Inst_Size) Execute(.rs1_data(REG_rs1_data),.rs2_data(REG_rs2_data),.EX_Imm(Ext_Imm),.PC_Curr(Inst_IF_ID),
    .PC_Src(PC_Src),.ALU_Src(ALU_Src),.Branch_Control(Branch_Control),.ALU_Control(ALU_Control),
    .Branch_out(PC_Select),.ALU_out(ALU_Out),.Added_PC_from_Branch(Added_PC_from_Branch)
);


wire [1:0] data_type;
wire read_en,write_en;
wire [Inst_Size-1:0] Mem_Data_Out;
Ext_Memory#(Inst_Size)Memory_Access(.Read_address(ALU_Out),.Write_data(REG_rs2_data),
    .data_type(data_type),.read_en(read_en),.write_en(write_en),
    .Data_Out(Mem_Data_Out)
    );

wire [1:0]Data_wb_control;
WB_Stage#(Inst_Size) Write_Back(.ALU_Data(ALU_Out),.Mem_Data(Mem_Data_Out),.PC_4(PC_4),
    .Data_wb_control(Data_wb_control),.Data_to_reg(REG_write_data));

ALU_Control ALU_Control_Unit(.func7(func7),.func3(func3),.opcode(opcode),.ALU_Ctrl(ALU_Control));

Control_Unit Ctrl_Unit(.func3(func3),.opcode(opcode),
.REG_Write(wr_en_REG),.PC_Src(PC_Src),.ALU_Src(ALU_Src),.MEM_Read(read_en),.Mem_Write(write_en),.Mem_to_REG(Data_wb_control),
.Branch(Branch_Control),.Imm_Sel(Imm_Sel),.Jump_Sel(Jump_Sel),.Mem_Read_Type(data_type)
);
endmodule
