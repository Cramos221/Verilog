`timescale 1ns/1ns

module CIC_tb;
  logic              clk;
  logic              rst;
  logic       [15:0] decimation_ratio;
  logic [7:0]        d_in;
  logic [7:0]        d_out;
  logic              d_clk;

  integer x_in, x_read, x_out;

  CIC #(.WIDTH(18)) CIC_inst (
    .clk(clk),
    .rst(rst),
    .decimation_ratio(decimation_ratio),
    .d_in(d_in),
    .d_out(d_out),
    .d_clk(d_clk)
  );

  always #1 clk = ~clk;

  always_ff @(posedge d_clk)
  begin
    $fwrite(x_out, "%d\n", d_out);
  end

  initial
  begin
    clk <= 1'b0;
    rst <= 1'b0;
    decimation_ratio <= 16'd4;
    d_in <= 8'b0;
    x_in = $fopen("input.txt", "r");
    x_out = $fopen("x_out.txt", "w");
  end 

  initial
  begin
    repeat (20) @(posedge clk);
    rst <= 1'b1;
    @(posedge clk);
    rst <= 1'b0;
    repeat (10) @(posedge clk);

    while (!$feof(x_in))
    begin
      x_read <= $fscanf(x_in, "%d\n", d_in);
      @(posedge clk);
    end

    repeat (1000) @(posedge clk);

    $fclose(x_in);
    $fclose(x_out);
    $stop;
  end
endmodule

