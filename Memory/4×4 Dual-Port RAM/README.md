# Dual-Port RAM using Verilog

## Project Description

Designed and simulated a 4×4 Dual-Port RAM using Verilog HDL. The memory has two independent ports (Port A and Port B), allowing both ports to access the same memory.

## Features

- 4 memory locations, each storing 4 bits.
- Two independent read/write ports.
- Synchronous write operation.
- Asynchronous read operation.
- Asynchronous active-high reset.
- Both ports can write to different memory locations simultaneously.

## Port Details

| Signal | Description |
|---|---|
| clk | Clock input |
| reset | Active-high reset |
| we_a | Port A write enable |
| we_b | Port B write enable |
| addr_a | Port A address (2 bits) |
| addr_b | Port B address (2 bits) |
| din_a | Port A data input (4 bits) |
| din_b | Port B data input (4 bits) |
| dout_a | Port A data output (4 bits) |
| dout_b | Port B data output (4 bits) |

## Memory Organization

- Total memory size: 16 bits
- Number of locations: 4
- Data width: 4 bits
- Address width: 2 bits

## Simulation and Testing

The design was simulated using Icarus Verilog and EPWave.

The following operations were verified:

1. Port A writes data and Port B reads it.
2. Port B writes data and Port A reads it.
3. Both ports access different memory locations.
4. Both ports can write to different addresses simultaneously.

## Tools Used

- Verilog HDL
- EDA Playground
- Icarus Verilog
- EPWave

## Learning Outcome

Learned how dual-port memory works, how two independent ports access shared memory, and the difference between synchronous write and asynchronous read operations.
