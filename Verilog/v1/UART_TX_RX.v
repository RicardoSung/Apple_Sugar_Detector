`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:02:09 06/28/2021
// Design Name:   UART_TX
// Module Name:   E:/FPGA_Xilinx/ISE/CCD/UART_TX_RX.v
// Project Name:  CCD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_TX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_TX_RX;

	reg clk;
	reg rst_n;
	reg uart_rx;
	wire rx_valid;
	wire [7:0] rx_data;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 1000 ns for global reset to finish
		#100;
          rst_n = 1;        
		// Add stimulus here
		#20000;
      //  $stop;
	end
   
    always #10 clk = ~ clk;        
   
    parameter                        BPS_115200 = 8680;
    parameter                        SEND_DATA = 8'b1010_0011;  
    
    integer i = 0;
       
      initial begin
        uart_rx = 1'b1;    //bus idle
        #1000 uart_rx = 1'b0;     //stranmit start bit
        
        for (i=0;i<8;i=i+1)
        #BPS_115200 uart_rx = SEND_DATA[i];     //stranmit data bit
      
        #BPS_115200 uart_rx = 1'b0;     //stranmit stop bit
        #BPS_115200 uart_rx = 1'b1;     //bus idle
        
       end   	  


	UART_RX uuu(
    .clk_50m(clk),
    .start(rst_n),
	.rx_data(rx_data),
	.rx_data_valid(rx_valid),
	.rx_data_ready(1'b1),
	.rx_pin(uart_rx)
    );
	
endmodule

