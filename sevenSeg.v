`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:18 04/17/2015 
// Design Name: 
// Module Name:    sevenSeg 
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
module interface_seg(
		input [11:0] data_in,
		output reg [11:0] data_out,
		input we,
		input clk
    );

		always @(posedge clk) begin
			if(we) begin
				data_out <= data_in;
			end
		end

endmodule
