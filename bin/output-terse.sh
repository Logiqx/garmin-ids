#!/usr/bin/sh

API=data/tmp/api/deviceTypes.json

OUT=data/out/terse/legal.psv

# Extract part numbers and product names from JSON
jq -r '.[] | .partNumber + "|" + .name' $API >$OUT

# Remove the phrase "(No Wi-Fi®)"
sed -i 's/ (No Wi-Fi®)//' $OUT

# Ensure the output is sorted
sort -o $OUT $OUT
