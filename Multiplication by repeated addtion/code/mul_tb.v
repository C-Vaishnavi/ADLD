`timescale 1ns / 1ps

module mul_tb;
reg [15:0] data_in;
reg clk,start;
wire done;

mul1 DP (eqz,ldA,ldB,ldP,clrP,decB,data_in,clk);
mul_control CON (ldA,ldB,ldP,clrP,decB,done,clk,eqz,start);

initial begin
clk =1'b0;
#3 start =1'b1;

end

always #5 clk=~clk;

initial begin
#17 data_in =10;
#10 data_in =6;
end

initial begin
$monitor ($time, "%d %b",DP.Y,done);
$dumpfile("mul.vcd"); $dumpvars(0,mul_tb);
end
endmodule
