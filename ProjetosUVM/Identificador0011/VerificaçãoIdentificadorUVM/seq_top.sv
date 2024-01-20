
//Include file----------------------------------------------------------------

`include "seq_item.sv"
`include "seq_sequencer.sv"
`include "seq_env.sv"


class seq_top extends uvm_test;
  `uvm_component_utils(seq_top)
  
//Instances other classes------------------------------------------------
  seq_env env;
  seq_sequence seq;

//Constructor--------------------------------------------------------
  function new(string name = "test", uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction
  
//build phase--------------------------------------------------------  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase!", UVM_HIGH)
    env= seq_env::type_id::create("env", this);
  endfunction
//start_of_simulation_phase--------------------------------------------- 
    function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
  endfunction
//Run Phase--------------------------------------------------------  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(.obj(this));
    seq= seq_sequence::type_id::create("seq",this);
    seq.start(env.agent.seq);
    phase.drop_objection(.obj(this));
  endtask
//end_of_elaboration--------------------------------------------  
  virtual function void end_of_elaboration();
    uvm_report_info(get_full_name(),"End of elaboration",UVM_LOW);
    print();
  endfunction
endclass