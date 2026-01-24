module uart #(
    
) (
    output          i_tx,
    input           i_tx_start,
    input [7:0]     i_tx_data,
    
    input           i_rx,
    output          o_rx_new,
    output          o_rx_err,
    output [7:0]    o_rx_data
);

rx recvier (
    .i_rx(i_rx),
    .o_new(o_rx_new),
    .o_err(o_rx_err),
    .o_data(o_rx_data)
);

tx transmitter (
    .o_tx(o_tx),
    .i_start(i_tx_start),
    .i_data(i_tx_data)
);

endmodule