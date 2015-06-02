`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:25:10 04/09/2015 
// Design Name: 
// Module Name:    decoder 
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
module decoder(
    input [10:0] data_in,
	 output reg d2reg_mem,
	 output reg we_mem,
	 output reg we_led,
	 output reg d2reg_switch,
	 output reg d2reg_button,
	 output reg we_seg,
	 output reg d2reg_uart,
	 output reg we_uart,
	 output reg we_VGA
    );
	 
	 always @* begin
		 d2reg_mem = 0;
		 we_mem = 0;
		 we_led = 0;
		 d2reg_switch = 0;
		 d2reg_button = 0;
		 we_seg = 0;
		 d2reg_uart = 0;
		 we_uart = 0;
		 we_VGA = 0;
		 casex(data_in)
				11'b0xxxxxxxxxx: begin
					d2reg_mem = 1;
					we_mem = 1;
				end
				11'b10000000001: begin
					we_led = 1;
				end
				11'b10000000010: begin
					d2reg_switch = 1;
				end
				11'b10000000011: begin
					d2reg_button = 1;
				end
				11'b10000000100: begin
					we_seg = 1;
				end
				11'b10000000101: begin
					d2reg_uart = 1;
					we_uart = 1;
				end
				11'b101xxxxxxxx: begin
					we_VGA = 1;
				end
		 endcase
	 end
	 
endmodule


