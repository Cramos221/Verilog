
module waveform_tb;

    // Specifying time units for the simulation
    timeunit 1ns;
    timeprecision 1ps;

    // Import packages
   

    // DUT parameters
    localparam int WIDTH = 16;
    localparam int WAVE_WIDTH = 16;
    localparam int CNT_WIDTH = 16;
  

    // DUT signals
  bit  clk;
  logic rst_in;
  logic [WIDTH-1:0] freq_sel;
  logic enable;
  logic [WAVE_WIDTH-1:0]wave_outsen;
  logic [WAVE_WIDTH-1:0]wave_outcos;
 
 
    // The DUT
  waveform #(.WIDTH(WIDTH),.WAVE_WIDTH(WAVE_WIDTH),.CNT_WIDTH(CNT_WIDTH))
     dut (.wave_outsen(wave_outsen),.wave_outcos(wave_outcos), .clk(clk),.rst_in(rst_in), .freq_in(freq_sel), .enable(enable));
  
//----------------------------
   // Gerar clock
    always #5 clk = ~clk;
  
    initial begin
        clk = 0;
        rst_in = 1;
        enable = 1;
      freq_sel = $urandom();
    #5    
         rst_in = 0;
      freq_sel = $urandom();
    #5
      	rst_in = 1;
        freq_sel = $urandom();
     #5 
      freq_sel = $urandom();
      #5
      freq_sel = $urandom();
      #5
      freq_sel = $urandom();
      
    end

  
  initial begin
    $display("--------inicio------------*- ");
    $monitor("Time =%3d, clk=%b , freq_in=%d, rst =%b, enable=%b, sen=%b", $time , clk, freq_sel, rst_in, enable,wave_outsen,);
    $dumpfile("dump.vcd");
    $dumpvars(1, waveform_tb);
  end 
  
  //----------
  initial begin 
 
  
  
  end
        
    
  

    
endmodule