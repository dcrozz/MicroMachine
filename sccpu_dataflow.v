`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:31 03/21/2015 
// Design Name: 
// Module Name:    sccpu_dataflow 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module sccpu_dataflow(
		input [31:0] meminst, // instruction memory
		input [31:0] memdata, // data memory
		input reset,
		input clock,
		output [31:0] pc, // the next pc address
		output [31:0] aluout, // the address written into memory
		output [31:0] data, // the data written into memory
		output wmem // the signal of writing into memory
    );
	 wire [31:0] next_pc,p4offset,p4;
	 wire [31:0] regf_qa,regf_d;
	 wire [4:0] regf_wn,reg2f;
	 wire zero,ovfl;
	 wire wreg,regrt,jal,m2reg,shift,aluimm,sext;
	 wire [31:0] alua,alub;
	 wire [3:0] aluc;
	 wire [1:0] pcsource;
	 wire [31:0] immext;
	 wire [31:0] mem2d;
	 
	 assign regf_wn = reg2f | {5{jal}};
	 
	 wire [5:0] op = meminst[31:26];
	 wire [5:0] func = meminst[5:0];
	 wire [4:0] rs = meminst[25:21];
	 wire [4:0] rt = meminst[20:16];
	 wire [4:0] rd = meminst[15:11];
	 wire [31:0] sa = {27'b0,meminst[10:6]};
	 wire [15:0] imm = meminst[15:0];
	 wire [31:0] immshift = {immext[29:0],2'b00};
	 wire [31:0] addr = {p4[31:28],meminst[25:0],2'b00};
	 wire wregovfl = wreg & ~ovfl;
	 
	 pcreg pc_inst(clock,reset,next_pc,pc);
	 regfiles regf(clock,reset,wregovfl,rs,rt,regf_wn,regf_d,regf_qa,data);
	 cpu_control cu(op,func,zero,wreg,regrt,jal,m2reg,shift,aluimm,sext,wmem,aluc,pcsource);
	 adddd addpc4(pc,32'h00000004,p4);
	 adddd addoffset(pc,immshift,p4offset);
	 mux2x5 reg_wn(rd,rt,regrt,reg2f);
	 mux2x32 mem2reg(aluout,memdata,m2reg,mem2d);
	 mux2x32 reg_d(mem2d,p4+4,jal,regf_d);
	 mux2x32 alu_a(regf_qa,sa,shift,alua);
	 mux2x32 alu_b(data,immext,aluimm,alub);
	 mux4x32 pc_select(p4,p4offset,regf_qa,addr,pcsource,next_pc);
	 ext eimm(imm,sext,immext);
	 alu aaalu(alua,alub,aluc,aluout,zero,ovfl);

endmodule

