`timescale 1ns/1ns

module CIC #(
  parameter WIDTH = 18
)(
  input logic              clk,
  input logic              rst,
  input logic       [15:0] decimation_ratio,
  input logic [7:0]        d_in,
  output logic [7:0]       d_out,
  output logic             d_clk
);

  logic signed [WIDTH-1:0] d_tmp;
  logic signed [WIDTH-1:0] d_d_tmp;

  // Integrator stage registers
  logic signed [WIDTH-1:0] d1, d2, d3, d4, d5;

  // Comb stage registers
  logic signed [WIDTH-1:0] d6, d_d6;
  logic signed [WIDTH-1:0] d7, d_d7;
  logic signed [WIDTH-1:0] d8, d_d8;
  logic signed [WIDTH-1:0] d9, d_d9;
  logic signed [WIDTH-1:0] d10;

  logic [15:0] count;
  logic v_comb;  // Valid signal for comb section running at output rate
  logic d_clk_tmp;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset values
      d1 <= 0;
      d2 <= 0;
      d3 <= 0;
      d4 <= 0;
      d5 <= 0;
      count <= 0;
    end else begin
      // Integrator section
      d1 <= d_in + d1;
      d2 <= d1 + d2;
      d3 <= d2 + d3;
      d4 <= d3 + d4;
      d5 <= d4 + d5;

      // Decimation
      if (count == decimation_ratio - 1) begin
        count <= 0;
        d_tmp <= d5;
        d_clk_tmp <= 1;
        v_comb <= 1;
      end else if (count == decimation_ratio >> 1) begin
        d_clk_tmp <= 0;
        count <= count + 1;
        v_comb <= 0;
      end else begin
        count <= count + 1;
        v_comb <= 0;
      end
    end
  end

  always_ff @(posedge clk) begin
    // Output clock
    d_clk <= d_clk_tmp;

    if (rst) begin
      // Reset values
      d6 <= 0;
      d7 <= 0;
      d8 <= 0;
      d9 <= 0;
      d10 <= 0;
      d_d6 <= 0;
      d_d7 <= 0;
      d_d8 <= 0;
      d_d9 <= 0;
      d_out <= 8'b0;
    end else begin
      if (v_comb) begin
        // Comb section
        d_d_tmp <= d_tmp;

        d6 <= d_tmp - d_d_tmp;
        d_d6 <= d6;

        d7 <= d6 - d_d6;
        d_d7 <= d7;

        d8 <= d7 - d_d7;
        d_d8 <= d8;

        d9 <= d8 - d_d8;
        d_d9 <= d9;

        d10 <= d9 - d_d9;

        // Output data
        d_out <= d10 >>> (WIDTH - 8);
      end
    end
  end
endmodule

