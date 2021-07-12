`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:58 06/26/2021 
// Design Name: 
// Module Name:    CCD_ICG 
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
module CCD_ICG(
    input Master_clk,
    input rst,
    input [15:0] SH_Pulse,
    output CCD_ICG
    );

    reg ICG_reg;
    reg [15:0] ICG_Pulse;
    reg [31:0] ICG_Period;
    // parameter ICG_Pulse = SH_Pulse + 1'b1 + 4'b1010;
    // //ICG_Pulse = SH_Pulse(t3) + 1(t2) + 10(t1)
    // parameter ICG_Period = ICG_Pulse + 16'b11_1001_1011_1000;
    //ICG_Period = pulse + 4*3694 = pulse + 14776
    reg [31:0] cnt;

    always @(posedge Master_clk or negedge rst) begin
        if(!rst)begin
            cnt <= 16'b0;
            ICG_reg    <= 1'b0;
            ICG_Pulse <= SH_Pulse + 1'b1 + 4'b1010;
            ICG_Period <= ICG_Pulse + 16'b11_1001_1011_1000;
        end else if(cnt <= ICG_Pulse - 1) begin
            cnt        <= cnt + 1'b1;
            ICG_reg    <= 1'b1;
        end else if(cnt == ICG_Period - 1) begin
            cnt        <= 16'd0;    
        end else begin
            cnt        <= cnt + 1'b1;
            ICG_reg    <= 1'b0;
        end    
    end

    assign CCD_ICG = ICG_reg;

endmodule
