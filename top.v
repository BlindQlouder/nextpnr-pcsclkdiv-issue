
module top(led_0__io);

output led_0__io;

wire tx_clk;
wire tx_clk_div;

reg [25:0] count;

assign led_0__io = count[25];

always @(posedge tx_clk_div) begin
    count <= count + 1;
end

(* LOC = "DCU0" *)
DCUA DCU0_inst (
    .CH0_FF_TX_PCLK(tx_clk),
);

PCSCLKDIV div_inst (
    .CLKI(tx_clk),
    .SEL0(0),
    .SEL1(1),
    .SEL2(0),
    //.CDIV1(tx_clk_div1),
    .CDIVX(tx_clk_div),
);

endmodule








