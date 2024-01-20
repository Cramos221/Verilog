// Code your design here
module seq(input logic in,clk,clr,output logic out);
  
  parameter [2:0] s0 = 3'b000;
  parameter [2:0] s1 = 3'b001;
  parameter [2:0] s2 = 3'b010;
  parameter [2:0] s3 = 3'b011;
  parameter [2:0] s4 = 3'b100;

reg [2:0] current_state, next_state;
  
  //Update State Register
always @(posedge clk)
begin
current_state <= clr==0 ? s0 : next_state;
end
  

//Output Logic
  assign out = (current_state == s4 ) ? 1 : 0;
  
 
//Next State Logic
  
  
always @(current_state or in)
begin
case(current_state)
s0: next_state <= in ? s0 : s1;
s1: next_state <= in ? s0 : s2;
s2: next_state <= in ? s3 : s2;
s3: next_state <= in ? s4 : s1;
s4: next_state <= in ? s0 : s1;

default next_state <= s0;
endcase
end


endmodule
