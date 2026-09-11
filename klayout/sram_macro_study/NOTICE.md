The standard-cell geometry in `stdcell_abutment.gds` and the standard-cell
transistor definitions in `macro_16x16.spice` and `macro_16x32.spice` are derived
from the locally installed TR-1um / openIP62 PDK.

Upstream openIP62 notice: Copyright 2025 TOKAI RIKA CO., LTD.
The upstream PDK uses the Apache License, Version 2.0; a copy is included as
`LICENSE-PDK`. This notice does not change the license of other project files.

Local PDK source: `/home/ishi-kai/pdk/TR-1um`.
Geometry source: `libs.tech/klayout/libraries/TR-1um_STDCELL.gds`.
Schematic sources: `libs.tech/xschem/TR-1um_5_stdcell/`.

The coupon copy changes AND3_X1 GC vertices from 23.705 to 23.700 um, normalizes
supply-label case, adds OR3's missing VDD label, and aligns OR3 B/C and OR4 A/B
labels with the schematic transistor stack order. It adds placement, unique
top-level port labels, and an actual M2 VSS strap. The upstream PDK is unmodified.
The macro SPICE files combine generated peripheral instances and extracted SRAM
devices with netlisted upstream standard-cell definitions. Details and scope
are recorded in README.md and the verification JSON files.
