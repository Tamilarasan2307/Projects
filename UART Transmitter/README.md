# UART Transmitter using Verilog

## Overview
This project implements a basic UART (Universal Asynchronous Receiver Transmitter) transmitter using Verilog HDL.

The transmitter converts 8-bit parallel data into serial data and sends it through the TX output line.

## Features
- 8-bit parallel data input
- Serial data transmission through TX
- Start bit (LOW)
- 8 data bits transmitted LSB first
- Stop bit (HIGH)
- TX busy status indication
- Asynchronous active-high reset
- Supports multiple data transmissions

## Module Inputs and Outputs

| Signal | Direction | Description |
|---|---|---|
| data_in [7:0] | Input | 8-bit parallel data |
| tx_start | Input | Starts transmission |
| clk | Input | System clock |
| reset | Input | Active-high reset |
| tx | Output | Serial data output |
| tx_busy | Output | Indicates transmission status |

## Simulation

The design was simulated using Icarus Verilog.

The testbench verifies:
- Transmission of `11110000`
- Transmission of `10101010`
- Serial data output
- TX busy status
- Reset operation during transmission

## Example Output

For input data `11110000`, the transmitter sends the data bits in LSB-first order:

```text
Start Bit : 0
Data Bits : 0 0 0 0 1 1 1 1
Stop Bit  : 1
```

## Tools Used
- Verilog HDL
- Icarus Verilog
- EDA Playground
- EPWave

## Note
This is a basic UART transmitter implementation. It currently sends one bit per system clock cycle and does not yet include a baud-rate generator.
