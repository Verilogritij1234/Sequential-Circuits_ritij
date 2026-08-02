Repository Name: sequential-logic-asic-portfolio
Repository Description: A professional portfolio of sequential digital logic circuits—ranging from fundamental flip-flops to complex FSMs—featuring Verilog RTL, testbenches, and open-source ASIC physical design flows (Yosys/OpenROAD).

-----------------------------------------------------------------------------

# Sequential Logic & FSM Design Portfolio 🔄

This repository contains a curated collection of sequential digital logic circuits and Finite State Machine (FSM) designs implemented in Verilog. It demonstrates a complete progression from fundamental state-retaining elements (latches/flip-flops) to fully realized practical applications. 

Designed with an ASIC workflow in mind, this repository includes not only the Register Transfer Level (RTL) code and simulation testbenches, but also logic synthesis netlists and physical design layouts (Place and Route) generated using open-source EDA tools.

## 📂 Repository Structure & Implemented Modules

### 1. Fundamental Sequential Elements (Root Directory)
Contains the building blocks of sequential logic design and clock management.
*   **Flip-Flops & Latches:** `SR_Latch.v`, `T_flip_flop.v`
*   **Counters:** `4_bit_ripple_counter.v`
*   **Clocking:** `clock_gen.v` (Clock generation utilities for testbenches)
*   *Note: Each module includes corresponding testbenches (`_tb.v`) and simulation output logs (`.out`, `.vvp`).*

### 2. Finite State Machines: `5_Vending_Machine`
A practical application of a Moore/Mealy FSM modeling a digital vending machine controller.
*   **RTL:** `vend.v`
*   **ASIC Flow Outputs:** Includes Yosys/OpenROAD artifacts targeting standard cell libraries, such as synthesized netlists (`vend_sky_netlist.json`, `netlist_sky_vend.v`, `pnr_netlist_vend.v`) and physical layout definitions (`vend.def`).
*   **Automation:** `my_flow.tcl` script for executing the PnR pipeline.

### 3. Advanced Counters & Registers: `Gray counter and gray encoders`
Focuses on specialized counting sequences and data shifting to minimize switching activity and prevent transient states.
*   **Gray Code Logic:** `4_bit_gray_counter.v`, `4_bit_gray_encoder.v`, `4_bit_gray_decoder.v`
*   **Registers:** `SHIFT_REGISTER.v`
*   **ASIC Flow Outputs:** Physical design definition files (`4_bit_gray_encoder.def`) and skywater synthesis netlists (`4_bit_gray_encoder_sky_netlist.json`).
*   **Automation:** `my.tcl` for driving the physical design flow.

## 💻 Toolchain & Prerequisites

To simulate the RTL and run the physical design flows, you will need:

*   **Simulation & Verification:** Icarus Verilog (`iverilog`) and GTKWave (for `.vcd` waveform inspection).
*   **Logic Synthesis:** Yosys (Generates `.json` and gate-level `.v` netlists).
*   **Physical Design (PnR):** OpenROAD (Executes `.tcl` scripts to generate `.def` macro layouts).

## 🚀 Usage 

### Running RTL Simulations
Navigate to any directory and compile the Verilog source alongside its dedicated testbench.
```bash
# Example for simulating the T Flip-Flop
iverilog -o tff_sim T_flip_flop.v T_flip_flop_tb.v
vvp tff_sim
```

### Executing the ASIC Flow
For directories containing TCL scripts (like the Vending Machine or Gray Encoder), you can automate the logic synthesis and physical design stages:
```bash
cd 5_Vending_Machine
openroad my_flow.tcl
```
*Ensure your environment is configured for the target Process Design Kit (e.g., Sky130) before executing the TCL scripts.*
