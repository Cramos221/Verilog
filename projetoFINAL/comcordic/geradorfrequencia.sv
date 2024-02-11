module gerador_de_frequencias_arbitrarias #(
    parameter WIDTH = 8
)(
    input logic clk, // Sinal de clock
    input logic rst, // Sinal de reset
    input logic enable, // Sinal de habilita��o
    input logic [WIDTH-1:0] data, // Dados de entrada que determinam a frequ�ncia
    output logic out // Sinal de sa�da
);

    logic [WIDTH:0] contador; // Contador para acumular a frequ�ncia

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