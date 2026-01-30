module cmd_controller #(
    parameter       p_clk_freq,
    parameter       p_baud_freq,
    parameter       p_reg_count,
    parameter       p_reg_size
) (
    input           i_clk,
    input           i_rst,
    
    input           i_rx,
    output          o_tx,
    
    output [p_reg_count-1:0][p_reg_size-1:0] o_regs,
    output [$clog2(p_reg_count):0] o_last_addr,
    output o_new_data
);

localparam p_reg_size_bytes = (p_reg_size + 7) / 8;
localparam p_reg_size_bytes_size = $clog2(p_reg_size_bytes);

reg [p_reg_count-1:0][p_reg_size-1:0] r_regs = '{default:0}; 
reg [$clog2(p_reg_count):0] r_last_addr = {$clog2(p_reg_count){1'b0}};
reg r_new_data = 1'b0;



wire w_tx_done;
wire w_rx_new;
wire w_rx_err;
wire [7:0] w_rx_data;

reg [7:0] r_tx_data = 8'd0;
reg r_tx_start = 1'b0;
    
uart #(
    .p_clk_freq(p_clk_freq),
    .p_baud_freq(p_baud_freq)
) controller (
    .i_clk(i_clk),
    .i_rst(i_rst),
    .o_tx(o_tx),
    .o_tx_done(w_tx_done),
    .i_tx_start(r_tx_start),
    .i_tx_data(r_tx_data),
    .i_rx(i_rx),
    .o_rx_new(w_rx_new),
    .o_rx_err(w_rx_err),
    .o_rx_data(w_rx_data)
);

reg r_rx_new_prev = 1'b0;
wire w_rx_new_rising = ~r_rx_new_prev & w_rx_new;

always @(posedge i_clk or negedge i_rst) begin
    if (~i_rst) begin
        r_rx_new_prev = 1'b0;
    end
    else begin
        r_rx_new_prev <= w_rx_new;
    end
end

parameter
    s_idle      = 2'd0,
    s_addr      = 2'd1,
    s_data      = 2'd2,
    s_timeout   = 2'd3;
    
reg [1:0] r_state = s_idle;
reg [7:0] r_addr = 8'd0;
reg [p_reg_size_bytes_size-1:0] r_data_byte_count = {p_reg_size_bytes_size{1'b0}};

always @(posedge i_clk or negedge i_rst) begin
    if (~i_rst) begin
        
    end
    else begin
        s_idle: begin
            if (w_rx_new_rising) begin
                r_state = s_addr;
                r_addr <= w_rx_data;
            end
        end 
        
        s_addr: begin
            if (w_rx_new_rising) begin
                r_state = s_addr;
            end
        end 
        
        s_data: begin
            
        end 
        
        s_timeout: begin
            
        end 
    end
end

assign o_regs = r_regs;
assign o_last_addr = r_last_addr;
assign o_new_data = r_new_data;

endmodule