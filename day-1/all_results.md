
# 📘 Verilog 100 Days – Waveform and Explanation Gallery

This document shows the waveform results and brief explanations of each day's design.

---

## ✅ Day 04 – AND Gate (All Modeling Styles)

### 🔧 Schematic

![AND Gate Schematic](./images/schematic.png)

**Description:**  
This is the schematic representation of a 2-input AND gate. It shows the gate symbol with two inputs `a`, `b` and one output `y`. The output goes HIGH only when both inputs are HIGH.

---

### 💾 Gate-Level Modeling

```verilog
module and_gate_gatelevel(output y, input a, input b);
  and (y, a, b);
endmodule
```

---

### 🧠 Behavioral Modeling

```verilog
module and_gate_behavioral(output reg y, input a, input b);
  always @ (a or b)
    y = a & b;
endmodule
```

---

### 🔁 Dataflow Modeling

```verilog
module and_gate_dataflow(output y, input a, input b);
  assign y = a & b;
endmodule
```

---

### 🏗️ Structural Modeling

![Structural Diagram](./images/structural.png)

```verilog
module and_gate_primitive(output y, input a, input b);
  and a1(y, a, b);
endmodule

module and_gate_structural(output y, input a, input b);
  wire temp;
  and_gate_primitive u1 (temp, a, b);
  assign y = temp;
endmodule
```

---

### 📝 Structural Description

![Structural Description](./images/strutral_2.png)

**Description:**  
This structural model uses an internal module `and_gate_primitive` that instantiates an AND gate using a primitive. The top module `and_gate_structural` then connects this to the external ports using a wire.

---

### 🔬 Simulation Result

![Simulation Waveform](./images/simulation.png)

**Description:**  
The simulation waveform verifies all four models of the AND gate. For every combination of inputs `a` and `b`, the output `y` follows the AND logic: HIGH only when both are HIGH. This confirms that all modeling styles behave identically.

---
