#!/usr/bin/sh

RAW=data/raw/api/*.json

OUT=data/out/terse/legal.psv

# Extract part numbers and product names from JSON
jq -r '.[] | .partNumber + "|" + .name' $RAW >$OUT

# Shorten multiple sizes - e.g. 47 mm / 51 mm to 47 / 51 mm
sed -i -E 's/([45][0-9]) mm \/ ([45][0-9] mm)/\1 \/ \2/' $OUT

# Remove the words "Edition" and "Collection"
sed -i -E 's/ Edition//;s/ Collection//' $OUT

# Remove the suffix "Carbon"
sed -i 's/ - Carbon//' $OUT

# Remove the phrase "(No Wi-Fi®)"
sed -i 's/ (No Wi-Fi®)//' $OUT

# Ensure the output is sorted
sort -o $OUT $OUT
