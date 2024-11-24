`timescale 1ns / 1ps

module clock_divider_TB();
  reg clk_fast, reset;
  wire clk_slow;
  
  always #5 clk_fast = ~clk_fast; //10 ns -time period
 
  clock_divider dut(
    .clk_in(clk_fast),
    .clk_out(clk_slow),
    .reset(reset),
    .ratio(32'd2) // choose every ratio you want
  ); 

  initial begin
    clk_fast=0; reset=0; #10;
    reset=1; 
    #200;
    $stop;
  end
endmodule
