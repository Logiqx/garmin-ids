#!/usr/bin/sh

API=data/tmp/api/deviceTypes.json

TMP=data/out/terse/legal.tmp
OUT=data/out/terse/legal.psv

# Extract part numbers and product names from JSON
jq -r '.[] | .partNumber + "|" + .name' $API >$OUT

# Ensure the results are sorted
sort -o $TMP $OUT

# Append the variant column
join -t '|' -a 1 -o auto $TMP data/raw/ref/variants.psv >$OUT

# Remove the temporary file
rm $TMP
