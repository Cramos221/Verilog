`include "geradorfrequencia.sv"
`include "cordic.v"
module waveform #(int WIDTH = 16, int WAVE_WIDTH = 16, int CNT_WIDTH =16 )(wave_outsen,wave_outcos, clk,rst_in, freq_in, enable);
  
  input logic clk;
  input logic rst_in;
  input logic [WIDTH-1:0] freq_in;
  input logic enable;
   
  
  output logic [WAVE_WIDTH-1:0]wave_outsen;
  output logic [WAVE_WIDTH-1:0]wave_outcos;
  
  logic clk_o;
  
  	
  // Frequency generator
  
  geradorfrequencia #(.WIDTH(WIDTH)) clk_gen(.data(freq_in),.clk(clk),.rst(rst_in),.out(clk_o),.enable(enable));
  
  // The counter 
  
  logic [CNT_WIDTH-1:0]counter;
  
  always @(clk_o)begin
    if(!rst_in)begin
      counter <= 0;
    end else begin 
      counter <= counter + 1;
    end
  end
  
  //Cordic
  
  CORDIC cordic(.clock(clk), .cosine(wave_outcos), .sine(wave_outsen), .x_start(counter), .y_start(16'b0), .angle(32'h20000000 )); 
  
  
  
  endmodule