`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:19:33 03/24/2022
// Design Name:   vending_machine
// Module Name:   /home/ise/prog/game/vending_tb.v
// Project Name:  game
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vending_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vending_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] in;

	// Outputs
	wire out;
	wire [1:0] change;

	// Instantiate the Unit Under Test (UUT)
	vending_machine uut (
		.clk(clk), 
		.rst(rst), 
		.in(in), 
		.out(out), 
		.change(change)
	);

	initial begin
		
	$dumpfile("vending_machine.vcd");
	$dumpvars(0,vending_tb);
	rst = 1;
	clk = 0;
	#6 rst = 0;
	in = 2;
	#19 in = 2;
	#25 ;
	end
	always #5 clk = ~clk;
			
	endmodule

