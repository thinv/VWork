#!/usr/bin/env bash
set -euo pipefail
ROOT="docs/04-design/golden-images"
CHUNKS="$ROOT/_chunks"

for dir in "$CHUNKS"/GS-WEB-*; do
  [ -d "$dir" ] || continue
  id="$(basename "$dir")"
  case "$id" in
    GS-WEB-01) out="$ROOT/GS-WEB-01-home-service-launcher.webp" ;;
    GS-WEB-02) out="$ROOT/GS-WEB-02-unified-work-inbox.webp" ;;
    GS-WEB-04) out="$ROOT/GS-WEB-04-tham-muu-van-ban.webp" ;;
    GS-WEB-05) out="$ROOT/GS-WEB-05-hoan-thien-van-ban.webp" ;;
    GS-WEB-06) out="$ROOT/GS-WEB-06-xu-ly-van-ban-den.webp" ;;
    *) continue ;;
  esac
  cat "$dir"/part-*.b64 | tr -d '\n\r' | base64 -d > "$out"
  file "$out"
done
