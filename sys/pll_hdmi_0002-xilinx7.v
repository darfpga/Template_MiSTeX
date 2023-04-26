`timescale 1ns/10ps
module  pll_hdmi_0002(
	input wire refclk,
	input wire rst,
	output wire outclk_0,
	output wire locked,
	input wire [63:0] reconfig_to_pll,
	output wire [63:0] reconfig_from_pll
);


    wire feedback;
	
	PLLE2_ADV #(
		.CLKFBOUT_MULT(7'd25),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE(7'd17), // 50*25/17 =~ 74.25MHz
		.CLKOUT0_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) PLLE2_ADV (
		.CLKFBIN(feedback),
		.CLKIN1(refclk),
		.PWRDWN(1'b0),
		.RST(rst),
		.CLKFBOUT(feedback),
		.CLKOUT0(outclk_0),
		.LOCKED(locked)
);
endmodule

