`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:57 06/26/2021 
// Design Name: 
// Module Name:    HT_Serial 
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
module HT_Serial(
    input clk_50m,
    input start,
    input [15:0] Data_Send,
    output HT_SCLK,
    output HT_SLOAD,
    output HT_SDATA
    );

// 产生SCLK时钟信号
    reg HT_SCLK_reg;
    parameter HT_SCLK_reg_Pulse = 5'b1_1001;
    parameter HT_SCLK_reg_Period =  6'b11_0010;
    reg [5:0] HT_SCLK_reg_cnt;

    always @(posedge clk_50m or negedge start) begin
        if(!start)begin
            HT_SCLK_reg_cnt <= 6'b0;
            HT_SCLK_reg    <= 1'b0;
        end else if(HT_SCLK_reg_cnt <= HT_SCLK_reg_Pulse - 1) begin
            HT_SCLK_reg_cnt        <= HT_SCLK_reg_cnt + 1'b1;
            HT_SCLK_reg    <= 1'b1;
        end else if(HT_SCLK_reg_cnt == HT_SCLK_reg_Period - 1) begin
            HT_SCLK_reg_cnt        <= 6'd0;    
        end else begin
            HT_SCLK_reg_cnt        <= HT_SCLK_reg_cnt + 1'b1;
            HT_SCLK_reg    <= 1'b0;
        end    
    end
    assign HT_SCLK = HT_SCLK_reg;


//SLOAD信号
    reg HT_SLOAD_reg;
    reg [4:0] HT_SLOAD_count_reg;
    parameter HT_SLOAD_count_max = 5'b1_0000;
    always @(negedge HT_SCLK_reg or negedge start ) begin
        if (!start) begin
            HT_SLOAD_reg <= 1'b1;
            HT_SLOAD_count_reg <= 5'b0;
        end else if(HT_SLOAD_count_reg <= HT_SLOAD_count_max - 1'b1) begin
            HT_SLOAD_count_reg <= HT_SLOAD_count_reg + 1'b1;
            HT_SLOAD_reg <= 1'b0;
        end else begin
            HT_SLOAD_count_reg <= 5'b0;
            HT_SLOAD_reg <= 1'b1;
        end
    end
    assign HT_SLOAD = HT_SLOAD_reg;

//SDATA信号
    reg HT_SDATA_reg;
    reg [4:0] HT_SDATA_cout_reg;
    reg [15:0] Data_reg;
    always @(negedge HT_SCLK_reg or negedge start ) begin
        if (!start) begin
            Data_reg <= Data_Send;
            HT_SDATA_reg <= 1'b1;
            HT_SDATA_cout_reg <= 5'b0;
        end else if(HT_SDATA_cout_reg <= HT_SLOAD_count_max -1'b1) begin
            HT_SDATA_cout_reg <= HT_SDATA_cout_reg + 1'b1;
            HT_SDATA_reg <= (Data_reg >> (HT_SLOAD_count_max - HT_SDATA_cout_reg - 1'b1));
        end else begin
            HT_SDATA_cout_reg <= 5'b0;
            HT_SDATA_reg <= 1'b1;
        end
    end
    assign HT_SDATA = HT_SDATA_reg;    

endmodule
