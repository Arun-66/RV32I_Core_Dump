`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2024 21:44:32
// Design Name: 
// Module Name: ID_tb
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

module ID_tb;

    // Parameters
    parameter Inst_Size = 32;

    // Inputs
    logic [Inst_Size-1:0] Inst;
    logic wr_en;
    logic Imm_Sel;
    logic jal;
    logic [Inst_Size-1:0] write_data;

    // Outputs
    logic [Inst_Size-1:0] rs1_data, rs2_data;
    logic [Inst_Size-1:0] Ext_Imm;
    logic [6:0] func7;
    logic [2:0] func3;
    logic [6:0] opcode;
    logic [Inst_Size-1:0] x0, x1, x2, x3, x4, x5, x6, x7;
    logic [Inst_Size-1:0] x8, x9, x10, x11, x12, x13, x14, x15;
    logic [Inst_Size-1:0] x16, x17, x18, x19, x20, x21, x22, x23;
    logic [Inst_Size-1:0] x24, x25, x26, x27, x28, x29, x30, x31;

    // Instantiate the ID_Stage module
    ID_Stage #(Inst_Size) id_stage (
        .Inst(Inst),
        .wr_en(wr_en),
        .Imm_Sel(Imm_Sel),
        .jal(jal),
        .write_data(write_data),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .Ext_Imm(Ext_Imm),
        .func7(func7),
        .func3(func3),
        .opcode(opcode),
        .x0(x0), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .x5(x5), .x6(x6), .x7(x7),
        .x8(x8), .x9(x9), .x10(x10), .x11(x11), .x12(x12), .x13(x13), .x14(x14), .x15(x15),
        .x16(x16), .x17(x17), .x18(x18), .x19(x19), .x20(x20), .x21(x21), .x22(x22), .x23(x23),
        .x24(x24), .x25(x25), .x26(x26), .x27(x27), .x28(x28), .x29(x29), .x30(x30), .x31(x31)
    );
logic [2:0]exp_func3;
logic [6:0]exp_func7;
logic [6:0]exp_opcode;
logic [31:0]exp_Imm;
    initial begin
        //I-Type
        write_data = 32'h00000313;
        wr_en = 1;
        Imm_Sel = 0;
        jal = 0;
        //         {  Imm12  }  {rs1} {f3}{rd}{opcode} 
        Inst = 32'b000000000000_00000_000_00110_0010011;
        //Results expected
        exp_Imm = 12'h00;
        exp_func3 = 3'b0;
        exp_func7 = 7'b0;
        exp_opcode = 7'b0010011;
        #10
        check_outputs(func3,func7,opcode,Ext_Imm,x6,exp_Imm, exp_func3, exp_func7,exp_opcode,write_data,"I-type");
 
        
        //R-Type
        
        //         {func7} {rs2} {rs1} {f3}{rd}{opcode} 
        Inst = 32'b0000000_00000_00000_010_00110_0110011;
        //Results expected
        exp_Imm = 12'h00;
        exp_func3 = 3'b010;
        exp_func7 = 7'b0;
        exp_opcode = Inst[6:0];
        #10
        check_outputs(func3,func7,opcode,Ext_Imm,x6,exp_Imm, exp_func3, exp_func7,exp_opcode,write_data,"R-type");
        
        // J-Type
        write_data = 32'h00000313;
        wr_en = 1;
        Imm_Sel = 0;
        jal = 1;
        //               {imm20}       {rd} {opcode}
        Inst = 32'b00000000000000000000_110_1101111; // Example JAL instruction
        // Results expected
        exp_Imm = 20'h00; // Immediate should be extracted correctly
        exp_func3 = 3'b0; // Function code for JAL is not used
        exp_func7 = 7'b0; // Function code for JAL is not used
        exp_opcode = 7'b1101111; // Opcode for JAL
        #10
        check_outputs(func3, func7, opcode, Ext_Imm, x6, exp_Imm, exp_func3, exp_func7, exp_opcode, write_data, "J-type");
        #10
        // B-Type
        write_data = 32'h00000313;
        wr_en = 1;
        Imm_Sel = 0;
        // {Imm[12][10:5]} {rs2} {rs1}{f3}{Imm4:1}{11}{opcode}
        Inst = 32'b0000000_00001_00010_100_00000_1100011; // Example BEQ instruction
        // Results expected
        exp_Imm = 12'h00; // Immediate should be extracted correctly (depends on the instruction)
        exp_func3 = 3'b100; // Function code for BEQ
        exp_func7 = 7'b0; // Function code for BEQ is not used
        exp_opcode = 7'b1100011; // Opcode for B-type instructions (BEQ)
        #10
        check_outputs(func3, func7, opcode, Ext_Imm, x6, exp_Imm, exp_func3, exp_func7, exp_opcode, write_data, "B-type");
        #10
        // S-Type
        write_data = 32'h00000313;
        wr_en = 1;
        Imm_Sel = 0;
        // {imm12} {rs1} {f3} {rd} {opcode}
        Inst = 32'b000000000000_00001_010_00000_0100011; // Example SW instruction
        // Results expected
        exp_Imm = 12'h00; // Immediate should be extracted correctly (depends on the instruction)
        exp_func3 = 3'b010; // Function code for SW
        exp_func7 = 7'b0; // Function code for SW is not used
        exp_opcode = 7'b0100011; // Opcode for S-type instructions (SW)
        #10
        check_outputs(func3, func7, opcode, Ext_Imm, x6, exp_Imm, exp_func3, exp_func7, exp_opcode, write_data, "S-type"); 
        #10
        // U-Type
        write_data = 32'h00000313;
        wr_en = 1;
        Imm_Sel = 0;
        // {imm20} {rd} {opcode}
        Inst = 32'b00000000000000001111_00110_0110111; // Example LUI instruction
        // Results expected
        exp_Imm = 20'h00; // Immediate should be extracted correctly (depends on the instruction)
        exp_func3 = 3'b0; // Function code for LUI is not used
        exp_func7 = 7'b0; // Function code for LUI is not used
        exp_opcode = 7'b0110111; // Opcode for LUI
        #10
        check_outputs(func3, func7, opcode, Ext_Imm, x6, exp_Imm, exp_func3, exp_func7, exp_opcode, write_data, "U-type");
end
task check_outputs(
    input logic [2:0] func3,
    input logic [6:0] func7,
    input logic [6:0] opcode,
    input logic [31:0] Ext_Imm,
    input logic [31:0] x6,
    input logic [31:0] exp_Imm,
    input logic [2:0] exp_func3,
    input logic [6:0] exp_func7,
    input logic [6:0] exp_opcode,
    input logic [31:0] exp_x6,
    input string data_type
);
    begin
        if (func3 == exp_func3) begin
            if (func7 == exp_func7) begin
                if (opcode == exp_opcode) begin
                    if (Ext_Imm == exp_Imm) begin
                        if(x6 ==exp_x6)
                            $display("%s success", data_type);  
                        else
                            $display("data Failed %b %b",x6,exp_x6);
                    end else begin
                        $display("Imm Failed %b %b",Ext_Imm,exp_Imm);
                    end
                end else begin    
                    $display("opcode failed %b %b",opcode,exp_opcode);
                end
            end else begin    
                $display("func 7 failed %b %b",func7,exp_func7);
            end
        end else begin
            $display("func3 failed %b %b func3 & expected func3",func3,exp_func3);
        end
    end
endtask
endmodule
