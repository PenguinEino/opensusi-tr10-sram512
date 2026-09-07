v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 440 -250 440 -210 {
lab=GND}
N 440 -340 440 -310 {
lab=VDD}
N 510 -250 510 -210 {lab=GND}
N 510 -340 510 -310 {lab=PRECHG}
N 610 -250 610 -210 {lab=GND}
N 610 -340 610 -310 {lab=WL}
N 190 -20 280 -20 {lab=BLB}
N 230 0 410 0 {lab=BL}
N 420 -20 420 0 {lab=BL}
N 190 0 210 0 {lab=BL}
N 210 -0 230 -0 {lab=BL}
N 210 -110 210 -40 {lab=VDD}
N 190 -40 210 -40 {lab=VDD}
N 190 60 190 80 {lab=GND}
N 190 70 260 70 {lab=GND}
N 260 70 320 70 {lab=GND}
N 260 -20 260 10 {lab=BLB}
N 320 0 320 10 {lab=BL}
N 280 -20 300 -20 {lab=BLB}
N 210 -90 280 -90 {lab=VDD}
N 300 -90 300 -80 {lab=VDD}
N 280 -90 420 -90 {lab=VDD}
N 420 -90 420 -80 {lab=VDD}
N 410 -0 420 -0 {lab=BL}
N 290 -50 300 -50 {lab=VDD}
N 290 -90 290 -50 {lab=VDD}
N 420 -50 430 -50 {lab=VDD}
N 430 -90 430 -50 {lab=VDD}
N 420 -90 430 -90 {lab=VDD}
N 340 -50 360 -50 {lab=PRECHG}
N 360 -50 380 -50 {lab=PRECHG}
C {devices/vsource.sym} 440 -280 0 0 {name=Vdd value=5.0 savecurrent=false}
C {devices/vdd.sym} 440 -340 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 440 -210 0 0 {name=l3 lab=GND
}
C {devices/vdd.sym} 210 -110 0 0 {name=l2 lab=VDD}
C {devices/vdd.sym} 190 40 1 0 {name=l4 lab=QB}
C {devices/vdd.sym} 190 20 1 0 {name=l5 lab=Q}
C {devices/gnd.sym} 190 80 0 0 {name=l6 lab=GND
}
C {devices/gnd.sym} 510 -210 0 0 {name=l7 lab=GND
}
C {devices/vdd.sym} 240 -20 0 0 {name=l9 lab=BLB}
C {devices/vsource.sym} 610 -280 0 0 {name=VWL value="PWL(0 0 11n 0 11.1n 5 15n 5 15.1n 0 20n 0)" savecurrent=false}
C {devices/gnd.sym} 610 -210 0 0 {name=l13 lab=GND
}
C {devices/vdd.sym} 610 -340 0 0 {name=l14 lab=WL}
C {devices/vdd.sym} -110 -40 0 0 {name=l15 lab=WL}
C {devices/code.sym} -100 -220 0 0 {name=TR-1um_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/ip62_models"
spice_ignore=false}
C {devices/code_shown.sym} 770 -340 0 0 {name=spice only_toplevel=false value="
.param QINIT=0 QBINIT=5
.ic v(Q)='QINIT' v(QB)='QBINIT'

.control
save all @m.x1.xxm7.m1[id] @m.x1.xxm6.m1[id]

tran 0.01n 20n

meas tran BL_read_Q0 find v(BL) at=14n
meas tran BLB_read_Q0 find v(BLB) at=14n
meas tran Q_read_Q0 find v(Q) at=14n
meas tran QB_read_Q0 find v(QB) at=14n
meas tran Q_disturb_Q0 max v(Q) from=11n to=15n
meas tran Q_hold_Q0 find v(Q) at=18n
meas tran QB_hold_Q0 find v(QB) at=18n

let PRECHG_T = V(PRECHG)/5+10
let WL_T = V(WL)/5+8
let BL_T = V(BL)/5+6
let BLB_T = V(BLB)/5+4
let Q_T = V(Q)/5+2
let QB_T = V(QB)/5
let I_Q_ACCESS_uA = @m.x1.xxm7.m1[id]*1e6
let I_QB_ACCESS_uA = @m.x1.xxm6.m1[id]*1e6
let I_Q_ACCESS_MAG_uA = abs(I_Q_ACCESS_uA)
let I_QB_ACCESS_MAG_uA = abs(I_QB_ACCESS_uA)
meas tran I_Q_ACCESS_PEAK_Q0 max I_Q_ACCESS_MAG_uA from=11n to=15n
meas tran I_QB_ACCESS_PEAK_Q0 max I_QB_ACCESS_MAG_uA from=11n to=15n
plot PRECHG_T WL_T BL_T BLB_T Q_T QB_T ylimit -0.2 11.2 ydelta 1 title 'READ: Q=0, QB=5 V'
plot I_Q_ACCESS_uA I_QB_ACCESS_uA ylabel 'Access current (uA)' title 'READ current: Q=0, QB=5 V'

alterparam QINIT=5
alterparam QBINIT=0
reset
save all @m.x1.xxm7.m1[id] @m.x1.xxm6.m1[id]

tran 0.01n 20n

meas tran BL_read_Q5 find v(BL) at=14n
meas tran BLB_read_Q5 find v(BLB) at=14n
meas tran Q_read_Q5 find v(Q) at=14n
meas tran QB_read_Q5 find v(QB) at=14n
meas tran QB_disturb_Q5 max v(QB) from=11n to=15n
meas tran Q_hold_Q5 find v(Q) at=18n
meas tran QB_hold_Q5 find v(QB) at=18n

let PRECHG_T = V(PRECHG)/5+10
let WL_T = V(WL)/5+8
let BL_T = V(BL)/5+6
let BLB_T = V(BLB)/5+4
let Q_T = V(Q)/5+2
let QB_T = V(QB)/5
let I_Q_ACCESS_uA = @m.x1.xxm7.m1[id]*1e6
let I_QB_ACCESS_uA = @m.x1.xxm6.m1[id]*1e6
let I_Q_ACCESS_MAG_uA = abs(I_Q_ACCESS_uA)
let I_QB_ACCESS_MAG_uA = abs(I_QB_ACCESS_uA)
meas tran I_Q_ACCESS_PEAK_Q5 max I_Q_ACCESS_MAG_uA from=11n to=15n
meas tran I_QB_ACCESS_PEAK_Q5 max I_QB_ACCESS_MAG_uA from=11n to=15n
plot PRECHG_T WL_T BL_T BLB_T Q_T QB_T ylimit -0.2 11.2 ydelta 1 title 'READ: Q=5 V, QB=0'
plot I_Q_ACCESS_uA I_QB_ACCESS_uA ylabel 'Access current (uA)' title 'READ current: Q=5 V, QB=0'

.endc

"}
C {sram.sym} 40 10 0 0 {name=x1}
C {MP.sym} 340 -50 2 0 {name=M1 model=PMOS w=3.4u l=1u nrd=0 nrs=0 m=1 spiceprefix=X}
C {MP.sym} 380 -50 2 1 {name=M2 model=PMOS w=3.4u l=1u nrd=0 nrs=0 m=1 spiceprefix=X}
C {devices/capa.sym} 260 40 0 0 {name=Cload
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 320 40 0 0 {name=Cload2
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/vdd.sym} 360 0 0 0 {name=l10 lab=BL}
C {devices/vdd.sym} 360 -50 0 0 {name=l16 lab=PRECHG}
C {devices/vdd.sym} 510 -340 0 0 {name=l8 lab=PRECHG}
C {devices/vsource.sym} 510 -280 0 0 {name=VPRECHG value="PWL(0 0 10n 0 10.1n 5 20n 5)" savecurrent=false}
