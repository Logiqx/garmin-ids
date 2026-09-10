PSV=data/out/long/legal.psv

# Approach = Golf, MARQ = expensive, Sim = no GPS, Swim 2 = GPS, vívolife = no GPS
# Edge = cycling, eTrex + GPSMAP + Montana + Oregon + Rino = handheld

more $PSV | sort -t'|' -k2,3 | egrep -v 'Approach|Edge|eTrex|GPSMAP|MARQ|Montana|Oregon|Rino|Swim|vívolife'
