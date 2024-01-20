class our_packet extends uvm_sequence_item;
    `uvm_object_utils(our_packet)
  
  
    //request
  rand logic [7:0] input_1;
  rand logic [7:0] input_2;
  rand logic [7:0] input_3;
  rand logic [7:0] input_4;
  rand logic [7:0] input_5;
  rand logic [7:0] input_6;
  rand logic [7:0] input_7;
  rand logic [7:0] input_8;
    //respost
  logic [7:0] out1;
  logic [7:0] out2;
  logic [7:0] out3;
  logic [7:0] out4;
  logic [7:0] out5;
  logic [7:0] out6;
  logic [7:0] out7;
  logic [7:0] out8;
  
  //Default Constraints--------------------------------------------------------
  constraint input1_c {input_1 inside {[0:100]};}
  constraint input2_c {input_2 inside {[0:100]};}
  constraint input3_c {input_3 inside {[10:200]};}
  constraint input4_c {input_4 inside {[10:100]};}
  constraint input5_c {input_5 inside {[1:200]};}
  constraint input6_c {input_6 inside {[1:100]};}
  constraint input7_c {input_7 inside {[1:200]};}
  constraint input8_c {input_8 inside {[1:100]};}



   //Constructor--------------------------------------------------------
  function new (string name = "our_packet");
    super.new(name);
    endfunction: new
  
  
  
  endclass: our_packet 