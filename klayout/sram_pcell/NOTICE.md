The MOS, contact and via PCell geometries saved in `pcell.gds` are generated
from the locally installed OpenSUSI TR-1um PDK.

Upstream notice: TR-1um: Copyright 2025 OpenSUSI non-profit organaization.
Original version was made by jun1okamura.
The upstream PCell sources use Apache License, Version 2.0, included here as
`LICENSE-PDK`. This notice does not change the license of other project files.

Source: https://github.com/OpenSUSI/TR-1um
Local source: `/home/ishi-kai/pdk/TR-1um/libs.tech/klayout/tech/python/cells/`.
Source hashes and saved-geometry comparisons are in `pcell_audit.json`.
This study adds instance placement, shared diffusion by instance overlap,
parent routing, wells, array construction and verification scripts. It does
not edit the installed PCell source or replace its generated device shapes.
Validation scope is documented in README.md.
