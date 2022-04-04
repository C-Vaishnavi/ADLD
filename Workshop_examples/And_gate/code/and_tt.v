module and_tt;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire c;

	// Instantiate the Unit Under Test (UUT)
	and_gate uut (
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		$monitor("a =%b b=%b c=%b",a,b,c);
a=0;
b=0;
#10;
a=0;
b=1;
#10;
a=1;
b=0;
#10;
a=1;
b=1;
#10;

	end
      
endmodule

