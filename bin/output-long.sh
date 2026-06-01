#!/usr/bin/sh

RAW=data/raw/api/*.json

TMP=data/out/long/legal.tmp
OUT=data/out/long/legal.psv

# Extract part numbers and product names from JSON
jq -r '.[] | (.partNumber + "|" + .name), (.partNumber + "|" + .additionalNames[])' $RAW >$TMP

# Fix additional product names which have been split in the JSON
grep -E -v '\|AMOLED|\|Solar|\|Tactical|\|Elite' $TMP >$OUT
sed -E -i 's/^(006-B4587-00.Instinct® 3 – 50 mm)$/\1, AMOLED, Tactical/' $OUT
sed -E -i 's/^(006-B4759-00.Instinct® 3 – 50 mm)$/\1, Solar, Tactical/' $OUT
sed -E -i 's/^(006-B4775-00.tactix® 8 – 51 mm)$/\1, AMOLED/' $OUT
sed -E -i 's/^(006-B4776-00.tactix® 8 – 51 mm)$/\1, Solar, Elite/' $OUT

# Ensure the output is sorted and remove the temporary file
sort -o $OUT $OUT
rm $TMP
