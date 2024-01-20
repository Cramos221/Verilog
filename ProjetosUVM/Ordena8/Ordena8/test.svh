class test extends uvm_test;  
  
  `uvm_component_utils(test)
  
  //intancias outras classes
  our_env env;
  our_sequence seq;
  

  //constructor--------------------------------------------------------
  function new(string name = "test", uvm_component parent);
     super.new(name, parent);
    `uvm_info("ENV_CLASS", "Inside Constructor!", UVM_HIGH)
    
   endfunction: new
  
  //build phase--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase!", UVM_HIGH)
    // buld otehr components
     // build env  
    env = our_env::type_id::create("env", this);
     
  endfunction: build_phase
  
    //Connect Phase--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "Connect Phase!", UVM_HIGH)

  endfunction: connect_phase
  
   //Run Phase--------------------------------------------------------
  
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST_CLASS", "Run Phase!", UVM_HIGH)

    phase.raise_objection(this);

    repeat(100) begin
      //test_seq
        seq = our_sequence::type_id::create("seq");
        seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);

  endtask: run_phase
  
endclass: test

