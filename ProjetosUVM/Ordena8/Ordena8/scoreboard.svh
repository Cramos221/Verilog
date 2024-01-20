class our_scoreboard extends uvm_test;
    `uvm_component_utils(our_scoreboard)
    
    uvm_analysis_imp #(our_packet, our_scoreboard) scoreboard_port;
    
    our_packet transactions[$];
    
    
    //Constructor--------------------------------------------------------
    function new(string name = "our_scoreboard", uvm_component parent);
      super.new(name, parent);
      `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
    endfunction: new
    
    
    
    //Build Phase--------------------------------------------------------
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
     
      scoreboard_port = new("scoreboard_port", this);
      
    endfunction: build_phase
    
    
    
    //Connect Phase--------------------------------------------------------
    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
      
     
    endfunction: connect_phase
    
    
    
    //Write Method--------------------------------------------------------
    function void write(our_packet pkt);
      transactions.push_back(pkt);
    endfunction: write 
    
    
    
    //Run Phase--------------------------------------------------------
    task run_phase (uvm_phase phase);
      super.run_phase(phase);
      `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
     
      forever begin
        
        // Compare it with actual value
        // Score the transactions accordingly
        
        our_packet curr_trans;
        wait((transactions.size() != 0));
        curr_trans = transactions.pop_front();
        compare(curr_trans);
        
      end
      
    endtask: run_phase
    
   
    
  endclass: our_scoreboard