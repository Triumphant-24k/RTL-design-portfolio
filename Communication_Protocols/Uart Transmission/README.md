# UART Transmitter (Verilog HDL)

## Overview

This project implements a UART (Universal Asynchronous Receiver Transmitter) Transmitter using Verilog HDL.

The design serializes 8-bit parallel input data and transmits it according to the UART protocol using:

- 1 Start Bit
- 8 Data Bits
- 1 Stop Bit

The design is based on a Finite State Machine (FSM) and has been verified using ModelSim simulation.

---

## Features

- FSM-based UART transmission
- 8-bit parallel-to-serial conversion
- Start bit generation
- Stop bit generation
- Baud-rate timing control
- Busy flag indication
- Fully verified through simulation

---

## UART Frame Format

```
| Start | D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | Stop |
|   0   |                Data                |   1   |
```

Data bits are transmitted LSB first.

---

## Test Case

Input Data:

```text
10101010
```

Expected Transmission:

```text
Start = 0
Data  = 0 1 0 1 0 1 0 1
Stop  = 1
```

---

## Simulation Result

![UART Waveform](image.png)

The waveform confirms:

- Correct Start Bit generation
- Sequential transmission of all 8 data bits
- Proper Stop Bit generation
- Correct FSM state transitions
- Successful UART frame transmission

---

## Files

| File | Description |
|--------|------------|
| uart.v | UART Transmitter RTL Design |
| uart_tb.v | Testbench |
| image.png | ModelSim Simulation Waveform |
| README.md | Project Documentation |

---

## Tools Used

- Verilog HDL
- ModelSim
- GitHub

---

## Skills Demonstrated

- RTL Design
- Finite State Machines (FSM)
- Serial Communication Protocols
- Digital Logic Design
- Verification & Testbench Development
- Waveform Analysis

---

## Author

**Sriram Kannan**

Aspiring RTL Design Engineer | FPGA & Digital Design Enthusiast
