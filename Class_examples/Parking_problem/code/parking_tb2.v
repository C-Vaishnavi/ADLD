`timescale 1ns / 1ps

module parking_tb2;

	// Inputs
	reg clk;
	reg reset_n;
	reg sensor_entrance;
	reg sensor_exit;
	reg [1:0] password_1;
	reg [1:0] password_2;

	// Outputs
	wire GREEN_LED;
	wire RED_LED;

	// Instantiate the Unit Under Test (UUT)
	parking_1 uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.sensor_entrance(sensor_entrance), 
		.sensor_exit(sensor_exit), 
		.password_1(password_1), 
		.password_2(password_2), 
		.GREEN_LED(GREEN_LED), 
		.RED_LED(RED_LED)
	);

	    initial begin
		 clk = 0;
		 forever #10 clk = ~clk;
		 end
		 
		initial begin
		reset_n = 0;
		sensor_entrance = 0;
		sensor_exit = 1;
		password_1 = 0;
		password_2 = 0;
		#20;
		
		reset_n = 0;
		sensor_entrance = 1;
		sensor_exit = 1;
		password_1 = 0;
		password_2 = 0;
		#20;
		
		
		reset_n = 1;
		sensor_entrance = 1;
		sensor_exit = 0;
		password_1 = 0;
		password_2 = 0;
		#20;
		
		sensor_entrance = 1;
		sensor_exit = 0;
		password_1 = 1;
		password_2 = 2;
		#20;
		
		sensor_entrance = 1;
		sensor_exit = 0;
		password_1 = 2;
		password_2 = 1;
		#20;
		
		sensor_entrance = 0;
		sensor_exit = 1;
		password_1 = 1;
		password_2 = 2;
		#20;
		
		sensor_entrance = 0;
		sensor_exit = 1;
		password_1 = 2;
		password_2 = 2;
		#20;
		
		sensor_entrance = 1;
		sensor_exit = 1;
		password_1 = 1;
		password_2 = 2;
		#20;
		
		sensor_entrance = 1;
		sensor_exit = 1;
		password_1 = 2;
		password_2 = 2;
		#20;

	end
      
endmodule
