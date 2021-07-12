`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:01:39 06/27/2021
// Design Name:   HT_Serial
// Module Name:   E:/FPGA_Xilinx/ISE/CCD/HT_Serial_Interface.v
// Project Name:  CCD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HT_Serial
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HT_Serial_Interface;

	// Inputs
	reg clk_50m;
	reg start;
	reg [15:0] Data_Send;

	// Outputs
	wire HT_SCLK;
	wire HT_SLOAD;
	wire HT_SDATA;
	wire complete;
	`define Data 16'b1111_0111_0011_0001

	// Instantiate the Unit Under Test (UUT)

	HT_Serial_Com#(
	.CLK_FRE(50),      //clock frequency(Mhz)
	.BAUD_RATE(115200) //serial baud rate
	)uut(
		.clk_50m(clk_50m), 
		.start(start), 
		.DATA(`Data), 
		.SCLK_pin(HT_SCLK), 
		.SLOAD_pin(HT_SLOAD), 
		.SDATA_pin(HT_SDATA),
		.REC_DATA(),
		.complete_signal(complete)
	);

	initial begin
		// Initialize Inputs
		clk_50m = 0;
		start = 0;
		Data_Send = 16'b1111_0111_0011_0001;

		// Wait 100 ns for global reset to finish
		#10;
        start = 1;
		// Add stimulus here
		forever #5 clk_50m = ~clk_50m;

	end
      
endmodule

