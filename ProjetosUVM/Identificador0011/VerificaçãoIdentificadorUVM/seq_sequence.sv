`include "seq_item.sv"
class seq_sequence extends uvm_sequence#(seq_item);
  `uvm_object_utils(seq_sequence)

  // Constructor
  function new(string name="seq_sequence");
    super.new(name);
  endfunction

  seq_item seq_h;

  // Body Task
  virtual task body();
    repeat(20) begin
   
      seq_h = seq_item::type_id::create("seq_h");

      void'(seq_h.randomize());
      `uvm_send(seq_h);

      #(5);
    end
  endtask
endclass

               