module jkff_tt;
reg clk=0;
reg j=0;
reg k=0;
reg reset=1;
wire q,qnot;
 jkff dut(reset,clk,j,k,q,qnot);
initial 
  begin
     reset = 1;
		clk = 0;
        #10 ; reset =0;
		$monitor($time,"J=%b K=%b Q=%b Qnot=%b",j,k,q,qnot);
 j<=1'b0;
  k<=1'b0;
  #20;
  
 j<=1'b0;
  k<=1'b1;
  #20;
  
  j<=1'b1;
  k<=1'b0;
  #20;
  
  j<=1'b1;
  k<=1'b1;
  #20;
  
  
end
always #1 clk=~clk;
endmodule
