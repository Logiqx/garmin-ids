#!/usr/bin/sh

API=data/tmp/api/deviceTypes.json
REF=data/raw/ref/concise.psv

TMP=data/out/concise/legal.tmp
OUT=data/out/concise/legal.psv

# Extract part numbers and product names from JSON
jq -r '.[] | .partNumber + "|" + .name' $API >$TMP

# Determine list of part numbers where the product name will be replaced
PARTS=$(cut -d '|' -f1 $REF | paste -sd '|' -)

# Replace some product names from the API with concise values
grep -E -v "$PARTS" $TMP >$OUT
cat $REF >>$OUT

# Ensure the results are sorted
sort -o $TMP $OUT

# Append the variant column
join -t '|' -a 1 -o auto $TMP data/raw/ref/variants.psv >$OUT

# Remove the temporary file
rm $TMP
