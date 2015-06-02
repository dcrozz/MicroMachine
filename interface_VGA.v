`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:05 05/28/2015 
// Design Name: 
// Module Name:    interface_VGA 
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
module interface_VGA(
		input [31:0] data_in,
		input [7:0] data_addr,
		output reg [2:0] out_r,
		output reg [2:0] out_g,
		output reg [1:0] out_b,
		output reg out_hs,
		output reg out_vs,
		input we,
		input clk,
		input glb_clk,
		input rst
    );

		reg [9:0] x_cnt,y_cnt; // 行坐标和列坐标
		reg [31:0] VGA_reg [0:255]; // 显存
		
		wire [9:0] xpos,ypos; // 有效显示区坐标
		assign xpos = x_cnt-10'd144;
		assign ypos = y_cnt-10'd35;
      reg [4:0] tmpx,tmpy; // 确定显存的位置
      
      wire [9:0] tmp;
      assign tmp = {tmpy,tmpx};
        
		wire [31:0] VGA_tmp;
      assign VGA_tmp = VGA_reg[tmp[9:2]];
		
		always @ (posedge glb_clk) begin
			if(we) begin
				VGA_reg[data_addr] <= data_in;
			end
		end
		always @ (posedge clk or posedge rst) begin
			if(rst)
				x_cnt <= 10'b0;
			else if(x_cnt == 10'd800)
				x_cnt <= 10'b1;
			else
				x_cnt <= x_cnt + 1'b1;
		end
		always @ (posedge clk or posedge rst) begin
			if(rst)
				y_cnt <= 10'b0;
			else if(y_cnt == 10'd525)
				y_cnt <= 10'b0;
			else if(x_cnt == 10'd800)
				y_cnt <= y_cnt + 1'b1;
		end
		always @ (posedge clk or posedge rst) begin
			if(rst)
				out_hs <= 1'b0;
			else if(x_cnt == 10'd800)
				out_hs <= 1'b0; //产生hsync信号
			else if(x_cnt == 10'd96)
				out_hs <= 1'b1;
		end
		always @ (posedge clk or posedge rst) begin
			if(rst)
				out_vs <= 1'b0;
			else if(y_cnt == 10'd525)
				out_vs <= 1'b0; //产生vsync信号
			else if(y_cnt == 10'd2)
				out_vs <= 1'b1;
		end
		always @ (posedge clk or posedge rst) begin
			if(rst) begin
				out_r <= 3'b0;
				out_g <= 3'b0;
				out_b <= 2'b0;
			end
			else if((x_cnt>=10'd144)&&(x_cnt<10'd784)&&(y_cnt>=10'd35)&&(y_cnt<10'd515)) begin
            if(ypos>=0 && ypos<20) tmpy <= 0;
            else if(ypos>=20 && ypos<40) tmpy <= 1;
            else if(ypos>=40 && ypos<60) tmpy <= 2;
            else if(ypos>=60 && ypos<80) tmpy <= 3;
            else if(ypos>=80 && ypos<100) tmpy <= 4;
            else if(ypos>=100 && ypos<120) tmpy <= 5;
            else if(ypos>=120 && ypos<140) tmpy <= 6;
            else if(ypos>=140 && ypos<160) tmpy <= 7;
            else if(ypos>=160 && ypos<180) tmpy <= 8;
            else if(ypos>=180 && ypos<200) tmpy <= 9;
            else if(ypos>=200 && ypos<220) tmpy <= 10;
            else if(ypos>=220 && ypos<240) tmpy <= 11;
            else if(ypos>=240 && ypos<260) tmpy <= 12;
            else if(ypos>=260 && ypos<280) tmpy <= 13;
            else if(ypos>=280 && ypos<300) tmpy <= 14;
            else if(ypos>=300 && ypos<320) tmpy <= 15;
            else if(ypos>=320 && ypos<340) tmpy <= 16;
            else if(ypos>=340 && ypos<360) tmpy <= 17;
            else if(ypos>=360 && ypos<380) tmpy <= 18;
            else if(ypos>=380 && ypos<400) tmpy <= 19;
            else if(ypos>=400 && ypos<420) tmpy <= 20;
            else if(ypos>=420 && ypos<440) tmpy <= 21;
            else if(ypos>=440 && ypos<460) tmpy <= 22;
            else if(ypos>=460 && ypos<480) tmpy <= 23;
            else tmpy <= 0;
            
            if(xpos>=0 && xpos<20) tmpx <= 0;
            else if(xpos>=20 && xpos<40) tmpx <= 1;
            else if(xpos>=40 && xpos<60) tmpx <= 2;
            else if(xpos>=60 && xpos<80) tmpx <= 3;
            else if(xpos>=80 && xpos<100) tmpx <= 4;
            else if(xpos>=100 && xpos<120) tmpx <= 5;
            else if(xpos>=120 && xpos<140) tmpx <= 6;
            else if(xpos>=140 && xpos<160) tmpx <= 7;
            else if(xpos>=160 && xpos<180) tmpx <= 8;
            else if(xpos>=180 && xpos<200) tmpx <= 9;
            else if(xpos>=200 && xpos<220) tmpx <= 10;
            else if(xpos>=220 && xpos<240) tmpx <= 11;
            else if(xpos>=240 && xpos<260) tmpx <= 12;
            else if(xpos>=260 && xpos<280) tmpx <= 13;
            else if(xpos>=280 && xpos<300) tmpx <= 14;
            else if(xpos>=300 && xpos<320) tmpx <= 15;
            else if(xpos>=320 && xpos<340) tmpx <= 16;
            else if(xpos>=340 && xpos<360) tmpx <= 17;
            else if(xpos>=360 && xpos<380) tmpx <= 18;
            else if(xpos>=380 && xpos<400) tmpx <= 19;
            else if(xpos>=400 && xpos<420) tmpx <= 20;
            else if(xpos>=420 && xpos<440) tmpx <= 21;
            else if(xpos>=440 && xpos<460) tmpx <= 22;
            else if(xpos>=460 && xpos<480) tmpx <= 23;
            else if(xpos>=480 && xpos<500) tmpx <= 24;
            else if(xpos>=500 && xpos<520) tmpx <= 25;
            else if(xpos>=520 && xpos<540) tmpx <= 26;
            else if(xpos>=540 && xpos<560) tmpx <= 27;
            else if(xpos>=560 && xpos<580) tmpx <= 28;
            else if(xpos>=580 && xpos<600) tmpx <= 29;
            else if(xpos>=600 && xpos<620) tmpx <= 30;
            else if(xpos>=620 && xpos<640) tmpx <= 31;
            else tmpx <= 0;
                
				case(tmp[1:0])
					2'b00:begin
						out_r <= VGA_tmp[31:29];
						out_g <= VGA_tmp[28:26];
						out_b <= VGA_tmp[25:24];
					end
					2'b01:begin
						out_r <= VGA_tmp[23:21];
						out_g <= VGA_tmp[20:18];
						out_b <= VGA_tmp[17:16];
					end
					2'b10:begin
						out_r <= VGA_tmp[15:13];
						out_g <= VGA_tmp[12:10];
						out_b <= VGA_tmp[9:8];
					end
					2'b11:begin
						out_r <= VGA_tmp[7:5];
						out_g <= VGA_tmp[4:2];
						out_b <= VGA_tmp[1:0];
					end
				endcase
			end
			else begin
				out_r <= 3'b0;
				out_g <= 3'b0;
				out_b <= 2'b0;
			end
		end
endmodule
