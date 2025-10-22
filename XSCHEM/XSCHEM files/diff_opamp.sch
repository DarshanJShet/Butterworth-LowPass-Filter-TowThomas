v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -200 -160 -200 -70 {
lab=#net1}
N -200 -160 -130 -160 {
lab=#net1}
N -70 -160 -20 -160 {
lab=#net2}
N -20 -160 -20 -130 {
lab=#net2}
N -280 -60 -240 -60 {
lab=vinp}
N -280 -20 -240 -20 {
lab=vinn}
N -20 -160 60 -160 {
lab=#net2}
N 70 -110 70 -10 {
lab=GND}
N 70 -10 110 -10 {
lab=GND}
N 90 -150 90 -50 {
lab=#net2}
N 90 -50 110 -50 {
lab=#net2}
N 60 -160 110 -160 {
lab=#net2}
N 90 -160 90 -150 {
lab=#net2}
N 70 -120 70 -110 {
lab=GND}
N 70 -120 110 -120 {
lab=GND}
N 150 -110 150 -60 {
lab=vcm}
N 150 -170 220 -170 {
lab=vo+}
N 150 30 230 30 {
lab=vo-}
N 150 -80 240 -80 {
lab=vcm}
N -20 -70 -20 -50 {
lab=GND}
N 150 0 150 30 {
lab=vo-}
N -200 30 150 30 {
lab=vo-}
N -200 -10 -200 30 {
lab=vo-}
C {vcvs.sym} 150 -140 0 0 {name=E1  N+=5 N-=0 NC+=2 NC-=0 value=1}
C {vcvs.sym} -200 -40 0 0 {name=E3 N+=5 N-=0 NC+=2 NC-=0 value=10}
C {res.sym} -100 -160 1 0 {name=R1
value=8000
footprint=1206
device=resistor
m=1}
C {capa.sym} -20 -100 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} -280 -60 0 0 {name=vin3 lab=vinp}
C {opin.sym} 230 30 0 0 {name=p1 lab=vo-}
C {ipin.sym} -280 -20 0 0 {name=vin1 lab=vinn}
C {vcvs.sym} 150 -30 0 0 {name=E2  N+=5 N-=0 NC+=2 NC-=0 value=1}
C {opin.sym} 220 -170 0 0 {name=p2 lab=vo+}
C {ipin.sym} 240 -80 2 0 {name=vin2 lab=vcm}
C {gnd.sym} -20 -50 0 0 {name=l1 lab=GND}
C {gnd.sym} 70 -10 0 0 {name=l2 lab=GND}
