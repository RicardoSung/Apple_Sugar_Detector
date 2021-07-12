`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:01:14 06/26/2021
// Design Name:   CCD_MASTER
// Module Name:   E:/FPGA_Xilinx/ISE/CCD/sim.v
// Project Name:  CCD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CCD_MASTER
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sim;

	// Inputs
	reg clk_50m;
	reg rst;

	// Outputs
	wire CCD_ICG;

	// Instantiate the Unit Under Test (UUT)
	CCD_ICG uut (
		.Master_clk(clk_50m), 
		.rst(rst), 
		.CCD_ICG(CCD_ICG)
	);

	initial begin
		// Initialize Inputs
		clk_50m = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		rst = 1;
		forever #5 clk_50m = ~clk_50m;
	end
      
endmodule

