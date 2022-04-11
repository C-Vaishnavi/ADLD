`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:44 03/23/2022 
// Design Name: 
// Module Name:    lfsr16 
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

 module xor11(y,a,b);
 output y; 
 input a,b; 
 assign y=a^b;
 endmodule 
 
 module dff(clk,reset,d,q
    );
	
	  input clk;   
	  input reset;  
	  input d;  
	  output q;
	  reg q;   
	  always @(posedge clk)
	  begin    
	  if(reset)   
	  q=1;  
	  else    
	  q=d;   
	  end  

endmodule
module lfsr16(
 clk,reset,q); 
 input clk,reset;
 output [15:0]q;
 wire [15:0] q; 
 wire a,b,c; 
 
xor11 x1(a,q[13],q[15]);
xor11 x2(b,q[12],a);
xor11 x3(c,q[10],b);



dff d1(clk,reset,c,q[0]);
dff d2(clk,reset,q[0],q[1]);
dff d3(clk,reset,q[1],q[2]);
dff d4(clk,reset,q[2],q[3]);
dff d5(clk,reset,q[3],q[4]);
dff d6(clk,reset,q[4],q[5]);
dff d7(clk,reset,q[5],q[6]);
dff d8(clk,reset,q[6],q[7]);
dff d9(clk,reset,q[7],q[8]);
dff d10(clk,reset,q[8],q[9]);
dff d11(clk,reset,q[9],q[10]);
dff d12(clk,reset,q[10],q[11]);
dff d13(clk,reset,q[11],q[12]);
dff d14(clk,reset,q[12],q[13]);
dff d15(clk,reset,q[13],q[14]);
dff d16(clk,reset,q[14],q[15]);


endmodule