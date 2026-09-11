v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
E {}
T {4-to-16 ROW DECODER: 2+2 predecode, NAND3 + INV_X2 per wordline} -180 -330 0 0 0.3 0.3 {}
T {WL_EN=0 keeps every WL LOW; row address is fixed before the access window} -180 -260 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 0 0 0 {name=xpre0_0}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 250 0 0 {name=xpre0_1}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 500 0 0 {name=xpre0_2}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 750 0 0 {name=xpre0_3}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 1300 0 0 {name=xpre1_0}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 1550 0 0 {name=xpre1_1}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 1800 0 0 {name=xpre1_2}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 2050 0 0 {name=xpre1_3}
C {TR-1um_5_stdcell/NAND3.sym} 1400 0 0 0 {name=xdecode0}
C {TR-1um_5_stdcell/INV_X2.sym} 1780 0 0 0 {name=xdriver0}
C {TR-1um_5_stdcell/NAND3.sym} 1400 300 0 0 {name=xdecode1}
C {TR-1um_5_stdcell/INV_X2.sym} 1780 300 0 0 {name=xdriver1}
C {TR-1um_5_stdcell/NAND3.sym} 1400 600 0 0 {name=xdecode2}
C {TR-1um_5_stdcell/INV_X2.sym} 1780 600 0 0 {name=xdriver2}
C {TR-1um_5_stdcell/NAND3.sym} 1400 900 0 0 {name=xdecode3}
C {TR-1um_5_stdcell/INV_X2.sym} 1780 900 0 0 {name=xdriver3}
C {TR-1um_5_stdcell/NAND3.sym} 1400 1200 0 0 {name=xdecode4}
C {TR-1um_5_stdcell/INV_X2.sym} 1780 1200 0 0 {name=xdriver4}
C {TR-1um_5_stdcell/NAND3.sym} 1400 1500 0 0 {name=xdecode5}
C {TR-1um_5_stdcell/INV_X2.sym} 1780 1500 0 0 {name=xdriver5}
C {TR-1um_5_stdcell/NAND3.sym} 1400 1800 0 0 {name=xdecode6}
C {TR-1um_5_stdcell/INV_X2.sym} 1780 1800 0 0 {name=xdriver6}
C {TR-1um_5_stdcell/NAND3.sym} 1400 2100 0 0 {name=xdecode7}
C {TR-1um_5_stdcell/INV_X2.sym} 1780 2100 0 0 {name=xdriver7}
C {TR-1um_5_stdcell/NAND3.sym} 2450 0 0 0 {name=xdecode8}
C {TR-1um_5_stdcell/INV_X2.sym} 2830 0 0 0 {name=xdriver8}
C {TR-1um_5_stdcell/NAND3.sym} 2450 300 0 0 {name=xdecode9}
C {TR-1um_5_stdcell/INV_X2.sym} 2830 300 0 0 {name=xdriver9}
C {TR-1um_5_stdcell/NAND3.sym} 2450 600 0 0 {name=xdecode10}
C {TR-1um_5_stdcell/INV_X2.sym} 2830 600 0 0 {name=xdriver10}
C {TR-1um_5_stdcell/NAND3.sym} 2450 900 0 0 {name=xdecode11}
C {TR-1um_5_stdcell/INV_X2.sym} 2830 900 0 0 {name=xdriver11}
C {TR-1um_5_stdcell/NAND3.sym} 2450 1200 0 0 {name=xdecode12}
C {TR-1um_5_stdcell/INV_X2.sym} 2830 1200 0 0 {name=xdriver12}
C {TR-1um_5_stdcell/NAND3.sym} 2450 1500 0 0 {name=xdecode13}
C {TR-1um_5_stdcell/INV_X2.sym} 2830 1500 0 0 {name=xdriver13}
C {TR-1um_5_stdcell/NAND3.sym} 2450 1800 0 0 {name=xdecode14}
C {TR-1um_5_stdcell/INV_X2.sym} 2830 1800 0 0 {name=xdriver14}
C {TR-1um_5_stdcell/NAND3.sym} 2450 2100 0 0 {name=xdecode15}
C {TR-1um_5_stdcell/INV_X2.sym} 2830 2100 0 0 {name=xdriver15}
N 1530 0 1640 0 {lab=WL0B}
N 1640 0 1760 0 {lab=WL0B}
C {devices/lab_wire.sym} 1640 0 0 0 {name=l50 lab=WL0B}
N 1530 300 1640 300 {lab=WL1B}
N 1640 300 1760 300 {lab=WL1B}
C {devices/lab_wire.sym} 1640 300 0 0 {name=l53 lab=WL1B}
N 1530 600 1640 600 {lab=WL2B}
N 1640 600 1760 600 {lab=WL2B}
C {devices/lab_wire.sym} 1640 600 0 0 {name=l56 lab=WL2B}
N 1530 900 1640 900 {lab=WL3B}
N 1640 900 1760 900 {lab=WL3B}
C {devices/lab_wire.sym} 1640 900 0 0 {name=l59 lab=WL3B}
N 1530 1200 1640 1200 {lab=WL4B}
N 1640 1200 1760 1200 {lab=WL4B}
C {devices/lab_wire.sym} 1640 1200 0 0 {name=l62 lab=WL4B}
N 1530 1500 1640 1500 {lab=WL5B}
N 1640 1500 1760 1500 {lab=WL5B}
C {devices/lab_wire.sym} 1640 1500 0 0 {name=l65 lab=WL5B}
N 1530 1800 1640 1800 {lab=WL6B}
N 1640 1800 1760 1800 {lab=WL6B}
C {devices/lab_wire.sym} 1640 1800 0 0 {name=l68 lab=WL6B}
N 1530 2100 1640 2100 {lab=WL7B}
N 1640 2100 1760 2100 {lab=WL7B}
C {devices/lab_wire.sym} 1640 2100 0 0 {name=l71 lab=WL7B}
N 2580 0 2700 0 {lab=WL8B}
N 2700 0 2810 0 {lab=WL8B}
C {devices/lab_wire.sym} 2700 0 0 0 {name=l74 lab=WL8B}
N 2580 300 2700 300 {lab=WL9B}
N 2700 300 2810 300 {lab=WL9B}
C {devices/lab_wire.sym} 2700 300 0 0 {name=l77 lab=WL9B}
N 2580 600 2700 600 {lab=WL10B}
N 2700 600 2810 600 {lab=WL10B}
C {devices/lab_wire.sym} 2700 600 0 0 {name=l80 lab=WL10B}
N 2580 900 2700 900 {lab=WL11B}
N 2700 900 2810 900 {lab=WL11B}
C {devices/lab_wire.sym} 2700 900 0 0 {name=l83 lab=WL11B}
N 2580 1200 2700 1200 {lab=WL12B}
N 2700 1200 2810 1200 {lab=WL12B}
C {devices/lab_wire.sym} 2700 1200 0 0 {name=l86 lab=WL12B}
N 2580 1500 2700 1500 {lab=WL13B}
N 2700 1500 2810 1500 {lab=WL13B}
C {devices/lab_wire.sym} 2700 1500 0 0 {name=l89 lab=WL13B}
N 2580 1800 2700 1800 {lab=WL14B}
N 2700 1800 2810 1800 {lab=WL14B}
C {devices/lab_wire.sym} 2700 1800 0 0 {name=l92 lab=WL14B}
N 2580 2100 2700 2100 {lab=WL15B}
N 2700 2100 2810 2100 {lab=WL15B}
C {devices/lab_wire.sym} 2700 2100 0 0 {name=l95 lab=WL15B}
C {devices/ipin.sym} -520 10 0 0 {name=pRA0 lab=RA0}
N -520 10 -460 10 {lab=RA0}
C {devices/lab_pin.sym} -460 10 0 0 {name=l98 lab=RA0}
C {devices/ipin.sym} -520 100 0 0 {name=pRA0B lab=RA0B}
N -520 100 -460 100 {lab=RA0B}
C {devices/lab_pin.sym} -460 100 0 0 {name=l101 lab=RA0B}
C {devices/ipin.sym} -520 190 0 0 {name=pRA1 lab=RA1}
N -520 190 -460 190 {lab=RA1}
C {devices/lab_pin.sym} -460 190 0 0 {name=l104 lab=RA1}
C {devices/ipin.sym} -520 280 0 0 {name=pRA1B lab=RA1B}
N -520 280 -460 280 {lab=RA1B}
C {devices/lab_pin.sym} -460 280 0 0 {name=l107 lab=RA1B}
C {devices/ipin.sym} -520 370 0 0 {name=pRA2 lab=RA2}
N -520 370 -460 370 {lab=RA2}
C {devices/lab_pin.sym} -460 370 0 0 {name=l110 lab=RA2}
C {devices/ipin.sym} -520 460 0 0 {name=pRA2B lab=RA2B}
N -520 460 -460 460 {lab=RA2B}
C {devices/lab_pin.sym} -460 460 0 0 {name=l113 lab=RA2B}
C {devices/ipin.sym} -520 550 0 0 {name=pRA3 lab=RA3}
N -520 550 -460 550 {lab=RA3}
C {devices/lab_pin.sym} -460 550 0 0 {name=l116 lab=RA3}
C {devices/ipin.sym} -520 640 0 0 {name=pRA3B lab=RA3B}
N -520 640 -460 640 {lab=RA3B}
C {devices/lab_pin.sym} -460 640 0 0 {name=l119 lab=RA3B}
C {devices/ipin.sym} -520 730 0 0 {name=pWL_EN lab=WL_EN}
N -520 730 -460 730 {lab=WL_EN}
C {devices/lab_pin.sym} -460 730 0 0 {name=l122 lab=WL_EN}
N 1880 0 2080 0 {lab=WL0}
C {devices/opin.sym} 2080 0 0 0 {name=pWL0 lab=WL0}
N 1880 300 2080 300 {lab=WL1}
C {devices/opin.sym} 2080 300 0 0 {name=pWL1 lab=WL1}
N 1880 600 2080 600 {lab=WL2}
C {devices/opin.sym} 2080 600 0 0 {name=pWL2 lab=WL2}
N 1880 900 2080 900 {lab=WL3}
C {devices/opin.sym} 2080 900 0 0 {name=pWL3 lab=WL3}
N 1880 1200 2080 1200 {lab=WL4}
C {devices/opin.sym} 2080 1200 0 0 {name=pWL4 lab=WL4}
N 1880 1500 2080 1500 {lab=WL5}
C {devices/opin.sym} 2080 1500 0 0 {name=pWL5 lab=WL5}
N 1880 1800 2080 1800 {lab=WL6}
C {devices/opin.sym} 2080 1800 0 0 {name=pWL6 lab=WL6}
N 1880 2100 2080 2100 {lab=WL7}
C {devices/opin.sym} 2080 2100 0 0 {name=pWL7 lab=WL7}
N 2930 0 3130 0 {lab=WL8}
C {devices/opin.sym} 3130 0 0 0 {name=pWL8 lab=WL8}
N 2930 300 3130 300 {lab=WL9}
C {devices/opin.sym} 3130 300 0 0 {name=pWL9 lab=WL9}
N 2930 600 3130 600 {lab=WL10}
C {devices/opin.sym} 3130 600 0 0 {name=pWL10 lab=WL10}
N 2930 900 3130 900 {lab=WL11}
C {devices/opin.sym} 3130 900 0 0 {name=pWL11 lab=WL11}
N 2930 1200 3130 1200 {lab=WL12}
C {devices/opin.sym} 3130 1200 0 0 {name=pWL12 lab=WL12}
N 2930 1500 3130 1500 {lab=WL13}
C {devices/opin.sym} 3130 1500 0 0 {name=pWL13 lab=WL13}
N 2930 1800 3130 1800 {lab=WL14}
C {devices/opin.sym} 3130 1800 0 0 {name=pWL14 lab=WL14}
N 2930 2100 3130 2100 {lab=WL15}
C {devices/opin.sym} 3130 2100 0 0 {name=pWL15 lab=WL15}
C {devices/iopin.sym} -520 -200 0 0 {name=pVDD lab=VDD}
N -520 -200 -460 -200 {lab=VDD}
C {devices/lab_pin.sym} -460 -200 0 0 {name=l157 lab=VDD}
C {devices/iopin.sym} -520 -130 0 0 {name=pVSS lab=VSS}
N -520 -130 -460 -130 {lab=VSS}
C {devices/lab_pin.sym} -460 -130 0 0 {name=l160 lab=VSS}
C {devices/lab_pin.sym} 380 -60 0 0 {name=l161 lab=VDD}
C {devices/lab_pin.sym} 460 0 2 0 {name=l162 lab=R0_0}
C {devices/lab_pin.sym} 330 -20 0 0 {name=l163 lab=RA0B}
C {devices/lab_pin.sym} 330 20 0 0 {name=l164 lab=RA1B}
C {devices/lab_pin.sym} 380 60 0 0 {name=l165 lab=VSS}
C {devices/lab_pin.sym} 380 190 0 0 {name=l166 lab=VDD}
C {devices/lab_pin.sym} 460 250 2 0 {name=l167 lab=R0_1}
C {devices/lab_pin.sym} 330 230 0 0 {name=l168 lab=RA0}
C {devices/lab_pin.sym} 330 270 0 0 {name=l169 lab=RA1B}
C {devices/lab_pin.sym} 380 310 0 0 {name=l170 lab=VSS}
C {devices/lab_pin.sym} 380 440 0 0 {name=l171 lab=VDD}
C {devices/lab_pin.sym} 460 500 2 0 {name=l172 lab=R0_2}
C {devices/lab_pin.sym} 330 480 0 0 {name=l173 lab=RA0B}
C {devices/lab_pin.sym} 330 520 0 0 {name=l174 lab=RA1}
C {devices/lab_pin.sym} 380 560 0 0 {name=l175 lab=VSS}
C {devices/lab_pin.sym} 380 690 0 0 {name=l176 lab=VDD}
C {devices/lab_pin.sym} 460 750 2 0 {name=l177 lab=R0_3}
C {devices/lab_pin.sym} 330 730 0 0 {name=l178 lab=RA0}
C {devices/lab_pin.sym} 330 770 0 0 {name=l179 lab=RA1}
C {devices/lab_pin.sym} 380 810 0 0 {name=l180 lab=VSS}
C {devices/lab_pin.sym} 380 1240 0 0 {name=l181 lab=VDD}
C {devices/lab_pin.sym} 460 1300 2 0 {name=l182 lab=R1_0}
C {devices/lab_pin.sym} 330 1280 0 0 {name=l183 lab=RA2B}
C {devices/lab_pin.sym} 330 1320 0 0 {name=l184 lab=RA3B}
C {devices/lab_pin.sym} 380 1360 0 0 {name=l185 lab=VSS}
C {devices/lab_pin.sym} 380 1490 0 0 {name=l186 lab=VDD}
C {devices/lab_pin.sym} 460 1550 2 0 {name=l187 lab=R1_1}
C {devices/lab_pin.sym} 330 1530 0 0 {name=l188 lab=RA2}
C {devices/lab_pin.sym} 330 1570 0 0 {name=l189 lab=RA3B}
C {devices/lab_pin.sym} 380 1610 0 0 {name=l190 lab=VSS}
C {devices/lab_pin.sym} 380 1740 0 0 {name=l191 lab=VDD}
C {devices/lab_pin.sym} 460 1800 2 0 {name=l192 lab=R1_2}
C {devices/lab_pin.sym} 330 1780 0 0 {name=l193 lab=RA2B}
C {devices/lab_pin.sym} 330 1820 0 0 {name=l194 lab=RA3}
C {devices/lab_pin.sym} 380 1860 0 0 {name=l195 lab=VSS}
C {devices/lab_pin.sym} 380 1990 0 0 {name=l196 lab=VDD}
C {devices/lab_pin.sym} 460 2050 2 0 {name=l197 lab=R1_3}
C {devices/lab_pin.sym} 330 2030 0 0 {name=l198 lab=RA2}
C {devices/lab_pin.sym} 330 2070 0 0 {name=l199 lab=RA3}
C {devices/lab_pin.sym} 380 2110 0 0 {name=l200 lab=VSS}
C {devices/lab_pin.sym} 1380 20 0 0 {name=l201 lab=WL_EN}
C {devices/lab_pin.sym} 1430 -60 0 0 {name=l202 lab=VDD}
C {devices/lab_pin.sym} 1380 -20 0 0 {name=l203 lab=R0_0}
C {devices/lab_pin.sym} 1380 0 0 0 {name=l204 lab=R1_0}
C {devices/lab_pin.sym} 1430 60 0 0 {name=l205 lab=VSS}
C {devices/lab_pin.sym} 1810 -40 0 0 {name=l206 lab=VDD}
C {devices/lab_pin.sym} 1810 40 0 0 {name=l207 lab=VSS}
C {devices/lab_pin.sym} 1380 320 0 0 {name=l208 lab=WL_EN}
C {devices/lab_pin.sym} 1430 240 0 0 {name=l209 lab=VDD}
C {devices/lab_pin.sym} 1380 280 0 0 {name=l210 lab=R0_1}
C {devices/lab_pin.sym} 1380 300 0 0 {name=l211 lab=R1_0}
C {devices/lab_pin.sym} 1430 360 0 0 {name=l212 lab=VSS}
C {devices/lab_pin.sym} 1810 260 0 0 {name=l213 lab=VDD}
C {devices/lab_pin.sym} 1810 340 0 0 {name=l214 lab=VSS}
C {devices/lab_pin.sym} 1380 620 0 0 {name=l215 lab=WL_EN}
C {devices/lab_pin.sym} 1430 540 0 0 {name=l216 lab=VDD}
C {devices/lab_pin.sym} 1380 580 0 0 {name=l217 lab=R0_2}
C {devices/lab_pin.sym} 1380 600 0 0 {name=l218 lab=R1_0}
C {devices/lab_pin.sym} 1430 660 0 0 {name=l219 lab=VSS}
C {devices/lab_pin.sym} 1810 560 0 0 {name=l220 lab=VDD}
C {devices/lab_pin.sym} 1810 640 0 0 {name=l221 lab=VSS}
C {devices/lab_pin.sym} 1380 920 0 0 {name=l222 lab=WL_EN}
C {devices/lab_pin.sym} 1430 840 0 0 {name=l223 lab=VDD}
C {devices/lab_pin.sym} 1380 880 0 0 {name=l224 lab=R0_3}
C {devices/lab_pin.sym} 1380 900 0 0 {name=l225 lab=R1_0}
C {devices/lab_pin.sym} 1430 960 0 0 {name=l226 lab=VSS}
C {devices/lab_pin.sym} 1810 860 0 0 {name=l227 lab=VDD}
C {devices/lab_pin.sym} 1810 940 0 0 {name=l228 lab=VSS}
C {devices/lab_pin.sym} 1380 1220 0 0 {name=l229 lab=WL_EN}
C {devices/lab_pin.sym} 1430 1140 0 0 {name=l230 lab=VDD}
C {devices/lab_pin.sym} 1380 1180 0 0 {name=l231 lab=R0_0}
C {devices/lab_pin.sym} 1380 1200 0 0 {name=l232 lab=R1_1}
C {devices/lab_pin.sym} 1430 1260 0 0 {name=l233 lab=VSS}
C {devices/lab_pin.sym} 1810 1160 0 0 {name=l234 lab=VDD}
C {devices/lab_pin.sym} 1810 1240 0 0 {name=l235 lab=VSS}
C {devices/lab_pin.sym} 1380 1520 0 0 {name=l236 lab=WL_EN}
C {devices/lab_pin.sym} 1430 1440 0 0 {name=l237 lab=VDD}
C {devices/lab_pin.sym} 1380 1480 0 0 {name=l238 lab=R0_1}
C {devices/lab_pin.sym} 1380 1500 0 0 {name=l239 lab=R1_1}
C {devices/lab_pin.sym} 1430 1560 0 0 {name=l240 lab=VSS}
C {devices/lab_pin.sym} 1810 1460 0 0 {name=l241 lab=VDD}
C {devices/lab_pin.sym} 1810 1540 0 0 {name=l242 lab=VSS}
C {devices/lab_pin.sym} 1380 1820 0 0 {name=l243 lab=WL_EN}
C {devices/lab_pin.sym} 1430 1740 0 0 {name=l244 lab=VDD}
C {devices/lab_pin.sym} 1380 1780 0 0 {name=l245 lab=R0_2}
C {devices/lab_pin.sym} 1380 1800 0 0 {name=l246 lab=R1_1}
C {devices/lab_pin.sym} 1430 1860 0 0 {name=l247 lab=VSS}
C {devices/lab_pin.sym} 1810 1760 0 0 {name=l248 lab=VDD}
C {devices/lab_pin.sym} 1810 1840 0 0 {name=l249 lab=VSS}
C {devices/lab_pin.sym} 1380 2120 0 0 {name=l250 lab=WL_EN}
C {devices/lab_pin.sym} 1430 2040 0 0 {name=l251 lab=VDD}
C {devices/lab_pin.sym} 1380 2080 0 0 {name=l252 lab=R0_3}
C {devices/lab_pin.sym} 1380 2100 0 0 {name=l253 lab=R1_1}
C {devices/lab_pin.sym} 1430 2160 0 0 {name=l254 lab=VSS}
C {devices/lab_pin.sym} 1810 2060 0 0 {name=l255 lab=VDD}
C {devices/lab_pin.sym} 1810 2140 0 0 {name=l256 lab=VSS}
C {devices/lab_pin.sym} 2430 20 0 0 {name=l257 lab=WL_EN}
C {devices/lab_pin.sym} 2480 -60 0 0 {name=l258 lab=VDD}
C {devices/lab_pin.sym} 2430 -20 0 0 {name=l259 lab=R0_0}
C {devices/lab_pin.sym} 2430 0 0 0 {name=l260 lab=R1_2}
C {devices/lab_pin.sym} 2480 60 0 0 {name=l261 lab=VSS}
C {devices/lab_pin.sym} 2860 -40 0 0 {name=l262 lab=VDD}
C {devices/lab_pin.sym} 2860 40 0 0 {name=l263 lab=VSS}
C {devices/lab_pin.sym} 2430 320 0 0 {name=l264 lab=WL_EN}
C {devices/lab_pin.sym} 2480 240 0 0 {name=l265 lab=VDD}
C {devices/lab_pin.sym} 2430 280 0 0 {name=l266 lab=R0_1}
C {devices/lab_pin.sym} 2430 300 0 0 {name=l267 lab=R1_2}
C {devices/lab_pin.sym} 2480 360 0 0 {name=l268 lab=VSS}
C {devices/lab_pin.sym} 2860 260 0 0 {name=l269 lab=VDD}
C {devices/lab_pin.sym} 2860 340 0 0 {name=l270 lab=VSS}
C {devices/lab_pin.sym} 2430 620 0 0 {name=l271 lab=WL_EN}
C {devices/lab_pin.sym} 2480 540 0 0 {name=l272 lab=VDD}
C {devices/lab_pin.sym} 2430 580 0 0 {name=l273 lab=R0_2}
C {devices/lab_pin.sym} 2430 600 0 0 {name=l274 lab=R1_2}
C {devices/lab_pin.sym} 2480 660 0 0 {name=l275 lab=VSS}
C {devices/lab_pin.sym} 2860 560 0 0 {name=l276 lab=VDD}
C {devices/lab_pin.sym} 2860 640 0 0 {name=l277 lab=VSS}
C {devices/lab_pin.sym} 2430 920 0 0 {name=l278 lab=WL_EN}
C {devices/lab_pin.sym} 2480 840 0 0 {name=l279 lab=VDD}
C {devices/lab_pin.sym} 2430 880 0 0 {name=l280 lab=R0_3}
C {devices/lab_pin.sym} 2430 900 0 0 {name=l281 lab=R1_2}
C {devices/lab_pin.sym} 2480 960 0 0 {name=l282 lab=VSS}
C {devices/lab_pin.sym} 2860 860 0 0 {name=l283 lab=VDD}
C {devices/lab_pin.sym} 2860 940 0 0 {name=l284 lab=VSS}
C {devices/lab_pin.sym} 2430 1220 0 0 {name=l285 lab=WL_EN}
C {devices/lab_pin.sym} 2480 1140 0 0 {name=l286 lab=VDD}
C {devices/lab_pin.sym} 2430 1180 0 0 {name=l287 lab=R0_0}
C {devices/lab_pin.sym} 2430 1200 0 0 {name=l288 lab=R1_3}
C {devices/lab_pin.sym} 2480 1260 0 0 {name=l289 lab=VSS}
C {devices/lab_pin.sym} 2860 1160 0 0 {name=l290 lab=VDD}
C {devices/lab_pin.sym} 2860 1240 0 0 {name=l291 lab=VSS}
C {devices/lab_pin.sym} 2430 1520 0 0 {name=l292 lab=WL_EN}
C {devices/lab_pin.sym} 2480 1440 0 0 {name=l293 lab=VDD}
C {devices/lab_pin.sym} 2430 1480 0 0 {name=l294 lab=R0_1}
C {devices/lab_pin.sym} 2430 1500 0 0 {name=l295 lab=R1_3}
C {devices/lab_pin.sym} 2480 1560 0 0 {name=l296 lab=VSS}
C {devices/lab_pin.sym} 2860 1460 0 0 {name=l297 lab=VDD}
C {devices/lab_pin.sym} 2860 1540 0 0 {name=l298 lab=VSS}
C {devices/lab_pin.sym} 2430 1820 0 0 {name=l299 lab=WL_EN}
C {devices/lab_pin.sym} 2480 1740 0 0 {name=l300 lab=VDD}
C {devices/lab_pin.sym} 2430 1780 0 0 {name=l301 lab=R0_2}
C {devices/lab_pin.sym} 2430 1800 0 0 {name=l302 lab=R1_3}
C {devices/lab_pin.sym} 2480 1860 0 0 {name=l303 lab=VSS}
C {devices/lab_pin.sym} 2860 1760 0 0 {name=l304 lab=VDD}
C {devices/lab_pin.sym} 2860 1840 0 0 {name=l305 lab=VSS}
C {devices/lab_pin.sym} 2430 2120 0 0 {name=l306 lab=WL_EN}
C {devices/lab_pin.sym} 2480 2040 0 0 {name=l307 lab=VDD}
C {devices/lab_pin.sym} 2430 2080 0 0 {name=l308 lab=R0_3}
C {devices/lab_pin.sym} 2430 2100 0 0 {name=l309 lab=R1_3}
C {devices/lab_pin.sym} 2480 2160 0 0 {name=l310 lab=VSS}
C {devices/lab_pin.sym} 2860 2060 0 0 {name=l311 lab=VDD}
C {devices/lab_pin.sym} 2860 2140 0 0 {name=l312 lab=VSS}
