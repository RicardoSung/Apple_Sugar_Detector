`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:20 07/11/2021 
// Design Name: 
// Module Name:    HT_Serial_Com 
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
module HT_Serial_Com
#(
	parameter CLK_FRE = 50,      //clock frequency(Mhz)
	parameter BAUD_RATE = 115200 //serial baud rate
)
(
    input clk_50m,
    input start,
    inout SDATA_pin,
    output SCLK_pin,
    output SLOAD_pin,
    input [15:0] DATA,//DATA[0] which is low level means Write.
    output [8:0] REC_DATA,
    output complete_signal
);
    reg complete_reg;
    assign complete_signal = complete_reg;
    reg [8:0] REC_DATA_reg;
    assign REC_DATA = REC_DATA_reg;
    reg SDATA_reg;
    assign SDATA_pin = SDATA_reg;
    reg SLOAD_reg;
    assign SLOAD_pin = SLOAD_reg;
    reg [4:0] bit_cnt;
    reg [15:0] tx_rx_data;
//generate SCLK signal
    reg SCLK_reg;
    localparam SCLK_Pulse_num = 4'b101;
    localparam SCLK_Period =  4'b1010;
    reg [3:0] SCLK_Cnt;
    always @(posedge clk_50m or negedge start) begin
        if(!start)begin
            SCLK_Cnt <= 4'b0;
            SCLK_reg <= 1'b0;
        end else if(SCLK_Cnt <= SCLK_Pulse_num - 1) begin
            SCLK_Cnt        <= SCLK_Cnt + 1'b1;
            SCLK_reg    <= 1'b1;
        end else if(SCLK_Cnt == SCLK_Period - 1) begin
            SCLK_Cnt        <= 4'd0;    
        end else begin
            SCLK_Cnt        <= SCLK_Cnt + 1'b1;
            SCLK_reg    <= 1'b0;
        end    
    end
    assign SCLK_pin = SCLK_reg;

    //mark data bits
    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            begin
                bit_cnt <= 5'd0;
            end
        else if(state == S_REC || state == S_SEND)
            if(SCLK_Cnt == SCLK_Period - 1)
                bit_cnt <= bit_cnt + 5'd1;
            else
                bit_cnt <= bit_cnt;
        else
            bit_cnt <= 5'd0;
    end

    //state circle & state machine
    reg [1:0] state;
    reg [1:0] next_state;
    localparam S_IDLE = 1;
    localparam S_REC  = 2;
    localparam S_SEND = 3;



    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            state <= S_IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case(state)
            S_IDLE:
                if(SLOAD_reg) begin
                    complete_reg <= 0;
                    if (!DATA[0]) begin
                        next_state <= S_SEND;
                    end else begin
                        next_state <= S_REC;
                    end
                end
                else
                begin
                    next_state <= S_IDLE;
                    complete_reg <= 1;
                end             
            S_REC:
                if(SCLK_Cnt == SCLK_Period - 1  && bit_cnt == 5'd15)
                    next_state <= S_IDLE;
                else
                    next_state <= S_REC;
            S_SEND:
                if(SCLK_Cnt == SCLK_Period - 1  && bit_cnt == 5'd15)
                    next_state <= S_IDLE;
                else
                    next_state <= S_SEND;
            default:
                next_state <= S_IDLE;
        endcase
    end


    //load data
    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            SDATA_reg <= 1'b1;
        else
            case(state)
                S_IDLE:
                    SDATA_reg <= 1'b1; 
                S_REC:
                    if (bit_cnt <= 5'd6) begin
                        SDATA_reg <= tx_rx_data[bit_cnt];
                    end else begin
                        REC_DATA_reg[bit_cnt-3'b111] <=  SDATA_reg;
                    end
                S_SEND:
                    SDATA_reg <= tx_rx_data[bit_cnt];         
                default:
                    SDATA_reg <= 1'b1; 
            endcase
    end


    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            begin
                tx_rx_data <= 16'd0;
            end
        else if(state == S_IDLE)
                tx_rx_data <= DATA;
    end

    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            SLOAD_reg <= 1'd1;
        else 
            SLOAD_reg <= 1'b0;
    end


endmodule
