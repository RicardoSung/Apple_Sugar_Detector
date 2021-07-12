`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:36 06/26/2021 
// Design Name: 
// Module Name:    CCD_SH 
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
module CCD_SH(
    input Master_clk,
    input rst,
    input [15:0] SH_Pulse,
    output CCD_SH
    );
//根据手册，sh的最短周期为10us，就是20个master周期，pluse最小为2，所以其他长度为18
    reg SH_reg;
    reg [15:0] SH_Pulse_num;
    reg [15:0] SH_Period;
    reg [15:0] cnt;

    always @(posedge Master_clk or negedge rst) begin
        if(!rst)begin
            cnt <= 16'b0;
            SH_reg    <= 1'b0;
            SH_Pulse_num <= SH_Pulse;
            SH_Period <= SH_Pulse + 5'b1_0010;
        end else if(cnt <= SH_Pulse_num - 1) begin
            cnt        <= cnt + 1'b1;
            SH_reg    <= 1'b1;
        end else if(cnt == SH_Period - 1) begin
            cnt        <= 16'd0;    
        end else begin
            cnt        <= cnt + 1'b1;
            SH_reg    <= 1'b0;
        end    
    end

    assign CCD_SH = SH_reg;

endmodule
