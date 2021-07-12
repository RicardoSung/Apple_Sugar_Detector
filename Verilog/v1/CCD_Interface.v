`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:10 06/27/2021 
// Design Name: 
// Module Name:    CCD_Interface 
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
module CCD_Interface(
    input clk_50m,
    input rst,
    input [15:0] SH_Pulse,
    output Master,
    output Icg,
    output Sh
    );

    CCD_MASTER MASTER(
        .clk_50m(clk_50m),
        .rst(rst),
        .CCD_Master(Master)
    );
    
    CCD_ICG ICG(
        .Master_clk(Master),
        .rst(rst),
        .SH_Pulse(SH_Pulse),
        .CCD_ICG(Icg)
    );

    CCD_SH SH(
        .Master_clk(Master),
        .rst(rst),
        .SH_Pulse(SH_Pulse),
        .CCD_SH(Sh)
    );


endmodule
