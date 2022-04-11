`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:34 03/23/2022
// Design Name:   lfsr16
// Module Name:   /home/ise/prog/course_project/lfsr16_tb.v
// Project Name:  course_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lfsr16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lfsr16_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] q;

	// Instantiate the Unit Under Test (UUT)
	lfsr16 uut (
		.clk(clk), 
		.reset(reset), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#20;
		
		reset =0;
		#20;

	
        
		// Add stimulus here

	end
	always #10 clk = ~ clk;
      
endmodule

