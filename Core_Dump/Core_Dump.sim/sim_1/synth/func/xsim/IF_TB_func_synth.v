// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Thu Oct 17 14:04:40 2024
// Host        : Jarvis running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/arun/Core_Dump/Core_Dump.sim/sim_1/synth/func/xsim/IF_TB_func_synth.v
// Design      : Inst_Mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* AddrSize = "32" *) (* Length = "1024" *) (* Width = "32" *) 
(* NotValidForBitStream *)
module Inst_Mem
   (addr,
    inst);
  input [31:0]addr;
  output [31:0]inst;

  wire [31:0]inst;

  OBUFT \inst_OBUF[0]_inst 
       (.I(1'b0),
        .O(inst[0]),
        .T(1'b1));
  OBUFT \inst_OBUF[10]_inst 
       (.I(1'b0),
        .O(inst[10]),
        .T(1'b1));
  OBUFT \inst_OBUF[11]_inst 
       (.I(1'b0),
        .O(inst[11]),
        .T(1'b1));
  OBUFT \inst_OBUF[12]_inst 
       (.I(1'b0),
        .O(inst[12]),
        .T(1'b1));
  OBUFT \inst_OBUF[13]_inst 
       (.I(1'b0),
        .O(inst[13]),
        .T(1'b1));
  OBUFT \inst_OBUF[14]_inst 
       (.I(1'b0),
        .O(inst[14]),
        .T(1'b1));
  OBUFT \inst_OBUF[15]_inst 
       (.I(1'b0),
        .O(inst[15]),
        .T(1'b1));
  OBUFT \inst_OBUF[16]_inst 
       (.I(1'b0),
        .O(inst[16]),
        .T(1'b1));
  OBUFT \inst_OBUF[17]_inst 
       (.I(1'b0),
        .O(inst[17]),
        .T(1'b1));
  OBUFT \inst_OBUF[18]_inst 
       (.I(1'b0),
        .O(inst[18]),
        .T(1'b1));
  OBUFT \inst_OBUF[19]_inst 
       (.I(1'b0),
        .O(inst[19]),
        .T(1'b1));
  OBUFT \inst_OBUF[1]_inst 
       (.I(1'b0),
        .O(inst[1]),
        .T(1'b1));
  OBUFT \inst_OBUF[20]_inst 
       (.I(1'b0),
        .O(inst[20]),
        .T(1'b1));
  OBUFT \inst_OBUF[21]_inst 
       (.I(1'b0),
        .O(inst[21]),
        .T(1'b1));
  OBUFT \inst_OBUF[22]_inst 
       (.I(1'b0),
        .O(inst[22]),
        .T(1'b1));
  OBUFT \inst_OBUF[23]_inst 
       (.I(1'b0),
        .O(inst[23]),
        .T(1'b1));
  OBUFT \inst_OBUF[24]_inst 
       (.I(1'b0),
        .O(inst[24]),
        .T(1'b1));
  OBUFT \inst_OBUF[25]_inst 
       (.I(1'b0),
        .O(inst[25]),
        .T(1'b1));
  OBUFT \inst_OBUF[26]_inst 
       (.I(1'b0),
        .O(inst[26]),
        .T(1'b1));
  OBUFT \inst_OBUF[27]_inst 
       (.I(1'b0),
        .O(inst[27]),
        .T(1'b1));
  OBUFT \inst_OBUF[28]_inst 
       (.I(1'b0),
        .O(inst[28]),
        .T(1'b1));
  OBUFT \inst_OBUF[29]_inst 
       (.I(1'b0),
        .O(inst[29]),
        .T(1'b1));
  OBUFT \inst_OBUF[2]_inst 
       (.I(1'b0),
        .O(inst[2]),
        .T(1'b1));
  OBUFT \inst_OBUF[30]_inst 
       (.I(1'b0),
        .O(inst[30]),
        .T(1'b1));
  OBUFT \inst_OBUF[31]_inst 
       (.I(1'b0),
        .O(inst[31]),
        .T(1'b1));
  OBUFT \inst_OBUF[3]_inst 
       (.I(1'b0),
        .O(inst[3]),
        .T(1'b1));
  OBUFT \inst_OBUF[4]_inst 
       (.I(1'b0),
        .O(inst[4]),
        .T(1'b1));
  OBUFT \inst_OBUF[5]_inst 
       (.I(1'b0),
        .O(inst[5]),
        .T(1'b1));
  OBUFT \inst_OBUF[6]_inst 
       (.I(1'b0),
        .O(inst[6]),
        .T(1'b1));
  OBUFT \inst_OBUF[7]_inst 
       (.I(1'b0),
        .O(inst[7]),
        .T(1'b1));
  OBUFT \inst_OBUF[8]_inst 
       (.I(1'b0),
        .O(inst[8]),
        .T(1'b1));
  OBUFT \inst_OBUF[9]_inst 
       (.I(1'b0),
        .O(inst[9]),
        .T(1'b1));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
