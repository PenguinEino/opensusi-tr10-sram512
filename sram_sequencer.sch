v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {SRAM SEQUENCER | 8 states / synchronous reset / registered controls} -100 -260 0 0 0.4 0.4 {}
T {STATE COUNTER: count when busy or START; IDLE holds otherwise} -100 -180 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/INV_X1.sym} 0 0 0 0 {name=xreset_inv}
C {devices/lab_pin.sym} 30 -40 0 0 {name=l10 lab=VDD}
C {devices/lab_pin.sym} -20 0 0 0 {name=l11 lab=RESET}
C {devices/lab_pin.sym} 100 0 2 0 {name=l12 lab=RESET_B}
C {devices/lab_pin.sym} 30 40 2 0 {name=l13 lab=VSS}
C {TR-1um_5_stdcell/OR3.sym} 250 0 0 0 {name=xbusy}
C {devices/lab_pin.sym} 230 20 0 0 {name=l15 lab=S2}
C {devices/lab_pin.sym} 280 -60 0 0 {name=l16 lab=VDD}
C {devices/lab_pin.sym} 230 -20 0 0 {name=l18 lab=S0}
C {devices/lab_pin.sym} 230 0 0 0 {name=l19 lab=S1}
C {devices/lab_pin.sym} 280 60 2 0 {name=l20 lab=VSS}
C {TR-1um_5_stdcell/INV_X1.sym} 550 0 0 0 {name=xidle}
C {devices/lab_pin.sym} 580 -40 0 0 {name=l22 lab=VDD}
C {devices/lab_pin.sym} 580 40 2 0 {name=l25 lab=VSS}
C {TR-1um_5_stdcell/AND3_X1.sym} 850 0 0 0 {name=xaccept}
C {devices/lab_pin.sym} 830 20 0 0 {name=l27 lab=RESET_B}
C {devices/lab_pin.sym} 880 -60 0 0 {name=l28 lab=VDD}
C {devices/lab_pin.sym} 960 0 2 0 {name=l29 lab=ACCEPT}
C {devices/lab_pin.sym} 830 0 0 0 {name=l31 lab=START}
C {devices/lab_pin.sym} 880 60 2 0 {name=l32 lab=VSS}
C {TR-1um_5_stdcell/OR2.sym} 1150 0 0 0 {name=xrun}
C {devices/lab_pin.sym} 1180 -60 0 0 {name=l34 lab=VDD}
C {devices/lab_pin.sym} 1260 0 2 0 {name=l35 lab=RUN}
C {devices/lab_pin.sym} 1130 -20 0 0 {name=l36 lab=BUSY}
C {devices/lab_pin.sym} 1130 20 0 0 {name=l37 lab=START}
C {devices/lab_pin.sym} 1180 60 2 0 {name=l38 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 1450 0 0 0 {name=xcarry}
C {devices/lab_pin.sym} 1480 -60 0 0 {name=l40 lab=VDD}
C {devices/lab_pin.sym} 1560 0 2 0 {name=l41 lab=CARRY}
C {devices/lab_pin.sym} 1430 -20 0 0 {name=l42 lab=S0}
C {devices/lab_pin.sym} 1430 20 0 0 {name=l43 lab=S1}
C {devices/lab_pin.sym} 1480 60 2 0 {name=l44 lab=VSS}
C {TR-1um_5_stdcell/INV_X1.sym} 0 230 0 0 {name=xb0}
C {devices/lab_pin.sym} 30 190 0 0 {name=l46 lab=VDD}
C {devices/lab_pin.sym} -20 230 0 0 {name=l47 lab=S0}
C {devices/lab_pin.sym} 30 270 2 0 {name=l49 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 280 230 0 0 {name=xn0}
C {devices/lab_pin.sym} 310 170 0 0 {name=l51 lab=VDD}
C {devices/lab_pin.sym} 260 250 0 0 {name=l54 lab=RUN}
C {devices/lab_pin.sym} 310 290 2 0 {name=l55 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 580 230 0 0 {name=xnr0}
C {TR-1um_5_stdcell/DFFR.sym} 880 260 0 0 {name=xs0}
N 690 230 850 230 {lab=N0}
C {devices/lab_pin.sym} 610 170 0 0 {name=l59 lab=VDD}
C {devices/lab_pin.sym} 560 250 0 0 {name=l61 lab=RESET_B}
C {devices/lab_pin.sym} 610 290 2 0 {name=l62 lab=VSS}
C {devices/lab_pin.sym} 850 200 0 0 {name=l63 lab=VDD}
C {devices/lab_pin.sym} 910 270 2 0 {name=l64 lab=xs0_QB}
C {devices/lab_pin.sym} 910 230 2 0 {name=l65 lab=S0}
C {devices/lab_pin.sym} 880 300 0 0 {name=l66 lab=VSS}
C {devices/lab_pin.sym} 850 320 2 0 {name=l67 lab=VSS}
C {devices/lab_pin.sym} 850 270 0 0 {name=l68 lab=CLK}
C {devices/lab_pin.sym} 760 230 2 0 {name=l69 lab=N0}
C {TR-1um_5_stdcell/XOR2.sym} 280 450 0 0 {name=xn1}
C {devices/lab_pin.sym} 310 390 0 0 {name=l71 lab=VDD}
C {devices/lab_pin.sym} 260 430 0 0 {name=l73 lab=S1}
C {devices/lab_pin.sym} 260 470 0 0 {name=l74 lab=S0}
C {devices/lab_pin.sym} 310 510 2 0 {name=l75 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 580 450 0 0 {name=xnr1}
C {TR-1um_5_stdcell/DFFR.sym} 880 480 0 0 {name=xs1}
N 690 450 850 450 {lab=N1}
C {devices/lab_pin.sym} 610 390 0 0 {name=l79 lab=VDD}
C {devices/lab_pin.sym} 560 470 0 0 {name=l81 lab=RESET_B}
C {devices/lab_pin.sym} 610 510 2 0 {name=l82 lab=VSS}
C {devices/lab_pin.sym} 850 420 0 0 {name=l83 lab=VDD}
C {devices/lab_pin.sym} 910 490 2 0 {name=l84 lab=xs1_QB}
C {devices/lab_pin.sym} 910 450 2 0 {name=l85 lab=S1}
C {devices/lab_pin.sym} 880 520 0 0 {name=l86 lab=VSS}
C {devices/lab_pin.sym} 850 540 2 0 {name=l87 lab=VSS}
C {devices/lab_pin.sym} 850 490 0 0 {name=l88 lab=CLK}
C {devices/lab_pin.sym} 760 450 2 0 {name=l89 lab=N1}
C {TR-1um_5_stdcell/XOR2.sym} 280 670 0 0 {name=xn2}
C {devices/lab_pin.sym} 310 610 0 0 {name=l91 lab=VDD}
C {devices/lab_pin.sym} 260 650 0 0 {name=l93 lab=S2}
C {devices/lab_pin.sym} 260 690 0 0 {name=l94 lab=CARRY}
C {devices/lab_pin.sym} 310 730 2 0 {name=l95 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 580 670 0 0 {name=xnr2}
C {TR-1um_5_stdcell/DFFR.sym} 880 700 0 0 {name=xs2}
N 690 670 850 670 {lab=N2}
C {devices/lab_pin.sym} 610 610 0 0 {name=l99 lab=VDD}
C {devices/lab_pin.sym} 560 690 0 0 {name=l101 lab=RESET_B}
C {devices/lab_pin.sym} 610 730 2 0 {name=l102 lab=VSS}
C {devices/lab_pin.sym} 850 640 0 0 {name=l103 lab=VDD}
C {devices/lab_pin.sym} 910 710 2 0 {name=l104 lab=xs2_QB}
C {devices/lab_pin.sym} 910 670 2 0 {name=l105 lab=S2}
C {devices/lab_pin.sym} 880 740 0 0 {name=l106 lab=VSS}
C {devices/lab_pin.sym} 850 760 2 0 {name=l107 lab=VSS}
C {devices/lab_pin.sym} 850 710 0 0 {name=l108 lab=CLK}
C {devices/lab_pin.sym} 760 670 2 0 {name=l109 lab=N2}
T {NEXT-STATE OUTPUT LOGIC: N is the next state, W_D the next mode} 1800 -180 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/INV_X1.sym} 1800 0 0 0 {name=xnb1}
C {devices/lab_pin.sym} 1830 -40 0 0 {name=l112 lab=VDD}
C {devices/lab_pin.sym} 1780 0 0 0 {name=l113 lab=N1}
C {devices/lab_pin.sym} 1900 0 2 0 {name=l114 lab=N1_B}
C {devices/lab_pin.sym} 1830 40 2 0 {name=l115 lab=VSS}
C {TR-1um_5_stdcell/INV_X1.sym} 2100 0 0 0 {name=xnb2}
C {devices/lab_pin.sym} 2130 -40 0 0 {name=l117 lab=VDD}
C {devices/lab_pin.sym} 2080 0 0 0 {name=l118 lab=N2}
C {devices/lab_pin.sym} 2200 0 2 0 {name=l119 lab=N2_B}
C {devices/lab_pin.sym} 2130 40 2 0 {name=l120 lab=VSS}
C {TR-1um_5_stdcell/NAND3.sym} 2400 0 0 0 {name=xpd}
C {devices/lab_pin.sym} 2380 20 0 0 {name=l122 lab=N0}
C {devices/lab_pin.sym} 2430 -60 0 0 {name=l123 lab=VDD}
C {devices/lab_pin.sym} 2380 -20 0 0 {name=l125 lab=N2_B}
C {devices/lab_pin.sym} 2380 0 0 0 {name=l126 lab=N1_B}
C {devices/lab_pin.sym} 2430 60 2 0 {name=l127 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 2400 220 0 0 {name=xwld}
C {devices/lab_pin.sym} 2430 160 0 0 {name=l129 lab=VDD}
C {devices/lab_pin.sym} 2380 200 0 0 {name=l131 lab=N2}
C {devices/lab_pin.sym} 2380 240 0 0 {name=l132 lab=N1_B}
C {devices/lab_pin.sym} 2430 280 2 0 {name=l133 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 1800 440 0 0 {name=xnc}
C {devices/lab_pin.sym} 1830 380 0 0 {name=l135 lab=VDD}
C {devices/lab_pin.sym} 1780 420 0 0 {name=l137 lab=N1}
C {devices/lab_pin.sym} 1780 460 0 0 {name=l138 lab=N0}
C {devices/lab_pin.sym} 1830 500 2 0 {name=l139 lab=VSS}
C {TR-1um_5_stdcell/XOR2.sym} 2100 440 0 0 {name=xwindow}
C {devices/lab_pin.sym} 2130 380 0 0 {name=l141 lab=VDD}
C {devices/lab_pin.sym} 2080 420 0 0 {name=l143 lab=N2}
C {devices/lab_pin.sym} 2130 500 2 0 {name=l145 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 2400 440 0 0 {name=xwed}
C {devices/lab_pin.sym} 2430 380 0 0 {name=l147 lab=VDD}
C {devices/lab_pin.sym} 2380 460 0 0 {name=l150 lab=W_D}
C {devices/lab_pin.sym} 2430 500 2 0 {name=l151 lab=VSS}
C {TR-1um_5_stdcell/NOR3.sym} 1800 660 0 0 {name=xnidle}
C {devices/lab_pin.sym} 1780 660 0 0 {name=l153 lab=N1}
C {devices/lab_pin.sym} 1780 680 0 0 {name=l154 lab=N2}
C {devices/lab_pin.sym} 1830 600 0 0 {name=l155 lab=VDD}
C {devices/lab_pin.sym} 1910 660 2 0 {name=l156 lab=N_IDLE}
C {devices/lab_pin.sym} 1780 640 0 0 {name=l157 lab=N0}
C {devices/lab_pin.sym} 1830 720 2 0 {name=l158 lab=VSS}
C {TR-1um_5_stdcell/OR2.sym} 2100 660 0 0 {name=xnlower}
C {devices/lab_pin.sym} 2130 600 0 0 {name=l160 lab=VDD}
C {devices/lab_pin.sym} 2080 640 0 0 {name=l162 lab=N0}
C {devices/lab_pin.sym} 2080 680 0 0 {name=l163 lab=N1}
C {devices/lab_pin.sym} 2130 720 2 0 {name=l164 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 2400 660 0 0 {name=xlate}
C {devices/lab_pin.sym} 2430 600 0 0 {name=l166 lab=VDD}
C {devices/lab_pin.sym} 2380 640 0 0 {name=l168 lab=N2}
C {devices/lab_pin.sym} 2430 720 2 0 {name=l170 lab=VSS}
C {TR-1um_5_stdcell/OR3.sym} 2700 660 0 0 {name=xsaed}
C {devices/lab_pin.sym} 2680 680 0 0 {name=l172 lab=W_D}
C {devices/lab_pin.sym} 2730 600 0 0 {name=l173 lab=VDD}
C {devices/lab_pin.sym} 2680 640 0 0 {name=l175 lab=N_IDLE}
C {devices/lab_pin.sym} 2730 720 2 0 {name=l177 lab=VSS}
C {TR-1um_5_stdcell/DFFR.sym} 3250 30 0 0 {name=xo0}
C {devices/lab_pin.sym} 3220 -30 0 0 {name=l179 lab=VDD}
C {devices/lab_pin.sym} 3280 40 2 0 {name=l180 lab=xo0_QB}
C {devices/lab_pin.sym} 3280 0 2 0 {name=l182 lab=PREB}
C {devices/lab_pin.sym} 3250 70 0 0 {name=l183 lab=VSS}
C {devices/lab_pin.sym} 3220 90 2 0 {name=l184 lab=VSS}
C {devices/lab_pin.sym} 3220 40 0 0 {name=l185 lab=CLK}
T {PREB} 3390 0 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/DFFR.sym} 3250 250 0 0 {name=xo1}
C {devices/lab_pin.sym} 3220 190 0 0 {name=l188 lab=VDD}
C {devices/lab_pin.sym} 3280 260 2 0 {name=l189 lab=xo1_QB}
C {devices/lab_pin.sym} 3280 220 2 0 {name=l191 lab=WL_EN}
C {devices/lab_pin.sym} 3250 290 0 0 {name=l192 lab=VSS}
C {devices/lab_pin.sym} 3220 310 2 0 {name=l193 lab=VSS}
C {devices/lab_pin.sym} 3220 260 0 0 {name=l194 lab=CLK}
T {WL_EN} 3390 220 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/DFFR.sym} 3250 470 0 0 {name=xo2}
C {devices/lab_pin.sym} 3220 410 0 0 {name=l197 lab=VDD}
C {devices/lab_pin.sym} 3280 480 2 0 {name=l198 lab=xo2_QB}
C {devices/lab_pin.sym} 3280 440 2 0 {name=l200 lab=WRITE_EN}
C {devices/lab_pin.sym} 3250 510 0 0 {name=l201 lab=VSS}
C {devices/lab_pin.sym} 3220 530 2 0 {name=l202 lab=VSS}
C {devices/lab_pin.sym} 3220 480 0 0 {name=l203 lab=CLK}
T {WRITE_EN} 3390 440 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/DFFR.sym} 3250 690 0 0 {name=xo3}
C {devices/lab_pin.sym} 3220 630 0 0 {name=l206 lab=VDD}
C {devices/lab_pin.sym} 3280 700 2 0 {name=l207 lab=xo3_QB}
C {devices/lab_pin.sym} 3280 660 2 0 {name=l209 lab=SAE}
C {devices/lab_pin.sym} 3250 730 0 0 {name=l210 lab=VSS}
C {devices/lab_pin.sym} 3220 750 2 0 {name=l211 lab=VSS}
C {devices/lab_pin.sym} 3220 700 0 0 {name=l212 lab=CLK}
T {SAE} 3390 660 0 0 0.3 0.3 {}
T {ACCESS REGISTERS: load only on ACCEPT; input changes while busy are ignored} -100 940 0 0 0.3 0.3 {}
C {sync_register_bit.sym} 200 1250 0 0 {name=xreg_RA}
C {devices/lab_pin.sym} 40 1175 0 0 {name=l216 lab=RA_IN}
C {devices/lab_pin.sym} 40 1225 0 0 {name=l217 lab=ACCEPT}
C {devices/lab_pin.sym} 40 1275 0 0 {name=l218 lab=CLK}
C {devices/lab_pin.sym} 40 1325 0 0 {name=l219 lab=RESET}
C {devices/lab_pin.sym} 360 1250 2 0 {name=l220 lab=RA}
C {devices/lab_pin.sym} 200 1090 0 0 {name=l221 lab=VDD}
C {devices/lab_pin.sym} 200 1410 0 0 {name=l222 lab=VSS}
C {sync_register_bit.sym} 850 1250 0 0 {name=xreg_CA}
C {devices/lab_pin.sym} 690 1175 0 0 {name=l224 lab=CA_IN}
C {devices/lab_pin.sym} 690 1225 0 0 {name=l225 lab=ACCEPT}
C {devices/lab_pin.sym} 690 1275 0 0 {name=l226 lab=CLK}
C {devices/lab_pin.sym} 690 1325 0 0 {name=l227 lab=RESET}
C {devices/lab_pin.sym} 1010 1250 2 0 {name=l228 lab=CA}
C {devices/lab_pin.sym} 850 1090 0 0 {name=l229 lab=VDD}
C {devices/lab_pin.sym} 850 1410 0 0 {name=l230 lab=VSS}
C {sync_register_bit.sym} 1500 1250 0 0 {name=xreg_DIN}
C {devices/lab_pin.sym} 1340 1175 0 0 {name=l232 lab=DIN_IN}
C {devices/lab_pin.sym} 1340 1225 0 0 {name=l233 lab=ACCEPT}
C {devices/lab_pin.sym} 1340 1275 0 0 {name=l234 lab=CLK}
C {devices/lab_pin.sym} 1340 1325 0 0 {name=l235 lab=RESET}
C {devices/lab_pin.sym} 1660 1250 2 0 {name=l236 lab=DIN}
C {devices/lab_pin.sym} 1500 1090 0 0 {name=l237 lab=VDD}
C {devices/lab_pin.sym} 1500 1410 0 0 {name=l238 lab=VSS}
C {TR-1um_5_stdcell/MUX2.sym} 2050 1110 0 0 {name=xwmux}
C {TR-1um_5_stdcell/AND2_X1.sym} 2300 1130 0 0 {name=xwrst}
C {TR-1um_5_stdcell/DFFR.sym} 2600 1160 0 0 {name=xwreg}
N 2120 1110 2280 1110 {lab=W_M}
N 2410 1130 2570 1130 {lab=W_D}
C {devices/lab_pin.sym} 2030 1090 0 0 {name=l244 lab=W}
C {devices/lab_pin.sym} 2030 1130 0 0 {name=l245 lab=WRITE_IN}
C {devices/lab_pin.sym} 2070 1150 0 0 {name=l246 lab=ACCEPT}
C {devices/lab_pin.sym} 2090 1070 0 0 {name=l247 lab=VDD}
C {devices/lab_pin.sym} 2090 1150 2 0 {name=l248 lab=VSS}
C {devices/lab_pin.sym} 2330 1070 0 0 {name=l249 lab=VDD}
C {devices/lab_pin.sym} 2280 1150 0 0 {name=l250 lab=RESET_B}
C {devices/lab_pin.sym} 2330 1190 2 0 {name=l251 lab=VSS}
C {devices/lab_pin.sym} 2570 1100 0 0 {name=l252 lab=VDD}
C {devices/lab_pin.sym} 2630 1170 2 0 {name=l253 lab=xwreg_QB}
C {devices/lab_pin.sym} 2630 1130 2 0 {name=l254 lab=W}
C {devices/lab_pin.sym} 2600 1200 0 0 {name=l255 lab=VSS}
C {devices/lab_pin.sym} 2570 1220 2 0 {name=l256 lab=VSS}
C {devices/lab_pin.sym} 2570 1170 0 0 {name=l257 lab=CLK}
C {devices/lab_pin.sym} 2470 1130 2 0 {name=l258 lab=W_D}
T {READ RESULT: capture SOUT on CLOSE -> FINISH (E6), hold through writes} -100 1580 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/INV_X1.sym} 0 1740 0 0 {name=xwb}
C {devices/lab_pin.sym} 30 1700 0 0 {name=l261 lab=VDD}
C {devices/lab_pin.sym} -20 1740 0 0 {name=l262 lab=W}
C {devices/lab_pin.sym} 100 1740 2 0 {name=l263 lab=W_B}
C {devices/lab_pin.sym} 30 1780 2 0 {name=l264 lab=VSS}
C {TR-1um_5_stdcell/INV_X1.sym} 300 1740 0 0 {name=xq0b}
C {devices/lab_pin.sym} 330 1700 0 0 {name=l266 lab=VDD}
C {devices/lab_pin.sym} 280 1740 0 0 {name=l267 lab=S0}
C {devices/lab_pin.sym} 400 1740 2 0 {name=l268 lab=S0_RB}
C {devices/lab_pin.sym} 330 1780 2 0 {name=l269 lab=VSS}
C {TR-1um_5_stdcell/AND3_X1.sym} 600 1740 0 0 {name=xclose}
C {devices/lab_pin.sym} 580 1760 0 0 {name=l271 lab=S0_RB}
C {devices/lab_pin.sym} 630 1680 0 0 {name=l272 lab=VDD}
C {devices/lab_pin.sym} 580 1720 0 0 {name=l274 lab=S2}
C {devices/lab_pin.sym} 580 1740 0 0 {name=l275 lab=S1}
C {devices/lab_pin.sym} 630 1800 2 0 {name=l276 lab=VSS}
C {TR-1um_5_stdcell/AND2_X1.sym} 900 1740 0 0 {name=xreadcap}
C {devices/lab_pin.sym} 930 1680 0 0 {name=l278 lab=VDD}
C {devices/lab_pin.sym} 1010 1740 2 0 {name=l279 lab=READ_CAPTURE}
C {devices/lab_pin.sym} 880 1760 0 0 {name=l281 lab=W_B}
C {devices/lab_pin.sym} 930 1800 2 0 {name=l282 lab=VSS}
C {sync_register_bit.sym} 1400 1740 0 0 {name=xresult}
C {devices/lab_pin.sym} 1240 1665 0 0 {name=l284 lab=SOUT}
C {devices/lab_pin.sym} 1240 1715 0 0 {name=l285 lab=READ_CAPTURE}
C {devices/lab_pin.sym} 1240 1765 0 0 {name=l286 lab=CLK}
C {devices/lab_pin.sym} 1240 1815 0 0 {name=l287 lab=RESET}
C {devices/lab_pin.sym} 1560 1740 2 0 {name=l288 lab=READ_DATA}
C {devices/lab_pin.sym} 1400 1580 0 0 {name=l289 lab=VDD}
C {devices/lab_pin.sym} 1400 1900 0 0 {name=l290 lab=VSS}
T {All DFFR async RST pins tied to VSS; RESET is implemented in D-input logic.} 1800 1700 0 0 0.27 0.27 {}
T {PREB also drives YPREB at the top level. No independent duplicate output port.} 1800 1750 0 0 0.27 0.27 {}
C {devices/ipin.sym} -100 2100 0 0 {name=pCLK lab=CLK}
C {devices/ipin.sym} 190 2100 0 0 {name=pRESET lab=RESET}
C {devices/ipin.sym} 480 2100 0 0 {name=pSTART lab=START}
C {devices/ipin.sym} 770 2100 0 0 {name=pRA_IN lab=RA_IN}
C {devices/ipin.sym} 1060 2100 0 0 {name=pCA_IN lab=CA_IN}
C {devices/ipin.sym} 1350 2100 0 0 {name=pDIN_IN lab=DIN_IN}
C {devices/ipin.sym} 1640 2100 0 0 {name=pWRITE_IN lab=WRITE_IN}
C {devices/ipin.sym} 1930 2100 0 0 {name=pSOUT lab=SOUT}
C {devices/opin.sym} 2220 2100 0 0 {name=pRA lab=RA}
C {devices/opin.sym} 2510 2100 0 0 {name=pCA lab=CA}
C {devices/opin.sym} 2800 2100 0 0 {name=pDIN lab=DIN}
C {devices/opin.sym} 3090 2100 0 0 {name=pPREB lab=PREB}
C {devices/opin.sym} -100 2250 0 0 {name=pWRITE_EN lab=WRITE_EN}
C {devices/opin.sym} 190 2250 0 0 {name=pWL_EN lab=WL_EN}
C {devices/opin.sym} 480 2250 0 0 {name=pSAE lab=SAE}
C {devices/opin.sym} 770 2250 0 0 {name=pREAD_DATA lab=READ_DATA}
C {devices/opin.sym} 1060 2250 0 0 {name=pBUSY lab=BUSY}
C {devices/opin.sym} 1350 2250 0 0 {name=pS0 lab=S0}
C {devices/opin.sym} 1640 2250 0 0 {name=pS1 lab=S1}
C {devices/opin.sym} 1930 2250 0 0 {name=pS2 lab=S2}
C {devices/opin.sym} 2220 2250 0 0 {name=pW lab=W}
C {devices/iopin.sym} 2510 2250 0 0 {name=pVDD lab=VDD}
C {devices/iopin.sym} 2800 2250 0 0 {name=pVSS lab=VSS}
N 360 0 530 0 {lab=BUSY}
C {devices/lab_wire.sym} 390 0 0 0 {name=flow315 lab=BUSY}
N 650 0 790 0 {lab=IDLE}
N 790 0 790 -20 {lab=IDLE}
N 790 -20 830 -20 {lab=IDLE}
C {devices/lab_wire.sym} 680 0 0 0 {name=flow317 lab=IDLE}
N 100 230 220 230 {lab=S0_B}
N 220 230 220 210 {lab=S0_B}
N 220 210 260 210 {lab=S0_B}
C {devices/lab_wire.sym} 130 230 0 0 {name=flow319 lab=S0_B}
N 390 230 520 230 {lab=N0_RAW}
N 520 230 520 210 {lab=N0_RAW}
N 520 210 560 210 {lab=N0_RAW}
C {devices/lab_wire.sym} 420 230 0 0 {name=flow321 lab=N0_RAW}
N 390 450 520 450 {lab=N1_RAW}
N 520 450 520 430 {lab=N1_RAW}
N 520 430 560 430 {lab=N1_RAW}
C {devices/lab_wire.sym} 420 450 0 0 {name=flow323 lab=N1_RAW}
N 390 670 520 670 {lab=N2_RAW}
N 520 670 520 650 {lab=N2_RAW}
N 520 650 560 650 {lab=N2_RAW}
C {devices/lab_wire.sym} 420 670 0 0 {name=flow325 lab=N2_RAW}
N 2530 0 3220 0 {lab=P_D}
C {devices/lab_wire.sym} 2560 0 0 0 {name=flow325 lab=P_D}
N 2510 220 3220 220 {lab=WL_D}
C {devices/lab_wire.sym} 2540 220 0 0 {name=flow325 lab=WL_D}
N 2510 440 3220 440 {lab=WE_D}
C {devices/lab_wire.sym} 2540 440 0 0 {name=flow325 lab=WE_D}
N 2810 660 3220 660 {lab=SAE_D}
C {devices/lab_wire.sym} 2840 660 0 0 {name=flow325 lab=SAE_D}
N 1910 440 2040 440 {lab=NC}
N 2040 440 2040 460 {lab=NC}
N 2040 460 2080 460 {lab=NC}
C {devices/lab_wire.sym} 1940 440 0 0 {name=flow327 lab=NC}
N 2210 440 2340 440 {lab=WRITE_WINDOW}
N 2340 440 2340 420 {lab=WRITE_WINDOW}
N 2340 420 2380 420 {lab=WRITE_WINDOW}
C {devices/lab_wire.sym} 2240 440 0 0 {name=flow329 lab=WRITE_WINDOW}
N 2210 660 2340 660 {lab=N_LOWER}
N 2340 660 2340 680 {lab=N_LOWER}
N 2340 680 2380 680 {lab=N_LOWER}
C {devices/lab_wire.sym} 2240 660 0 0 {name=flow331 lab=N_LOWER}
N 2510 660 2680 660 {lab=N_LATE}
C {devices/lab_wire.sym} 2540 660 0 0 {name=flow331 lab=N_LATE}
N 710 1740 840 1740 {lab=CLOSE}
N 840 1740 840 1720 {lab=CLOSE}
N 840 1720 880 1720 {lab=CLOSE}
C {devices/lab_wire.sym} 740 1740 0 0 {name=flow333 lab=CLOSE}
