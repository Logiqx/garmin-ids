#!/usr/bin/sh

API=https://apps.garmin.com/api/appsLibraryExternalServices/api/asw/deviceTypes

OUT=data/raw/api/deviceTypes.json

curl $API | jq . >$OUT
