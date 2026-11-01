# Verilog Vending Machine

## About the Project
Designed a vending machine using Verilog HDL and FSM.

The machine accepts 5-unit and 10-unit coins. When the total amount reaches 20 units, it dispenses the product. If the amount exceeds 20, the extra amount is returned.

## Features
- Accepts 5-unit and 10-unit coins.
- Product price is 20 units.
- Uses a 4-state FSM.
- Supports reset.
- Dispenses the product and returns extra amount.

## Tools Used
- Verilog HDL
- Icarus Verilog
- EDA Playground
- EPWave

## Files
- `VMS.v` – Design code
- `tb.v` – Testbench
- `VMS.vcd` – Simulation waveform

## Simulation Results
- 5 + 5 + 5 + 5 = 20 → Dispense
- 10 + 10 = 20 → Dispense
- 5 + 10 + 10 = 25 → Dispense + Return 5

## Concepts Learned
- FSM Design
- Verilog HDL
- Combinational and Sequential Logic
- Testbench Writing
- Simulation and Waveform Analysis
