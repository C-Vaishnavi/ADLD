
`timescale 1ns / 1ps

module mul1(
eqz,ldA,ldB,ldP,clrP ,decB ,data_in, clk);
input ldA,ldB,ldP,clrP ,decB , clk;
input [15:0] data_in;
output eqz;
wire [15:0] X, Y,Z,Bout,Bus;


PIPO1 A(X,data_in,ldA,clk);
PIPO2 P(Y,Z,ldP,clrP,clk);
CNTR B(Bout,data_in,ldB,decB,clk);
ADD AD(Z,X,Y);
EQZ COMP(eqz,Bout);
endmodule


module PIPO1(dout,din,ld,clk);
input [15:0]din;
input ld,clk;
output reg [15:0]dout;

always @(posedge clk)
if(ld) dout <=din;
endmodule

module PIPO2(dout,din,ld,clr,clk);
input [15:0]din;
input ld,clr,clk;
output reg [15:0]dout;

always@(posedge clk)
if(clr) dout <=16'b0;
else if(ld) dout<= din;
endmodule


module EQZ(eqz ,data);
input [15:0] data;
output eqz;
assign eqz = (data==0);
endmodule


module ADD(dout,da,db);
input [15:0] da,db;
output reg [15:0]dout;

always @(*)
dout =da + db ;
endmodule


module CNTR(dout, din ,ld ,dec ,clk);
input ld ,dec ,clk;
input [15:0]din;
output reg [15:0]dout;
always @ (posedge clk)
begin
if(ld) dout<=din;

else if(dec) dout<=dout-1;

end

endmodule




module mul_control (ldA,ldB, ldP, clrP, decB,done, clk, eqz,start);
input clk,eqz, start;
output reg ldA,ldB, ldP, clrP, decB,done;

reg [2:0] state;
parameter s0 =3'b000 ,s1=3'b001, s2=3'b010 ,s3=3'b011 ,s4=3'b100;

always @(posedge clk)
begin
case(state)
 s0 : if(start) state<=s1;
  s1: state<=s2;
  s2: state <=s3;
  s3: #2 if(eqz) state<=s4; 
  s4: state <=s4;
  default : state <=s0;
endcase
end

always @(state)
begin
 case (state)
 s0:begin #1 ldA =0; ldB =0;ldP =0;clrP= 0;decB =0; done =0; end
 s1:begin #1 ldA =1; done =0; end
 s2:begin #1 ldA =0; ldB =1;clrP= 1; end
 s3:begin #1 ldA =0; ldB =0;ldP =1;clrP= 0;decB =1; done =0; end
 s4:begin  #1 done =1;ldA =0; ldB =0;ldP =0;clrP= 0;decB =0;  end
 default :begin #1 ldA =0; ldB =0;ldP =0;clrP= 0;decB =0; done =0; end
  endcase
end
endmodule







