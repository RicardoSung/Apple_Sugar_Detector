`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:55 06/26/2021 
// Design Name: 
// Module Name:    CCD_MASTER 
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
module CCD_MASTER(
    input clk_50m,
    input rst,
    output CCD_Master
    );

    reg [7:0] cnt1;
    reg [7:0] cnt2;
    reg clk_div1, clk_div2;
    parameter NUM_Div = 25;


    always @(posedge clk_50m or negedge rst) begin
        if(!rst)begin
            cnt1 <= 8'b0;
        end else if(cnt1 < NUM_Div - 1) begin
            cnt1 <= cnt1 + 1'b1;
        end  else begin
            cnt1 <= 8'b0;
        end
    end

    always @(posedge clk_50m or negedge rst) begin
        if(!rst)begin
            clk_div1 <= 1'b1;
        end else if (cnt1 < NUM_Div / 2) begin
            clk_div1 <= 1'b1;
        end else begin
            clk_div1 <= 1'b0;
        end
    end

    always @(negedge clk_50m or negedge rst) begin
        if(!rst)begin
            cnt2 <= 8'b0;
        end else if (cnt2 < NUM_Div - 1) begin
            cnt2 <= cnt2 + 1'b1;
        end else begin
            cnt2 <= 8'b0;
        end

    end

    always @(negedge clk_50m or negedge rst) begin
        if(!rst)begin
            clk_div2 <= 1'b1;
        end else if (cnt2 < NUM_Div / 2) begin
            clk_div2 <= 1'b1;
        end else begin
            clk_div2 <= 1'b0;
        end
    end

    assign CCD_Master = (clk_div1 | clk_div2);


endmodule
