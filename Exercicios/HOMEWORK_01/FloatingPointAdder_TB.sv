module FloatingPointAdder_TB;
  // Importa o pacote
  import FloatingPointPackage::*;

  // Parâmetros do módulo
  parameter MANTISSA_SIZE = 23;
  parameter EXPONENT_SIZE = 8;

  // Sinais de entrada e saída
  reg [31:0] input_a;
  reg [31:0] input_b;
  wire [31:0] result;

  // Instanciar o módulo
  FloatingPointAdder #(MANTISSA_SIZE, EXPONENT_SIZE) UUT (
    .input_a(input_a),
    .input_b(input_b),
    .result(result)
  );

  // Teste de exemplo
  initial begin
    // Inicializações
    input_a = 32'h40490fdb; //  (3.14159)
    input_b = 32'h3f9d70a4; //  (1.23456)

    // Aguarde a simulação avançar para que o resultado esteja disponível
   
    #100;

    // Exiba os valores de entrada
    $display("Entrada A (IEEE 754 Single Precision): %h", input_a);
    $display("Entrada B (IEEE 754 Single Precision): %h", input_b);

    // Exiba o resultado
    $display("Resultado (IEEE 754 Single Precision): %h", result);

    // Finaliza a simulação
    $finish;
  end
endmodule
