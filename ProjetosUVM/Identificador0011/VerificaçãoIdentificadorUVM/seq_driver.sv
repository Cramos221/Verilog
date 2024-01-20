`ifndef SEQ_DRIVER
`define SEQ_DRIVER
//Include file----------------------------------------------------------------
`include "seq_sequencer.sv"


class seq_driver extends uvm_driver #(seq_item);
  `uvm_component_utils(seq_driver)
  
//Instances other classes------------------------------------------------  
  seq_item seq;
  virtual seq_if vintf;
  
//Constructor--------------------------------------------------------    
  function new(string name="seq_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction
  
//build phase--------------------------------------------------------    
  function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(virtual seq_if)::get(this,"","seq_if",vintf))
      `uvm_fatal("NO_VIF",{"virtual interface must be set for:",get_full_name(),".vintf"});
  endfunction
  
//Run Phase---------------------------------------------------  
  task run_phase(uvm_phase phase);
    forever 
      begin
        seq = seq_item::type_id::create("seq");
        seq_item_port.get_next_item(seq);
  		`uvm_info(get_full_name(),$psprintf("in=%0b,out=%0b",vintf.in,vintf.out),UVM_NONE)
       drive(seq);
        
        seq_item_port.item_done();
      end
  endtask
  
//Task drive---------------------------------------------------   
  task drive(seq_item seq);
   
     vintf.in <= seq.in;
     vintf.out <=seq.out;
    
  endtask
  
  
  
endclass

`endif