#!/usr/bin/sh

API=https://apps.garmin.com/api/appsLibraryExternalServices/api/asw/deviceTypes

DIR=data/raw/api
OUT=$DIR/deviceTypes.json

curl $API | jq . >$OUT

# Add missing registered trademark symbols
sed -i 's/ForeAthlete /ForeAthlete® /;s/Montana /Montana® /' $OUT

# Add missing spaces after the trademark symbols
sed -i -E 's/([®™])([^ ")])/\1 \2/g' $OUT

# Add missing spaces after hyphens
sed -i -E 's/( -)([^ ])/\1 \2/g' $OUT
