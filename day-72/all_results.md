

# 📘 Verilog 100 Days – Waveform and Explanation Gallery

This document shows the waveform results and brief explanations of d_ff checking with test bench to check dut

---

## ✅ Day 70 - d_ff checking with test bench to check dut

![D_ff](./images/tb_d_scematic.png)
 

**Description:**  
# run 1000ns<br>
Time	D	RST	Expected Q	Actual Q<br>
                   0	0	1	0		x<br>
Mismatch detected at time 5<br>
  Expected Q: 0, Actual Q: x<br>
                   5	0	1	0		0<br>
                  20	0	0	0		0<br>
                  26	1	0	0		0<br>
                  35	1	0	1		1<br>
                  36	0	0	1		1<br>
                  45	0	0	0		0<br>
                  46	1	0	0		0<br>
                  55	1	0	1		1<br>
                  56	0	0	1		1<br>
                  65	0	0	0		0<br>
                  66	1	0	0		0<br>
                  75	1	0	1		1<br>
                  76	0	0	1		1<br>
                  85	0	0	0		0<br>
 

 
### 🔬 Simulation Result

![Simulation Waveform](./images/tb_d_sim.png)

**Description:**  
simulation results.
simualtion results of EVEN COUNTER
