class our_driver extends uvm_driver #(our_packet);
  
  `uvm_component_utils(our_driver)
 
  virtual our_interface intf;
  our_packet pkt;
  
  //Constructor--------------------------------------------------------
  function new(string name = "our_driver", uvm_component parent = null);
     super.new(name, parent);
     `uvm_info("DRIVER_CLASS", "Inside Constructor!", UVM_HIGH)
   endfunction: new
  
  //Build Phase--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "Build Phase!", UVM_HIGH)
    pkt = our_packet::type_id::create("Our_packet");
    if(!(uvm_config_db #(virtual our_interface)::get(this, "*", "intf", intf))) begin
      `uvm_error("DRIVER_CLASS", "Failed to get INTF from config DB!")
    end
  endfunction
  
  //Connect Phase--------------------------------------------------
  function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS", "Connect Phase!", UVM_HIGH)
  endfunction: connect_phase
  
  
  //Run Phase---------------------------------------------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS", "Inside Run Phase!", UVM_HIGH)

    forever begin
      @(posedge intf.clk)
      
      seq_item_port.get_next_item(pkt);
      intf.input_1 <= pkt.input_1;
      intf.input_2 <= pkt.input_2;
      intf.input_3 <= pkt.input_3;
      intf.input_4 <= pkt.input_4;
      intf.input_5 <= pkt.input_5;
      intf.input_6 <= pkt.input_6;
      intf.input_7 <= pkt.input_7;
      intf.input_8 <= pkt.input_8;
      
      seq_item_port.item_done();
    end
    
  endtask: run_phase



   

endclass: our_driver

