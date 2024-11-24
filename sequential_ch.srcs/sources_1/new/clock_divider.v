`timescale 1ns / 1ps

module clock_divider(
    input  clk_in,
    output reg clk_out,
    input  reset,
    input  [31:0] ratio
    );
  reg [31:0] counter;
  
  always @ (posedge clk_in, negedge reset) 
    if(reset==0)begin
      counter<=32'd0;
      clk_out<=0;
    end
    else
      if (counter==ratio-1) begin
        clk_out<=0;
        counter<=32'd0;
      end
      else 
        if(counter==(ratio/2)-1) begin
          clk_out<=1;
          counter<=counter+1;
        end 
        else
          counter<=counter+1;
endmodule
