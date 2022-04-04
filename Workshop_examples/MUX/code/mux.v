module mux(y,s,a,b);
input a,b,s;
output y;

assign y=(s)? b:a;
endmodule
