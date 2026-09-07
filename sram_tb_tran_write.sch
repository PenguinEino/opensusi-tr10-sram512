v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 360 30 360 70 {
lab=GND}
N 360 -60 360 -30 {
lab=VDD}
N 430 30 430 70 {lab=GND}
N 480 30 480 70 {lab=GND}
N 430 -60 430 -30 {lab=BL}
N 480 -60 480 -30 {lab=BLB}
N 540 30 540 70 {lab=GND}
N 540 -60 540 -30 {lab=WL}
C {devices/vsource.sym} 360 0 0 0 {name=Vdd value=5.0 savecurrent=false}
C {devices/vdd.sym} 360 -60 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 360 70 0 0 {name=l3 lab=GND
}
C {devices/vdd.sym} 190 -40 1 0 {name=l2 lab=VDD}
C {devices/vdd.sym} 190 40 1 0 {name=l4 lab=QB}
C {devices/vdd.sym} 190 20 1 0 {name=l5 lab=Q}
C {devices/gnd.sym} 190 60 0 0 {name=l6 lab=GND
}
C {devices/vsource.sym} 430 0 0 0 {name=VBL value="PWL(0 5 20n 5 20.1n 0 50n 0)" savecurrent=false}
C {devices/vsource.sym} 480 0 0 0 {name=VBLB value="PWL(0 0 20n 0 20.1n 5 50n 5)" savecurrent=false}
C {devices/gnd.sym} 430 70 0 0 {name=l7 lab=GND
}
C {devices/gnd.sym} 480 70 0 0 {name=l8 lab=GND
}
C {devices/vdd.sym} 190 -20 1 0 {name=l9 lab=BLB}
C {devices/vdd.sym} 190 0 1 0 {name=l10 lab=BL}
C {devices/vdd.sym} 430 -60 0 0 {name=l11 lab=BL}
C {devices/vdd.sym} 480 -60 0 0 {name=l12 lab=BLB}
C {devices/vsource.sym} 540 0 0 0 {name=VWL value="PULSE(0 5 5n 0.1n 0.1n 10n 20n)" savecurrent=false}
C {devices/gnd.sym} 540 70 0 0 {name=l13 lab=GND
}
C {devices/vdd.sym} 540 -60 0 0 {name=l14 lab=WL}
C {devices/vdd.sym} -110 -40 0 0 {name=l15 lab=WL}
C {devices/code.sym} -100 -220 0 0 {name=TR-1um_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/ip62_models"
spice_ignore=false}
C {devices/code_shown.sym} 760 -160 0 0 {name=spice only_toplevel=false value="
.ic v(Q) = 0 v(QB)=5

.control
save all

tran 0.05n 50n

meas tran T_write_5 trig v(WL) val=2.5 rise=1 targ v(Q) val=2.5 rise=1
meas tran Q_hold_5 find v(Q) at=19n
meas tran QB_hold_5 find v(QB) at=19n
meas tran T_write_0 trig v(WL) val=2.5 rise=2 targ v(Q) val=2.5 fall=1
meas tran Q_hold_0 find v(Q) at=45n
meas tran QB_hold_0 find v(QB) at=45n

plot V(WL)+24 V(BL)+18 V(BLB)+12 V(Q)+6 V(QB) ylimit -0.5 25.5
.endc

"}
C {sram.sym} 40 10 0 0 {name=x1}
