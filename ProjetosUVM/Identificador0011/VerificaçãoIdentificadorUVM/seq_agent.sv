//Include file----------------------------------------------------------------
`include "seq_driver.sv"
`include "seq_monitor.sv"
`include "seq_sequencer.sv"

class seq_agent extends uvm_agent;
  `uvm_component_utils(seq_agent)
  
//Instances other classes------------------------------------------------  
  seq_driver driver;
  seq_sequencer seq;
  seq_monitor monitor;

//Constructor--------------------------------------------------------  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    `uvm_info("AGENT_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction
  
//build phase--------------------------------------------------------    
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    driver= seq_driver::type_id::create("driver", this);
    seq= seq_sequencer::type_id::create("seq", this);
    monitor= seq_monitor::type_id::create("monitor", this);
     `uvm_info("AGENT_CLASS", "Build Phase!", UVM_HIGH)
  endfunction
  
//Connect Phase--------------------------------------------------  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS", "Connect Phase!", UVM_HIGH)
    driver.seq_item_port.connect(seq.seq_item_export);
   endfunction
  
endclass
