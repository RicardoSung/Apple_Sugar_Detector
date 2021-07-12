`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:01:58 06/26/2021
// Design Name:   CCD_MASTER
// Module Name:   E:/FPGA_Xilinx/ISE/CCD/CCD_clock.v
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

module CCD_clock;

	// Inputs
	reg clk_50m;
	reg rst;

	// Outputs
	wire CCD_Master;
	wire CCD_SH;
	wire CCD_ICG;
	reg [15:0] sh_pulse =15'b111;
	wire [15:0] SH_Pulse;
	assign SH_Pulse = sh_pulse;
	// parameter SH_Pulse = 2'b10;
	// Instantiate the Unit Under Test (UUT)

	CCD_Interface CCD(
    .clk_50m(clk_50m),
    .rst(rst),
    .SH_Pulse(SH_Pulse),
   	.Master(CCD_Master),
    .Icg(CCD_ICG),
    .Sh(CCD_SH)
    );

	initial begin
		// Initialize Inputs
		clk_50m = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#10;
        rst = 1;
		// Add stimulus here
		forever #5 clk_50m = ~clk_50m;
	end
      
endmodule

