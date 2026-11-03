# 4x4 Register File using Verilog

## Description
Designed a 4x4 Register File using Verilog with one write port and two independent read ports.

## Features
- Four 4-bit registers (16-bit total storage).
- Synchronous write operation.
- Write enable control.
- Asynchronous reset.
- Two simultaneous asynchronous read operations.
- Two 4:1 multiplexers for register selection.

## Inputs
- `clk` – Clock signal
- `reset` – Reset signal
- `we` – Write enable
- `wr_addr` – Write address
- `wr_data` – Input data
- `rd_addr1` – First read address
- `rd_addr2` – Second read address

## Outputs
- `data1` – First read data
- `data2` – Second read data

## Register Mapping

| Address | Register |
|---|---|
| 00 | R0 |
| 01 | R1 |
| 10 | R2 |
| 11 | R3 |

## Simulation Results

| Register | Written Data |
|---|---|
| R0 | 0110 |
| R1 | 0111 |
| R2 | 1000 |
| R3 | 1001 |

**Read Port Results:**

| Read Address 1 | Read Address 2 | Data 1 | Data 2 |
|---|---|---|---|
| 00 | 01 | 0110 | 0111 |
| 10 | 11 | 1000 | 1001 |

## Tools Used
- Verilog HDL
- EDA Playground
- Icarus Verilog
- EPWave

## Learning Outcomes
- Understanding Register File architecture.
- Implementing synchronous write operations.
- Implementing asynchronous read operations.
- Using 4:1 multiplexers for register selection.
- Designing and verifying a dual-read-port Register File.
