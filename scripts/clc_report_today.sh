#!/bin/bash

OUTPUT_PATH="$HOME/tmp/clockify_today"
mkdir -p "$(dirname "$OUTPUT_PATH")"
clockify-cli report today --duration-formatted >"$OUTPUT_PATH"
