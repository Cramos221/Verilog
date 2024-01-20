

//include file----------------
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "seq_top.sv"
`include "seq_if.sv"
  


module seq_test;

  bit clk;
  bit clr;
  bit in;
  bit out;

  
  //Instantiation--------------------------------------------------------
  seq_if vif();
  
  seq DUT(.clk(vif.clk),.clr(vif.reset),.in(vif.in),.out(vif.out));
 //Interface Setting----------------------------------------------
  initial
    begin
      uvm_config_db#(virtual seq_if):: set(null,"*","seq_if",vif);
      run_test("seq_top");
    end
  
  
endmodule