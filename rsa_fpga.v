`timescale 1ns / 1ps

module rsa_fpga(
	 input CLK_IN1_P,
	 input CLK_IN1_N,
	 input rst,
    input start,
    output done,
    input [5:0] key,
    input [5:0] data,
    input [5:0] n,
    output [5:0] result
    );

	clk_wiz clk_fpga
   (// Clock in ports
    .CLK_IN1_P(CLK_IN1_P),    // IN
    .CLK_IN1_N(CLK_IN1_N),    // IN
    // Clock out ports
    .CLK_OUT1(clk),     // OUT
    // Status and control signals
    .RESET(rst));       // IN
	 
	rsa_top rsa_mod (
    .clk(clk), 
    .rst(rst), 
    .start(start), 
    .done(done), 
    .key(key), 
    .data(data), 
    .n(n), 
    .result(result)
    );


endmodule
