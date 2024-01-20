
class seq_monitor extends uvm_monitor;
  `uvm_component_utils(seq_monitor)
  
  virtual seq_if vintf;
  uvm_analysis_port #(seq_item)item_collected_port;
  
  
  seq_item seq;
  
 //Constructor-------------------------------------------------------- 
  function new(string name="seq_monitor", uvm_component parent);
    super.new(name,parent);
  endfunction
 
   
 //Build Phase-------------------------------------------------------- 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual seq_if)::get(this,"","seq_if",vintf))
      `uvm_fatal("NOVIF",{"virtual interface must be set for:", get_full_name(), ".vintf"});
  endfunction
  
  
  //Run Phase--------------------------------------------------------
virtual task run_phase(uvm_phase phase);
  
  repeat(20)begin 
      seq= seq_item::type_id::create("seq");
    

     seq.in = vintf.in;
      
  
     seq.out = vintf.out;
    
      `uvm_info(get_full_name(),$psprintf("in=%0b,out=%0b",seq.in,vintf.out),UVM_NONE)
    #10;
    end
 endtask
endclass