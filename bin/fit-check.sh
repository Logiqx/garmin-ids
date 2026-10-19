#!/bin/sh

FIT=data/raw/sdk/fit.csv
API=data/out/long/legal.psv

TMP=$(mktemp)

for i in $(cat $FIT | cut -d, -f1)
do
    echo $i: $(grep -c $i $API)
done | grep ": 0" | cut -d: -f1 >$TMP

for i in $(cat $TMP)
do
    grep $i $FIT
done | sort -t, -k2

rm $TMP
