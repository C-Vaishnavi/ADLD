module srff_tb();
reg s;
reg r;
reg clk;
wire q,qbar;
main uut(.s(s),.r(r),.clk(clk),.q(q),.qbar(qbar));
initial
begin
	s=0;
		r=0;
		clk=0;
		$monitor(" q = %b, qbar = %b, s= %b , r= %b ",q ,qbar , s ,r);
		#2 s=0;
		#2 r=1;
		#2 s=0;
		#2 r=0;
		#2 s=0;
		#2 r=1;
		#2 s=1;
		#2 r=0;
		#2 s=1;
		#2 r=1;
		end
		always #1 clk =~ clk;
endmodule

