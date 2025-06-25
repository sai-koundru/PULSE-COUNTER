# PULSE-COUNTER

# ⏱️ Pulse Counter in Verilog

This project implements a **pulse duration counter** in Verilog. It monitors an external `start` signal and generates a high pulse (`op_sig`) when the signal has remained high for **10 consecutive clock cycles**.

---

## 📘 Project Description

The module `pulse_counter` is a **sequential circuit** that:
- Monitors the `start` signal
- Increments an internal counter for each clock cycle `start` remains high
- Once the count reaches 10, `op_sig` pulses high for 1 clock cycle
- The counter resets when `start` goes low or when `rst` is asserted

---

## 🔁 Functionality

| Signal     | Direction | Description                                 |
|------------|-----------|---------------------------------------------|
| `clk`      | Input     | System clock                                |
| `start`    | Input     | Active-high signal to begin counting        |
| `rst`      | Input     | Asynchronous reset                          |
| `op_sig`   | Output    | High pulse when `start` is high for 10 clocks |

---

## 📂 Project Files

| File Name         | Description                               |
|------------------|-------------------------------------------|
| `pulse_counter.v` | Core Verilog design of the pulse counter  |
| `tb_pulse_counter.v` | Testbench simulating realistic behavior |

---

## 🧪 Simulation Logic (Testbench)

The testbench simulates:
- Reset phase
- Two separate `start` phases: 5 clocks each
- Ensures output `op_sig` is high only after 10 valid clock cycles of `start`

```verilog
// Pseudo waveform
start:  ___-------_______--------____
op_sig: ______________________----___
