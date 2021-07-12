`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:40 06/27/2021 
// Design Name: 
// Module Name:    UART_RX 
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
module UART_RX
#(
	parameter CLK_FRE = 50,      //clock frequency(Mhz)
	parameter BAUD_RATE = 115200 //serial baud rate
)
(
    input clk_50m,
    input start,
	output reg [7:0] rx_data,
	output reg rx_data_valid,
	input rx_data_ready,
	input rx_pin
    );

    localparam CYCLE = CLK_FRE*1000000 / BAUD_RATE;
    localparam S_IDLE      = 1;
    localparam S_START     = 2; //start bit
    localparam S_REC_BYTE  = 3; //data bits
    localparam S_STOP      = 4; //stop bit
    localparam S_DATA      = 5;

    reg[2:0]  state;
    reg[2:0]  next_state;
    reg       rx_d0;            //delay 1 clock for rx_pin
    reg       rx_d1;            //delay 1 clock for rx_d0
    wire      rx_negedge;       //negedge of rx_pin
    reg[7:0]  rx_bits;          //temporary storage of received data
    reg[15:0] cycle_cnt;        //baud counter
    reg[2:0]  bit_cnt;          //bit counter

//to figure out the start condition, rx_d0 is the new digital state of rx_pin
//rx_d1 is the last state of rx_pin
//when rx_pin is set from high to low, the uart interface starts
//at that time, rx_d0 is 0, while rx_d1 is 1,then rx_negedge is 1
    assign rx_negedge = rx_d1 && ~rx_d0;

    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
        begin
            rx_d0 <= 1'b0;
            rx_d1 <= 1'b0;
        end
        else
        begin
            rx_d0 <= rx_pin;
            rx_d1 <= rx_d0;
        end
    end

//generate uart clk
    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            cycle_cnt <= 16'd0;
        else if((state == S_REC_BYTE && cycle_cnt == CYCLE - 1) || next_state != state)
            cycle_cnt <= 16'd0;
        else
            cycle_cnt <= cycle_cnt + 16'd1;	
    end
//mark data bytes
    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            begin
                bit_cnt <= 3'd0;
            end
        else if(state == S_REC_BYTE)
            if(cycle_cnt == CYCLE - 1)
                bit_cnt <= bit_cnt + 3'd1;
            else
                bit_cnt <= bit_cnt;
        else
            bit_cnt <= 3'd0;
    end

//receive serial data bit data
    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            rx_bits <= 8'd0;
    // state Receive_Data, mark the rx_pin value when CYCLE/2-1, to avoid other effects
        else if(state == S_REC_BYTE && cycle_cnt == CYCLE/2 - 1)
            rx_bits[bit_cnt] <= rx_pin;
        else
            rx_bits <= rx_bits; 
    end

//to release the stop signal named rx_data_valid
    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            rx_data_valid <= 1'b0;
        else if(state == S_STOP && next_state != state)
            rx_data_valid <= 1'b1;
        else if(state == S_DATA && rx_data_ready)
            rx_data_valid <= 1'b0;
    end

//to release the rx_data
    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            rx_data <= 8'd0;
        else if(state == S_STOP && next_state != state)
            rx_data <= rx_bits;//latch received data
    end


// state machine, dafault state is S_IDLE
    always@(posedge clk_50m or negedge start)
    begin
        if(start == 1'b0)
            state <= S_IDLE;
        else
            state <= next_state;
    end
// state circle
    always@(*)
    begin
        case(state)
            S_IDLE:
                if(rx_negedge)
                    next_state <= S_START;
                else
                    next_state <= S_IDLE;
            S_START:
                if(cycle_cnt == CYCLE - 1)//one data cycle 
                    next_state <= S_REC_BYTE;
                else
                    next_state <= S_START;
            S_REC_BYTE:
                if(cycle_cnt == CYCLE - 1  && bit_cnt == 3'd7)  //receive 8bit data
                    next_state <= S_STOP;
                else
                    next_state <= S_REC_BYTE;
            S_STOP:
                if(cycle_cnt == CYCLE/2 - 1)//half bit cycle,to avoid missing the next byte receiver
                    next_state <= S_DATA;
                else
                    next_state <= S_STOP;
            S_DATA:
                if(rx_data_ready)    //data receive complete
                    next_state <= S_IDLE;
                else
                    next_state <= S_DATA;
            default:
                next_state <= S_IDLE;
        endcase
    end















endmodule
