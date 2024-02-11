module sine_lut #(int OUT_WIDTH = 16,int LUT_SIZE = 32,int SEL_WIDTH = $clog2(LUT_SIZE)
)(sine_out, clk, rst,index);
  
    
    input  logic                        clk;
    input  logic                        rst;
    input  logic        [SEL_WIDTH-1:0] index;
    output logic signed [OUT_WIDTH-1:0] sine_out;

  
  
	always_ff @(posedge clk) begin
      if (~rst) begin
   	     sine_out <= 0;
  	  end else begin
    	    case (index)
            0: sine_out <= 16'sd0;
            1: sine_out <= 16'sd6393;
            2: sine_out <= 16'sd12539;
            3: sine_out <= 16'sd18204;
            4: sine_out <= 16'sd23170;
            5: sine_out <= 16'sd27245;
            6: sine_out <= 16'sd30273;
            7: sine_out <= 16'sd32137;
            8: sine_out <= 16'sd32767;
            9: sine_out <= 16'sd32137;
            10: sine_out <= 16'sd30273;
            11: sine_out <= 16'sd27245;
            12: sine_out <= 16'sd23170;
            13: sine_out <= 16'sd18204;
            14: sine_out <= 16'sd12539;
            15: sine_out <= 16'sd6393;
            16: sine_out <= 16'sd0;
            17: sine_out <= -16'sd6393;
            18: sine_out <= -16'sd12539;
            19: sine_out <= -16'sd18204;
            20: sine_out <= -16'sd23170;
            21: sine_out <= -16'sd27245;
            22: sine_out <= -16'sd30273;
            23: sine_out <= -16'sd32137;
            24: sine_out <= -16'sd32767;
            25: sine_out <= -16'sd32137;
            26: sine_out <= -16'sd30273;
            27: sine_out <= -16'sd27245;
            28: sine_out <= -16'sd23170;
            29: sine_out <= -16'sd18204;
            30: sine_out <= -16'sd12539;
            31: sine_out <= -16'sd6393;
            default: sine_out <= 0;
        endcase
    end
    end
  

endmodule
