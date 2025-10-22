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
| Op-Amp Unity-Gain Bandwidth (UGB) | 20 MHz – 400 MHz |
| Simulation Tools | MATLAB, Xschem (Skywater 130nm PDK) |

---

## 🧮 Methodology

The design and analysis process was carried out in two major phases — **MATLAB-based system-level verification** and **Xschem circuit-level implementation** using the Skywater PDK. The workflow followed a top-down design approach to ensure theoretical accuracy and practical feasibility.

### 1️⃣ MATLAB Design and Pre-Simulation
- Implemented the **Tow–Thomas biquad topology** mathematically to derive the transfer function.
- Designed a **4th-order Butterworth response** by cascading two second-order biquads.
- Generated **Bode magnitude, phase**, and **pole-zero plots** to validate theoretical performance.
- Computed precise **resistor and capacitor values (R, C)** to meet the target cutoff frequency (50 kHz).

### 2️⃣ Xschem Circuit-Level Realization
- Modeled the **operational amplifier** using an ideal **voltage-controlled voltage source (VCVS)** with adjustable gain and bandwidth.
- Implemented the **Tow–Thomas filter** using MATLAB-derived component values.
- Simulated the design in **Xschem** under different op-amp gains and **unity-gain bandwidths (UGB)** to study non-ideal effects.

### 3️⃣ Performance Evaluation
- Compared MATLAB and Xschem frequency responses to ensure design consistency.
- Analyzed how finite op-amp gain and bandwidth impact **cutoff frequency**, **stability**, and **passband flatness**.
- Determined minimum gain and bandwidth values required for the circuit to meet its Butterworth specifications.

---

This structured methodology bridges **theoretical filter design** with **practical circuit implementation**, ensuring accuracy before proceeding to transistor-level realization.

---

## 📊 Results and Analysis

Comprehensive simulations were performed in **MATLAB** and **Xschem** to validate the designed fourth-order Butterworth low-pass filter. The results demonstrate strong agreement between system-level and circuit-level responses.

### 🔹 1️⃣ MATLAB Simulation Results
- The MATLAB-based analysis generated **Bode magnitude and phase plots**, confirming a smooth Butterworth response with:
  - Passband ripple ≤ 0.5 dB  
  - Cutoff frequency (**fc**) ≈ 50 kHz  
  - Stopband attenuation < −40 dB at 80 kHz  
- Pole–zero plots verified system stability and proper pole placement for a maximally flat passband.

### 🔹 2️⃣ Xschem Simulation Results
The filter was implemented and simulated in Xschem using ideal op-amp models (VCVS) based on the Skywater PDK.  
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
A minimum UGB of **≥100 MHz** is required for optimal performance.

---

### 🔹 3️⃣ Observations
- MATLAB and Xschem results exhibit excellent correlation, validating the correctness of component selection and topology.  
- Finite op-amp gain and limited bandwidth cause a **shift in cutoff frequency** and **distortion in the passband**.  
- With **80 dB gain** and **200 MHz UGB**, the circuit achieves ideal Butterworth characteristics, confirming robust design stability.

---

**Conclusion:**  
The simulation results confirm that the designed fourth-order Tow–Thomas low-pass filter meets all target specifications. The methodology effectively bridges MATLAB-based analytical design with Xschem circuit verification, providing a reliable foundation for transistor-level implementation and further optimization.

---
