# PIN Lock System Using Verilog

## Project Overview

This project implements a digital PIN lock system using Finite State Machines (FSMs) in Verilog HDL. Two implementations are developed to understand the difference between Moore and Mealy FSMs.

## 1. Moore FSM Lock

* **Concept:** Moore Finite State Machine
* **Input sequence:** `1011`
* **Output:** The lock opens when the complete sequence `1011` is detected.
* **Output dependency:** The output depends only on the current state.
* **States:** Five states representing the progress of sequence detection.

### Expected Behavior

* `open = 1`, `close = 0` when the FSM reaches the unlocked state.
* Otherwise, `open = 0`, `close = 1`.

## 2. Mealy FSM Lock

* **Concept:** Mealy Finite State Machine
* **Input sequence:** `1010`
* **Output:** The lock opens when the complete sequence `1010` is detected.
* **Output dependency:** The output depends on both the current state and the current input.
* **States:** Four states representing the progress of sequence detection.

### Expected Behavior

* `open = 1`, `close = 0` when the final `0` completes the sequence `1010`.
* Otherwise, `open = 0`, `close = 1`.

## Tools Used

* Verilog HDL
* Icarus Verilog
* EDA Playground
* EPWave waveform viewer

## Verification

Both designs are verified using Verilog testbenches.

The testbenches provide clock, reset, and serial input values. Simulation output and waveforms are used to verify sequence detection and lock outputs.

## Key Learning Outcomes

* Understanding Moore and Mealy FSMs.
* Designing state transitions using Verilog.
* Implementing asynchronous active-high reset.
* Writing testbenches for sequential circuits.
* Verifying outputs through simulation and waveform analysis.
* Understanding how FSM output logic differs between Moore and Mealy designs.

## Future Improvements

* Use the same PIN sequence for both implementations for a direct comparison.
* Add support for overlapping input sequences.
* Add an incorrect-PIN handling mechanism.
* Extend the design to support a configurable PIN sequence.

## Author

ECE Student | VLSI and SoC Design Learner

