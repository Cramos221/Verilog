// Code your testbench here
// or browse Examples
module identificador_tb();
  
  logic A, clk, clr, out;
  
  
  seq inst1(A, clk, clr, out);
  
  initial begin
    $display("Vamos identificar a sequência 0011 ");
    $monitor("time=%0d,entrada=%b, clk=%b, saida=%b,",$time,A, clk, out);
    $dumpfile("dump.vcd");
    $dumpvars(1, identificador_tb);
  end
  
  /*//clock generator
  initial begin clk = 1'b0; repeat(20) #5 clk= ~clk;end
  */
    
  
    initial begin
    clk = 0;
    clr = 1;
    A = 0;
  
    #5
    clk = 1;
    A = 0;
    #5
    clk = 0;
    A = 0;
    #5
   clk = 1;
    A=0;
    #5
   clk = 0;
    A=0;
    #5
   clk = 1;
    A=0;
     #5
   clk = 0;
    A=1;
     #5
   clk = 1;
    A=1;
     #5
   clk = 0;
    A=1;
     #5
   clk = 1;
    A=1;
    
    
 
  end
  
endmodule
