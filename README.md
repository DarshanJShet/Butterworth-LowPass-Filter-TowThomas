# Fourth-Order Butterworth Low-Pass Filter using Tow–Thomas Topology

This project presents the design, analysis, and simulation of a **4th-order active low-pass Butterworth filter** using the **Tow–Thomas biquad topology**. The design combines **MATLAB-based pre-simulation** with **Xschem circuit-level implementation** using the Skywater open-source PDK.

---

## ⚙️ Specifications

| Parameter | Target / Notes |
|------------|----------------|
| Filter Type | 4th-order Butterworth (two cascaded biquads) |
| Passband Frequency | 0 – 50 kHz |
| Stopband Attenuation | < -40 dB at 80 kHz |
| Passband Gain | 0 to 0.5 dB |
| Cutoff Frequency (fc) | 50 kHz |
| Op-Amp Gain | 20 dB to 80 dB (varied) |
| Op-Amp Unity-Gain Bandwidth (UGB) | 20 MHz – 400 MHz (varied) |
| Simulation Tools | MATLAB, Xschem (Skywater 130nm PDK),Ngspice |

---

## 🧮 Methodology

The design and analysis process was carried out in two major phases — **MATLAB-based system-level verification** and **Xschem circuit-level implementation** using the Skywater PDK.

### 1️⃣ MATLAB Design and Pre-Simulation
- Implemented the 4th order Butterworth filter in MATLAB and obtained the transfer function along with the poles and zeros.
- Using the poles and zeros, split the transfer function into 2 biquads.
- Plotted the gain and phase plot for both biquads along with the gain and phase of the whole transfer function.

### 2️⃣ Xschem Circuit-Level Realization
- Chose the Tow–Thomas filter topology for filter implementation.
- Using the given formulas, found the values of resistors and capacitors.
- Implemented the filter using an ideal op-amp and the obtained resistor and capacitor values.
- Calculated the deviation each op-amp output magnitude has from 0 dB and converted it to volts.
- The value obtained is the scaling factor for that op-amp. Then the resistances and capacitances connected to that output need to be scaled: divide the resistances by the scaling factor and multiply the capacitances by the scaling factor.

### 3️⃣ Performance Evaluation
- Compared MATLAB and Xschem frequency responses to ensure design consistency.
- Analyzed how finite op-amp gain and bandwidth impact passband gain and cutoff frequency.
- Determined the minimum gain and bandwidth values required for the circuit to meet its Butterworth specifications.
---

## 📊 Results and Analysis

Simulations were performed in **MATLAB** and **Xschem** to validate the designed fourth-order Butterworth low-pass filter. The results demonstrate strong agreement between system-level and circuit-level responses.

### 🔹 1️⃣ MATLAB Simulation Results
- The MATLAB-based analysis generated **Bode magnitude and phase plots**, confirming a smooth Butterworth response with:
  - Passband ripple < 0.5 dB  
  - Cutoff frequency (**fc**) ≈ 50 kHz  
- Pole–zero plots verified that system is stability.

### 🔹 2️⃣ Xschem Simulation Results
The filter was implemented and simulated in Xschem using ideal op-amp.  
Two key non-ideal parameters — **op-amp gain** and **unity-gain bandwidth (UGB)** — were varied to analyze their impact.

#### Effect of Op-Amp Gain
| Op-Amp Gain (dB) | Passband Gain (dB) | −3 dB Gain (dB) | Cutoff Frequency (MHz) |
|-------------------|--------------------|------------------|-------------------------|
| 20 | -2.61 | -5.61 | 38.1 |
| 40 | -0.23 | -3.23 | 49 |
| 60 | -0.02 | -3.02 | 50 |
| 80 | 0 | -3 | 50 |

➡️ As gain increases, passband flatness improves and the cutoff frequency closely aligns with the design target.

#### Effect of Op-Amp Unity-Gain Bandwidth (UGB)
| UGB (MHz) | Cutoff Frequency (MHz) |
|------------|-------------------------|
| 20 | 12.2 |
| 50 | 23.6 |
| 100 | 34.6 |
| 150 | 39.1 |
| 200 | 44.9 |
| 400 | 50.2 |

➡️ Higher UGB ensures accurate cutoff frequency and Butterworth response.  
A minimum UGB is required for optimal performance.

---

### 🔹 3️⃣ Observations
- MATLAB and Xschem results exhibit excellent correlation, validating the correctness of component selection and topology.  
- Finite op-amp gain and limited bandwidth cause a **shift in cutoff frequency**.  
- With **80 dB gain** and **400 MHz UGB**, the circuit achieves ideal Butterworth characteristics, confirming robust design stability.

---

**Conclusion:**  
The simulation results confirm that the designed fourth-order Tow–Thomas low-pass filter meets all target specifications.

---
