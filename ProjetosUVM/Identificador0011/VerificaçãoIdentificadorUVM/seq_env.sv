//Include file----------------------------------------------------------------
`include "seq_agent.sv"
class seq_env extends uvm_env;
  `uvm_component_utils(seq_env)
  
//Instances other classes------------------------------------------------    
  seq_agent agent;

//Constructor--------------------------------------------------------    
  function new(string name= "seq_env", uvm_component parent);
    super.new(name,parent);
  endfunction

//build phase--------------------------------------------------------    
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent= seq_agent::type_id::create(.name("agent"), .parent(this));
  endfunction
  
 function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
  endfunction  
  
endclass

  