`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:03 07/28/2023 
// Design Name: 
// Module Name:    dsp_mult 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
(*use_dsp48 = "yes"*)
module dsp_mult(
    input [5:0] in1,
    input [5:0] in2,
    output [11:0] mult_res
    );
	assign mult_res = in1 * in2;
endmodule
