# Cache Memory Design Using Verilog

## Overview
This project implements a simple Direct-Mapped Cache Memory using Verilog HDL.

The design demonstrates how a cache stores frequently accessed data and how the processor can identify cache hits and misses.

## Specifications
- Main Memory: 16 locations
- Address Width: 4 bits
- Cache Lines: 4
- Data Width: 4 bits
- Mapping Technique: Direct Mapping
- Valid Bit: Used to identify valid cache entries
- Tag Comparison: Used to detect cache hits and misses

## Features
- Cache hit and miss detection
- Data retrieval from cache
- Cache line replacement on a miss
- Valid bit management
- Hit counter and miss counter
- Total memory access counter
- Hit ratio and miss ratio calculation

## Working Principle
1. The processor provides a 4-bit memory address.
2. The address is divided into tag and index fields.
3. The index selects a cache line.
4. The valid bit and stored tag are checked.
5. If the tag matches and the line is valid, a cache hit occurs.
6. Otherwise, a cache miss occurs, and data is loaded from main memory into the cache.

## Performance Calculation
- Hit Ratio = Hit Count / Total Accesses
- Miss Ratio = Miss Count / Total Accesses

## Simulation
The design was tested using a Verilog testbench.

The simulation checks:
- Cache hit conditions
- Cache miss conditions
- Cache line replacement
- Hit and miss counters
- Hit and miss ratios

## Tools Used
- Verilog HDL
- EDA Playground
- Icarus Verilog
- EPWave

## Project Structure
- `cache.v` – Cache memory design
- `tb.v` – Testbench for simulation

## Result
The cache memory design was successfully simulated and tested for different memory access patterns. Hit and miss statistics were also calculated using the testbench.
