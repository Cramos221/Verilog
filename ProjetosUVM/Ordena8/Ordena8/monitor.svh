class our_monitor extends uvm_monitor;  
   `uvm_component_utils(our_monitor)
 
   virtual our_interface intf;
   our_packet pkt;
   
   uvm_analysis_port #(our_packet) monitor_port;

   
    //Constructor--------------------------------------------------------
     function new (string name = "our_monitor", uvm_component parent);
     super.new(name, parent);
     `uvm_info("MONITOR_CLASS", "Inside Constructor!", UVM_HIGH)
     endfunction: new
   
    
   
   //Build Phase--------------------------------------------------------
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      `uvm_info("MONITOR_CLASS", "Build Phase!", UVM_HIGH)

      monitor_port = new("monitor_port", this);

     pkt = our_packet::type_id::create("Our Packet");
     //get method
     if(!(uvm_config_db #(virtual our_interface)::get(this, "*", "vif", intf))) begin
      `uvm_error("MONITOR_CLASS", "Failed to get INTF from config DB!")
    end
     
   endfunction: build_phase
   
   //Connect Phase--------------------------------------------------------
   function void connect_phase (uvm_phase phase);
      super.connect_phase(phase);
      `uvm_info("MONITOR_CLASS", "Connect Phase!", UVM_HIGH)
   endfunction: connect_phase
   
   
   //Run Phase--------------------------------------------------------
   task run_phase(uvm_phase phase);
      super.run_phase(phase);
     forever begin
       @(posedge intf.clk);
       
       pkt.input_1 <= intf.input_1;
       pkt.input_2 <= intf.input_2;
       pkt.input_3 <= intf.input_3;
       pkt.input_4 <= intf.input_4;
       pkt.input_5 <= intf.input_5;
       pkt.input_6 <= intf.input_6;
       pkt.input_7 <= intf.input_7;
       pkt.input_8 <= intf.input_8;
   //sample output
      @(posedge intf.clk);
      
      
      pkt.out1 <= intf.out1;
      pkt.out2 <= intf.out2;
      pkt.out3 <= intf.out3;
      pkt.out4 <= intf.out4;
      pkt.out5 <= intf.out5;
      pkt.out6 <= intf.out6;
      pkt.out7 <= intf.out7;
      pkt.out8 <= intf.out8;

   // send item to scoreboard
      monitor_port.write(pkt);
 
     end
     
   endtask: run_phase
   
  
 
 
 endclass: our_monitor
 
 