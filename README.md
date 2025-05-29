# intro2riscV
## Recommended Order
1- Learn Verilog basics by doing EHB_436E: Experiments 1-8 

  - This will teach you how to write Verilog using Xilinx Vivado (you can find "how to" download instructions in the documentation or first experiments in the EHB_436E_SSTU folder) by giving you tasks about both Combinational and Sequential Logic.

2- Learn advanced Verilog and Digital Design basics by doing EHB_436E: Project_1, Project_2, Final_Project 

  - This will teach you the basics of Combinational and Sequential Logic design and general digital design methodology. 
  - By completely understanding the projects, you become completely capable of writing any Verilog code.
  - FSM (Finite State Machine)
  - Learn the simulation part carefully and try self-checking tesbenches 

3- EHB_425E: Learn basics of RISC-V
  - Firstly, practice ASM. In the presentations, you can find the general microprocessor methodology and design principles (Datapath - Control). Deep dive into RISC-V. Recommended to go by:
    - Memory structures
    - ISA (Instruction Set Architecture) and the general knowledge about different ISAs of RISC-V like RV32I, RV32IM, RV32F...
    - ALU (Arithmetic Logic Unit) design principles
  - Now you are ready for VLSI-II(Very Large Scale Integration - II) homeworks. You can skip the first 2 if you don't want to learn the CMOS technologies.
    - In this part, only use Vivado not any other programs are necessary for learning RISC-V. For synthesis and simulation, Vivado would be more than enough.
    - HW3: ISA
    - HW4: Memory types of RISC-V,
    - HW5: ALU and Function Unit (Datapath)
    - HW6: Control
    - HW7: Pipeline
    - HW8: Hazards
    - NOTE: To begin with, the simple projects HW7-HW8 are not required. They are advance optimizations that almost all of the RISC-V designs uses. However, to begin with basic understandings, it is not required primarily. But don't forget that without completing them, it is not possible to understand the RISC-V compeletely.
