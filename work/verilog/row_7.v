/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module row_7 (
    input [4:0] pos,
    input clk,
    input rst,
    output reg [4:0] out
  );
  
  
  
  always @* begin
    out = pos / 3'h5;
  end
endmodule
