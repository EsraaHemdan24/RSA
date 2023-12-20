`timescale 1ns / 1ps

module counter_ctrl(
    input clk,
    input rst,
    input start,
	 input [5:0] key,
    output reg done
    );
	reg [5:0] count_val;
	reg counting; // Indicates operation is on-going
	
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			count_val <= 0;
			done <= 0;
			counting <= 0;
		end
		else begin
			// Parallel logic
			if(start && !counting) begin
				counting <= 1;
				done <= 0;
				count_val <= 1;
			end
			
			if(counting) begin
				count_val <= count_val + 6'd1;
			end
			
			if(count_val == key) begin
				done <= 1;
				counting <= 0;
			end
		end
	end

endmodule
