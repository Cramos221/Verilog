class our_sequence extends uvm_sequence ;
  `uvm_object_utils(our_sequence)

   our_packet pkt;

//Constructor-------------------------------------------------------- 
function new (string name = "our_sequence");
  super.new(name);
  `uvm_info("BASE_SEQ", "Inside Constructor!", UVM_HIGH)
  endfunction: new

//Body Task--------------------------------------------------------
task body();
  `uvm_info("BASE_SEQ", "Inside body task!", UVM_HIGH)

  pkt = our_packet::type_id::create("Our Packet");
  
  repeat(10)
    begin
      start_item(pkt);
      pkt.randomize();
      finish_item(pkt);
    end
  endtask: body


endclass: our_sequence 

