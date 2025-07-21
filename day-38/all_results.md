

# 📘 Verilog 100 Days – Waveform and Explanation Gallery

This document shows the waveform results and brief explanations of Booth Multiplier

---

## ✅ Day 38 - Booth Multiplier

 

![Arithmetic Logic Unit](./images/booth_schematic.png)

**Description:**  
  the scematic of Booth Multiplier




### 🔬 Simulation Result

![Simulation Waveform](./images/booth_sim.png)

**Description:**  
simulation results.
simualtion results of Booth Multiplier


**Working Explaintion**


# Booth Multiplier (4-bit × 4-bit) – Verilog Implementation

 a **4-bit Booth Multiplier** in Verilog. Booth's algorithm is an efficient technique for multiplying binary numbers in **2's complement representation**, and it reduces the number of addition/subtraction operations using **bit-pair encoding**.

## 📌 Features

- Handles **signed multiplication** using Booth’s algorithm.
- Inputs:
- all should be in 2's compliment value.
  - 4-bit multiplicand `a`
  - 4-bit multiplier `b`
  - Control input `n` specifying the number of iterations
  - Clock and Reset signals
- Outputs:
  - 8-bit product `p`

## 🛠️ Files

- `booth_multiplier.v` – Verilog module implementing Booth’s multiplication logic.
- (Add testbench file name here if you create one, e.g., `booth_multiplier_tb.v`)

---

## 📘 How Booth Algorithm Works (in this implementation)

### Step-by-Step

1. **Initialization** (on `rst` high):
   - `reg_q` stores multiplier `b`
   - `reg_p` initialized to 0
   - `qn` (previous LSB of `reg_q`) initialized to 0
   - `count` initialized to `n` (typically 4 for 4-bit numbers)

2. **Each clock cycle** performs the following:
   - Based on the last two bits (`reg_q[0]` and `qn`), one of three actions is taken:
     - **00 or 11** → Arithmetic Shift Right (ASR) only.
     - **10** → Add `a` to `reg_p`, then ASR.
     - **01** → Add `-a` (2's complement of `a`) to `reg_p`, then ASR.
   - Sign bit of `reg_p` is preserved on shift using:  
     `reg_p[3] <= reg_p[3];`
   - `qn` updated with `reg_q[0]`
   - `count` decremented.

3. **Termination**:
   - After all iterations, final result is `{reg_p, reg_q}` stored in output `p`.

---
This is the video i reffered -  `https://www.youtube.com/watch?v=cWfaw7b3jKY`

## 🧮 Example

To multiply `a = 4'b0011 (3)` and `b = 4'b0100 (4)`:


here b is stored in q(reg_q) , p is 0 and 
the reg_q lsb and qn+1(qn) is compared .
if it is 
00/11 - then just arthematic right shift
01 - then a = a - b (reg_p = reg_p + a) and then arthematic right shift
10 - then a = a + b (reg_p = reg_p + c) and tehn arthematic right shift
and use count which represents the number of bits , until it becomes the 0 the process will take place.



