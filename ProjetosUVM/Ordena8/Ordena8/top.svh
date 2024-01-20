`timescale 1ns/1ns
`include "uvm_macros.svh"

     import uvm_pkg::*;
     import test_pkg::*;

module top ();
 
  
  logic clock;
 //Instantiation--------------------------------------------------------
  our_interface intf(.clock(clock));
  ordena8 dut(.a1(intf.input_1),.b1(intf.input_2),.c1(intf.input_3),.d1(intf.input_4),.e1(intf.input_5),.f1(intf.input_6),.g1(intf.input_7),.h1(intf.input_8),
  .num1(intf.out1), .num2(intf.out2), .num3(intf.out3),.num4(intf.out4),.num5(intf.out5),.num6(intf.out6),.num7(intf.out7), .num8(intf.out8));
  
//Interface Setting----------------------------------------------
  initial begin 
    uvm_config_db #(virtual our_interface)::set(null, "*", "intf", intf );

  end



//Start The Test-----------------------------------------------------                                 
  
  initial begin 
    run_test("our_test");
  end
 //Clock Generation--------------------------------------------------------  
  initial begin
    clock = 0;
    #5;
    forever begin
      clock = ~clock;
      #2;
    end
  end
  //Maximum Simulation Time--------------------------------------------------------
  initial begin
    #5000;
    $display("Sorry! Ran out of clock cycles!");
    $finish();
  end
 //Generate Waveforms--------------------------------------------------------
  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end
endmodule: top

