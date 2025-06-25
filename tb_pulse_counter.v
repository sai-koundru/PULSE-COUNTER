`timescale 1ns / 1ps

module xyz_tb;

  // Inputs
  reg clk;
  reg start;
  reg rst;

  // Output
  wire op_sig;

  // Instantiate the Unit Under Test (UUT)
  xyz uut (
    .clk(clk),
    .start(start),
    .rst(rst),
    .op_sig(op_sig)
  );

  // Generate a 10ns clock (i.e., 100MHz)
  always #5 clk = ~clk;

  initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    start = 0;

    // Wait some time with reset ON
    #20;

    // Release reset
    rst = 0;

    // Wait a bit before starting
    #10;

    // Pulse start signal for 5 clocks
    start = 1;
    #50;

    // Stop start for a few clocks
    start = 0;
    #30;

    // Start again for remaining 5 clocks
    start = 1;
    #50;

    // Then stop everything
    start = 0;
    #20;

    // Final reset
    rst = 1;
    #10;
    rst = 0;

    // End simulation
    #20;
    $finish;
  end

endmodule













module pulse_counter(
	    input clk,
	    input start,
	    input rst,
	    output reg op_sig
	);

reg [3:0] count;

always @(posedge clk or posedge rst)
begin
if (rst)
	begin
	    count <= 0;
        op_sig <= 0;
    end
else if (start)
	begin
	if (count != 9) 
	    begin
		count <= count + 1;
op_sig <= 0;   
end
    else
	    begin
	    count <= 0;
op_sig <= 1;  
end
end
else 
	begin 
	op_sig <= 0;   
  end 
end
endmodule