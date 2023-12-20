`timescale 1ns / 1ps

module rsa_top(
    input clk,
    input rst,
    input start,
    output done,
    input [5:0] key,
    input [5:0] data,
    input [5:0] n,
    output reg [5:0] result
    );

	counter_ctrl cntr_ctrl_inst (
    .clk(clk), 
    .rst(rst), 
    .start(start), 
    .key(key), 
    .done(done)
    );

	wire [5:0] mult_in1;
	wire [5:0] mult_in2;
	wire [11:0] mult_res;
	dsp_mult mult_inst (
    .in1(mult_in1), 
    .in2(mult_in2), 
    .mult_res(mult_res)
    );

	wire [5:0] mod_res;
	mod_bram mod_inst (
    .clk(clk), 
    .data(mult_res), 
    .n(n), 
    .mod_res(mod_res)
    );
	 
	assign mult_in1 = data; 
	assign mult_in2 = (!done) ? mod_res : 6'd1;
	
	// result register
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			result <= 0;
		end
		else begin
			if(!done) begin
				result <= mod_res;
			end
		end
	end

endmodule
