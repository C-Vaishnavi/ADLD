`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:13:49 03/19/2022
// Design Name:   pipe1_ex
// Module Name:   /home/ise/prog/adld_work/pipe1_ex_tb.v
// Project Name:  adld_work
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe1_ex
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe1_ex_tb;

	// Inputs
	reg [0:9] A;
	reg [0:9] B;
	reg [0:9] C;
	reg [0:9] D;
	reg clk;

	// Outputs
	wire [0:9] F;

	// Instantiate the Unit Under Test (UUT)
	pipe1_ex uut (
		.F(F), 
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.clk(clk)
	);
	
	always
 begin
 #10 clk = ~ clk;
 end
 
	initial begin
		
		
		clk = 0;

#5 A = 10;	B = 12;  C = 6;  D = 3;
#20 A = 10;	B = 10;  C = 5;  D = 4;
#20 A = 20;	B = 11;  C = 1;  D = 5;
//#20 A = 25;	B = 30;  C = 25;  D = 5;
//#20 A = 35;	B = 40;  C = 15;  D = 10;
//#20 A = 10;	B = 15;  C = 20;  D = 15;
	end
	
	 initial
        begin
		  $dumpfile("pipe.vcd");
		  $dumpvars(0 , pipe1_ex_tb);
		  
            $monitor( " time = %d, F =%d ", $time ,F );
            
        end 
      
endmodule

