`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Mandi
// Engineer: Akash kumar
// 
// Create Date: 26.07.2022 05:15:46
// Design Name: RTL
// Module Name: sq_root
// Project Name: Restoring square root
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sq_root(q,r,d,load,count,start,clk);
input [31:0] d;
input load,clk;
output [15:0] q;
output [16:0] r;
output reg start;
//output reg busy, ready;
output reg [3:0] count;
reg [31:0] reg_d;
reg [15:0] reg_q;
reg [16:0] reg_r;
assign q = reg_q;
assign r = reg_r;
wire [17:0] subout = {reg_r[15:0],reg_d[31:30]} - {reg_q, 2'b1};
wire [16:0] muxout = subout[17] ? {reg_r[14:0],reg_d[31:30]} : subout[16:0];

always @(posedge clk ) 
if (load) 
begin
reg_q <= 0;
reg_d <= d;
reg_r <= 0;
count <= 0;
start <= 1;
if (start)
begin
reg_d <= {reg_d[29:0],2'b0};
reg_q <= {reg_q[14:0],~subout[17]};
reg_r <= muxout;
count <= count + 1'b1;

if (count == 4'b1111)
begin
end
end
end
endmodule
