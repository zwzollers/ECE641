module tx #(
    parameter       p_clk_freq,
    parameter       p_baud_freq
) (
    input           i_clk,
    input           i_rst,

    output          o_tx,
    input           i_start,
    input [7:0]     i_data
);


wire w_baud_clk;
wire w_sync_baud_clk;

clk_div #(
    .p_input_freq(p_clk_freq),
    .p_output_freq(p_baud_freq)
) baud_clk (
    .i_clk(i_clk),
    .i_rst(i_rst),
    .o_clk(w_baud_clk)
);

endmodule