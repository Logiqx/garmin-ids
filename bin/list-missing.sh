TMP1=$(mktemp)
TMP2=$(mktemp)
PSV=data/out/long/legal.psv

grep -h '|' ../gps-details/docs/devices/garmin/watches/* >$TMP1

# Approach = Golf, MARQ = expensive, Sim = no GPS, Swim 2 = GPS, vívolife = no GPS
# Edge = cycling, eTrex + GPSMAP + Montana + Oregon + Rino = handheld

for i in $(egrep -v 'Approach|Edge|eTrex|GPSMAP|MARQ|Montana|Oregon|Rino|Swim|vívolife' $PSV | sed 's/006\-B//;s/\-00.*//');
do
    echo $i $(grep -c $i $TMP1)
done | grep "0$" | sed 's/0$//' >$TMP2

for i in $(cat $TMP2)
do
    grep $i $PSV
done

rm $TMP1 $TMP2
