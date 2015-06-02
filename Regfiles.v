`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:15 03/21/2015 
// Design Name: 
// Module Name:    Regfiles 
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
module regfiles(
	input clk, //寄存器组时钟信号，下降沿写入数据（注意：pc 为上升沿，此为下降沿）
	input rst, //reset 信号，reset 有效时全部寄存器置零
	input we, //写有效信号，we 有效时寄存器才能被写入
	input [4:0] raddr1, //所需读取的寄存器的地址
	input [4:0] raddr2, //所需读取的寄存器的地址
	input [4:0] waddr, //写寄存器的地址
	input [31:0] wdata, //写寄存器数据
	output [31:0] rdata1, //raddr1 所对应寄存器的数据，只要有raddr1 的输入即输出相应数据
	output [31:0] rdata2 //raddr2 所对应寄存器的数据，只要有raddr2 的输入即输出相应数据
	);
	reg [31:0] tmp_data[1:31];
	integer i;
	
	assign rdata1 = (raddr1==0) ? 0 : tmp_data[raddr1];
	assign rdata2 = (raddr2==0) ? 0 : tmp_data[raddr2];
	always @(negedge clk or posedge rst) begin
		if(rst) begin
			for(i=1;i<32;i=i+1)
				tmp_data[i] <= 0;
		end
		else if((waddr!=0)&&we)
			tmp_data[waddr] <= wdata;
	end

endmodule
