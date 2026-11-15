# Direct-Mapped Cache Memory using Verilog

## Project Overview
This project implements a simple **Direct-Mapped Cache Memory** using Verilog HDL.

The cache stores frequently accessed data from main memory to reduce access time. When the requested data is available in the cache, a cache hit occurs. Otherwise, a cache miss occurs, and the data is fetched from main memory and stored in the cache.

## Design Specifications
- **Main Memory:** 16 locations
- **Data Width:** 4 bits
- **Cache Size:** 4 cache lines
- **Address Width:** 4 bits
- **Cache Mapping:** Direct-Mapped
- **Tag Width:** 2 bits
- **Index Width:** 2 bits
- **Offset:** Not used (one data value per cache line)

## Working Principle

1. The CPU provides a 4-bit address.
2. The address is divided into Tag and Index fields.
3. The Index selects the corresponding cache line.
4. The Valid bit checks whether the selected cache line contains valid data.
5. The stored Tag is compared with the requested Tag.
6. If both Tags match and the Valid bit is set, a **Cache Hit** occurs.
7. Otherwise, a **Cache Miss** occurs. Data is fetched from main memory and stored in the selected cache line.

## Signals

| Signal | Description |
|---|---|
| `clk` | Clock input |
| `reset` | Resets the cache valid bits |
| `address` | 4-bit memory address |
| `hit` | Indicates a cache hit |
| `miss` | Indicates a cache miss |
| `dout` | 4-bit output data |

## Tools Used
- Verilog HDL
- EDA Playground
- Icarus Verilog
- EPWave (Waveform Viewer)

## Simulation and Testing

The design is tested using a Verilog testbench.

The testbench verifies:
- Initial cache miss
- Cache hit for a repeated address
- Cache miss due to Tag mismatch
- Cache line replacement
- Reading updated data after replacement

## Project Files
- `cache.v` – Cache memory design
- `tb.v` – Testbench for simulation
