module sdram (
    inout [15:0]        io_dram_dq,
    output [12:0]       o_dram_addr,
    output [1:0]        o_dram_ba,
    output [1:0]        o_dram_dqm,
    otuput              o_dram_ras_n,
    otuput              o_dram_cas_n,
    otuput              o_dram_cke,
    otuput              o_dram_clk,
    otuput              o_dram_we_n,
    otuput              o_dram_cs_n  
);

assign o_dram_cs_n = 1'b0;

wire
    w_cs_n,
    w_ras_n,
    w_cas_n,
    w_we_n,
    w_ba_en,
    w_ap,
    w_addr_en;
    
assign {w_cs_n, w_ras_n, w_cas_n, w_we_n, w_ba_en, w_ap, w_addr_en} = r_curr_cmd_state;
    

parameter 
    cmd_nop          = 4'd0,
    cmd_burst_stop   = 4'd1,
    cmd_read         = 4'd2,
    cmd_read_ap      = 4'd3,
    cmd_write        = 4'd4,
    cmd_write_ap     = 4'd5,
    cmd_activate     = 4'd6,
    cmd_precharge    = 4'd7,
    cmd_auto_refresh = 4'd8,
    cmd_self_refresh = 4'd9,
    cmd_mode_reg     = 4'd10;
    
    reg [2:0] r_curr_op = cmd_nop;
    
parameter
    cmd_state_nop          = 7'b0111000,
    cmd_state_burst_stop   = 7'b0110000,
    cmd_state_read         = 7'b0101101,
    cmd_state_read_ap      = 7'b1010111,
    cmd_state_write        = 7'b0100101,
    cmd_state_write_ap     = 7'b0100111,
    cmd_state_activate     = 7'b0011111,
    cmd_state_precharge    = 7'b0010100,
    cmd_state_auto_refresh = 7'b0001000,
    cmd_state_self_refresh = 7'b0001000,
    cmd_state_mode_reg     = 7'b0000001;
    
    reg [6:0] r_curr_cmd_state = cmd_state_nop;
    
parameter
    s_idle              = 4'd0,
    s_row_active        = 4'd1,
    s_read              = 4'd2,
    s_write             = 4'd3,
    s_read_ap           = 4'd4,
    s_write_ap          = 4'd5,
    s_precharging       = 4'd6,
    s_row_activating    = 4'd7,
    s_write_recovering  = 4'd8,
    s_refresh           = 4'd9,
    s_mode_register     = 4'd10,
    s_self_refresh      = 4'd11,
    s_self_refresh_r    = 4'd12,
    s_power_down        = 4'd13,
    s_all_banks_idle    = 4'd14;
    
reg [3:0] r_state = s_idle;


always @(posedge i_clk) begin
    case(r_curr_op)
        s_idle: begin
            
        end
        
        s_row_active: begin
            
        end
        
        s_read: begin
            
        end
        
        s_write: begin
            
        end
        
        s_read_ap: begin
            
        end
        
        s_write_ap: begin
            
        end
        
        s_precharging: begin
            
        end
        
        s_row_activating: begin
            
        end
        
        s_write_recovering: begin
            
        end
        
        s_refresh: begin
            
        end
        
        s_mode_register: begin
            
        end
        
        s_self_refresh: begin
            
        end
        
        s_self_refresh_r: begin
            
        end
        
        s_power_down: begin
            
        end
        
        s_all_banks_idle: begin
            
        end
    endcase  
end


endmodule