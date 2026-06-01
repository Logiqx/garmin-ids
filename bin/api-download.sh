#!/usr/bin/sh

API=https://apps.garmin.com/api/appsLibraryExternalServices/api/asw/deviceTypes

DIR=data/raw/api
OUT=$DIR/deviceTypes.json

curl $API | jq . >$OUT

sed -i 's/ForeAthlete /ForeAthlete® /;s/Montana /Montana® /' $OUT
