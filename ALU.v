`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:46:04 03/20/2015 
// Design Name: 
// Module Name:    ALU 
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
module alu(
	input [31:0] a, // 32 位输入，操作数1
	input [31:0] b, // 32 位输入，操作数2
	input [3:0] aluc, // 4 位输入，控制alu 的操作
	output [31:0] r, // 32 位输出，有a b 经过aluc 指定的操作生成
	output zero,	 // 0 标志位
	output ovfl  // overflow
	);

	reg [31:0] tmp0,tmp1,tmp4,tmp5,tmp6,tmp7,tmp8,tmp10,tmp12,tmp14,tmp13;
	reg signed [31:0] tmp2,tmp3,tmp11;
	reg [31:0] tmpr;
	reg tmpz,tmpo;
	
	assign r = tmpr;
	assign zero = tmpz;
	assign ovfl = tmpo;
	
	always @* begin
		tmpo = 0;
		tmpr = 0;
		tmpz = 0;
		
		tmp0 = a + b;
		tmp2 = $signed(a) + $signed(b);
		tmp1 = a - b;
		tmp3 = $signed(a) - $signed(b);
		tmp4 = a & b;
		tmp5 = a | b;
		tmp6 = a ^ b;
		tmp7 = ~(a | b);
		tmp8 = {b[15:0],16'b0};
		tmp11 = $signed(a) < $signed(b) ? 1 : 0;
		tmp10 = a < b ? 1 : 0;
		tmp12 = $signed(b) >>> a[4:0];
		tmp14 = b << a[4:0];
		tmp13 = b >> a[4:0];
		
		casex(aluc)
			4'b0000: begin
				tmpr = tmp0;
			end
			4'b0010: begin
				tmpr = tmp2;
				if( (~a[31])&&(~b[31])&&tmpr[31] || a[31]&&b[31]&&(~tmpr[31]) ) begin
					tmpo = 1;
				end
			end
			4'b0001: begin
				tmpr = tmp1;
			end
			4'b0011: begin
				tmpr = tmp3;
				if( (~a[31])&&b[31]&&tmpr[31] || a[31]&&(~b[31])&&(~tmpr[31]) )begin
					tmpo = 1;
				end
			end
			4'b0100: begin
				tmpr = tmp4;
			end
			4'b0101: begin
				tmpr = tmp5;
			end
			4'b0110: begin
				tmpr = tmp6;
			end
			4'b0111: begin
				tmpr = tmp7;
			end
			4'b100x: begin
				tmpr = tmp8;
			end
			4'b1011:begin
				tmpr = tmp11;
			end
			4'b1010: begin
				tmpr = tmp10;
			end
			4'b1100: begin
				tmpr = tmp12;
			end
			4'b111x: begin
				tmpr = tmp14;
			end
			4'b1101: begin
				tmpr = tmp13;
			end
		endcase
		
		if(tmpr) tmpz = 0;
		else tmpz = 1;
	end
	
endmodule

module adddd(
	input [31:0] a,
	input [31:0] b,
	output [31:0] c
);
	reg [31:0] tmp;
	
	assign c = tmp;
	always @* begin
		tmp = a + b;
	end

endmodule
