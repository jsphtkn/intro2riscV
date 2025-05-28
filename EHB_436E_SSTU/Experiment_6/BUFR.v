// BUFR: Regional Clock Buffer for I/O and Logic Resources within a Clock Region
//       7 Series
// Xilinx HDL Language Template, version 2021.1

BUFR #(
   .BUFR_DIVIDE("1"),   	// Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
   .SIM_DEVICE("7SERIES")   // Must be set to "7SERIES"
)
BUFR_inst (
   .O(O),      // 1-bit output: Clock output port
   .CE(CE),    // 1-bit input: Active high, clock enable (Divided modes only)
   .CLR(1'b0), // 1-bit input: Active high, asynchronous clear (Divided modes only)
   .I(I)       // 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
);

// End of BUFR_inst instantiation