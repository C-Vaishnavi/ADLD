module full_adder_tt;
reg a,b,cin;
wire sum, cout;

full_adder DUT (.sum(sum) ,.cout(cout) , .a(a) ,.b(b) ,.cin(cin));
initial
begin

$monitor($time ,"a =%b b=%b cin =%b sum =%b carry =%b", a,b,cin, sum ,cout);
a=0; b=0; cin=0 ;
#10;
a=0; b=1; cin=0 ;
#10;
a=1; b=0; cin=0 ;
#10;
a=0; b=1; cin=0 ;
#10;

end
endmodule




