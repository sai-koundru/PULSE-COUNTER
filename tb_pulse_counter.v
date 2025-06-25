`timescale 1ns / 1ps

module tb_pulse_counter;


  reg clk;
  reg start;
  reg rst;


  wire op_sig;


  tb_pulse_counter uut ( .clk(clk), .start(start), .rst(rst), .op_sig(op_sig) );

  always #5 clk = ~clk;

  initial 
  	begin

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
