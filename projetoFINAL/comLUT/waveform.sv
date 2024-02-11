`include "geradorfrequencia.sv"
`include "lut_sin.sv"
module waveform #(int WIDTH = 16, int WAVE_WIDTH = 16, int CNT_WIDTH =16 )(wave_outsen, clk,rst_in, freq_in, enable);
  
  input logic clk;
  input logic rst_in;
  input logic [WIDTH-1:0] freq_in;
  input logic enable;
   
  
  output logic [WAVE_WIDTH-1:0]wave_outsen;
  
    localparam int OUT_WIDTH = 16;
    localparam int LUT_SIZE = 32;
    localparam int SEL_WIDTH = $clog2(LUT_SIZE);
  
  	
  // Frequency generator
  
  gerador_de_frequencias_arbitrarias #(.WIDTH(WIDTH)) clk_gen(.data(freq_in),.clk(clk),.rst(rst_in),.out(clk_o),.enable(enable));
  
  // The counter 
  
  logic [CNT_WIDTH-1:0]counter;
  
  always @(clk_o)begin
    if(~rst_in)begin
      counter <= 0;
    end else begin 
      counter <= counter + 1;
    end
  end
  
  //Cordic
  
  sine_lut #(.OUT_WIDTH(OUT_WIDTH),.LUT_SIZE(LUT_SIZE),.SEL_WIDTH(SEL_WIDTH)
            )dutseno(.sine_out(wave_outsen), .clk(clk), .rst(rst_in),.index(counter));
  
  
  
  
  endmodule