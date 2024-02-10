// Code your design here
module geradorfrequencia #(int WIDTH=8)(data,clk,rst,out,enable);
  
 input logic clk,rst,enable;
 input logic [WIDTH-1:0] data;
 output logic out;
 
  logic [WIDTH:0]acumulador;
  
  always_ff @(posedge clk) begin
    if(!rst)begin 
    acumulador <= 0;
    end
     else begin  
       if (enable) 
    acumulador = acumulador + data + 1;
    end
  
  end  
  
  assign out = acumulador[WIDTH];
  
  
  
endmodule
