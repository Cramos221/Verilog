// Code your design here
module gerador_de_frequencias_arbitrarias #(
    parameter WIDTH = 8
)(
    input logic clk, // Sinal de clock
    input logic rst, // Sinal de reset
    input logic enable, // Sinal de habilitação
    input logic [WIDTH-1:0] data, // Dados de entrada que determinam a frequência
    output logic out // Sinal de saída
);
  
   
  
    logic [WIDTH:0] contador; // Contador para acumular a frequência

    always_ff @(posedge clk ) begin
      if (~rst)begin
        	contador <= 0;
      end
            else if (enable) begin
                contador <= contador + data + 1;
        end
    end

    assign out = contador[WIDTH];

endmodule
