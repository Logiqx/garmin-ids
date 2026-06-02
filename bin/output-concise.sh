#!/usr/bin/sh

RAW=data/raw/api/*.json
REF=data/raw/ref/concise.psv

TMP=data/out/concise/legal.tmp
OUT=data/out/concise/legal.psv

# Extract part numbers and product names from JSON
jq -r '.[] | .partNumber + "|" + .name' $RAW >$TMP

# Determine list of part numbers where the product name will be replaced
PARTS=$(cut -d '|' -f1 $REF | paste -sd '|' -)

# Replace some product names from the API with concise values
grep -E -v "$PARTS" $TMP >$OUT
cat $REF >>$OUT

# Ensure the output is sorted and remove the temporary file
sort -o $OUT $OUT
rm $TMP
