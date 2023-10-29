#!/bin/bash

set -e

DIRNAME=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))
OUTPUT_DIR="$DIRNAME/out"

FILENAME=$(basename $1)
EXTENSION=${FILENAME#*.}
if [[ "$EXTENSION" != "asm" ]]; then
  echo "[ERROR] file extension must be .asm"
  exit 1
fi
BASE_NAME=${FILENAME%.*}

mkdir -p "$DIRNAME/out"

nasm -f elf64 "$1" -o "/tmp/$BASE_NAME.o"
ld "/tmp/$BASE_NAME.o" -o "$OUTPUT_DIR/$BASE_NAME.out"
