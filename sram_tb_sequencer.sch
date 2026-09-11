v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -100 1380 -100 {lab=VDD}
C {devices/lab_pin.sym} 0 -100 0 0 {name=wirelabel12 lab=VDD}
C {TR-1umLIB/MP.sym} -40 0 0 0 {name=XP0_0
model=PMOS
w=10.2u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 0 -100 0 -30 {lab=VDD}
N 0 0 80 0 {lab=VDD}
N 80 -100 80 0 {lab=VDD}
C {devices/lab_pin.sym} -40 0 0 0 {name=wirelabel17 lab=PREB}
N 0 30 0 790 {lab=BL0}
C {devices/lab_pin.sym} 0 100 2 0 {name=wirelabel19 lab=BL0}
N 0 670 120 670 {lab=BL0}
N 120 670 120 680 {lab=BL0}
C {devices/capa.sym} 120 710 0 0 {name=CBL0 value='CBL' m=1}
C {devices/gnd.sym} 120 740 0 0 {name=ground23 lab=GND}
C {TR-1umLIB/MN.sym} -40 820 0 0 {name=XM0_0
model=NMOS
w=3.4u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 0 820 140 820 {lab=GND}
C {devices/lab_pin.sym} 140 820 2 0 {name=wirelabel26 lab=GND}
N 0 850 0 960 {lab=Y}
N -40 770 -40 820 {lab=COL0}
C {TR-1umLIB/MP.sym} 460 0 0 0 {name=XP0_1
model=PMOS
w=10.2u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 500 -100 500 -30 {lab=VDD}
N 500 0 580 0 {lab=VDD}
N 580 -100 580 0 {lab=VDD}
C {devices/lab_pin.sym} 460 0 0 0 {name=wirelabel33 lab=PREB}
N 500 30 500 790 {lab=BLB0}
C {devices/lab_pin.sym} 500 100 2 0 {name=wirelabel35 lab=BLB0}
N 500 670 620 670 {lab=BLB0}
N 620 670 620 680 {lab=BLB0}
C {devices/capa.sym} 620 710 0 0 {name=CBLB0 value='CBL' m=1}
C {devices/gnd.sym} 620 740 0 0 {name=ground39 lab=GND}
C {TR-1umLIB/MN.sym} 460 820 0 0 {name=XM0_1
model=NMOS
w=3.4u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 500 820 640 820 {lab=GND}
C {devices/lab_pin.sym} 640 820 2 0 {name=wirelabel42 lab=GND}
N 500 850 500 1020 {lab=YB}
N 460 770 460 820 {lab=COL0}
N -100 770 460 770 {lab=COL0}
C {sram.sym} 250 230 0 0 {name=xc00}
N 0 200 100 200 {lab=BL0}
N 400 200 500 200 {lab=BLB0}
N 400 220 430 220 {lab=Q00}
C {devices/lab_pin.sym} 430 220 2 0 {name=wirelabel51 lab=Q00}
N 400 240 430 240 {lab=QB00}
C {devices/lab_pin.sym} 430 240 2 0 {name=wirelabel53 lab=QB00}
N 400 260 430 260 {lab=VDD}
C {devices/lab_pin.sym} 430 260 2 0 {name=wirelabel55 lab=VDD}
N 400 280 430 280 {lab=GND}
C {devices/lab_pin.sym} 430 280 2 0 {name=wirelabel57 lab=GND}
N 250 310 250 340 {lab=WL0}
C {sram.sym} 250 500 0 0 {name=xc10}
N 0 470 100 470 {lab=BL0}
N 400 470 500 470 {lab=BLB0}
N 400 490 430 490 {lab=Q10}
C {devices/lab_pin.sym} 430 490 2 0 {name=wirelabel63 lab=Q10}
N 400 510 430 510 {lab=QB10}
C {devices/lab_pin.sym} 430 510 2 0 {name=wirelabel65 lab=QB10}
N 400 530 430 530 {lab=VDD}
C {devices/lab_pin.sym} 430 530 2 0 {name=wirelabel67 lab=VDD}
N 400 550 430 550 {lab=GND}
C {devices/lab_pin.sym} 430 550 2 0 {name=wirelabel69 lab=GND}
N 250 580 250 610 {lab=WL1}
C {TR-1umLIB/MP.sym} 760 0 0 0 {name=XP1_0
model=PMOS
w=10.2u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 800 -100 800 -30 {lab=VDD}
N 800 0 880 0 {lab=VDD}
N 880 -100 880 0 {lab=VDD}
C {devices/lab_pin.sym} 760 0 0 0 {name=wirelabel75 lab=PREB}
N 800 30 800 790 {lab=BL1}
C {devices/lab_pin.sym} 800 100 2 0 {name=wirelabel77 lab=BL1}
N 800 670 920 670 {lab=BL1}
N 920 670 920 680 {lab=BL1}
C {devices/capa.sym} 920 710 0 0 {name=CBL1 value='CBL' m=1}
C {devices/gnd.sym} 920 740 0 0 {name=ground81 lab=GND}
C {TR-1umLIB/MN.sym} 760 820 0 0 {name=XM1_0
model=NMOS
w=3.4u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 800 820 940 820 {lab=GND}
C {devices/lab_pin.sym} 940 820 2 0 {name=wirelabel84 lab=GND}
N 800 850 800 960 {lab=Y}
N 760 770 760 820 {lab=COL1}
C {TR-1umLIB/MP.sym} 1260 0 0 0 {name=XP1_1
model=PMOS
w=10.2u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 1300 -100 1300 -30 {lab=VDD}
N 1300 0 1380 0 {lab=VDD}
N 1380 -100 1380 0 {lab=VDD}
C {devices/lab_pin.sym} 1260 0 0 0 {name=wirelabel91 lab=PREB}
N 1300 30 1300 790 {lab=BLB1}
C {devices/lab_pin.sym} 1300 100 2 0 {name=wirelabel93 lab=BLB1}
N 1300 670 1420 670 {lab=BLB1}
N 1420 670 1420 680 {lab=BLB1}
C {devices/capa.sym} 1420 710 0 0 {name=CBLB1 value='CBL' m=1}
C {devices/gnd.sym} 1420 740 0 0 {name=ground97 lab=GND}
C {TR-1umLIB/MN.sym} 1260 820 0 0 {name=XM1_1
model=NMOS
w=3.4u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 1300 820 1440 820 {lab=GND}
C {devices/lab_pin.sym} 1440 820 2 0 {name=wirelabel100 lab=GND}
N 1300 850 1300 1020 {lab=YB}
N 1260 770 1260 820 {lab=COL1}
N 700 770 1260 770 {lab=COL1}
C {sram.sym} 1050 230 0 0 {name=xc01}
N 800 200 900 200 {lab=BL1}
N 1200 200 1300 200 {lab=BLB1}
N 1200 220 1230 220 {lab=Q01}
C {devices/lab_pin.sym} 1230 220 2 0 {name=wirelabel109 lab=Q01}
N 1200 240 1230 240 {lab=QB01}
C {devices/lab_pin.sym} 1230 240 2 0 {name=wirelabel111 lab=QB01}
N 1200 260 1230 260 {lab=VDD}
C {devices/lab_pin.sym} 1230 260 2 0 {name=wirelabel113 lab=VDD}
N 1200 280 1230 280 {lab=GND}
C {devices/lab_pin.sym} 1230 280 2 0 {name=wirelabel115 lab=GND}
N 1050 310 1050 340 {lab=WL0}
C {sram.sym} 1050 500 0 0 {name=xc11}
N 800 470 900 470 {lab=BL1}
N 1200 470 1300 470 {lab=BLB1}
N 1200 490 1230 490 {lab=Q11}
C {devices/lab_pin.sym} 1230 490 2 0 {name=wirelabel121 lab=Q11}
N 1200 510 1230 510 {lab=QB11}
C {devices/lab_pin.sym} 1230 510 2 0 {name=wirelabel123 lab=QB11}
N 1200 530 1230 530 {lab=VDD}
C {devices/lab_pin.sym} 1230 530 2 0 {name=wirelabel125 lab=VDD}
N 1200 550 1230 550 {lab=GND}
C {devices/lab_pin.sym} 1230 550 2 0 {name=wirelabel127 lab=GND}
N 1050 580 1050 610 {lab=WL1}
N -180 340 1050 340 {lab=WL0}
C {devices/lab_pin.sym} -180 340 0 0 {name=wirelabel130 lab=WL0}
N -180 610 1050 610 {lab=WL1}
C {devices/lab_pin.sym} -180 610 0 0 {name=wirelabel132 lab=WL1}
N 0 960 1500 960 {lab=Y}
C {devices/lab_pin.sym} 1500 960 2 0 {name=wirelabel134 lab=Y}
N 500 1020 1500 1020 {lab=YB}
C {devices/lab_pin.sym} 1500 1020 2 0 {name=wirelabel136 lab=YB}
N 50 960 50 1320 {lab=Y}
N 50 1320 150 1320 {lab=Y}
C {TR-1umLIB/MP.sym} 110 1170 0 0 {name=XPY0
model=PMOS
w=10.2u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 150 1200 150 1320 {lab=Y}
N 150 1100 150 1140 {lab=VDD}
C {devices/lab_pin.sym} 150 1100 0 0 {name=wirelabel145 lab=VDD}
N 150 1170 250 1170 {lab=VDD}
N 250 1100 250 1170 {lab=VDD}
N 150 1100 250 1100 {lab=VDD}
C {devices/lab_pin.sym} 110 1170 0 0 {name=wirelabel149 lab=PREB}
C {TR-1umLIB/MN.sym} 110 1510 0 0 {name=XWY0
model=NMOS
w=3.4u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 150 1320 150 1480 {lab=Y}
C {devices/lab_pin.sym} 110 1510 0 0 {name=wirelabel152 lab=PD_Y}
N 150 1510 230 1510 {lab=GND}
N 230 1510 230 1620 {lab=GND}
N 150 1540 150 1620 {lab=GND}
N 150 1320 320 1320 {lab=Y}
N 320 1320 320 1480 {lab=Y}
C {devices/capa.sym} 320 1510 0 0 {name=CY value='CY' m=1}
N 320 1540 320 1620 {lab=GND}
N 320 1320 1000 1320 {lab=Y}
N 550 1020 550 1380 {lab=YB}
N 550 1380 650 1380 {lab=YB}
C {TR-1umLIB/MP.sym} 610 1170 0 0 {name=XPY1
model=PMOS
w=10.2u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 650 1200 650 1380 {lab=YB}
N 650 1100 650 1140 {lab=VDD}
C {devices/lab_pin.sym} 650 1100 0 0 {name=wirelabel166 lab=VDD}
N 650 1170 750 1170 {lab=VDD}
N 750 1100 750 1170 {lab=VDD}
N 650 1100 750 1100 {lab=VDD}
C {devices/lab_pin.sym} 610 1170 0 0 {name=wirelabel170 lab=PREB}
C {TR-1umLIB/MN.sym} 610 1510 0 0 {name=XWY1
model=NMOS
w=3.4u
l=1u
m=1
spiceprefix=X
nrd=0
nrs=0}
N 650 1380 650 1480 {lab=YB}
C {devices/lab_pin.sym} 610 1510 0 0 {name=wirelabel173 lab=PD_YB}
N 650 1510 730 1510 {lab=GND}
N 730 1510 730 1620 {lab=GND}
N 650 1540 650 1620 {lab=GND}
N 650 1380 820 1380 {lab=YB}
N 820 1380 820 1480 {lab=YB}
C {devices/capa.sym} 820 1510 0 0 {name=CYB value='CY' m=1}
N 820 1540 820 1620 {lab=GND}
N 820 1380 1000 1380 {lab=YB}
N 150 1620 820 1620 {lab=GND}
C {devices/gnd.sym} 150 1620 0 0 {name=ground183 lab=GND}
C {sense_amp_7t.sym} 1150 1380 0 0 {name=xsa}
C {devices/lab_pin.sym} 1000 1440 0 0 {name=wirelabel185 lab=SAE}
C {devices/lab_pin.sym} 1150 1260 0 0 {name=wirelabel186 lab=VDD}
C {devices/gnd.sym} 1150 1500 0 0 {name=ground187 lab=GND}
N 1300 1320 1500 1320 {lab=SOUT}
C {devices/lab_pin.sym} 1500 1320 2 0 {name=wirelabel189 lab=SOUT}
N 1500 1320 1500 1500 {lab=SOUT}
C {devices/capa.sym} 1500 1530 0 0 {name=CSOUT value=10f m=1}
C {devices/gnd.sym} 1500 1560 0 0 {name=ground192 lab=GND}
N 1300 1380 1720 1380 {lab=SOUTB}
C {devices/lab_pin.sym} 1720 1380 2 0 {name=wirelabel194 lab=SOUTB}
N 1720 1380 1720 1500 {lab=SOUTB}
C {devices/capa.sym} 1720 1530 0 0 {name=CSOUTB value=10f m=1}
C {devices/gnd.sym} 1720 1560 0 0 {name=ground197 lab=GND}
C {row_decoder_1to2.sym} -500 470 0 0 {name=xrow}
N -320 340 -180 340 {lab=WL0}
N -320 610 -180 610 {lab=WL1}
C {devices/lab_pin.sym} -680 430 2 0 {name=l3 lab=RA}
C {devices/lab_pin.sym} -680 510 2 0 {name=l4 lab=WL_EN}
C {devices/lab_pin.sym} -500 270 2 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} -500 670 2 0 {name=l6 lab=GND}
C {col_decoder_1to2.sym} -500 980 0 0 {name=xcol}
C {devices/lab_pin.sym} -680 940 0 0 {name=col_ca lab=CA}
C {devices/lab_pin.sym} -500 780 0 0 {name=col_vdd lab=VDD}
C {devices/gnd.sym} -500 1180 0 0 {name=col_gnd lab=GND}
N -320 850 -200 850 {lab=COL0}
N -200 770 -200 850 {lab=COL0}
N -200 770 -100 770 {lab=COL0}
N -320 1120 -150 1120 {lab=COL1}
N -150 900 -150 1120 {lab=COL1}
N -150 900 680 900 {lab=COL1}
N 680 770 680 900 {lab=COL1}
N 680 770 700 770 {lab=COL1}
C {devices/lab_pin.sym} -200 850 2 0 {name=col0_label lab=COL0}
C {devices/lab_pin.sym} -150 1120 2 0 {name=col1_label lab=COL1}
C {write_control.sym} -500 1510 0 0 {name=xwrite}
C {devices/lab_pin.sym} -680 1470 0 0 {name=write_din lab=DIN}
C {devices/lab_pin.sym} -680 1550 0 0 {name=write_en lab=WRITE_EN}
C {devices/lab_pin.sym} -500 1310 0 0 {name=write_vdd lab=VDD}
C {devices/gnd.sym} -500 1710 0 0 {name=write_gnd lab=GND}
N -320 1380 -80 1380 {lab=PD_Y}
N -80 1380 -80 1510 {lab=PD_Y}
N -80 1510 110 1510 {lab=PD_Y}
N -320 1650 -220 1650 {lab=PD_YB}
N -220 1430 -220 1650 {lab=PD_YB}
N -220 1430 500 1430 {lab=PD_YB}
N 500 1430 500 1510 {lab=PD_YB}
N 500 1510 610 1510 {lab=PD_YB}
T {2 x 2 SRAM | CLOCKED SEQUENCER / PARALLEL COMMAND INPUTS} -800 -280 0 0 0.45 0.45 {}
T {Real FFs and gates generate precharge, wordline, write and sense timing.} -800 -230 0 0 0.3 0.3 {}
T {ARRAY / ROW-COLUMN DECODE / WRITE CONTROL} -800 -160 0 0 0.3 0.3 {}
C {sram_sequencer.sym} 700 2350 0 0 {name=xseq}
C {devices/lab_pin.sym} 430 2175 0 0 {name=l227 lab=CLK}
C {devices/lab_pin.sym} 430 2225 0 0 {name=l228 lab=RESET}
C {devices/lab_pin.sym} 430 2275 0 0 {name=l229 lab=START}
C {devices/lab_pin.sym} 430 2325 0 0 {name=l230 lab=RA_IN}
C {devices/lab_pin.sym} 430 2375 0 0 {name=l231 lab=CA_IN}
C {devices/lab_pin.sym} 430 2425 0 0 {name=l232 lab=DIN_IN}
C {devices/lab_pin.sym} 430 2475 0 0 {name=l233 lab=WRITE_IN}
C {devices/lab_pin.sym} 430 2525 0 0 {name=l234 lab=SOUT}
C {devices/lab_pin.sym} 970 2050 2 0 {name=l235 lab=RA}
C {devices/lab_pin.sym} 970 2100 2 0 {name=l236 lab=CA}
C {devices/lab_pin.sym} 970 2150 2 0 {name=l237 lab=DIN}
C {devices/lab_pin.sym} 970 2200 2 0 {name=l238 lab=PREB}
C {devices/lab_pin.sym} 970 2250 2 0 {name=l239 lab=WRITE_EN}
C {devices/lab_pin.sym} 970 2300 2 0 {name=l240 lab=WL_EN}
C {devices/lab_pin.sym} 970 2350 2 0 {name=l241 lab=SAE}
C {devices/lab_pin.sym} 970 2400 2 0 {name=l242 lab=READ_DATA}
C {devices/lab_pin.sym} 970 2450 2 0 {name=l243 lab=BUSY}
C {devices/lab_pin.sym} 970 2500 2 0 {name=l244 lab=S0}
C {devices/lab_pin.sym} 970 2550 2 0 {name=l245 lab=S1}
C {devices/lab_pin.sym} 970 2600 2 0 {name=l246 lab=S2}
C {devices/lab_pin.sym} 970 2650 2 0 {name=l247 lab=W}
C {devices/lab_pin.sym} 700 1965 0 0 {name=l248 lab=VDD}
C {devices/lab_pin.sym} 700 2735 0 0 {name=l249 lab=GND}
T {CLOCKED SEQUENCER | descend into symbol to inspect state and output FFs} -800 1850 0 0 0.3 0.3 {}
T {ONE COMMAND: E0 accept, E1 release, E2 drive, E3 WL, E4 sense, E5 close, E6 capture, E7 idle} -800 2800 0 0 0.27 0.27 {}
C {devices/vsource.sym} -600 3100 0 0 {name=VVDD
value="5"
savecurrent=false
hide_texts=true}
C {devices/lab_pin.sym} -600 3070 2 0 {name=l253 lab=VDD}
C {devices/gnd.sym} -600 3130 0 0 {name=gs0 lab=GND}
T {5 V} -550 3100 0 0 0.23 0.23 {}
C {devices/vsource.sym} 0 3100 0 0 {name=VCLK
value="PULSE(0 5 50n 1n 1n 49n 100n)"
savecurrent=false
hide_texts=true}
C {devices/lab_pin.sym} 0 3070 2 0 {name=l257 lab=CLK}
C {devices/gnd.sym} 0 3130 0 0 {name=gs1 lab=GND}
T {100 ns / rising edge} 50 3100 0 0 0.23 0.23 {}
C {devices/vsource.sym} 600 3100 0 0 {name=VRESET
value="PWL(0n 5 210n 5 211n 0 14740n 0)"
savecurrent=false
hide_texts=true}
C {devices/lab_pin.sym} 600 3070 2 0 {name=l261 lab=RESET}
C {devices/gnd.sym} 600 3130 0 0 {name=gs2 lab=GND}
T {PWL} 650 3100 0 0 0.23 0.23 {}
C {devices/vsource.sym} 1200 3100 0 0 {name=VSTART
value="PWL(0n 0 310n 0 311n 5 360n 5 361n 0 560n 0 561n 5 660n 5 661n 0 1210n 0 1211n 5 1260n 5 1261n 0 1460n 0 1461n 5 1560n 5 1561n 0 2110n 0 2111n 5 2160n 5 2161n 0 2360n 0 2361n 5 2460n 5 2461n 0 3010n 0 3011n 5 3060n 5 3061n 0 3260n 0 3261n 5 3360n 5 3361n 0 3910n 0 3911n 5 3960n 5 3961n 0 4160n 0 4161n 5 4260n 5 4261n 0 4810n 0 4811n 5 4860n 5 4861n 0 5060n 0 5061n 5 5160n 5 5161n 0 5710n 0 5711n 5 5760n 5 5761n 0 5960n 0 5961n 5 6060n 5 6061n 0 6610n 0 6611n 5 6660n 5 6661n 0 6860n 0 6861n 5 6960n 5 6961n 0 7510n 0 7511n 5 7560n 5 7561n 0 7760n 0 7761n 5 7860n 5 7861n 0 8410n 0 8411n 5 8460n 5 8461n 0 8660n 0 8661n 5 8760n 5 8761n 0 9310n 0 9311n 5 9360n 5 9361n 0 9560n 0 9561n 5 9660n 5 9661n 0 10210n 0 10211n 5 10260n 5 10261n 0 10460n 0 10461n 5 10560n 5 10561n 0 11110n 0 11111n 5 11160n 5 11161n 0 11360n 0 11361n 5 11460n 5 11461n 0 12010n 0 12011n 5 12060n 5 12061n 0 12260n 0 12261n 5 12360n 5 12361n 0 12910n 0 12911n 5 12960n 5 12961n 0 13160n 0 13161n 5 13260n 5 13261n 0 13810n 0 13811n 5 13860n 5 13861n 0 14060n 0 14061n 5 14160n 5 14161n 0 14740n 0)"
savecurrent=false
hide_texts=true}
C {devices/lab_pin.sym} 1200 3070 2 0 {name=l265 lab=START}
C {devices/gnd.sym} 1200 3130 0 0 {name=gs3 lab=GND}
T {PWL} 1250 3100 0 0 0.23 0.23 {}
C {devices/vsource.sym} -600 3320 0 0 {name=VRA_IN
value="PWL(0n 0 310n 0 311n 0 460n 0 461n 5 1210n 5 1211n 0 1360n 0 1361n 5 2110n 5 2111n 0 2260n 0 2261n 5 3010n 5 3011n 0 3160n 0 3161n 5 3910n 5 3911n 5 4060n 5 4061n 0 4810n 0 4811n 5 4960n 5 4961n 0 5710n 0 5711n 5 5860n 5 5861n 0 6610n 0 6611n 5 6760n 5 6761n 0 7510n 0 7511n 0 7660n 0 7661n 5 8410n 5 8411n 0 8560n 0 8561n 5 9310n 5 9311n 0 9460n 0 9461n 5 10210n 5 10211n 0 10360n 0 10361n 5 11110n 5 11111n 5 11260n 5 11261n 0 12010n 0 12011n 5 12160n 5 12161n 0 12910n 0 12911n 5 13060n 5 13061n 0 13810n 0 13811n 5 13960n 5 13961n 0 14740n 0)"
savecurrent=false
hide_texts=true}
C {devices/lab_pin.sym} -600 3290 2 0 {name=l269 lab=RA_IN}
C {devices/gnd.sym} -600 3350 0 0 {name=gs4 lab=GND}
T {PWL} -550 3320 0 0 0.23 0.23 {}
C {devices/vsource.sym} 0 3320 0 0 {name=VCA_IN
value="PWL(0n 0 310n 0 311n 0 460n 0 461n 5 1210n 5 1211n 0 1360n 0 1361n 5 2110n 5 2111n 5 2260n 5 2261n 0 3010n 0 3011n 5 3160n 5 3161n 0 3910n 0 3911n 0 4060n 0 4061n 5 4810n 5 4811n 0 4960n 0 4961n 5 5710n 5 5711n 5 5860n 5 5861n 0 6610n 0 6611n 5 6760n 5 6761n 0 7510n 0 7511n 0 7660n 0 7661n 5 8410n 5 8411n 0 8560n 0 8561n 5 9310n 5 9311n 5 9460n 5 9461n 0 10210n 0 10211n 5 10360n 5 10361n 0 11110n 0 11111n 0 11260n 0 11261n 5 12010n 5 12011n 0 12160n 0 12161n 5 12910n 5 12911n 5 13060n 5 13061n 0 13810n 0 13811n 5 13960n 5 13961n 0 14740n 0)"
savecurrent=false
hide_texts=true}
C {devices/lab_pin.sym} 0 3290 2 0 {name=l273 lab=CA_IN}
C {devices/gnd.sym} 0 3350 0 0 {name=gs5 lab=GND}
T {PWL} 50 3320 0 0 0.23 0.23 {}
C {devices/vsource.sym} 600 3320 0 0 {name=VDIN_IN
value="PWL(0n 0 310n 0 311n 0 460n 0 461n 5 1210n 5 1211n 0 1360n 0 1361n 5 2110n 5 2111n 5 2260n 5 2261n 0 3010n 0 3011n 5 3160n 5 3161n 0 3910n 0 3911n 5 4060n 5 4061n 0 4810n 0 4811n 5 4960n 5 4961n 0 5710n 0 5711n 0 5860n 0 5861n 5 6610n 5 6611n 0 6760n 0 6761n 5 7510n 5 7511n 5 7660n 5 7661n 0 8410n 0 8411n 5 8560n 5 8561n 0 9310n 0 9311n 0 9460n 0 9461n 5 10210n 5 10211n 0 10360n 0 10361n 5 11110n 5 11111n 0 11260n 0 11261n 5 12010n 5 12011n 0 12160n 0 12161n 5 12910n 5 12911n 5 13060n 5 13061n 0 13810n 0 13811n 5 13960n 5 13961n 0 14740n 0)"
savecurrent=false
hide_texts=true}
C {devices/lab_pin.sym} 600 3290 2 0 {name=l277 lab=DIN_IN}
C {devices/gnd.sym} 600 3350 0 0 {name=gs6 lab=GND}
T {PWL} 650 3320 0 0 0.23 0.23 {}
C {devices/vsource.sym} 1200 3320 0 0 {name=VWRITE_IN
value="PWL(0n 0 310n 0 311n 5 460n 5 461n 0 1210n 0 1211n 0 1360n 0 1361n 5 2110n 5 2111n 5 2260n 5 2261n 0 3010n 0 3011n 0 3160n 0 3161n 5 3910n 5 3911n 5 4060n 5 4061n 0 4810n 0 4811n 0 4960n 0 4961n 5 5710n 5 5711n 5 5860n 5 5861n 0 6610n 0 6611n 0 6760n 0 6761n 5 7510n 5 7511n 5 7660n 5 7661n 0 8410n 0 8411n 0 8560n 0 8561n 5 9310n 5 9311n 5 9460n 5 9461n 0 10210n 0 10211n 0 10360n 0 10361n 5 11110n 5 11111n 5 11260n 5 11261n 0 12010n 0 12011n 0 12160n 0 12161n 5 12910n 5 12911n 5 13060n 5 13061n 0 13810n 0 13811n 0 13960n 0 13961n 5 14740n 5)"
savecurrent=false
hide_texts=true}
C {devices/lab_pin.sym} 1200 3290 2 0 {name=l281 lab=WRITE_IN}
C {devices/gnd.sym} 1200 3350 0 0 {name=gs7 lab=GND}
T {PWL} 1250 3320 0 0 0.23 0.23 {}
T {INPUT SOURCES: edit with q. RESET is internal test initialization, not a new external pin.} -800 2960 0 0 0.28 0.28 {}
T {SEQUENCE / CLK=100 ns} 2200 -180 0 0 0.28 0.28 {}
T {RESET HIGH through 210 ns (2 rising edges)} 2200 -138 0 0 0.28 0.28 {}
T {First START sampled at 350 ns} 2200 -96 0 0 0.28 0.28 {}
T {Next command every 900 ns} 2200 -54 0 0 0.28 0.28 {}
T {WRITE followed by READ at each address} 2200 -12 0 0 0.28 0.28 {}
T {Checkerboard then inverse; 16 commands} 2200 30 0 0 0.28 0.28 {}
T {} 2200 72 0 0 0.28 0.28 {}
T {E0: accept RA/CA/DIN/WRITE; precharge} 2200 114 0 0 0.28 0.28 {}
T {E1: precharge OFF} 2200 156 0 0 0.28 0.28 {}
T {E2: write pull-down enable (writes only)} 2200 198 0 0 0.28 0.28 {}
T {E3: WL_EN HIGH} 2200 240 0 0 0.28 0.28 {}
T {E4: SAE HIGH} 2200 282 0 0 0.28 0.28 {}
T {E5: WL_EN LOW; keep write drive} 2200 324 0 0 0.28 0.28 {}
T {E6: release write / capture READ_DATA} 2200 366 0 0 0.28 0.28 {}
T {E7: IDLE} 2200 408 0 0 0.28 0.28 {}
T {E8: idle gap; no automatic repeat} 2200 450 0 0 0.28 0.28 {}
T {} 2200 492 0 0 0.28 0.28 {}
T {After E0, external input bits are inverted.} 2200 534 0 0 0.28 0.28 {}
T {Busy START pulses must be ignored.} 2200 576 0 0 0.28 0.28 {}
T {Active RA/CA/DIN/W must remain latched.} 2200 618 0 0 0.28 0.28 {}
T {READ_DATA holds across writes and reset of SA.} 2200 660 0 0 0.28 0.28 {}
T {} 2200 702 0 0 0.28 0.28 {}
T {STATE: S2 S1 S0 = 000 idle ... 111 finish} 2200 744 0 0 0.28 0.28 {}
T {No shift register or extracted wiring yet.} 2200 786 0 0 0.28 0.28 {}
T {Unwritten SRAM contents are unspecified.} 2200 828 0 0 0.28 0.28 {}
T {350 ns: W r0 c0 = 0} 2200 1020 0 0 0.27 0.27 {}
T {1250 ns: R r0 c0 = 0} 2200 1058 0 0 0.27 0.27 {}
T {2150 ns: W r0 c1 = 1} 2200 1096 0 0 0.27 0.27 {}
T {3050 ns: R r0 c1 = 1} 2200 1134 0 0 0.27 0.27 {}
T {3950 ns: W r1 c0 = 1} 2200 1172 0 0 0.27 0.27 {}
T {4850 ns: R r1 c0 = 1} 2200 1210 0 0 0.27 0.27 {}
T {5750 ns: W r1 c1 = 0} 2200 1248 0 0 0.27 0.27 {}
T {6650 ns: R r1 c1 = 0} 2200 1286 0 0 0.27 0.27 {}
T {7550 ns: W r0 c0 = 1} 2200 1324 0 0 0.27 0.27 {}
T {8450 ns: R r0 c0 = 1} 2200 1362 0 0 0.27 0.27 {}
T {9350 ns: W r0 c1 = 0} 2200 1400 0 0 0.27 0.27 {}
T {10250 ns: R r0 c1 = 0} 2200 1438 0 0 0.27 0.27 {}
T {11150 ns: W r1 c0 = 0} 2200 1476 0 0 0.27 0.27 {}
T {12050 ns: R r1 c0 = 0} 2200 1514 0 0 0.27 0.27 {}
T {12950 ns: W r1 c1 = 1} 2200 1552 0 0 0.27 0.27 {}
T {13850 ns: R r1 c1 = 1} 2200 1590 0 0 0.27 0.27 {}
C {devices/code.sym} 2250 1900 0 0 {name=TR_1um_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/ip62_models"}
C {devices/code.sym} 2600 1900 0 0 {name=SIMULATION
only_toplevel=true
value=".param CBL=10f CY=100f
.control
save v(CLK) v(RESET) v(START) v(RA_IN) v(CA_IN) v(DIN_IN) v(WRITE_IN) v(RA) v(CA) v(DIN) v(W) v(PREB) v(WL_EN) v(WRITE_EN) v(SAE) v(READ_DATA) v(BUSY) v(S0) v(S1) v(S2) v(WL0) v(WL1) v(COL0) v(COL1) v(PD_Y) v(PD_YB) v(BL0) v(BLB0) v(BL1) v(BLB1) v(Y) v(YB) v(SOUT) v(SOUTB) v(Q00) v(QB00) v(Q01) v(QB01) v(Q10) v(QB10) v(Q11) v(QB11)
tran 0.5n 14740n
let failures = 0
let state = (v(S0)+2*v(S1)+4*v(S2))/5
meas tran cell_0 find v(Q00) at=1130n
if cell_0 > 0.5
 let failures = failures + 1
end
meas tran cell_1 find v(Q00) at=2030n
if cell_1 > 0.5
 let failures = failures + 1
end
meas tran read_1 find v(READ_DATA) at=1930n
if read_1 > 0.5
 let failures = failures + 1
end
meas tran cell_2 find v(Q01) at=2930n
if cell_2 < 4.5
 let failures = failures + 1
end
meas tran cell_3 find v(Q01) at=3830n
if cell_3 < 4.5
 let failures = failures + 1
end
meas tran read_3 find v(READ_DATA) at=3730n
if read_3 < 4.5
 let failures = failures + 1
end
meas tran cell_4 find v(Q10) at=4730n
if cell_4 < 4.5
 let failures = failures + 1
end
meas tran cell_5 find v(Q10) at=5630n
if cell_5 < 4.5
 let failures = failures + 1
end
meas tran read_5 find v(READ_DATA) at=5530n
if read_5 < 4.5
 let failures = failures + 1
end
meas tran cell_6 find v(Q11) at=6530n
if cell_6 > 0.5
 let failures = failures + 1
end
meas tran cell_7 find v(Q11) at=7430n
if cell_7 > 0.5
 let failures = failures + 1
end
meas tran read_7 find v(READ_DATA) at=7330n
if read_7 > 0.5
 let failures = failures + 1
end
meas tran cell_8 find v(Q00) at=8330n
if cell_8 < 4.5
 let failures = failures + 1
end
meas tran cell_9 find v(Q00) at=9230n
if cell_9 < 4.5
 let failures = failures + 1
end
meas tran read_9 find v(READ_DATA) at=9130n
if read_9 < 4.5
 let failures = failures + 1
end
meas tran cell_10 find v(Q01) at=10130n
if cell_10 > 0.5
 let failures = failures + 1
end
meas tran cell_11 find v(Q01) at=11030n
if cell_11 > 0.5
 let failures = failures + 1
end
meas tran read_11 find v(READ_DATA) at=10930n
if read_11 > 0.5
 let failures = failures + 1
end
meas tran cell_12 find v(Q10) at=11930n
if cell_12 > 0.5
 let failures = failures + 1
end
meas tran cell_13 find v(Q10) at=12830n
if cell_13 > 0.5
 let failures = failures + 1
end
meas tran read_13 find v(READ_DATA) at=12730n
if read_13 > 0.5
 let failures = failures + 1
end
meas tran cell_14 find v(Q11) at=13730n
if cell_14 < 4.5
 let failures = failures + 1
end
meas tran cell_15 find v(Q11) at=14630n
if cell_15 < 4.5
 let failures = failures + 1
end
meas tran read_15 find v(READ_DATA) at=14530n
if read_15 < 4.5
 let failures = failures + 1
end
if failures = 0
 echo PASS: sequenced writes and registered reads; run scripts/verify_sequencer.py for full timing checks
else
 echo FAIL: sequenced SRAM access
 print failures
end
set wr_singlescale
set wr_vecnames
wrdata sequencer_waveforms.txt v(CLK) v(RESET) v(START) v(RA_IN) v(CA_IN) v(DIN_IN) v(WRITE_IN) v(RA) v(CA) v(DIN) v(W) v(PREB) v(WL_EN) v(WRITE_EN) v(SAE) v(READ_DATA) v(BUSY) v(S0) v(S1) v(S2) v(WL0) v(WL1) v(COL0) v(COL1) v(PD_Y) v(PD_YB) v(BL0) v(BLB0) v(BL1) v(BLB1) v(Y) v(YB) v(SOUT) v(SOUTB) v(Q00) v(QB00) v(Q01) v(QB01) v(Q10) v(QB10) v(Q11) v(QB11)
write sram_tb_sequencer.raw
plot state xlimit 300n 1150n title 'STATE: E0=350ns to E7=1050ns; one state per CLK'
plot v(CLK) v(START) v(WRITE_IN) v(W) xlimit 300n 2050n title 'COMMAND: accepted mode holds despite input changes and busy START'
plot v(Q00) v(Q01) v(Q10) v(Q11) title 'STORED BITS: checkerboard then inverse'
plot v(SOUT) v(READ_DATA) title 'READ: SOUT is captured at E6; READ_DATA holds through writes'
let PREB_T = v(PREB)/5+6
let WRITE_EN_T = v(WRITE_EN)/5+4
let WL_EN_T = v(WL_EN)/5+2
let SAE_T = v(SAE)/5+0
plot PREB_T WRITE_EN_T WL_EN_T SAE_T xlimit 300n 2050n title 'CONTROLS: PREB+6 WRITE_EN+4 WL_EN+2 SAE+0'
.endc"}
C {devices/netlist_options.sym} 2250 2100 0 0 {name=NETLIST_OPTIONS
lvs_netlist=false
top_is_subckt=false
spiceprefix=true
hiersep=. }
