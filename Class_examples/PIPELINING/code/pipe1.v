`timescale 1ns / 1ps

module pipe1_ex(
 F,A,B ,C,D,clk   );
parameter N=10;
input[0:N-1] A, B, C, D;
input clk;
output [0:N-1] F;
reg [0:N-1] L12_x1 , L12_x2, L12_D , L23_D ,L23_x3, L34_D;

assign F= L34_D;

always @(posedge clk)
begin
L12_x1 <= #4 A+B;
L12_x2 <= #4 C-D;
L12_D <= D;
end

always @(posedge clk)
begin
L23_x3 <= #4 L12_x1 + L12_x2;
L23_D<= L12_D;
end

always @(posedge clk)
begin
L34_D <= #4 ( L23_x3 * L23_D);

end
endmodule
