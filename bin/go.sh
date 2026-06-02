#!/bin/sh

DIR=bin

# Download latest JSON from the API
$DIR/api-download.sh

# Create outputs
$DIR/output-concise.sh
$DIR/output-long.sh
$DIR/output-terse.sh
