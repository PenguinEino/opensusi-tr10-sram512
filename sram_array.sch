v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -900 760 -880 760 {lab=Vdd}
N -880 760 -880 990 {lab=Vdd}
N -900 990 -880 990 {lab=Vdd}
N -900 780 -860 780 {lab=BLB0}
N -860 780 -860 1010 {lab=BLB0}
N -890 1010 -860 1010 {lab=BLB0}
N -900 1010 -890 1010 {lab=BLB0}
N -840 800 -840 1030 {lab=BL0}
N -820 860 -820 1090 {lab=Vss}
N -860 590 -860 780 {lab=BLB0}
N -840 590 -840 800 {lab=BL0}
N -880 590 -880 760 {lab=Vdd}
N -490 750 -470 750 {lab=Vdd}
N -470 750 -470 980 {lab=Vdd}
N -490 980 -470 980 {lab=Vdd}
N -490 770 -450 770 {lab=BLB1}
N -450 770 -450 1000 {lab=BLB1}
N -480 1000 -450 1000 {lab=BLB1}
N -490 1000 -480 1000 {lab=BLB1}
N -430 790 -430 1020 {lab=BL1}
N -410 850 -410 1080 {lab=Vss}
N -450 580 -450 770 {lab=BLB1}
N -430 580 -430 790 {lab=BL1}
N -470 580 -470 750 {lab=Vdd}
N -1200 730 -790 730 {lab=WL0}
N -1200 960 -790 960 {lab=WL1}
N -880 490 -880 590 {lab=Vdd}
N -880 490 -470 490 {lab=Vdd}
N -470 490 -470 580 {lab=Vdd}
N -920 490 -880 490 {lab=Vdd}
N -860 420 -860 590 {lab=BLB0}
N -840 420 -840 590 {lab=BL0}
N -820 600 -410 600 {lab=Vss}
N -450 440 -450 580 {lab=BLB1}
N -430 440 -430 580 {lab=BL1}
N -920 600 -820 600 {lab=Vss}
N -820 600 -820 860 {lab=Vss}
N -410 600 -410 850 {lab=Vss}
N -900 860 -820 860 {lab=Vss}
N -900 1090 -820 1090 {lab=Vss}
N -490 1080 -410 1080 {lab=Vss}
N -490 850 -410 850 {lab=Vss}
N -1200 960 -1200 980 {lab=WL1}
N -1200 730 -1200 750 {lab=WL0}
N -790 730 -790 740 {lab=WL0}
N -790 960 -790 970 {lab=WL1}
N -790 970 -790 980 {lab=WL1}
N -1200 980 -1200 990 {lab=WL1}
N -1200 750 -1200 760 {lab=WL0}
N -790 740 -790 750 {lab=WL0}
N -900 1070 -840 1070 {lab=BL0}
N -840 1030 -840 1070 {lab=BL0}
N -490 1060 -430 1060 {lab=BL1}
N -430 1020 -430 1060 {lab=BL1}
N -490 830 -430 830 {lab=BL1}
N -900 840 -840 840 {lab=BL0}
C {sram.sym} -1050 810 0 0 {name=x1}
C {sram.sym} -1050 1040 0 0 {name=x2}
C {sram.sym} -640 800 0 0 {name=x3}
C {sram.sym} -640 1030 0 0 {name=x4}
C {devices/ipin.sym} -1200 990 0 0 {name=p8 lab=WL1}
C {devices/ipin.sym} -920 490 0 0 {name=p2 lab=Vdd}
C {devices/ipin.sym} -920 600 0 0 {name=p7 lab=Vss}
C {devices/iopin.sym} -840 420 3 0 {name=p9 lab=BL0}
C {devices/iopin.sym} -860 420 3 0 {name=p3 lab=BLB0}
C {devices/iopin.sym} -430 440 3 0 {name=p4 lab=BL1}
C {devices/iopin.sym} -450 440 3 0 {name=p5 lab=BLB1}
C {devices/ipin.sym} -1200 760 0 0 {name=p1 lab=WL0}
