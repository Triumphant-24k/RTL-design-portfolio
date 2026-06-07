# FIFO Buffer (Verilog HDL)

## Overview

This project implements an 8×8 Synchronous FIFO (First-In First-Out) Buffer using Verilog HDL.

A FIFO is a memory structure that stores data in the order it is received. The first data written into the FIFO is the first data read out. FIFOs are widely used in digital systems for buffering, data transfer, and clock domain interfacing.

The design has been implemented and verified using ModelSim simulation.

---

## Project Objective

The objective of this project is to understand and implement a memory-based buffering system capable of:

- Storing incoming data
- Maintaining data order
- Managing read and write operations
- Tracking FIFO occupancy
- Generating Full and Empty status flags

---

## Features

- 8-bit Data Width
- 8-Entry FIFO Depth
- Synchronous Read and Write Operations
- Internal Memory Array
- Read Pointer Management
- Write Pointer Management
- Occupancy Counter
- Full Flag Generation
- Empty Flag Generation
- Fully Verified Using ModelSim

---

## FIFO Architecture

The FIFO uses an internal memory array:

```verilog
reg [7:0] mem [0:7];
```

This provides:

- 8 storage locations
- 8-bit data width per location
- Total storage capacity of 64 bits

### Internal Components

| Component | Function |
|------------|-----------|
| Memory Array | Stores FIFO data |
| Write Pointer | Points to next write location |
| Read Pointer | Points to next read location |
| Counter | Tracks FIFO occupancy |
| Full Flag | Indicates FIFO is full |
| Empty Flag | Indicates FIFO is empty |

---

## FIFO Operation

### Write Operation

When:

```text
write_en = 1
full = 0
```

The FIFO performs:

```verilog
mem[write_ptr] <= data_in;
```

and:

```text
write_ptr = write_ptr + 1
count = count + 1
```

---

### Read Operation

When:

```text
read_en = 1
empty = 0
```

The FIFO performs:

```verilog
data_out <= mem[read_ptr];
```

and:

```text
read_ptr = read_ptr + 1
count = count - 1
```

---

## Example Operation

### Data Written

```text
10
20
30
```

FIFO Contents:

```text
Address   Data
----------------
0         10
1         20
2         30
```

### Data Read

```text
10
20
30
```

The data is read in the same order it was written.

This demonstrates FIFO behavior:

```text
First In → First Out
```

---

## File Structure

```text
FIFO_Buffer/
│
├── fifo.v
├── fifo_tb.v
├── waveform.png
└── README.md
```

| File | Description |
|--------|-------------|
| fifo.v | FIFO RTL Design |
| fifo_tb.v | Testbench |
| waveform.png | ModelSim Simulation Result |
| README.md | Project Documentation |

---

## Simulation Waveform

The FIFO was verified using ModelSim simulation.

The waveform demonstrates:

- Data writes into the FIFO
- Data reads from the FIFO
- Pointer movement
- Occupancy count updates
- Empty flag operation
- Correct FIFO ordering

![FIFO Simulation](waveform.png)

---

## Verification Results

### Write Sequence

```text
10
20
30
```

### Read Sequence

```text
10
20
30
```

### Pointer Activity

```text
write_ptr:
0 → 1 → 2 → 3

read_ptr:
0 → 1 → 2 → 3
```

### Count Activity

```text
0 → 1 → 2 → 3
3 → 2 → 1 → 0
```

### Status Flags

```text
empty:
1 → 0 → 1

full:
0 throughout simulation
```

---

## Applications

FIFO Buffers are widely used in:

- UART Communication
- SPI Communication
- I²C Communication
- Processor Pipelines
- DMA Controllers
- Network Interfaces
- FPGA Designs
- SoC Architectures

---

## Learning Outcomes

Through this project I gained practical experience in:

- Memory Array Design
- Sequential Logic Design
- Read/Write Pointer Management
- FIFO Architecture
- Status Flag Generation
- RTL Design Using Verilog
- Testbench Development
- Waveform Analysis and Debugging

---

## Future Improvements

Possible enhancements include:

- Circular Buffer Implementation
- Simultaneous Read/Write Support
- Parameterized FIFO Depth
- Parameterized Data Width
- Asynchronous FIFO
- Gray Code Pointer Synchronization
- FPGA Implementation

---

## Tools Used

- Verilog HDL
- ModelSim Intel FPGA Starter Edition
- GitHub

---

## Author

**Vanni Kannan**

Electronics & Communication Engineering Student

Aspiring RTL Design & VLSI Engineer

GitHub: https://github.com/Triumphant-24k
