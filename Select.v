`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:27 03/21/2015 
// Design Name: 
// Module Name:    Select 
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
module mux2x32(
    input [31:0] a,
    input [31:0] b,
    input s,
    output [31:0] r
    );
	 
	 reg [31:0] tmp;
	 assign r = tmp;
	 
	 always @* begin
		if (s==0)
			tmp = a;
		else
			tmp = b;
	 end
	 
endmodule

module mux2x5(
    input [4:0] a,
    input [4:0] b,
    input s,
    output [4:0] r
    );
	 
	 reg [4:0] tmp;
	 assign r = tmp;
	 
	 always @* begin
		if (s==0)
			tmp = a;
		else
			tmp = b;
	 end
	 
endmodule

module mux4x32(
    input [31:0] a,
    input [31:0] b,
	 input [31:0] c,
	 input [31:0] d,
    input [1:0] s,
    output [31:0] r
    );
	 
	 reg [31:0] tmp;
	 assign r = tmp;
	 
	 always @* begin
		if (s==0)
			tmp = a;
		else if(s==1)
			tmp = b;
		else if (s==2)
			tmp = c;
		else
			tmp = d;
	 end
	 
endmodule