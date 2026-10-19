#!/usr/bin/sh

SDK=/mnt/c/Users/mwgeo/AppData/Roaming/Garmin/ConnectIQ/Devices

DATA_DIR=data/raw/sdk
OUT=$DATA_DIR/ciq.csv

jq -r '(.partNumbers[] | .number) + ","  + .displayName' $SDK/*/compiler.json | sort >$OUT
