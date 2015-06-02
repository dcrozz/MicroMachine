`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:10 03/21/2015 
// Design Name: 
// Module Name:    CPU_Main 
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
`timescale 1ns / 1ps

module CPU_main(
		input reset,
		input clk_input,
		input [7:0] switch,
		input [3:0] button,
		input uart,
		output [7:0] data_led,
		output [11:0] data_seg,
			output data_uart,
		output [2:0] VGA_r,
		output [2:0] VGA_g,
		output [1:0] VGA_b,
		output VGA_hs,
		output VGA_vs
    );
	 wire [31:0] data,mem,ins,pc,alu;
	 wire we,clock,clk16x,clkVGA;
	 // main memory
	 wire d2reg_mem,we_mem;
	 wire [31:0] mem2reg;
	 // led
	 wire we_led;
	 // switch
	 wire d2reg_switch;
	 wire [7:0] switch2reg;
	 // button
	 wire d2reg_button;
	 wire [3:0] button2reg;
	 // segment
	 wire we_seg;
	 // uart
	 wire d2reg_uart,we_uart;
	 wire [7:0] uart2reg,uart2buf;
	 wire uart_data_ready;
	 // VGA
	 wire we_VGA;
	 
	 assign mem = d2reg_mem ? mem2reg : 32'bz;
	 assign mem = d2reg_switch ? {24'b0,switch2reg} : 32'bz;
	 assign mem = d2reg_button ? {28'b0,button2reg} : 32'bz;
	 assign mem = d2reg_uart ? {24'b0,uart2reg} : 32'bz;
	 
	 fenpinqi xiaofen(clk_input,clock,clk16x,clkVGA);
	 ipcore icore(pc[11:2],ins);
	 sccpu_dataflow u(ins,mem,reset,clock,pc,alu,data,we);
	 DataMem datam(alu[11:2],data,mem2reg,we_mem&we,clock);
	 
	 decoder decoder(alu[12:2],
								 d2reg_mem,we_mem,
								 we_led,
								 d2reg_switch,
								 d2reg_button,
								 we_seg,
								 d2reg_uart,we_uart,
								 we_VGA);
	 
	 interface_led i_led(data[7:0],data_led,we_led&we,clock);
	 interface_switch i_switch(switch,switch2reg,clock);
	 interface_button i_button(button,button2reg,clock);
	 interface_seg i_seg(data[11:0],data_seg,we_seg&we,clock);
	 
	 rx_module_recv uart_recv(uart,uart2buf,clk16x,reset,uart_data_ready);
	 rx_module_buff uart_buff(uart2buf,uart2reg,uart_data_ready,clk16x);
	 rx_module_send uart_send(data[7:0],data_uart,we_uart&we,clk16x,reset);
	 
	 interface_VGA i_VGA(data,alu[9:2],VGA_r,VGA_g,VGA_b,VGA_hs,VGA_vs,we_VGA&we,clkVGA,clock,reset);

endmodule
