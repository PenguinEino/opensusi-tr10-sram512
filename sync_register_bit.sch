v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {ENABLED REGISTER BIT | synchronous RESET} -120 -150 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/INV_X1.sym} 0 280 0 0 {name=xr}
C {devices/lab_pin.sym} 30 240 0 0 {name=l9 lab=VDD}
C {devices/lab_pin.sym} -20 280 0 0 {name=l10 lab=RESET}
C {devices/lab_pin.sym} 100 280 2 0 {name=l11 lab=RESET_B}
C {devices/lab_pin.sym} 30 320 2 0 {name=l12 lab=VSS}
C {TR-1um_5_stdcell/MUX2.sym} 0 0 0 0 {name=xm}
C {TR-1um_5_stdcell/AND2_X1.sym} 220 20 0 0 {name=xreset}
C {TR-1um_5_stdcell/DFFR.sym} 480 50 0 0 {name=xff}
N 70 0 200 0 {lab=M}
N 330 20 450 20 {lab=FD}
C {devices/lab_pin.sym} -20 -20 0 0 {name=l18 lab=Q}
C {devices/lab_pin.sym} -20 20 0 0 {name=l19 lab=D}
C {devices/lab_pin.sym} 20 40 0 0 {name=l20 lab=EN}
C {devices/lab_pin.sym} 40 -40 0 0 {name=l21 lab=VDD}
C {devices/lab_pin.sym} 40 40 2 0 {name=l22 lab=VSS}
C {devices/lab_pin.sym} 250 -40 0 0 {name=l23 lab=VDD}
C {devices/lab_pin.sym} 200 40 0 0 {name=l24 lab=RESET_B}
C {devices/lab_pin.sym} 250 80 2 0 {name=l25 lab=VSS}
C {devices/lab_pin.sym} 450 -10 0 0 {name=l26 lab=VDD}
C {devices/lab_pin.sym} 510 60 2 0 {name=l27 lab=QB}
C {devices/lab_pin.sym} 510 20 2 0 {name=l28 lab=Q}
C {devices/lab_pin.sym} 480 90 0 0 {name=l29 lab=VSS}
C {devices/lab_pin.sym} 450 110 2 0 {name=l30 lab=VSS}
C {devices/lab_pin.sym} 450 60 0 0 {name=l31 lab=CLK}
C {devices/ipin.sym} -100 450 0 0 {name=pD lab=D}
C {devices/ipin.sym} 50 450 0 0 {name=pEN lab=EN}
C {devices/ipin.sym} 200 450 0 0 {name=pCLK lab=CLK}
C {devices/ipin.sym} 350 450 0 0 {name=pRESET lab=RESET}
C {devices/opin.sym} 500 450 0 0 {name=pQ lab=Q}
C {devices/iopin.sym} 650 450 0 0 {name=pVDD lab=VDD}
C {devices/iopin.sym} 800 450 0 0 {name=pVSS lab=VSS}
T {MUX selects D when EN=1, otherwise holds Q. RESET forces next Q=0.} -100 530 0 0 0.25 0.25 {}
