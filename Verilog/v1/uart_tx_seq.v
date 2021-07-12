`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:57:43 06/28/2021
// Design Name:   UART_TX_Sequence
// Module Name:   E:/FPGA_Xilinx/ISE/CCD/uart_tx_seq.v
// Project Name:  CCD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_TX_Sequence
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_tx_seq;

	// Inputs
	reg clk_50m;
	reg start;
	reg [3699:0] spectrum_values;
	wire tx_pin;
	// Instantiate the Unit Under Test (UUT)
	wire [3699:0]spectrum_values_wire;

	assign spectrum_values_wire[31:0] = spectrum_values[31:0];
	initial begin
		// Initialize Inputs
		clk_50m = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#10 start = 1;
		spectrum_values[15:0]=16'b1110_1101_1011_0111;
		spectrum_values[31:16]=16'b1111_1110_1100_1000;
        
		forever #5 clk_50m = ~clk_50m;
		// Add stimulus here
	end
    UART_TX_Sequence uut (
		.clk_50m(clk_50m), 
		.start(start), 
		.spectrum_values(spectrum_values_wire),
		.tx_pin(tx_pin)
	);
endmodule

