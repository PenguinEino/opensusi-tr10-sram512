v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
E {}
T {4-to-16 ROW DECODER: 2+2 predecode, AND3_X1 per 16-cell wordline} -180 -330 0 0 0.3 0.3 {}
T {WL_EN=0 keeps every WL LOW; row address is fixed before the access window} -180 -260 0 0 0.3 0.3 {}
T {Address complements are generated locally: four long RA wires across the macro.} -180 2710 0 0 0.3 0.3 {}
T {Two 16-column physical blocks: each selected row has one driver per block.} -180 2780 0 0 0.3 0.3 {}
C {TR-1um_5_stdcell/INV_X1.sym} -150 0 0 0 {name=xaddress_b0}
C {TR-1um_5_stdcell/INV_X1.sym} -150 480 0 0 {name=xaddress_b1}
C {TR-1um_5_stdcell/INV_X1.sym} -150 960 0 0 {name=xaddress_b2}
C {TR-1um_5_stdcell/INV_X1.sym} -150 1440 0 0 {name=xaddress_b3}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 0 0 0 {name=xpre0_0}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 250 0 0 {name=xpre0_1}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 500 0 0 {name=xpre0_2}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 750 0 0 {name=xpre0_3}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 1300 0 0 {name=xpre1_0}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 1550 0 0 {name=xpre1_1}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 1800 0 0 {name=xpre1_2}
C {TR-1um_5_stdcell/AND2_X1.sym} 350 2050 0 0 {name=xpre1_3}
C {TR-1um_5_stdcell/AND3_X1.sym} 1400 0 0 0 {name=xdriver0}
C {TR-1um_5_stdcell/AND3_X1.sym} 1920 100 0 0 {name=xdriver_right0}
C {TR-1um_5_stdcell/AND3_X1.sym} 1400 300 0 0 {name=xdriver1}
C {TR-1um_5_stdcell/AND3_X1.sym} 1920 400 0 0 {name=xdriver_right1}
C {TR-1um_5_stdcell/AND3_X1.sym} 1400 600 0 0 {name=xdriver2}
C {TR-1um_5_stdcell/AND3_X1.sym} 1920 700 0 0 {name=xdriver_right2}
C {TR-1um_5_stdcell/AND3_X1.sym} 1400 900 0 0 {name=xdriver3}
C {TR-1um_5_stdcell/AND3_X1.sym} 1920 1000 0 0 {name=xdriver_right3}
C {TR-1um_5_stdcell/AND3_X1.sym} 1400 1200 0 0 {name=xdriver4}
C {TR-1um_5_stdcell/AND3_X1.sym} 1920 1300 0 0 {name=xdriver_right4}
C {TR-1um_5_stdcell/AND3_X1.sym} 1400 1500 0 0 {name=xdriver5}
C {TR-1um_5_stdcell/AND3_X1.sym} 1920 1600 0 0 {name=xdriver_right5}
C {TR-1um_5_stdcell/AND3_X1.sym} 1400 1800 0 0 {name=xdriver6}
C {TR-1um_5_stdcell/AND3_X1.sym} 1920 1900 0 0 {name=xdriver_right6}
C {TR-1um_5_stdcell/AND3_X1.sym} 1400 2100 0 0 {name=xdriver7}
C {TR-1um_5_stdcell/AND3_X1.sym} 1920 2200 0 0 {name=xdriver_right7}
C {TR-1um_5_stdcell/AND3_X1.sym} 2450 0 0 0 {name=xdriver8}
C {TR-1um_5_stdcell/AND3_X1.sym} 2970 100 0 0 {name=xdriver_right8}
C {TR-1um_5_stdcell/AND3_X1.sym} 2450 300 0 0 {name=xdriver9}
C {TR-1um_5_stdcell/AND3_X1.sym} 2970 400 0 0 {name=xdriver_right9}
C {TR-1um_5_stdcell/AND3_X1.sym} 2450 600 0 0 {name=xdriver10}
C {TR-1um_5_stdcell/AND3_X1.sym} 2970 700 0 0 {name=xdriver_right10}
C {TR-1um_5_stdcell/AND3_X1.sym} 2450 900 0 0 {name=xdriver11}
C {TR-1um_5_stdcell/AND3_X1.sym} 2970 1000 0 0 {name=xdriver_right11}
C {TR-1um_5_stdcell/AND3_X1.sym} 2450 1200 0 0 {name=xdriver12}
C {TR-1um_5_stdcell/AND3_X1.sym} 2970 1300 0 0 {name=xdriver_right12}
C {TR-1um_5_stdcell/AND3_X1.sym} 2450 1500 0 0 {name=xdriver13}
C {TR-1um_5_stdcell/AND3_X1.sym} 2970 1600 0 0 {name=xdriver_right13}
C {TR-1um_5_stdcell/AND3_X1.sym} 2450 1800 0 0 {name=xdriver14}
C {TR-1um_5_stdcell/AND3_X1.sym} 2970 1900 0 0 {name=xdriver_right14}
C {TR-1um_5_stdcell/AND3_X1.sym} 2450 2100 0 0 {name=xdriver15}
C {TR-1um_5_stdcell/AND3_X1.sym} 2970 2200 0 0 {name=xdriver_right15}
C {devices/ipin.sym} -520 10 0 0 {name=pRA0 lab=RA0}
N -520 10 -460 10 {lab=RA0}
C {devices/lab_pin.sym} -460 10 0 0 {name=l56 lab=RA0}
C {devices/ipin.sym} -520 100 0 0 {name=pRA1 lab=RA1}
N -520 100 -460 100 {lab=RA1}
C {devices/lab_pin.sym} -460 100 0 0 {name=l59 lab=RA1}
C {devices/ipin.sym} -520 190 0 0 {name=pRA2 lab=RA2}
N -520 190 -460 190 {lab=RA2}
C {devices/lab_pin.sym} -460 190 0 0 {name=l62 lab=RA2}
C {devices/ipin.sym} -520 280 0 0 {name=pRA3 lab=RA3}
N -520 280 -460 280 {lab=RA3}
C {devices/lab_pin.sym} -460 280 0 0 {name=l65 lab=RA3}
C {devices/ipin.sym} -520 370 0 0 {name=pWL_EN lab=WL_EN}
N -520 370 -460 370 {lab=WL_EN}
C {devices/lab_pin.sym} -460 370 0 0 {name=l68 lab=WL_EN}
N 1510 0 1710 0 {lab=WL0}
C {devices/opin.sym} 1710 0 0 0 {name=pWL0 lab=WL0}
N 2030 100 2230 100 {lab=WL_R0}
C {devices/opin.sym} 2230 100 0 0 {name=pWL_R0 lab=WL_R0}
N 1510 300 1710 300 {lab=WL1}
C {devices/opin.sym} 1710 300 0 0 {name=pWL1 lab=WL1}
N 2030 400 2230 400 {lab=WL_R1}
C {devices/opin.sym} 2230 400 0 0 {name=pWL_R1 lab=WL_R1}
N 1510 600 1710 600 {lab=WL2}
C {devices/opin.sym} 1710 600 0 0 {name=pWL2 lab=WL2}
N 2030 700 2230 700 {lab=WL_R2}
C {devices/opin.sym} 2230 700 0 0 {name=pWL_R2 lab=WL_R2}
N 1510 900 1710 900 {lab=WL3}
C {devices/opin.sym} 1710 900 0 0 {name=pWL3 lab=WL3}
N 2030 1000 2230 1000 {lab=WL_R3}
C {devices/opin.sym} 2230 1000 0 0 {name=pWL_R3 lab=WL_R3}
N 1510 1200 1710 1200 {lab=WL4}
C {devices/opin.sym} 1710 1200 0 0 {name=pWL4 lab=WL4}
N 2030 1300 2230 1300 {lab=WL_R4}
C {devices/opin.sym} 2230 1300 0 0 {name=pWL_R4 lab=WL_R4}
N 1510 1500 1710 1500 {lab=WL5}
C {devices/opin.sym} 1710 1500 0 0 {name=pWL5 lab=WL5}
N 2030 1600 2230 1600 {lab=WL_R5}
C {devices/opin.sym} 2230 1600 0 0 {name=pWL_R5 lab=WL_R5}
N 1510 1800 1710 1800 {lab=WL6}
C {devices/opin.sym} 1710 1800 0 0 {name=pWL6 lab=WL6}
N 2030 1900 2230 1900 {lab=WL_R6}
C {devices/opin.sym} 2230 1900 0 0 {name=pWL_R6 lab=WL_R6}
N 1510 2100 1710 2100 {lab=WL7}
C {devices/opin.sym} 1710 2100 0 0 {name=pWL7 lab=WL7}
N 2030 2200 2230 2200 {lab=WL_R7}
C {devices/opin.sym} 2230 2200 0 0 {name=pWL_R7 lab=WL_R7}
N 2560 0 2760 0 {lab=WL8}
C {devices/opin.sym} 2760 0 0 0 {name=pWL8 lab=WL8}
N 3080 100 3280 100 {lab=WL_R8}
C {devices/opin.sym} 3280 100 0 0 {name=pWL_R8 lab=WL_R8}
N 2560 300 2760 300 {lab=WL9}
C {devices/opin.sym} 2760 300 0 0 {name=pWL9 lab=WL9}
N 3080 400 3280 400 {lab=WL_R9}
C {devices/opin.sym} 3280 400 0 0 {name=pWL_R9 lab=WL_R9}
N 2560 600 2760 600 {lab=WL10}
C {devices/opin.sym} 2760 600 0 0 {name=pWL10 lab=WL10}
N 3080 700 3280 700 {lab=WL_R10}
C {devices/opin.sym} 3280 700 0 0 {name=pWL_R10 lab=WL_R10}
N 2560 900 2760 900 {lab=WL11}
C {devices/opin.sym} 2760 900 0 0 {name=pWL11 lab=WL11}
N 3080 1000 3280 1000 {lab=WL_R11}
C {devices/opin.sym} 3280 1000 0 0 {name=pWL_R11 lab=WL_R11}
N 2560 1200 2760 1200 {lab=WL12}
C {devices/opin.sym} 2760 1200 0 0 {name=pWL12 lab=WL12}
N 3080 1300 3280 1300 {lab=WL_R12}
C {devices/opin.sym} 3280 1300 0 0 {name=pWL_R12 lab=WL_R12}
N 2560 1500 2760 1500 {lab=WL13}
C {devices/opin.sym} 2760 1500 0 0 {name=pWL13 lab=WL13}
N 3080 1600 3280 1600 {lab=WL_R13}
C {devices/opin.sym} 3280 1600 0 0 {name=pWL_R13 lab=WL_R13}
N 2560 1800 2760 1800 {lab=WL14}
C {devices/opin.sym} 2760 1800 0 0 {name=pWL14 lab=WL14}
N 3080 1900 3280 1900 {lab=WL_R14}
C {devices/opin.sym} 3280 1900 0 0 {name=pWL_R14 lab=WL_R14}
N 2560 2100 2760 2100 {lab=WL15}
C {devices/opin.sym} 2760 2100 0 0 {name=pWL15 lab=WL15}
N 3080 2200 3280 2200 {lab=WL_R15}
C {devices/opin.sym} 3280 2200 0 0 {name=pWL_R15 lab=WL_R15}
C {devices/iopin.sym} -520 -200 0 0 {name=pVDD lab=VDD}
N -520 -200 -460 -200 {lab=VDD}
C {devices/lab_pin.sym} -460 -200 0 0 {name=l135 lab=VDD}
C {devices/iopin.sym} -520 -130 0 0 {name=pVSS lab=VSS}
N -520 -130 -460 -130 {lab=VSS}
C {devices/lab_pin.sym} -460 -130 0 0 {name=l138 lab=VSS}
C {devices/lab_pin.sym} -120 -40 0 0 {name=l139 lab=VDD}
C {devices/lab_pin.sym} -170 0 0 0 {name=l140 lab=RA0}
C {devices/lab_pin.sym} -50 0 2 0 {name=l141 lab=RA0B}
C {devices/lab_pin.sym} -120 40 0 0 {name=l142 lab=VSS}
C {devices/lab_pin.sym} -120 440 0 0 {name=l143 lab=VDD}
C {devices/lab_pin.sym} -170 480 0 0 {name=l144 lab=RA1}
C {devices/lab_pin.sym} -50 480 2 0 {name=l145 lab=RA1B}
C {devices/lab_pin.sym} -120 520 0 0 {name=l146 lab=VSS}
C {devices/lab_pin.sym} -120 920 0 0 {name=l147 lab=VDD}
C {devices/lab_pin.sym} -170 960 0 0 {name=l148 lab=RA2}
C {devices/lab_pin.sym} -50 960 2 0 {name=l149 lab=RA2B}
C {devices/lab_pin.sym} -120 1000 0 0 {name=l150 lab=VSS}
C {devices/lab_pin.sym} -120 1400 0 0 {name=l151 lab=VDD}
C {devices/lab_pin.sym} -170 1440 0 0 {name=l152 lab=RA3}
C {devices/lab_pin.sym} -50 1440 2 0 {name=l153 lab=RA3B}
C {devices/lab_pin.sym} -120 1480 0 0 {name=l154 lab=VSS}
C {devices/lab_pin.sym} 380 -60 0 0 {name=l155 lab=VDD}
C {devices/lab_pin.sym} 460 0 2 0 {name=l156 lab=R0_0}
C {devices/lab_pin.sym} 330 -20 0 0 {name=l157 lab=RA0B}
C {devices/lab_pin.sym} 330 20 0 0 {name=l158 lab=RA1B}
C {devices/lab_pin.sym} 380 60 0 0 {name=l159 lab=VSS}
C {devices/lab_pin.sym} 380 190 0 0 {name=l160 lab=VDD}
C {devices/lab_pin.sym} 460 250 2 0 {name=l161 lab=R0_1}
C {devices/lab_pin.sym} 330 230 0 0 {name=l162 lab=RA0}
C {devices/lab_pin.sym} 330 270 0 0 {name=l163 lab=RA1B}
C {devices/lab_pin.sym} 380 310 0 0 {name=l164 lab=VSS}
C {devices/lab_pin.sym} 380 440 0 0 {name=l165 lab=VDD}
C {devices/lab_pin.sym} 460 500 2 0 {name=l166 lab=R0_2}
C {devices/lab_pin.sym} 330 480 0 0 {name=l167 lab=RA0B}
C {devices/lab_pin.sym} 330 520 0 0 {name=l168 lab=RA1}
C {devices/lab_pin.sym} 380 560 0 0 {name=l169 lab=VSS}
C {devices/lab_pin.sym} 380 690 0 0 {name=l170 lab=VDD}
C {devices/lab_pin.sym} 460 750 2 0 {name=l171 lab=R0_3}
C {devices/lab_pin.sym} 330 730 0 0 {name=l172 lab=RA0}
C {devices/lab_pin.sym} 330 770 0 0 {name=l173 lab=RA1}
C {devices/lab_pin.sym} 380 810 0 0 {name=l174 lab=VSS}
C {devices/lab_pin.sym} 380 1240 0 0 {name=l175 lab=VDD}
C {devices/lab_pin.sym} 460 1300 2 0 {name=l176 lab=R1_0}
C {devices/lab_pin.sym} 330 1280 0 0 {name=l177 lab=RA2B}
C {devices/lab_pin.sym} 330 1320 0 0 {name=l178 lab=RA3B}
C {devices/lab_pin.sym} 380 1360 0 0 {name=l179 lab=VSS}
C {devices/lab_pin.sym} 380 1490 0 0 {name=l180 lab=VDD}
C {devices/lab_pin.sym} 460 1550 2 0 {name=l181 lab=R1_1}
C {devices/lab_pin.sym} 330 1530 0 0 {name=l182 lab=RA2}
C {devices/lab_pin.sym} 330 1570 0 0 {name=l183 lab=RA3B}
C {devices/lab_pin.sym} 380 1610 0 0 {name=l184 lab=VSS}
C {devices/lab_pin.sym} 380 1740 0 0 {name=l185 lab=VDD}
C {devices/lab_pin.sym} 460 1800 2 0 {name=l186 lab=R1_2}
C {devices/lab_pin.sym} 330 1780 0 0 {name=l187 lab=RA2B}
C {devices/lab_pin.sym} 330 1820 0 0 {name=l188 lab=RA3}
C {devices/lab_pin.sym} 380 1860 0 0 {name=l189 lab=VSS}
C {devices/lab_pin.sym} 380 1990 0 0 {name=l190 lab=VDD}
C {devices/lab_pin.sym} 460 2050 2 0 {name=l191 lab=R1_3}
C {devices/lab_pin.sym} 330 2030 0 0 {name=l192 lab=RA2}
C {devices/lab_pin.sym} 330 2070 0 0 {name=l193 lab=RA3}
C {devices/lab_pin.sym} 380 2110 0 0 {name=l194 lab=VSS}
C {devices/lab_pin.sym} 1380 20 0 0 {name=l195 lab=WL_EN}
C {devices/lab_pin.sym} 1430 -60 0 0 {name=l196 lab=VDD}
C {devices/lab_pin.sym} 1380 -20 0 0 {name=l197 lab=R0_0}
C {devices/lab_pin.sym} 1380 0 0 0 {name=l198 lab=R1_0}
C {devices/lab_pin.sym} 1430 60 0 0 {name=l199 lab=VSS}
C {devices/lab_pin.sym} 1900 120 0 0 {name=l200 lab=WL_EN}
C {devices/lab_pin.sym} 1950 40 0 0 {name=l201 lab=VDD}
C {devices/lab_pin.sym} 1900 80 0 0 {name=l202 lab=R0_0}
C {devices/lab_pin.sym} 1900 100 0 0 {name=l203 lab=R1_0}
C {devices/lab_pin.sym} 1950 160 0 0 {name=l204 lab=VSS}
C {devices/lab_pin.sym} 1380 320 0 0 {name=l205 lab=WL_EN}
C {devices/lab_pin.sym} 1430 240 0 0 {name=l206 lab=VDD}
C {devices/lab_pin.sym} 1380 280 0 0 {name=l207 lab=R0_1}
C {devices/lab_pin.sym} 1380 300 0 0 {name=l208 lab=R1_0}
C {devices/lab_pin.sym} 1430 360 0 0 {name=l209 lab=VSS}
C {devices/lab_pin.sym} 1900 420 0 0 {name=l210 lab=WL_EN}
C {devices/lab_pin.sym} 1950 340 0 0 {name=l211 lab=VDD}
C {devices/lab_pin.sym} 1900 380 0 0 {name=l212 lab=R0_1}
C {devices/lab_pin.sym} 1900 400 0 0 {name=l213 lab=R1_0}
C {devices/lab_pin.sym} 1950 460 0 0 {name=l214 lab=VSS}
C {devices/lab_pin.sym} 1380 620 0 0 {name=l215 lab=WL_EN}
C {devices/lab_pin.sym} 1430 540 0 0 {name=l216 lab=VDD}
C {devices/lab_pin.sym} 1380 580 0 0 {name=l217 lab=R0_2}
C {devices/lab_pin.sym} 1380 600 0 0 {name=l218 lab=R1_0}
C {devices/lab_pin.sym} 1430 660 0 0 {name=l219 lab=VSS}
C {devices/lab_pin.sym} 1900 720 0 0 {name=l220 lab=WL_EN}
C {devices/lab_pin.sym} 1950 640 0 0 {name=l221 lab=VDD}
C {devices/lab_pin.sym} 1900 680 0 0 {name=l222 lab=R0_2}
C {devices/lab_pin.sym} 1900 700 0 0 {name=l223 lab=R1_0}
C {devices/lab_pin.sym} 1950 760 0 0 {name=l224 lab=VSS}
C {devices/lab_pin.sym} 1380 920 0 0 {name=l225 lab=WL_EN}
C {devices/lab_pin.sym} 1430 840 0 0 {name=l226 lab=VDD}
C {devices/lab_pin.sym} 1380 880 0 0 {name=l227 lab=R0_3}
C {devices/lab_pin.sym} 1380 900 0 0 {name=l228 lab=R1_0}
C {devices/lab_pin.sym} 1430 960 0 0 {name=l229 lab=VSS}
C {devices/lab_pin.sym} 1900 1020 0 0 {name=l230 lab=WL_EN}
C {devices/lab_pin.sym} 1950 940 0 0 {name=l231 lab=VDD}
C {devices/lab_pin.sym} 1900 980 0 0 {name=l232 lab=R0_3}
C {devices/lab_pin.sym} 1900 1000 0 0 {name=l233 lab=R1_0}
C {devices/lab_pin.sym} 1950 1060 0 0 {name=l234 lab=VSS}
C {devices/lab_pin.sym} 1380 1220 0 0 {name=l235 lab=WL_EN}
C {devices/lab_pin.sym} 1430 1140 0 0 {name=l236 lab=VDD}
C {devices/lab_pin.sym} 1380 1180 0 0 {name=l237 lab=R0_0}
C {devices/lab_pin.sym} 1380 1200 0 0 {name=l238 lab=R1_1}
C {devices/lab_pin.sym} 1430 1260 0 0 {name=l239 lab=VSS}
C {devices/lab_pin.sym} 1900 1320 0 0 {name=l240 lab=WL_EN}
C {devices/lab_pin.sym} 1950 1240 0 0 {name=l241 lab=VDD}
C {devices/lab_pin.sym} 1900 1280 0 0 {name=l242 lab=R0_0}
C {devices/lab_pin.sym} 1900 1300 0 0 {name=l243 lab=R1_1}
C {devices/lab_pin.sym} 1950 1360 0 0 {name=l244 lab=VSS}
C {devices/lab_pin.sym} 1380 1520 0 0 {name=l245 lab=WL_EN}
C {devices/lab_pin.sym} 1430 1440 0 0 {name=l246 lab=VDD}
C {devices/lab_pin.sym} 1380 1480 0 0 {name=l247 lab=R0_1}
C {devices/lab_pin.sym} 1380 1500 0 0 {name=l248 lab=R1_1}
C {devices/lab_pin.sym} 1430 1560 0 0 {name=l249 lab=VSS}
C {devices/lab_pin.sym} 1900 1620 0 0 {name=l250 lab=WL_EN}
C {devices/lab_pin.sym} 1950 1540 0 0 {name=l251 lab=VDD}
C {devices/lab_pin.sym} 1900 1580 0 0 {name=l252 lab=R0_1}
C {devices/lab_pin.sym} 1900 1600 0 0 {name=l253 lab=R1_1}
C {devices/lab_pin.sym} 1950 1660 0 0 {name=l254 lab=VSS}
C {devices/lab_pin.sym} 1380 1820 0 0 {name=l255 lab=WL_EN}
C {devices/lab_pin.sym} 1430 1740 0 0 {name=l256 lab=VDD}
C {devices/lab_pin.sym} 1380 1780 0 0 {name=l257 lab=R0_2}
C {devices/lab_pin.sym} 1380 1800 0 0 {name=l258 lab=R1_1}
C {devices/lab_pin.sym} 1430 1860 0 0 {name=l259 lab=VSS}
C {devices/lab_pin.sym} 1900 1920 0 0 {name=l260 lab=WL_EN}
C {devices/lab_pin.sym} 1950 1840 0 0 {name=l261 lab=VDD}
C {devices/lab_pin.sym} 1900 1880 0 0 {name=l262 lab=R0_2}
C {devices/lab_pin.sym} 1900 1900 0 0 {name=l263 lab=R1_1}
C {devices/lab_pin.sym} 1950 1960 0 0 {name=l264 lab=VSS}
C {devices/lab_pin.sym} 1380 2120 0 0 {name=l265 lab=WL_EN}
C {devices/lab_pin.sym} 1430 2040 0 0 {name=l266 lab=VDD}
C {devices/lab_pin.sym} 1380 2080 0 0 {name=l267 lab=R0_3}
C {devices/lab_pin.sym} 1380 2100 0 0 {name=l268 lab=R1_1}
C {devices/lab_pin.sym} 1430 2160 0 0 {name=l269 lab=VSS}
C {devices/lab_pin.sym} 1900 2220 0 0 {name=l270 lab=WL_EN}
C {devices/lab_pin.sym} 1950 2140 0 0 {name=l271 lab=VDD}
C {devices/lab_pin.sym} 1900 2180 0 0 {name=l272 lab=R0_3}
C {devices/lab_pin.sym} 1900 2200 0 0 {name=l273 lab=R1_1}
C {devices/lab_pin.sym} 1950 2260 0 0 {name=l274 lab=VSS}
C {devices/lab_pin.sym} 2430 20 0 0 {name=l275 lab=WL_EN}
C {devices/lab_pin.sym} 2480 -60 0 0 {name=l276 lab=VDD}
C {devices/lab_pin.sym} 2430 -20 0 0 {name=l277 lab=R0_0}
C {devices/lab_pin.sym} 2430 0 0 0 {name=l278 lab=R1_2}
C {devices/lab_pin.sym} 2480 60 0 0 {name=l279 lab=VSS}
C {devices/lab_pin.sym} 2950 120 0 0 {name=l280 lab=WL_EN}
C {devices/lab_pin.sym} 3000 40 0 0 {name=l281 lab=VDD}
C {devices/lab_pin.sym} 2950 80 0 0 {name=l282 lab=R0_0}
C {devices/lab_pin.sym} 2950 100 0 0 {name=l283 lab=R1_2}
C {devices/lab_pin.sym} 3000 160 0 0 {name=l284 lab=VSS}
C {devices/lab_pin.sym} 2430 320 0 0 {name=l285 lab=WL_EN}
C {devices/lab_pin.sym} 2480 240 0 0 {name=l286 lab=VDD}
C {devices/lab_pin.sym} 2430 280 0 0 {name=l287 lab=R0_1}
C {devices/lab_pin.sym} 2430 300 0 0 {name=l288 lab=R1_2}
C {devices/lab_pin.sym} 2480 360 0 0 {name=l289 lab=VSS}
C {devices/lab_pin.sym} 2950 420 0 0 {name=l290 lab=WL_EN}
C {devices/lab_pin.sym} 3000 340 0 0 {name=l291 lab=VDD}
C {devices/lab_pin.sym} 2950 380 0 0 {name=l292 lab=R0_1}
C {devices/lab_pin.sym} 2950 400 0 0 {name=l293 lab=R1_2}
C {devices/lab_pin.sym} 3000 460 0 0 {name=l294 lab=VSS}
C {devices/lab_pin.sym} 2430 620 0 0 {name=l295 lab=WL_EN}
C {devices/lab_pin.sym} 2480 540 0 0 {name=l296 lab=VDD}
C {devices/lab_pin.sym} 2430 580 0 0 {name=l297 lab=R0_2}
C {devices/lab_pin.sym} 2430 600 0 0 {name=l298 lab=R1_2}
C {devices/lab_pin.sym} 2480 660 0 0 {name=l299 lab=VSS}
C {devices/lab_pin.sym} 2950 720 0 0 {name=l300 lab=WL_EN}
C {devices/lab_pin.sym} 3000 640 0 0 {name=l301 lab=VDD}
C {devices/lab_pin.sym} 2950 680 0 0 {name=l302 lab=R0_2}
C {devices/lab_pin.sym} 2950 700 0 0 {name=l303 lab=R1_2}
C {devices/lab_pin.sym} 3000 760 0 0 {name=l304 lab=VSS}
C {devices/lab_pin.sym} 2430 920 0 0 {name=l305 lab=WL_EN}
C {devices/lab_pin.sym} 2480 840 0 0 {name=l306 lab=VDD}
C {devices/lab_pin.sym} 2430 880 0 0 {name=l307 lab=R0_3}
C {devices/lab_pin.sym} 2430 900 0 0 {name=l308 lab=R1_2}
C {devices/lab_pin.sym} 2480 960 0 0 {name=l309 lab=VSS}
C {devices/lab_pin.sym} 2950 1020 0 0 {name=l310 lab=WL_EN}
C {devices/lab_pin.sym} 3000 940 0 0 {name=l311 lab=VDD}
C {devices/lab_pin.sym} 2950 980 0 0 {name=l312 lab=R0_3}
C {devices/lab_pin.sym} 2950 1000 0 0 {name=l313 lab=R1_2}
C {devices/lab_pin.sym} 3000 1060 0 0 {name=l314 lab=VSS}
C {devices/lab_pin.sym} 2430 1220 0 0 {name=l315 lab=WL_EN}
C {devices/lab_pin.sym} 2480 1140 0 0 {name=l316 lab=VDD}
C {devices/lab_pin.sym} 2430 1180 0 0 {name=l317 lab=R0_0}
C {devices/lab_pin.sym} 2430 1200 0 0 {name=l318 lab=R1_3}
C {devices/lab_pin.sym} 2480 1260 0 0 {name=l319 lab=VSS}
C {devices/lab_pin.sym} 2950 1320 0 0 {name=l320 lab=WL_EN}
C {devices/lab_pin.sym} 3000 1240 0 0 {name=l321 lab=VDD}
C {devices/lab_pin.sym} 2950 1280 0 0 {name=l322 lab=R0_0}
C {devices/lab_pin.sym} 2950 1300 0 0 {name=l323 lab=R1_3}
C {devices/lab_pin.sym} 3000 1360 0 0 {name=l324 lab=VSS}
C {devices/lab_pin.sym} 2430 1520 0 0 {name=l325 lab=WL_EN}
C {devices/lab_pin.sym} 2480 1440 0 0 {name=l326 lab=VDD}
C {devices/lab_pin.sym} 2430 1480 0 0 {name=l327 lab=R0_1}
C {devices/lab_pin.sym} 2430 1500 0 0 {name=l328 lab=R1_3}
C {devices/lab_pin.sym} 2480 1560 0 0 {name=l329 lab=VSS}
C {devices/lab_pin.sym} 2950 1620 0 0 {name=l330 lab=WL_EN}
C {devices/lab_pin.sym} 3000 1540 0 0 {name=l331 lab=VDD}
C {devices/lab_pin.sym} 2950 1580 0 0 {name=l332 lab=R0_1}
C {devices/lab_pin.sym} 2950 1600 0 0 {name=l333 lab=R1_3}
C {devices/lab_pin.sym} 3000 1660 0 0 {name=l334 lab=VSS}
C {devices/lab_pin.sym} 2430 1820 0 0 {name=l335 lab=WL_EN}
C {devices/lab_pin.sym} 2480 1740 0 0 {name=l336 lab=VDD}
C {devices/lab_pin.sym} 2430 1780 0 0 {name=l337 lab=R0_2}
C {devices/lab_pin.sym} 2430 1800 0 0 {name=l338 lab=R1_3}
C {devices/lab_pin.sym} 2480 1860 0 0 {name=l339 lab=VSS}
C {devices/lab_pin.sym} 2950 1920 0 0 {name=l340 lab=WL_EN}
C {devices/lab_pin.sym} 3000 1840 0 0 {name=l341 lab=VDD}
C {devices/lab_pin.sym} 2950 1880 0 0 {name=l342 lab=R0_2}
C {devices/lab_pin.sym} 2950 1900 0 0 {name=l343 lab=R1_3}
C {devices/lab_pin.sym} 3000 1960 0 0 {name=l344 lab=VSS}
C {devices/lab_pin.sym} 2430 2120 0 0 {name=l345 lab=WL_EN}
C {devices/lab_pin.sym} 2480 2040 0 0 {name=l346 lab=VDD}
C {devices/lab_pin.sym} 2430 2080 0 0 {name=l347 lab=R0_3}
C {devices/lab_pin.sym} 2430 2100 0 0 {name=l348 lab=R1_3}
C {devices/lab_pin.sym} 2480 2160 0 0 {name=l349 lab=VSS}
C {devices/lab_pin.sym} 2950 2220 0 0 {name=l350 lab=WL_EN}
C {devices/lab_pin.sym} 3000 2140 0 0 {name=l351 lab=VDD}
C {devices/lab_pin.sym} 2950 2180 0 0 {name=l352 lab=R0_3}
C {devices/lab_pin.sym} 2950 2200 0 0 {name=l353 lab=R1_3}
C {devices/lab_pin.sym} 3000 2260 0 0 {name=l354 lab=VSS}
