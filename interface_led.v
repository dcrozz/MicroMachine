`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:23:32 04/09/2015 
// Design Name: 
// Module Name:    interface_led 
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
module interface_led(
		input [7:0] data_in,
		output reg [7:0] data_out,
		input we,
		input clk
    );

		always @(posedge clk) begin
			if(we) begin
				data_out <= data_in;
			end
		end

endmodule