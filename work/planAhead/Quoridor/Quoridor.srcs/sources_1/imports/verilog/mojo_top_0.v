/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input [4:0] io_button,
    input [7:0] io_dip,
    output reg [7:0] io_led,
    output reg [3:0] wall0row,
    output reg [4:0] gp10row,
    output reg [4:0] bp20row,
    output reg [4:0] p1col,
    output reg [3:0] wall1col
  );
  
  
  
  reg [35:0] a;
  
  reg [2:0] b;
  
  reg rst;
  
  reg fn;
  
  reg pos_rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_sclk_value;
  counter_2 sclk (
    .clk(clk),
    .rst(rst),
    .value(M_sclk_value)
  );
  wire [6-1:0] M_buttonHandler_out;
  wire [1-1:0] M_buttonHandler_debug;
  reg [1-1:0] M_buttonHandler_enter;
  reg [1-1:0] M_buttonHandler_btntop;
  reg [1-1:0] M_buttonHandler_btndown;
  reg [1-1:0] M_buttonHandler_btnleft;
  reg [1-1:0] M_buttonHandler_btnright;
  reg [1-1:0] M_buttonHandler_button_rst;
  buttonHandler_3 buttonHandler (
    .clk(clk),
    .rst(rst),
    .enter(M_buttonHandler_enter),
    .btntop(M_buttonHandler_btntop),
    .btndown(M_buttonHandler_btndown),
    .btnleft(M_buttonHandler_btnleft),
    .btnright(M_buttonHandler_btnright),
    .button_rst(M_buttonHandler_button_rst),
    .out(M_buttonHandler_out),
    .debug(M_buttonHandler_debug)
  );
  wire [2-1:0] M_counter1_out;
  counter1_4 counter1 (
    .clk(clk),
    .rst(rst),
    .out(M_counter1_out)
  );
  wire [5-1:0] M_wallcounter_out;
  wallcounter_5 wallcounter (
    .clk(clk),
    .rst(rst),
    .out(M_wallcounter_out)
  );
  wire [5-1:0] M_row_out;
  reg [5-1:0] M_row_pos;
  row_6 row (
    .clk(clk),
    .rst(rst),
    .pos(M_row_pos),
    .out(M_row_out)
  );
  wire [5-1:0] M_column_out;
  reg [5-1:0] M_column_pos;
  column_7 column (
    .clk(clk),
    .rst(rst),
    .pos(M_column_pos),
    .out(M_column_out)
  );
  
  wire [36-1:0] M_pos_out;
  wire [1-1:0] M_pos_debug;
  reg [1-1:0] M_pos_en;
  reg [36-1:0] M_pos_data;
  pos_8 pos (
    .clk(M_sclk_value),
    .rst(pos_rst),
    .en(M_pos_en),
    .data(M_pos_data),
    .out(M_pos_out),
    .debug(M_pos_debug)
  );
  localparam S0_main = 2'd0;
  localparam S1_main = 2'd1;
  localparam S2_main = 2'd2;
  localparam S3_main = 2'd3;
  
  reg [1:0] M_main_d, M_main_q = S0_main;
  wire [36-1:0] M_alu_result;
  reg [36-1:0] M_alu_a;
  reg [5-1:0] M_alu_alufn;
  reg [3-1:0] M_alu_b;
  alutest_9 alu (
    .clk(M_sclk_value),
    .rst(rst),
    .a(M_alu_a),
    .alufn(M_alu_alufn),
    .b(M_alu_b),
    .result(M_alu_result)
  );
  wire [1-1:0] M_cntr_value;
  counter_10 cntr (
    .clk(M_sclk_value),
    .rst(rst),
    .value(M_cntr_value)
  );
  
  always @* begin
    M_main_d = M_main_q;
    
    b = 3'h0;
    fn = 5'h00;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    io_led = 8'h00;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    wall0row = 4'hf;
    gp10row = 5'h1f;
    bp20row = 5'h1f;
    p1col = 5'h00;
    wall1col = 5'h00;
    M_pos_data = 1'h0;
    M_pos_en = 1'h0;
    M_buttonHandler_btntop = io_button[0+0-:1];
    M_buttonHandler_btndown = io_button[2+0-:1];
    M_buttonHandler_btnleft = io_button[3+0-:1];
    M_buttonHandler_btnright = io_button[4+0-:1];
    M_buttonHandler_enter = io_button[1+0-:1];
    fn = 6'h20;
    b = 3'h1;
    a = M_pos_out;
    M_alu_alufn = fn;
    M_alu_a = a;
    M_alu_b = b;
    led = a[30+4-:5];
    io_led[7+0-:1] = M_cntr_value;
    io_led[6+0-:1] = M_pos_debug;
    M_buttonHandler_button_rst = io_dip[3+0-:1];
    
    case (M_main_q)
      S0_main: begin
        if (M_buttonHandler_out[5+0-:1] == 1'h1) begin
          M_main_d = S1_main;
        end
        M_buttonHandler_button_rst = 1'h0;
      end
      S1_main: begin
        M_pos_en = 1'h1;
        M_pos_data = M_alu_result;
        M_main_d = S2_main;
      end
      S2_main: begin
        M_pos_en = 1'h0;
        M_buttonHandler_button_rst = 1'h1;
        M_main_d = S3_main;
      end
      S3_main: begin
        M_buttonHandler_button_rst = 1'h0;
        M_main_d = S0_main;
      end
    endcase
    pos_rst = io_dip[7+0-:1];
    M_row_pos = 1'h0;
    M_column_pos = 1'h0;
    M_row_pos = a[30+4-:5];
    gp10row[(M_row_out)*1+0-:1] = 1'h0;
    M_column_pos = a[30+4-:5];
    p1col[(M_column_out)*1+0-:1] = 1'h1;
    io_led[(M_column_out)*1+0-:1] = 1'h1;
  end
  
  always @(posedge M_sclk_value) begin
    M_main_q <= M_main_d;
  end
  
endmodule
