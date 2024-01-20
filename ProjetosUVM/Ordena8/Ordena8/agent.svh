
class our_agent extends uvm_agent;
  
  `uvm_component_utils(our_agent)
  
    our_driver driver;
    our_monitor monitor;
    our_sequence sequencer;
  
  //Constructor---------------------------------------------------
  function new(string name = "our_agent", uvm_component parent);
     super.new(name, parent);
     `uvm_info("AGENT_CLASS", "Inside Constructor!", UVM_HIGH)
   endfunction: new
  
  //Build Phase---------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_CLASS", "Build Phase!", UVM_HIGH)

    sequencer = our_sequencer::type_id::create("sequencer", this);
    driver = our_driver::type_id::create("driver", this);
    monitor = our_monitor::type_id::create("monitor", this);
  endfunction: build_phase
  
  //Connect Phase--------------------------------------------------
  function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS", "Connect Phase!", UVM_HIGH)
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction : connect_phase
  
  
  //run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    endtask: run_phase
  
  

endclass: our_agent


