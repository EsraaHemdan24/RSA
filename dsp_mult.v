`timescale 1ns / 1ps

module dsp_mult(
    input [5:0] in1,
    input [5:0] in2,
    output [11:0] mult_res
    );
	assign mult_res = in1 * in2;
endmodule
