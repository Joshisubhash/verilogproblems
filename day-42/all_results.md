
# 📘 Verilog 100 Days – Waveform and Explanation Gallery

This document shows the waveform results and brief explanations of floating point adder

---

## ✅ Day 42 - floating point adder

 

![floating point adder](./images/fp_schematic.png)

**Description:**  
  the scematic of floating point adder

 
### 🔬 Simulation Result

![Simulation Waveform](./images/fp_sim.png)

**Description:** 
simualtion results of floating point adder

**Description**
explaination of code
# 🧮 Verilog Floating Point Adder (10-bit)

This project implements a **10-bit Floating Point Adder** in Verilog using a Finite State Machine (FSM). It handles addition and subtraction of two floating-point numbers represented in a custom format with exponent biasing and implicit leading bits.

---

## 🔧 Floating Point Format

| Bit Index | Field     | Width | Description              |
|-----------|-----------|-------|--------------------------|
| [9]       | Sign      | 1     | 0 = positive, 1 = negative |
| [8:5]     | Exponent  | 4     | Biased with value 7       |
| [4:0]     | Mantissa  | 5     | Assumes leading 1         |

The effective value of a number is:


---

## ⚙️ FSM Workflow

| State | Description |
|-------|-------------|
| 0 | Unpacks `a` and `b`, separates sign, exponent, mantissa, applies implicit `1` |
| 1 | Aligns mantissas based on exponent difference |
| 2 | Performs addition or subtraction based on sign |
| 3 | Normalizes result if required, assembles final result |
| 4 | Outputs final floating point number |
| 5 | Left-shift normalization for denormal results (after subtraction) |
---
 
