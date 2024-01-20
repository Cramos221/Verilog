`ifndef SEQ_SEQUENCER
`define SEQ_SEQUENCER

`include "seq_sequence.sv"
class seq_sequencer extends uvm_sequencer#(seq_item);
  `uvm_component_utils(seq_sequencer)
  
//Constructor--------------------------------------------------------   
  function new(string name= "seq_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction
endclass
`endif