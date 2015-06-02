`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:04 04/26/2015 
// Design Name: 
// Module Name:    rx_module 
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
module rx_module_recv(
		input data_in,
		output reg [7:0] data_out,
		input clk,
		input rst,
		output reg data_ready
    );
		
		/*捕获rx(data_in)的下降沿，即起始信号*/
		reg pre_rx;
		wire rx_begin;
		always @(posedge clk or posedge rst) begin
			if(rst)
				pre_rx <= 0;
			else
				pre_rx <= data_in;
		end
		assign rx_begin = pre_rx & ~data_in;
		
		/*如果捕获到下降沿，则开始计数*/
		reg cnt_en;
		always @(posedge clk or posedge rst) begin
			if(rst)
				cnt_en <= 0;
			else if(rx_begin)
				cnt_en <= 1;
			else if(cnt == 8'd153)
				cnt_en <= 0;
		end
		
		/*对采样时钟进行计数*/
		reg [7:0] cnt;
		always @(posedge clk or posedge rst) begin
			if(rst)
				cnt <= 8'b0;
			else if(cnt_en)
				cnt <= cnt+1;
			else
				cnt <= 8'b0;
		end
		
		/*在各个采样时刻，读取接收到的数据*/
		always @(posedge clk or posedge rst) begin
			if(rst)
				data_out <= 8'b0;
			else if(cnt_en)
				case(cnt)
					8'd24: data_out[0] <= data_in;
					8'd40: data_out[1] <= data_in;
					8'd56: data_out[2] <= data_in;
					8'd72: data_out[3] <= data_in;
					8'd88: data_out[4] <= data_in;
					8'd104:data_out[5] <= data_in;
					8'd120:data_out[6] <= data_in;
					8'd136:data_out[7] <= data_in;
				endcase
		end
		
		/*接收到停止位后，给出数据准备好标志位*/
		always @(posedge clk or posedge rst) begin
			if(rst)
				data_ready <= 0;
			else if(cnt==8'd152 || cnt==8'd153)
				data_ready <= 1;
			else
				data_ready <= 0;
		end

endmodule

module rx_module_send(
		input [7:0] data_in,
		output reg data_out,
		input we,
		input clk,
		input rst
    );

		/*捕获we的下上升沿，即起始信号*/
		reg pre_we;
		wire we_begin;
		always @(posedge clk or posedge rst) begin
			if(rst)
				pre_we <= 0;
			else
				pre_we <= we;
		end
		assign we_begin = ~pre_we & we;
		
		/*当we的上升沿到来时，将要写的数据存入buffer*/
		reg [7:0] buffer;
		always @(posedge we_begin or posedge rst) begin
			if(rst)
				buffer <= 8'b0;
			else
				buffer <= data_in;
		end
		
		/*如果捕获到上升沿，则开始计数*/
		reg cnt_en;
		always @(posedge clk or posedge rst) begin
			if(rst)
				cnt_en <= 0;
			else if(we_begin)
				cnt_en <= 1;
			else if(cnt == 8'd160)
				cnt_en <= 0;
		end
		
		/*对采样时钟进行计数*/
		reg [7:0] cnt;
		always @(posedge clk or posedge rst) begin
			if(rst)
				cnt <= 8'b0;
			else if(cnt_en)
				cnt <= cnt+1;
			else
				cnt <= 8'b0;
		end
		
		/*在各个采样时刻，发送已写入的数据*/
		always @(posedge clk or posedge rst) begin
			if(rst)
				data_out <= 1;
			else if(cnt_en)
				case(cnt)
					8'd0:  data_out <= 0;
					8'd16: data_out <= buffer[0];
					8'd32: data_out <= buffer[1];
					8'd48: data_out <= buffer[2];
					8'd64: data_out <= buffer[3];
					8'd80: data_out <= buffer[4];
					8'd96: data_out <= buffer[5];
					8'd112:data_out <= buffer[6];
					8'd128:data_out <= buffer[7];
					8'd144:data_out <= 1;
				endcase
			else
				data_out <= 1;
		end
		
endmodule

module rx_module_buff(
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
