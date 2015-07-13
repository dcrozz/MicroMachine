# MipsCPU 
A single cycle CPU running on Xilinx Spartan-6 XC6LX16-CS324, supporting 31 MIPS instructions.

• 31 MIPS instructions.
• Single Cycle, without interruptions and exceptions(maybe add these features later).

Instructions:

•  R-Type: ADD, ADDU, SUB, SUBU, AND, OR, XOR, NOR, SLT, SLTU, SLL, SLLV, SRL, SRLV, SRA, SRAV, JR 
•  I-Type: ADDI, ADDIU, ANDI, ORI, XORI, LW, SW, BEQ, BNE, SLTI, SLTIU, LUI 
•  J-Type: J, JAL 

MIPS Instruction specifications: MIPS32 Architecture for Programmers(English, PDF Format)

Reference book: 《计算机原理与设计——Verilog HDL版》(Chinese, PDF Format)

FPGA Information: Xilinx Spartan-6 XC6LX16-CS324

.mips function:
• feature a countdown with the time you set at the beginning
• bonus -- a boooring game featured bt the countdown that can test you conscience of time
