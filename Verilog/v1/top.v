`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:51 06/26/2021 
// Design Name: 
// Module Name:    top 
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
module top(
    input clk_50m,
    // input rst,
    // inout [8:8] HT_value,
    // output HT_CDSCLK1,
    // output HT_CDSCLK2,
    // output HT_ADCCLK,
    // output HT_SLOAD,
    // output HT_SCLK,
    // output HT_SDATA,
    output CCD_Master,
    output CCD_SH,
    output CCD_ICG,
    output UART_TXD,
    input UART_RXD,
    output led
    );

`define conf_addr 3'b000
`define mux_addr 3'b001
`define red_pga_addr 3'b010
`define green_pga_addr 3'b011
`define blue_pga_addr 3'b100
`define red_offset_addr 3'b101
`define green_offset_addr 3'b110
`define blue_offset_addr 3'b111
//CONF REG
`define EX_1CH_SHA_16 9'b000000000
`define EX_1CH_SHA_2  9'b000000010
`define IN_1CH_SHA_16 9'b001000000
`define IN_1CH_SHA_2  9'b001000010
//MUX REG
`define BGR_R_12 9'b011000101
`define BGR_G_12 9'b010100101
`define BGR_B_12 9'b010010101
//PGA REG
`define Gain_1 9'b000000000
//Offset REG
`define Offset_0 9'b000000000
//uart baud rate
`define baud_rate_1_5000_0000 1_0110_1110_0011_0110_0000
`define baud_rate_11_5200 1_1100_0010_0000_0000
`define baud_rate_51_2000 111_1101_0000_0000_0000


//Light the LED & software reset
reg rst_reg=0;
wire rst;
reg led_reg = 0;
always @(posedge clk_50m) begin
    led_reg <= 1;
    rst_reg <= 1;
end
assign led = led_reg;
assign rst = rst_reg;

//ccd clock
reg [15:0] sh_pulse =15'b111;
wire [15:0] SH_Pulse;
assign SH_Pulse = sh_pulse;
CCD_Interface ccd(
    .clk_50m(clk_50m),
    .rst(rst),
    .SH_Pulse(sh_pulse),
    .Master(CCD_Master),
    .Icg(CCD_ICG),
    .Sh(CCD_SH)
    );

//UART transmit
wire rx_data_valid;
reg rx_data_ready_reg;
wire rx_data_ready;
wire [7:0] tx_rx_data;
wire tx_data_ready;
assign rx_data_ready = rx_data_ready_reg;

reg tx_data_valid_reg;
wire tx_data_valid = tx_data_valid_reg;
UART_TX#
(
    .CLK_FRE(50),
	.BAUD_RATE(921600)
) tx_test
(
    .clk_50m(clk_50m),
	.start(rst),
    .tx_data_valid(tx_data_valid),
	.tx_data(tx_rx_data),
	.tx_data_ready(tx_data_ready),
	.tx_pin(UART_TXD)
);
//USART_Receive

UART_RX#(
	.CLK_FRE(50),
	.BAUD_RATE(921600)
) rx_test
(
    .clk_50m(clk_50m),
    .start(rst),
	.rx_data(tx_rx_data),
	.rx_data_valid(rx_data_valid),
	.rx_data_ready(rx_data_ready),
	.rx_pin(UART_RXD)
);

always @(*) begin
    
    tx_data_valid_reg = rx_data_valid;
    // tx_data_ready = 1;
    rx_data_ready_reg = 1;
end


// //transmit the specture data
// UART_TX_Sequence#(
//     .clk_FRE(50),
// 	.BAUD_RATE(115200)
// )uart_seq(
//     .clk_50m(clk_50m),
//     .start(rst),
//     .spectrum_values(),
//     .tx_pin(UART_TXD)
// );










endmodule
