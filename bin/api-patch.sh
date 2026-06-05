#!/usr/bin/sh

RAW=data/raw/api/deviceTypes.json
OUT=data/tmp/api/deviceTypes.json

# Duplicate original file
cp $RAW $OUT

# Standardise hyphens - use minus sign
sed -i 's/–/-/g' $OUT

# Add missing registered trademark symbols
sed -i 's/ForeAthlete /ForeAthlete® /;s/Montana /Montana® /' $OUT

# Add missing spaces after the trademark symbols
sed -i -E 's/([®™])([^ ")])/\1 \2/g' $OUT

# Add missing spaces before hyphens
sed -i -E 's/([^ ])(- )/\1 \2/' $OUT

# Add missing spaces after hyphens
sed -i -E 's/( -)([^ ])/\1 \2/' $OUT

# Ensure Descent Mk2 and Mk3 use camel case
sed -i 's/™ MK/™ Mk/' $OUT

# Standardise #1 - e.g. fēnix® 8 AMOLED (43mm) to fēnix® 8 - 43mm, AMOLED
sed -i -E 's/(AMOLED|Solar|Dual Power) \((.*)\)/- \2, \1/' $OUT

# Standardise #2 - e.g. epix™ Pro (42mm) to epix™ Pro - 42mm
sed -i -E 's/\(([45][0-9])(mm)\)/- \1 \2/' $OUT

# Add missing spaces either side of slashes - e.g. 47mm / 51mm
sed -i -E 's/(mm)\/([45][0-9]mm)/\1 \/ \2/' $OUT

# Add missing spaces in sizes - e.g. 47 mm / 51 mm
sed -i -E 's/( [45][0-9])(mm)/\1 \2/g' $OUT

# Shorten multiple sizes - e.g. 47 mm / 51 mm to 47 / 51 mm
sed -i -E 's/([45][0-9]) mm \/ ([45][0-9] mm)/\1 \/ \2/' $OUT

# Add missing commas - e.g. fēnix® 8 Pro – 51 mm, MicroLED
sed -i -E 's/(mm) ([A-Z][A-Za-z]*LED)/\1, \2/' $OUT

# Add missing brackets - e.g. fēnix® 7X Pro (No Wi-Fi®)
sed -i -E 's/ (No Wi-Fi)/ (\1®)/' $OUT

# One-off fix for fēnix® 7 - Solar Edition
sed -i -E 's/(fēnix® 7) (Solar)/\1 - \2 Edition/' $OUT

# One-off fix for tactix® Delta Solar Ballistics
sed -i 's/Solar:Ballisitcs Edition/Solar Ballistics/' $OUT

# Shorten ONE PIECE names
sed -i -E 's/(ONE PIECE).*"/\1"/' $OUT

# Shorten Dual Power to Solar
sed -i 's/Dual Power/Solar/' $OUT

# Remove unnnecessary suffixes
sed -i 's/ Edition//;s/ Collection//;s/ - Damascus Steel//;s/ - Carbon//' $OUT
