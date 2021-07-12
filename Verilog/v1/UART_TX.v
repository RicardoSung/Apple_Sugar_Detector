`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:46 06/27/2021 
// Design Name: 
// Module Name:    UART_TX 
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
module UART_TX
#(
	parameter CLK_FRE = 50,      //clock frequency(Mhz)
	parameter BAUD_RATE = 115200 //serial baud rate
)
(
    input clk_50m,
	input  start,
    input tx_data_valid,
	input[7:0] tx_data,
	output reg tx_data_ready,
	output tx_pin
);

    localparam CYCLE = CLK_FRE * 1000000 / BAUD_RATE;
    localparam S_IDLE = 1;
    localparam S_START = 2;
    localparam S_SEND_BYTE = 3;
    localparam S_STOP = 4;
    reg[2:0] state;
    reg[2:0] next_state;
    reg[15:0] cycle_cnt;
    reg[2:0] bit_cnt;
    reg[7:0] tx_data_latch;
    reg tx_reg;

    assign tx_pin = tx_reg;

    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
        cycle_cnt <= 16'd0;
        else if((state == S_SEND_BYTE && cycle_cnt == CYCLE - 1) || next_state != state)
            cycle_cnt <= 16'd0;
        else
            cycle_cnt <= cycle_cnt + 16'd1;	
    end

    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            begin
                tx_data_ready <= 1'b0;
            end
        else if(state == S_IDLE)
            if(tx_data_valid == 1'b1)
                tx_data_ready <= 1'b0;
            else
                tx_data_ready <= 1'b1;
        else if(state == S_STOP && cycle_cnt == CYCLE - 1)
                tx_data_ready <= 1'b1;
    end


    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            tx_reg <= 1'b1;
        else
            case(state)
                S_IDLE,S_STOP:
                    tx_reg <= 1'b1; 
                S_START:
                    tx_reg <= 1'b0; 
                S_SEND_BYTE:
                    tx_reg <= tx_data_latch[bit_cnt];
                default:
                    tx_reg <= 1'b1; 
            endcase
    end


    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            state <= S_IDLE;
        else
            state <= next_state;
    end


    always@(*)
    begin
        case(state)
            S_IDLE:
                if(tx_data_valid == 1'b1)
                    next_state <= S_START;
                else
                    next_state <= S_IDLE;
            S_START:
                if(cycle_cnt == CYCLE - 1)
                    next_state <= S_SEND_BYTE;
                else
                    next_state <= S_START;
            S_SEND_BYTE:
                if(cycle_cnt == CYCLE - 1  && bit_cnt == 3'd7)
                    next_state <= S_STOP;
                else
                    next_state <= S_SEND_BYTE;
            S_STOP:
                if(cycle_cnt == CYCLE - 1)
                    next_state <= S_IDLE;
                else
                    next_state <= S_STOP;
            default:
                next_state <= S_IDLE;
        endcase
    end

    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            begin
                tx_data_latch <= 8'd0;
            end
        else if(state == S_IDLE && tx_data_valid == 1'b1)
                tx_data_latch <= tx_data;
    end

    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            begin
                bit_cnt <= 3'd0;
            end
        else if(state == S_SEND_BYTE)
            if(cycle_cnt == CYCLE - 1)
                bit_cnt <= bit_cnt + 3'd1;
            else
                bit_cnt <= bit_cnt;
        else
            bit_cnt <= 3'd0;
    end


endmodule
