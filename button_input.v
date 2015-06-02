`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:41 04/12/2015 
// Design Name: 
// Module Name:    button_input 
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
module interface_switch(
		input [7:0] data_in,
		output reg [7:0] data_out,
		input clk
    );

		always @(posedge clk) begin
			data_out <= data_in;
		end

endmodule

module interface_button(
		input [3:0] data_in,
		output reg [3:0] data_out,
		input clk
    );

		always @(posedge clk) begin
			data_out <= data_in;
		end

endmodule