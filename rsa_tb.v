`timescale 1ns / 1ps



module rsa_tb;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [5:0] key;
	reg [5:0] data;
	reg [5:0] n;

	// Outputs
	wire done;
	wire [5:0] result;

	// Instantiate the Unit Under Test (UUT)
	rsa_top uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.done(done), 
		.key(key), 
		.data(data), 
		.n(n), 
		.result(result)
	);
	
	parameter clk_prd = 100;
	always #(clk_prd/2) clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		start = 0;
		key = 0;
		data = 0;
		n = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
        
		// Add stimulus here
		#clk_prd;
		data = 43;
		key = 31;
		n = 23;
		start = 1;
		#clk_prd;
		wait(done == 1);
		start = 0;
		
		// to view waveform last values
		#clk_prd;
		#clk_prd;

		$finish();
	end
      
endmodule

