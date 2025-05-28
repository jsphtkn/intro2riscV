// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Tue Jan 14 12:02:50 2025
// Host        : DESKTOP-KMJ9JAC running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {C:/Users/jsphtkn/Vivado
//               Projects/sstu_project_2_UART/sstu_project_2_UART.sim/sim_1/impl/timing/xsim/uart_top_tb_time_impl.v}
// Design      : uart_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module baud_gen
   (clk_Rx,
    clk_Tx,
    clk_IBUF_BUFG,
    rst_IBUF,
    BR_mode_IBUF);
  output clk_Rx;
  output clk_Tx;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input BR_mode_IBUF;

  wire BR_mode_IBUF;
  wire baud_count1;
  wire baud_count1_carry__0_i_1_n_0;
  wire baud_count1_carry__0_i_2_n_0;
  wire baud_count1_carry__0_i_3_n_0;
  wire baud_count1_carry__0_i_4_n_0;
  wire baud_count1_carry__0_i_5_n_0;
  wire baud_count1_carry__0_i_6_n_0;
  wire baud_count1_carry__0_i_7_n_0;
  wire baud_count1_carry_i_1_n_0;
  wire baud_count1_carry_i_2_n_0;
  wire baud_count1_carry_i_3_n_0;
  wire baud_count1_carry_i_4_n_0;
  wire baud_count1_carry_i_5_n_0;
  wire baud_count1_carry_i_6_n_0;
  wire baud_count1_carry_i_7_n_0;
  wire baud_count1_carry_i_8_n_0;
  wire baud_count1_carry_n_0;
  wire \baud_count[0]_i_2_n_0 ;
  wire \baud_count[0]_i_3_n_0 ;
  wire \baud_count[0]_i_4_n_0 ;
  wire \baud_count[0]_i_5_n_0 ;
  wire \baud_count[12]_i_2_n_0 ;
  wire \baud_count[12]_i_3_n_0 ;
  wire \baud_count[12]_i_4_n_0 ;
  wire \baud_count[12]_i_5_n_0 ;
  wire \baud_count[4]_i_2_n_0 ;
  wire \baud_count[4]_i_3_n_0 ;
  wire \baud_count[4]_i_4_n_0 ;
  wire \baud_count[4]_i_5_n_0 ;
  wire \baud_count[8]_i_2_n_0 ;
  wire \baud_count[8]_i_3_n_0 ;
  wire \baud_count[8]_i_4_n_0 ;
  wire \baud_count[8]_i_5_n_0 ;
  wire baud_count_Rx1;
  wire baud_count_Rx1_carry__0_i_1_n_0;
  wire baud_count_Rx1_carry__0_i_2_n_0;
  wire baud_count_Rx1_carry__0_i_3_n_0;
  wire baud_count_Rx1_carry__0_i_4_n_0;
  wire baud_count_Rx1_carry__0_i_5_n_0;
  wire baud_count_Rx1_carry__0_i_6_n_0;
  wire baud_count_Rx1_carry_i_1_n_0;
  wire baud_count_Rx1_carry_i_2_n_0;
  wire baud_count_Rx1_carry_i_3_n_0;
  wire baud_count_Rx1_carry_i_4_n_0;
  wire baud_count_Rx1_carry_i_5_n_0;
  wire baud_count_Rx1_carry_i_6_n_0;
  wire baud_count_Rx1_carry_i_7_n_0;
  wire baud_count_Rx1_carry_i_8_n_0;
  wire baud_count_Rx1_carry_n_0;
  wire \baud_count_Rx[0]_i_2_n_0 ;
  wire \baud_count_Rx[0]_i_3_n_0 ;
  wire \baud_count_Rx[0]_i_4_n_0 ;
  wire \baud_count_Rx[0]_i_5_n_0 ;
  wire \baud_count_Rx[12]_i_2_n_0 ;
  wire \baud_count_Rx[12]_i_3_n_0 ;
  wire \baud_count_Rx[12]_i_4_n_0 ;
  wire \baud_count_Rx[12]_i_5_n_0 ;
  wire \baud_count_Rx[4]_i_2_n_0 ;
  wire \baud_count_Rx[4]_i_3_n_0 ;
  wire \baud_count_Rx[4]_i_4_n_0 ;
  wire \baud_count_Rx[4]_i_5_n_0 ;
  wire \baud_count_Rx[8]_i_2_n_0 ;
  wire \baud_count_Rx[8]_i_3_n_0 ;
  wire \baud_count_Rx[8]_i_4_n_0 ;
  wire \baud_count_Rx[8]_i_5_n_0 ;
  wire [15:0]baud_count_Rx_reg;
  wire \baud_count_Rx_reg[0]_i_1_n_0 ;
  wire \baud_count_Rx_reg[0]_i_1_n_4 ;
  wire \baud_count_Rx_reg[0]_i_1_n_5 ;
  wire \baud_count_Rx_reg[0]_i_1_n_6 ;
  wire \baud_count_Rx_reg[0]_i_1_n_7 ;
  wire \baud_count_Rx_reg[12]_i_1_n_4 ;
  wire \baud_count_Rx_reg[12]_i_1_n_5 ;
  wire \baud_count_Rx_reg[12]_i_1_n_6 ;
  wire \baud_count_Rx_reg[12]_i_1_n_7 ;
  wire \baud_count_Rx_reg[4]_i_1_n_0 ;
  wire \baud_count_Rx_reg[4]_i_1_n_4 ;
  wire \baud_count_Rx_reg[4]_i_1_n_5 ;
  wire \baud_count_Rx_reg[4]_i_1_n_6 ;
  wire \baud_count_Rx_reg[4]_i_1_n_7 ;
  wire \baud_count_Rx_reg[8]_i_1_n_0 ;
  wire \baud_count_Rx_reg[8]_i_1_n_4 ;
  wire \baud_count_Rx_reg[8]_i_1_n_5 ;
  wire \baud_count_Rx_reg[8]_i_1_n_6 ;
  wire \baud_count_Rx_reg[8]_i_1_n_7 ;
  wire [15:0]baud_count_reg;
  wire \baud_count_reg[0]_i_1_n_0 ;
  wire \baud_count_reg[0]_i_1_n_4 ;
  wire \baud_count_reg[0]_i_1_n_5 ;
  wire \baud_count_reg[0]_i_1_n_6 ;
  wire \baud_count_reg[0]_i_1_n_7 ;
  wire \baud_count_reg[12]_i_1_n_4 ;
  wire \baud_count_reg[12]_i_1_n_5 ;
  wire \baud_count_reg[12]_i_1_n_6 ;
  wire \baud_count_reg[12]_i_1_n_7 ;
  wire \baud_count_reg[4]_i_1_n_0 ;
  wire \baud_count_reg[4]_i_1_n_4 ;
  wire \baud_count_reg[4]_i_1_n_5 ;
  wire \baud_count_reg[4]_i_1_n_6 ;
  wire \baud_count_reg[4]_i_1_n_7 ;
  wire \baud_count_reg[8]_i_1_n_0 ;
  wire \baud_count_reg[8]_i_1_n_4 ;
  wire \baud_count_reg[8]_i_1_n_5 ;
  wire \baud_count_reg[8]_i_1_n_6 ;
  wire \baud_count_reg[8]_i_1_n_7 ;
  wire [10:6]baud_limit_Rx;
  wire \baud_limit_Rx[10]_i_1_n_0 ;
  wire clk_IBUF_BUFG;
  wire clk_Rx;
  wire clk_Rx_i_1_n_0;
  wire clk_Tx;
  wire clk_Tx_i_1_n_0;
  wire rst_IBUF;
  wire [2:0]NLW_baud_count1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_baud_count1_carry_O_UNCONNECTED;
  wire [2:0]NLW_baud_count1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_baud_count1_carry__0_O_UNCONNECTED;
  wire [2:0]NLW_baud_count_Rx1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_baud_count_Rx1_carry_O_UNCONNECTED;
  wire [2:0]NLW_baud_count_Rx1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_baud_count_Rx1_carry__0_O_UNCONNECTED;
  wire [2:0]\NLW_baud_count_Rx_reg[0]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_baud_count_Rx_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_baud_count_Rx_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_baud_count_Rx_reg[8]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_baud_count_reg[0]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_baud_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_baud_count_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_baud_count_reg[8]_i_1_CO_UNCONNECTED ;

  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 baud_count1_carry
       (.CI(1'b0),
        .CO({baud_count1_carry_n_0,NLW_baud_count1_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({baud_count1_carry_i_1_n_0,baud_count1_carry_i_2_n_0,baud_count1_carry_i_3_n_0,baud_count1_carry_i_4_n_0}),
        .O(NLW_baud_count1_carry_O_UNCONNECTED[3:0]),
        .S({baud_count1_carry_i_5_n_0,baud_count1_carry_i_6_n_0,baud_count1_carry_i_7_n_0,baud_count1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 baud_count1_carry__0
       (.CI(baud_count1_carry_n_0),
        .CO({baud_count1,NLW_baud_count1_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,baud_count1_carry__0_i_1_n_0,baud_count1_carry__0_i_2_n_0,baud_count1_carry__0_i_3_n_0}),
        .O(NLW_baud_count1_carry__0_O_UNCONNECTED[3:0]),
        .S({baud_count1_carry__0_i_4_n_0,baud_count1_carry__0_i_5_n_0,baud_count1_carry__0_i_6_n_0,baud_count1_carry__0_i_7_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    baud_count1_carry__0_i_1
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_reg[13]),
        .O(baud_count1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    baud_count1_carry__0_i_2
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_reg[11]),
        .O(baud_count1_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h70)) 
    baud_count1_carry__0_i_3
       (.I0(baud_count_reg[8]),
        .I1(baud_count_reg[9]),
        .I2(baud_limit_Rx[6]),
        .O(baud_count1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    baud_count1_carry__0_i_4
       (.I0(baud_count_reg[14]),
        .I1(baud_count_reg[15]),
        .O(baud_count1_carry__0_i_4_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    baud_count1_carry__0_i_5
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_reg[13]),
        .I2(baud_count_reg[12]),
        .O(baud_count1_carry__0_i_5_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    baud_count1_carry__0_i_6
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_reg[11]),
        .I2(baud_count_reg[10]),
        .O(baud_count1_carry__0_i_6_n_0));
  LUT3 #(
    .INIT(8'h81)) 
    baud_count1_carry__0_i_7
       (.I0(baud_count_reg[8]),
        .I1(baud_limit_Rx[6]),
        .I2(baud_count_reg[9]),
        .O(baud_count1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_count1_carry_i_1
       (.I0(baud_limit_Rx[6]),
        .I1(baud_count_reg[6]),
        .I2(baud_count_reg[7]),
        .I3(baud_limit_Rx[10]),
        .O(baud_count1_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    baud_count1_carry_i_2
       (.I0(baud_count_reg[5]),
        .O(baud_count1_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h70)) 
    baud_count1_carry_i_3
       (.I0(baud_count_reg[2]),
        .I1(baud_count_reg[3]),
        .I2(baud_limit_Rx[10]),
        .O(baud_count1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    baud_count1_carry_i_4
       (.I0(baud_count_reg[0]),
        .I1(baud_count_reg[1]),
        .O(baud_count1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_count1_carry_i_5
       (.I0(baud_limit_Rx[6]),
        .I1(baud_count_reg[6]),
        .I2(baud_limit_Rx[10]),
        .I3(baud_count_reg[7]),
        .O(baud_count1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    baud_count1_carry_i_6
       (.I0(baud_count_reg[5]),
        .I1(baud_count_reg[4]),
        .O(baud_count1_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h81)) 
    baud_count1_carry_i_7
       (.I0(baud_count_reg[2]),
        .I1(baud_limit_Rx[10]),
        .I2(baud_count_reg[3]),
        .O(baud_count1_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    baud_count1_carry_i_8
       (.I0(baud_count_reg[0]),
        .I1(baud_count_reg[1]),
        .O(baud_count1_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[0]_i_2 
       (.I0(baud_count1),
        .I1(baud_count_reg[3]),
        .O(\baud_count[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[0]_i_3 
       (.I0(baud_count1),
        .I1(baud_count_reg[2]),
        .O(\baud_count[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[0]_i_4 
       (.I0(baud_count1),
        .I1(baud_count_reg[1]),
        .O(\baud_count[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \baud_count[0]_i_5 
       (.I0(baud_count_reg[0]),
        .I1(baud_count1),
        .O(\baud_count[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[12]_i_2 
       (.I0(baud_count1),
        .I1(baud_count_reg[15]),
        .O(\baud_count[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[12]_i_3 
       (.I0(baud_count1),
        .I1(baud_count_reg[14]),
        .O(\baud_count[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[12]_i_4 
       (.I0(baud_count1),
        .I1(baud_count_reg[13]),
        .O(\baud_count[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[12]_i_5 
       (.I0(baud_count1),
        .I1(baud_count_reg[12]),
        .O(\baud_count[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[4]_i_2 
       (.I0(baud_count1),
        .I1(baud_count_reg[7]),
        .O(\baud_count[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[4]_i_3 
       (.I0(baud_count1),
        .I1(baud_count_reg[6]),
        .O(\baud_count[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[4]_i_4 
       (.I0(baud_count1),
        .I1(baud_count_reg[5]),
        .O(\baud_count[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[4]_i_5 
       (.I0(baud_count1),
        .I1(baud_count_reg[4]),
        .O(\baud_count[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[8]_i_2 
       (.I0(baud_count1),
        .I1(baud_count_reg[11]),
        .O(\baud_count[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[8]_i_3 
       (.I0(baud_count1),
        .I1(baud_count_reg[10]),
        .O(\baud_count[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[8]_i_4 
       (.I0(baud_count1),
        .I1(baud_count_reg[9]),
        .O(\baud_count[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count[8]_i_5 
       (.I0(baud_count1),
        .I1(baud_count_reg[8]),
        .O(\baud_count[8]_i_5_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 baud_count_Rx1_carry
       (.CI(1'b0),
        .CO({baud_count_Rx1_carry_n_0,NLW_baud_count_Rx1_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({baud_count_Rx1_carry_i_1_n_0,baud_count_Rx1_carry_i_2_n_0,baud_count_Rx1_carry_i_3_n_0,baud_count_Rx1_carry_i_4_n_0}),
        .O(NLW_baud_count_Rx1_carry_O_UNCONNECTED[3:0]),
        .S({baud_count_Rx1_carry_i_5_n_0,baud_count_Rx1_carry_i_6_n_0,baud_count_Rx1_carry_i_7_n_0,baud_count_Rx1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 baud_count_Rx1_carry__0
       (.CI(baud_count_Rx1_carry_n_0),
        .CO({baud_count_Rx1,NLW_baud_count_Rx1_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,baud_count_Rx1_carry__0_i_1_n_0,baud_count_Rx1_carry__0_i_2_n_0}),
        .O(NLW_baud_count_Rx1_carry__0_O_UNCONNECTED[3:0]),
        .S({baud_count_Rx1_carry__0_i_3_n_0,baud_count_Rx1_carry__0_i_4_n_0,baud_count_Rx1_carry__0_i_5_n_0,baud_count_Rx1_carry__0_i_6_n_0}));
  LUT3 #(
    .INIT(8'h04)) 
    baud_count_Rx1_carry__0_i_1
       (.I0(baud_count_Rx_reg[10]),
        .I1(baud_limit_Rx[10]),
        .I2(baud_count_Rx_reg[11]),
        .O(baud_count_Rx1_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    baud_count_Rx1_carry__0_i_2
       (.I0(baud_count_Rx_reg[8]),
        .I1(baud_limit_Rx[10]),
        .I2(baud_count_Rx_reg[9]),
        .O(baud_count_Rx1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    baud_count_Rx1_carry__0_i_3
       (.I0(baud_count_Rx_reg[14]),
        .I1(baud_count_Rx_reg[15]),
        .O(baud_count_Rx1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    baud_count_Rx1_carry__0_i_4
       (.I0(baud_count_Rx_reg[12]),
        .I1(baud_count_Rx_reg[13]),
        .O(baud_count_Rx1_carry__0_i_4_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    baud_count_Rx1_carry__0_i_5
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_Rx_reg[10]),
        .I2(baud_count_Rx_reg[11]),
        .O(baud_count_Rx1_carry__0_i_5_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    baud_count_Rx1_carry__0_i_6
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_Rx_reg[8]),
        .I2(baud_count_Rx_reg[9]),
        .O(baud_count_Rx1_carry__0_i_6_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    baud_count_Rx1_carry_i_1
       (.I0(baud_count_Rx_reg[6]),
        .I1(baud_limit_Rx[6]),
        .I2(baud_count_Rx_reg[7]),
        .O(baud_count_Rx1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_count_Rx1_carry_i_2
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_Rx_reg[4]),
        .I2(baud_count_Rx_reg[5]),
        .I3(baud_limit_Rx[6]),
        .O(baud_count_Rx1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    baud_count_Rx1_carry_i_3
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_Rx_reg[2]),
        .I2(baud_count_Rx_reg[3]),
        .I3(baud_limit_Rx[6]),
        .O(baud_count_Rx1_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h71)) 
    baud_count_Rx1_carry_i_4
       (.I0(baud_count_Rx_reg[0]),
        .I1(baud_count_Rx_reg[1]),
        .I2(baud_limit_Rx[6]),
        .O(baud_count_Rx1_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    baud_count_Rx1_carry_i_5
       (.I0(baud_limit_Rx[6]),
        .I1(baud_count_Rx_reg[6]),
        .I2(baud_count_Rx_reg[7]),
        .O(baud_count_Rx1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_count_Rx1_carry_i_6
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_Rx_reg[4]),
        .I2(baud_limit_Rx[6]),
        .I3(baud_count_Rx_reg[5]),
        .O(baud_count_Rx1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    baud_count_Rx1_carry_i_7
       (.I0(baud_limit_Rx[10]),
        .I1(baud_count_Rx_reg[2]),
        .I2(baud_limit_Rx[6]),
        .I3(baud_count_Rx_reg[3]),
        .O(baud_count_Rx1_carry_i_7_n_0));
  LUT3 #(
    .INIT(8'h82)) 
    baud_count_Rx1_carry_i_8
       (.I0(baud_count_Rx_reg[0]),
        .I1(baud_limit_Rx[6]),
        .I2(baud_count_Rx_reg[1]),
        .O(baud_count_Rx1_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[0]_i_2 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[3]),
        .O(\baud_count_Rx[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[0]_i_3 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[2]),
        .O(\baud_count_Rx[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[0]_i_4 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[1]),
        .O(\baud_count_Rx[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \baud_count_Rx[0]_i_5 
       (.I0(baud_count_Rx_reg[0]),
        .I1(baud_count_Rx1),
        .O(\baud_count_Rx[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[12]_i_2 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[15]),
        .O(\baud_count_Rx[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[12]_i_3 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[14]),
        .O(\baud_count_Rx[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[12]_i_4 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[13]),
        .O(\baud_count_Rx[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[12]_i_5 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[12]),
        .O(\baud_count_Rx[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[4]_i_2 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[7]),
        .O(\baud_count_Rx[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[4]_i_3 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[6]),
        .O(\baud_count_Rx[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[4]_i_4 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[5]),
        .O(\baud_count_Rx[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[4]_i_5 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[4]),
        .O(\baud_count_Rx[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[8]_i_2 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[11]),
        .O(\baud_count_Rx[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[8]_i_3 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[10]),
        .O(\baud_count_Rx[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[8]_i_4 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[9]),
        .O(\baud_count_Rx[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \baud_count_Rx[8]_i_5 
       (.I0(baud_count_Rx1),
        .I1(baud_count_Rx_reg[8]),
        .O(\baud_count_Rx[8]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[0]_i_1_n_7 ),
        .Q(baud_count_Rx_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \baud_count_Rx_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\baud_count_Rx_reg[0]_i_1_n_0 ,\NLW_baud_count_Rx_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,baud_count_Rx1}),
        .O({\baud_count_Rx_reg[0]_i_1_n_4 ,\baud_count_Rx_reg[0]_i_1_n_5 ,\baud_count_Rx_reg[0]_i_1_n_6 ,\baud_count_Rx_reg[0]_i_1_n_7 }),
        .S({\baud_count_Rx[0]_i_2_n_0 ,\baud_count_Rx[0]_i_3_n_0 ,\baud_count_Rx[0]_i_4_n_0 ,\baud_count_Rx[0]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[8]_i_1_n_5 ),
        .Q(baud_count_Rx_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[8]_i_1_n_4 ),
        .Q(baud_count_Rx_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[12]_i_1_n_7 ),
        .Q(baud_count_Rx_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \baud_count_Rx_reg[12]_i_1 
       (.CI(\baud_count_Rx_reg[8]_i_1_n_0 ),
        .CO(\NLW_baud_count_Rx_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_count_Rx_reg[12]_i_1_n_4 ,\baud_count_Rx_reg[12]_i_1_n_5 ,\baud_count_Rx_reg[12]_i_1_n_6 ,\baud_count_Rx_reg[12]_i_1_n_7 }),
        .S({\baud_count_Rx[12]_i_2_n_0 ,\baud_count_Rx[12]_i_3_n_0 ,\baud_count_Rx[12]_i_4_n_0 ,\baud_count_Rx[12]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[12]_i_1_n_6 ),
        .Q(baud_count_Rx_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[12]_i_1_n_5 ),
        .Q(baud_count_Rx_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[12]_i_1_n_4 ),
        .Q(baud_count_Rx_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[0]_i_1_n_6 ),
        .Q(baud_count_Rx_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[0]_i_1_n_5 ),
        .Q(baud_count_Rx_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[0]_i_1_n_4 ),
        .Q(baud_count_Rx_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[4]_i_1_n_7 ),
        .Q(baud_count_Rx_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \baud_count_Rx_reg[4]_i_1 
       (.CI(\baud_count_Rx_reg[0]_i_1_n_0 ),
        .CO({\baud_count_Rx_reg[4]_i_1_n_0 ,\NLW_baud_count_Rx_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_count_Rx_reg[4]_i_1_n_4 ,\baud_count_Rx_reg[4]_i_1_n_5 ,\baud_count_Rx_reg[4]_i_1_n_6 ,\baud_count_Rx_reg[4]_i_1_n_7 }),
        .S({\baud_count_Rx[4]_i_2_n_0 ,\baud_count_Rx[4]_i_3_n_0 ,\baud_count_Rx[4]_i_4_n_0 ,\baud_count_Rx[4]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[4]_i_1_n_6 ),
        .Q(baud_count_Rx_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[4]_i_1_n_5 ),
        .Q(baud_count_Rx_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[4]_i_1_n_4 ),
        .Q(baud_count_Rx_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[8]_i_1_n_7 ),
        .Q(baud_count_Rx_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \baud_count_Rx_reg[8]_i_1 
       (.CI(\baud_count_Rx_reg[4]_i_1_n_0 ),
        .CO({\baud_count_Rx_reg[8]_i_1_n_0 ,\NLW_baud_count_Rx_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_count_Rx_reg[8]_i_1_n_4 ,\baud_count_Rx_reg[8]_i_1_n_5 ,\baud_count_Rx_reg[8]_i_1_n_6 ,\baud_count_Rx_reg[8]_i_1_n_7 }),
        .S({\baud_count_Rx[8]_i_2_n_0 ,\baud_count_Rx[8]_i_3_n_0 ,\baud_count_Rx[8]_i_4_n_0 ,\baud_count_Rx[8]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_Rx_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_Rx_reg[8]_i_1_n_6 ),
        .Q(baud_count_Rx_reg[9]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[0]_i_1_n_7 ),
        .Q(baud_count_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \baud_count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\baud_count_reg[0]_i_1_n_0 ,\NLW_baud_count_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,baud_count1}),
        .O({\baud_count_reg[0]_i_1_n_4 ,\baud_count_reg[0]_i_1_n_5 ,\baud_count_reg[0]_i_1_n_6 ,\baud_count_reg[0]_i_1_n_7 }),
        .S({\baud_count[0]_i_2_n_0 ,\baud_count[0]_i_3_n_0 ,\baud_count[0]_i_4_n_0 ,\baud_count[0]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[8]_i_1_n_5 ),
        .Q(baud_count_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[8]_i_1_n_4 ),
        .Q(baud_count_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[12]_i_1_n_7 ),
        .Q(baud_count_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \baud_count_reg[12]_i_1 
       (.CI(\baud_count_reg[8]_i_1_n_0 ),
        .CO(\NLW_baud_count_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_count_reg[12]_i_1_n_4 ,\baud_count_reg[12]_i_1_n_5 ,\baud_count_reg[12]_i_1_n_6 ,\baud_count_reg[12]_i_1_n_7 }),
        .S({\baud_count[12]_i_2_n_0 ,\baud_count[12]_i_3_n_0 ,\baud_count[12]_i_4_n_0 ,\baud_count[12]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[12]_i_1_n_6 ),
        .Q(baud_count_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[12]_i_1_n_5 ),
        .Q(baud_count_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[12]_i_1_n_4 ),
        .Q(baud_count_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[0]_i_1_n_6 ),
        .Q(baud_count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[0]_i_1_n_5 ),
        .Q(baud_count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[0]_i_1_n_4 ),
        .Q(baud_count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[4]_i_1_n_7 ),
        .Q(baud_count_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \baud_count_reg[4]_i_1 
       (.CI(\baud_count_reg[0]_i_1_n_0 ),
        .CO({\baud_count_reg[4]_i_1_n_0 ,\NLW_baud_count_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_count_reg[4]_i_1_n_4 ,\baud_count_reg[4]_i_1_n_5 ,\baud_count_reg[4]_i_1_n_6 ,\baud_count_reg[4]_i_1_n_7 }),
        .S({\baud_count[4]_i_2_n_0 ,\baud_count[4]_i_3_n_0 ,\baud_count[4]_i_4_n_0 ,\baud_count[4]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[4]_i_1_n_6 ),
        .Q(baud_count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[4]_i_1_n_5 ),
        .Q(baud_count_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[4]_i_1_n_4 ),
        .Q(baud_count_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[8]_i_1_n_7 ),
        .Q(baud_count_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \baud_count_reg[8]_i_1 
       (.CI(\baud_count_reg[4]_i_1_n_0 ),
        .CO({\baud_count_reg[8]_i_1_n_0 ,\NLW_baud_count_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\baud_count_reg[8]_i_1_n_4 ,\baud_count_reg[8]_i_1_n_5 ,\baud_count_reg[8]_i_1_n_6 ,\baud_count_reg[8]_i_1_n_7 }),
        .S({\baud_count[8]_i_2_n_0 ,\baud_count[8]_i_3_n_0 ,\baud_count[8]_i_4_n_0 ,\baud_count[8]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \baud_count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\baud_count_reg[8]_i_1_n_6 ),
        .Q(baud_count_reg[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \baud_limit_Rx[10]_i_1 
       (.I0(BR_mode_IBUF),
        .O(\baud_limit_Rx[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \baud_limit_Rx_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\baud_limit_Rx[10]_i_1_n_0 ),
        .Q(baud_limit_Rx[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \baud_limit_Rx_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(BR_mode_IBUF),
        .Q(baud_limit_Rx[6]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    clk_Rx_i_1
       (.I0(baud_count_Rx1),
        .O(clk_Rx_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    clk_Rx_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(clk_Rx_i_1_n_0),
        .Q(clk_Rx));
  LUT1 #(
    .INIT(2'h1)) 
    clk_Tx_i_1
       (.I0(baud_count1),
        .O(clk_Tx_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    clk_Tx_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(clk_Tx_i_1_n_0),
        .Q(clk_Tx));
endmodule

module uart_rx
   (Q,
    clk_Rx,
    Rx_en_IBUF,
    signal,
    clk_IBUF_BUFG,
    rst_IBUF);
  output [7:0]Q;
  input clk_Rx;
  input Rx_en_IBUF;
  input signal;
  input clk_IBUF_BUFG;
  input rst_IBUF;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_1__0_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire [7:0]Q;
  wire \Rx_data_out[7]_i_1_n_0 ;
  wire Rx_en_IBUF;
  wire \bit_index[0]_i_1_n_0 ;
  wire \bit_index[1]_i_1_n_0 ;
  wire \bit_index[2]_i_1_n_0 ;
  wire \bit_index[3]_i_1_n_0 ;
  wire \bit_index[3]_i_2_n_0 ;
  wire \bit_index_reg_n_0_[0] ;
  wire \bit_index_reg_n_0_[1] ;
  wire \bit_index_reg_n_0_[2] ;
  wire \bit_index_reg_n_0_[3] ;
  wire \bit_weight[0]_i_1_n_0 ;
  wire \bit_weight[1]_i_1_n_0 ;
  wire \bit_weight[2]_i_1_n_0 ;
  wire \bit_weight[3]_i_1_n_0 ;
  wire \bit_weight[3]_i_2_n_0 ;
  wire \bit_weight[3]_i_3_n_0 ;
  wire \bit_weight_reg_n_0_[0] ;
  wire \bit_weight_reg_n_0_[1] ;
  wire \bit_weight_reg_n_0_[2] ;
  wire \bit_weight_reg_n_0_[3] ;
  wire clk_IBUF_BUFG;
  wire clk_Rx;
  wire \data_buffer[0]_i_1_n_0 ;
  wire \data_buffer[1]_i_1_n_0 ;
  wire \data_buffer[2]_i_1_n_0 ;
  wire \data_buffer[3]_i_1_n_0 ;
  wire \data_buffer[3]_i_2_n_0 ;
  wire \data_buffer[4]_i_1_n_0 ;
  wire \data_buffer[5]_i_1_n_0 ;
  wire \data_buffer[6]_i_1_n_0 ;
  wire \data_buffer[7]_i_1_n_0 ;
  wire \data_buffer[7]_i_2_n_0 ;
  wire \data_buffer_reg_n_0_[0] ;
  wire \data_buffer_reg_n_0_[1] ;
  wire \data_buffer_reg_n_0_[2] ;
  wire \data_buffer_reg_n_0_[3] ;
  wire \data_buffer_reg_n_0_[4] ;
  wire \data_buffer_reg_n_0_[5] ;
  wire \data_buffer_reg_n_0_[6] ;
  wire \data_buffer_reg_n_0_[7] ;
  wire rst_IBUF;
  wire \sample_count[0]_i_1_n_0 ;
  wire \sample_count[1]_i_1_n_0 ;
  wire \sample_count[2]_i_1_n_0 ;
  wire \sample_count_reg_n_0_[0] ;
  wire \sample_count_reg_n_0_[1] ;
  wire \sample_count_reg_n_0_[2] ;
  wire signal;
  wire [1:0]state__0;

  LUT5 #(
    .INIT(32'h00FFF200)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(Rx_en_IBUF),
        .I1(signal),
        .I2(state__0[1]),
        .I3(\FSM_sequential_state[0]_i_2_n_0 ),
        .I4(state__0[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0A0A08AA)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(clk_Rx),
        .I1(\bit_index_reg_n_0_[3] ),
        .I2(\FSM_sequential_state[1]_i_2_n_0 ),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF0F0010FFFF0000)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(clk_Rx),
        .I3(\FSM_sequential_state[1]_i_2_n_0 ),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\FSM_sequential_state[1]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(\sample_count_reg_n_0_[2] ),
        .I1(\sample_count_reg_n_0_[1] ),
        .I2(\sample_count_reg_n_0_[0] ),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "STOP:11,START:01,IDLE:00,DATA:10" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state__0[0]));
  (* FSM_ENCODED_STATES = "STOP:11,START:01,IDLE:00,DATA:10" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\FSM_sequential_state[1]_i_1__0_n_0 ),
        .Q(state__0[1]));
  LUT6 #(
    .INIT(64'h00000000E0000000)) 
    \Rx_data_out[7]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(state__0[1]),
        .I3(clk_Rx),
        .I4(state__0[0]),
        .I5(\FSM_sequential_state[1]_i_2_n_0 ),
        .O(\Rx_data_out[7]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_data_out_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\Rx_data_out[7]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\data_buffer_reg_n_0_[0] ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_data_out_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\Rx_data_out[7]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\data_buffer_reg_n_0_[1] ),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_data_out_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\Rx_data_out[7]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\data_buffer_reg_n_0_[2] ),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_data_out_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\Rx_data_out[7]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\data_buffer_reg_n_0_[3] ),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_data_out_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\Rx_data_out[7]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\data_buffer_reg_n_0_[4] ),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_data_out_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\Rx_data_out[7]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\data_buffer_reg_n_0_[5] ),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_data_out_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\Rx_data_out[7]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\data_buffer_reg_n_0_[6] ),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_data_out_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\Rx_data_out[7]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\data_buffer_reg_n_0_[7] ),
        .Q(Q[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \bit_index[0]_i_1 
       (.I0(\bit_index_reg_n_0_[3] ),
        .I1(state__0[1]),
        .I2(\bit_index_reg_n_0_[0] ),
        .O(\bit_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0220)) 
    \bit_index[1]_i_1 
       (.I0(state__0[1]),
        .I1(\bit_index_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .O(\bit_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h02222000)) 
    \bit_index[2]_i_1 
       (.I0(state__0[1]),
        .I1(\bit_index_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\bit_index_reg_n_0_[2] ),
        .O(\bit_index[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000D5550000)) 
    \bit_index[3]_i_1 
       (.I0(state__0[1]),
        .I1(\sample_count_reg_n_0_[2] ),
        .I2(\sample_count_reg_n_0_[1] ),
        .I3(\sample_count_reg_n_0_[0] ),
        .I4(clk_Rx),
        .I5(state__0[0]),
        .O(\bit_index[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \bit_index[3]_i_2 
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(\bit_index_reg_n_0_[2] ),
        .I3(\bit_index_reg_n_0_[3] ),
        .I4(state__0[1]),
        .O(\bit_index[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_index[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_index[0]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_index[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_index[1]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_index[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_index[2]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_index_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_index[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_index[3]_i_2_n_0 ),
        .Q(\bit_index_reg_n_0_[3] ));
  LUT3 #(
    .INIT(8'h28)) 
    \bit_weight[0]_i_1 
       (.I0(\bit_weight[3]_i_3_n_0 ),
        .I1(\bit_weight_reg_n_0_[0] ),
        .I2(signal),
        .O(\bit_weight[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \bit_weight[1]_i_1 
       (.I0(\bit_weight[3]_i_3_n_0 ),
        .I1(\bit_weight_reg_n_0_[0] ),
        .I2(signal),
        .I3(\bit_weight_reg_n_0_[1] ),
        .O(\bit_weight[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \bit_weight[2]_i_1 
       (.I0(\bit_weight[3]_i_3_n_0 ),
        .I1(signal),
        .I2(\bit_weight_reg_n_0_[0] ),
        .I3(\bit_weight_reg_n_0_[1] ),
        .I4(\bit_weight_reg_n_0_[2] ),
        .O(\bit_weight[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA8AAA8AAA8AAAAA)) 
    \bit_weight[3]_i_1 
       (.I0(clk_Rx),
        .I1(\FSM_sequential_state[1]_i_2_n_0 ),
        .I2(state__0[0]),
        .I3(state__0[1]),
        .I4(\bit_weight_reg_n_0_[3] ),
        .I5(\bit_weight_reg_n_0_[2] ),
        .O(\bit_weight[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \bit_weight[3]_i_2 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(signal),
        .I2(\bit_weight_reg_n_0_[0] ),
        .I3(\bit_weight_reg_n_0_[1] ),
        .I4(\bit_weight[3]_i_3_n_0 ),
        .I5(\bit_weight_reg_n_0_[3] ),
        .O(\bit_weight[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h7F7F7F00)) 
    \bit_weight[3]_i_3 
       (.I0(\sample_count_reg_n_0_[0] ),
        .I1(\sample_count_reg_n_0_[1] ),
        .I2(\sample_count_reg_n_0_[2] ),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(\bit_weight[3]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_weight_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_weight[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_weight[0]_i_1_n_0 ),
        .Q(\bit_weight_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_weight_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_weight[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_weight[1]_i_1_n_0 ),
        .Q(\bit_weight_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_weight_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_weight[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_weight[2]_i_1_n_0 ),
        .Q(\bit_weight_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_weight_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_weight[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_weight[3]_i_2_n_0 ),
        .Q(\bit_weight_reg_n_0_[3] ));
  LUT6 #(
    .INIT(64'hFFFEFFFF000E0000)) 
    \data_buffer[0]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\data_buffer[3]_i_2_n_0 ),
        .I5(\data_buffer_reg_n_0_[0] ),
        .O(\data_buffer[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFF0E000000)) 
    \data_buffer[1]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\data_buffer[3]_i_2_n_0 ),
        .I5(\data_buffer_reg_n_0_[1] ),
        .O(\data_buffer[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFF0E000000)) 
    \data_buffer[2]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\data_buffer[3]_i_2_n_0 ),
        .I5(\data_buffer_reg_n_0_[2] ),
        .O(\data_buffer[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFFE0000000)) 
    \data_buffer[3]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(\data_buffer[3]_i_2_n_0 ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[1] ),
        .I5(\data_buffer_reg_n_0_[3] ),
        .O(\data_buffer[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \data_buffer[3]_i_2 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(clk_Rx),
        .I3(\FSM_sequential_state[1]_i_2_n_0 ),
        .I4(\bit_index_reg_n_0_[2] ),
        .I5(\bit_index_reg_n_0_[3] ),
        .O(\data_buffer[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF000E0000)) 
    \data_buffer[4]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\data_buffer[7]_i_2_n_0 ),
        .I5(\data_buffer_reg_n_0_[4] ),
        .O(\data_buffer[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFF0E000000)) 
    \data_buffer[5]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\data_buffer[7]_i_2_n_0 ),
        .I5(\data_buffer_reg_n_0_[5] ),
        .O(\data_buffer[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFF0E000000)) 
    \data_buffer[6]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\data_buffer[7]_i_2_n_0 ),
        .I5(\data_buffer_reg_n_0_[6] ),
        .O(\data_buffer[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFFE0000000)) 
    \data_buffer[7]_i_1 
       (.I0(\bit_weight_reg_n_0_[2] ),
        .I1(\bit_weight_reg_n_0_[3] ),
        .I2(\data_buffer[7]_i_2_n_0 ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[1] ),
        .I5(\data_buffer_reg_n_0_[7] ),
        .O(\data_buffer[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \data_buffer[7]_i_2 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(clk_Rx),
        .I3(\FSM_sequential_state[1]_i_2_n_0 ),
        .I4(\bit_index_reg_n_0_[2] ),
        .I5(\bit_index_reg_n_0_[3] ),
        .O(\data_buffer[7]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \data_buffer_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\data_buffer[0]_i_1_n_0 ),
        .Q(\data_buffer_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_buffer_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\data_buffer[1]_i_1_n_0 ),
        .Q(\data_buffer_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_buffer_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\data_buffer[2]_i_1_n_0 ),
        .Q(\data_buffer_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_buffer_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\data_buffer[3]_i_1_n_0 ),
        .Q(\data_buffer_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_buffer_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\data_buffer[4]_i_1_n_0 ),
        .Q(\data_buffer_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_buffer_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\data_buffer[5]_i_1_n_0 ),
        .Q(\data_buffer_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_buffer_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\data_buffer[6]_i_1_n_0 ),
        .Q(\data_buffer_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_buffer_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\data_buffer[7]_i_1_n_0 ),
        .Q(\data_buffer_reg_n_0_[7] ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0FE0)) 
    \sample_count[0]_i_1 
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(clk_Rx),
        .I3(\sample_count_reg_n_0_[0] ),
        .O(\sample_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h54FFA800)) 
    \sample_count[1]_i_1 
       (.I0(\sample_count_reg_n_0_[0] ),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(clk_Rx),
        .I4(\sample_count_reg_n_0_[1] ),
        .O(\sample_count[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7770FFFF88800000)) 
    \sample_count[2]_i_1 
       (.I0(\sample_count_reg_n_0_[0] ),
        .I1(\sample_count_reg_n_0_[1] ),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .I4(clk_Rx),
        .I5(\sample_count_reg_n_0_[2] ),
        .O(\sample_count[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \sample_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\sample_count[0]_i_1_n_0 ),
        .Q(\sample_count_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \sample_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\sample_count[1]_i_1_n_0 ),
        .Q(\sample_count_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \sample_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\sample_count[2]_i_1_n_0 ),
        .Q(\sample_count_reg_n_0_[2] ));
endmodule

(* ECO_CHECKSUM = "1dcc35ac" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module uart_top
   (clk,
    rst,
    data_in,
    Tx_en,
    Rx_en,
    BR_mode,
    data_out);
  input clk;
  input rst;
  input [7:0]data_in;
  input Tx_en;
  input Rx_en;
  input BR_mode;
  output [7:0]data_out;

  wire BR_mode;
  wire BR_mode_IBUF;
  wire Rx_en;
  wire Rx_en_IBUF;
  wire Tx_en;
  wire Tx_en_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire clk_Rx;
  wire clk_Tx;
  wire [7:0]data_in;
  wire [7:0]data_in_IBUF;
  wire [7:0]data_out;
  wire [7:0]data_out_OBUF;
  wire rst;
  wire rst_IBUF;
  wire signal;

initial begin
 $sdf_annotate("uart_top_tb_time_impl.sdf",,,,"tool_control");
end
  baud_gen BR_generator
       (.BR_mode_IBUF(BR_mode_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .clk_Rx(clk_Rx),
        .clk_Tx(clk_Tx),
        .rst_IBUF(rst_IBUF));
  IBUF BR_mode_IBUF_inst
       (.I(BR_mode),
        .O(BR_mode_IBUF));
  IBUF Rx_en_IBUF_inst
       (.I(Rx_en),
        .O(Rx_en_IBUF));
  IBUF Tx_en_IBUF_inst
       (.I(Tx_en),
        .O(Tx_en_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF \data_in_IBUF[0]_inst 
       (.I(data_in[0]),
        .O(data_in_IBUF[0]));
  IBUF \data_in_IBUF[1]_inst 
       (.I(data_in[1]),
        .O(data_in_IBUF[1]));
  IBUF \data_in_IBUF[2]_inst 
       (.I(data_in[2]),
        .O(data_in_IBUF[2]));
  IBUF \data_in_IBUF[3]_inst 
       (.I(data_in[3]),
        .O(data_in_IBUF[3]));
  IBUF \data_in_IBUF[4]_inst 
       (.I(data_in[4]),
        .O(data_in_IBUF[4]));
  IBUF \data_in_IBUF[5]_inst 
       (.I(data_in[5]),
        .O(data_in_IBUF[5]));
  IBUF \data_in_IBUF[6]_inst 
       (.I(data_in[6]),
        .O(data_in_IBUF[6]));
  IBUF \data_in_IBUF[7]_inst 
       (.I(data_in[7]),
        .O(data_in_IBUF[7]));
  OBUF \data_out_OBUF[0]_inst 
       (.I(data_out_OBUF[0]),
        .O(data_out[0]));
  OBUF \data_out_OBUF[1]_inst 
       (.I(data_out_OBUF[1]),
        .O(data_out[1]));
  OBUF \data_out_OBUF[2]_inst 
       (.I(data_out_OBUF[2]),
        .O(data_out[2]));
  OBUF \data_out_OBUF[3]_inst 
       (.I(data_out_OBUF[3]),
        .O(data_out[3]));
  OBUF \data_out_OBUF[4]_inst 
       (.I(data_out_OBUF[4]),
        .O(data_out[4]));
  OBUF \data_out_OBUF[5]_inst 
       (.I(data_out_OBUF[5]),
        .O(data_out[5]));
  OBUF \data_out_OBUF[6]_inst 
       (.I(data_out_OBUF[6]),
        .O(data_out[6]));
  OBUF \data_out_OBUF[7]_inst 
       (.I(data_out_OBUF[7]),
        .O(data_out[7]));
  uart_rx receiver_1
       (.Q(data_out_OBUF),
        .Rx_en_IBUF(Rx_en_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .clk_Rx(clk_Rx),
        .rst_IBUF(rst_IBUF),
        .signal(signal));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  uart_tx transmitter_1
       (.Tx_en_IBUF(Tx_en_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .clk_Tx(clk_Tx),
        .data_in_IBUF(data_in_IBUF),
        .rst_IBUF(rst_IBUF),
        .signal(signal));
endmodule

module uart_tx
   (signal,
    clk_IBUF_BUFG,
    rst_IBUF,
    clk_Tx,
    Tx_en_IBUF,
    data_in_IBUF);
  output signal;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input clk_Tx;
  input Tx_en_IBUF;
  input [7:0]data_in_IBUF;

  wire \FSM_sequential_state[0]_i_1__0_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state_reg_n_0_[0] ;
  wire \FSM_sequential_state_reg_n_0_[1] ;
  wire Tx_data_out3_out;
  wire Tx_data_out_i_1_n_0;
  wire Tx_data_out_i_4_n_0;
  wire Tx_data_out_i_5_n_0;
  wire Tx_data_out_reg_i_2_n_0;
  wire Tx_en_IBUF;
  wire \bit_index[0]_i_1__0_n_0 ;
  wire \bit_index[1]_i_1__0_n_0 ;
  wire \bit_index[2]_i_1__0_n_0 ;
  wire \bit_index[3]_i_1__0_n_0 ;
  wire \bit_index[3]_i_2__0_n_0 ;
  wire \bit_index_reg_n_0_[0] ;
  wire \bit_index_reg_n_0_[1] ;
  wire \bit_index_reg_n_0_[2] ;
  wire \bit_index_reg_n_0_[3] ;
  wire clk_IBUF_BUFG;
  wire clk_Tx;
  wire \data_buffer[7]_i_1_n_0 ;
  wire \data_buffer[7]_i_2__0_n_0 ;
  wire \data_buffer_reg_n_0_[0] ;
  wire \data_buffer_reg_n_0_[1] ;
  wire \data_buffer_reg_n_0_[2] ;
  wire \data_buffer_reg_n_0_[3] ;
  wire \data_buffer_reg_n_0_[4] ;
  wire \data_buffer_reg_n_0_[5] ;
  wire \data_buffer_reg_n_0_[6] ;
  wire \data_buffer_reg_n_0_[7] ;
  wire [7:0]data_in_IBUF;
  wire rst_IBUF;
  wire signal;

  LUT5 #(
    .INIT(32'h00FFE200)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(Tx_en_IBUF),
        .I1(\FSM_sequential_state_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[3] ),
        .I3(clk_Tx),
        .I4(\FSM_sequential_state_reg_n_0_[0] ),
        .O(\FSM_sequential_state[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state_reg_n_0_[0] ),
        .I1(clk_Tx),
        .I2(\FSM_sequential_state_reg_n_0_[1] ),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00,START:01,STOP:11,DATA:10" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\FSM_sequential_state[0]_i_1__0_n_0 ),
        .Q(\FSM_sequential_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "IDLE:00,START:01,STOP:11,DATA:10" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(\FSM_sequential_state_reg_n_0_[1] ));
  LUT6 #(
    .INIT(64'hFDC1FFFFFDC10000)) 
    Tx_data_out_i_1
       (.I0(Tx_en_IBUF),
        .I1(\FSM_sequential_state_reg_n_0_[1] ),
        .I2(\FSM_sequential_state_reg_n_0_[0] ),
        .I3(Tx_data_out_reg_i_2_n_0),
        .I4(Tx_data_out3_out),
        .I5(signal),
        .O(Tx_data_out_i_1_n_0));
  LUT4 #(
    .INIT(16'hA2AA)) 
    Tx_data_out_i_3
       (.I0(clk_Tx),
        .I1(\bit_index_reg_n_0_[3] ),
        .I2(\FSM_sequential_state_reg_n_0_[0] ),
        .I3(\FSM_sequential_state_reg_n_0_[1] ),
        .O(Tx_data_out3_out));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Tx_data_out_i_4
       (.I0(\data_buffer_reg_n_0_[3] ),
        .I1(\data_buffer_reg_n_0_[2] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\data_buffer_reg_n_0_[1] ),
        .I4(\bit_index_reg_n_0_[0] ),
        .I5(\data_buffer_reg_n_0_[0] ),
        .O(Tx_data_out_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    Tx_data_out_i_5
       (.I0(\data_buffer_reg_n_0_[7] ),
        .I1(\data_buffer_reg_n_0_[6] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\data_buffer_reg_n_0_[5] ),
        .I4(\bit_index_reg_n_0_[0] ),
        .I5(\data_buffer_reg_n_0_[4] ),
        .O(Tx_data_out_i_5_n_0));
  FDPE #(
    .INIT(1'b1)) 
    Tx_data_out_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(Tx_data_out_i_1_n_0),
        .PRE(rst_IBUF),
        .Q(signal));
  MUXF7 Tx_data_out_reg_i_2
       (.I0(Tx_data_out_i_4_n_0),
        .I1(Tx_data_out_i_5_n_0),
        .O(Tx_data_out_reg_i_2_n_0),
        .S(\bit_index_reg_n_0_[2] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0B0A)) 
    \bit_index[0]_i_1__0 
       (.I0(\FSM_sequential_state_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\FSM_sequential_state_reg_n_0_[1] ),
        .O(\bit_index[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h283C2828)) 
    \bit_index[1]_i_1__0 
       (.I0(\FSM_sequential_state_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[3] ),
        .I4(\FSM_sequential_state_reg_n_0_[1] ),
        .O(\bit_index[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h28883CCC28882888)) 
    \bit_index[2]_i_1__0 
       (.I0(\FSM_sequential_state_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[2] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[3] ),
        .I5(\FSM_sequential_state_reg_n_0_[1] ),
        .O(\bit_index[2]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h2A)) 
    \bit_index[3]_i_1__0 
       (.I0(clk_Tx),
        .I1(\FSM_sequential_state_reg_n_0_[1] ),
        .I2(\FSM_sequential_state_reg_n_0_[0] ),
        .O(\bit_index[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAC0002AAA8000)) 
    \bit_index[3]_i_2__0 
       (.I0(\FSM_sequential_state_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[2] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\bit_index_reg_n_0_[3] ),
        .I5(\FSM_sequential_state_reg_n_0_[1] ),
        .O(\bit_index[3]_i_2__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_index[3]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_index[0]_i_1__0_n_0 ),
        .Q(\bit_index_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_index[3]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_index[1]_i_1__0_n_0 ),
        .Q(\bit_index_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_index[3]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_index[2]_i_1__0_n_0 ),
        .Q(\bit_index_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_index_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_index[3]_i_1__0_n_0 ),
        .CLR(rst_IBUF),
        .D(\bit_index[3]_i_2__0_n_0 ),
        .Q(\bit_index_reg_n_0_[3] ));
  LUT4 #(
    .INIT(16'h4000)) 
    \data_buffer[7]_i_1 
       (.I0(rst_IBUF),
        .I1(clk_Tx),
        .I2(\FSM_sequential_state_reg_n_0_[1] ),
        .I3(\FSM_sequential_state_reg_n_0_[0] ),
        .O(\data_buffer[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000A400)) 
    \data_buffer[7]_i_2__0 
       (.I0(\FSM_sequential_state_reg_n_0_[0] ),
        .I1(Tx_en_IBUF),
        .I2(\FSM_sequential_state_reg_n_0_[1] ),
        .I3(clk_Tx),
        .I4(rst_IBUF),
        .O(\data_buffer[7]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_buffer_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_buffer[7]_i_2__0_n_0 ),
        .D(data_in_IBUF[0]),
        .Q(\data_buffer_reg_n_0_[0] ),
        .R(\data_buffer[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_buffer_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_buffer[7]_i_2__0_n_0 ),
        .D(data_in_IBUF[1]),
        .Q(\data_buffer_reg_n_0_[1] ),
        .R(\data_buffer[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_buffer_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_buffer[7]_i_2__0_n_0 ),
        .D(data_in_IBUF[2]),
        .Q(\data_buffer_reg_n_0_[2] ),
        .R(\data_buffer[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_buffer_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_buffer[7]_i_2__0_n_0 ),
        .D(data_in_IBUF[3]),
        .Q(\data_buffer_reg_n_0_[3] ),
        .R(\data_buffer[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_buffer_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_buffer[7]_i_2__0_n_0 ),
        .D(data_in_IBUF[4]),
        .Q(\data_buffer_reg_n_0_[4] ),
        .R(\data_buffer[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_buffer_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_buffer[7]_i_2__0_n_0 ),
        .D(data_in_IBUF[5]),
        .Q(\data_buffer_reg_n_0_[5] ),
        .R(\data_buffer[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_buffer_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_buffer[7]_i_2__0_n_0 ),
        .D(data_in_IBUF[6]),
        .Q(\data_buffer_reg_n_0_[6] ),
        .R(\data_buffer[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_buffer_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_buffer[7]_i_2__0_n_0 ),
        .D(data_in_IBUF[7]),
        .Q(\data_buffer_reg_n_0_[7] ),
        .R(\data_buffer[7]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
