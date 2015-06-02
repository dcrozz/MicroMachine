`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:13:51 03/22/2015 
// Design Name: 
// Module Name:    fenpinqi 
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
module fenpinqi(
		input clk_input,
		output reg clock,
		output reg clk16x,
		output reg clkVGA
    );
	 
	 integer counter = 0;
	 always @(posedge clk_input) begin
		counter = counter+1;
		case(counter)
			1:clock = 1;
			6:clock = 0;
			10:counter = 0;
		endcase
	 end
	 
	 integer cnt_16x = 0;
	 always @(posedge clk_input) begin
		cnt_16x = cnt_16x+1;
		case(cnt_16x)
			1:clk16x = 1;
			327:clk16x = 0;
			652:cnt_16x = 0;
		endcase
	 end
	 
	 integer cnt_VGA = 0;
	 always @(posedge clk_input) begin
		cnt_VGA = cnt_VGA+1;
		case(cnt_VGA)
			1:clkVGA = 1;
			3:clkVGA = 0;
			4:cnt_VGA = 0;
		endcase
	 end

endmodule
