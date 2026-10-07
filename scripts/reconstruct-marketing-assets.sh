#!/usr/bin/env bash
set -euo pipefail

ROOT="apps/web/public"
CHUNKS="$ROOT/_asset-chunks"

decode_asset() {
  local id="$1"
  local out="$2"
  local dir="$CHUNKS/$id"
  mkdir -p "$(dirname "$out")"
  cat "$dir"/part-*.b64 | tr -d '\n\r' | base64 -d > "$out"
  file "$out"
}

decode_asset "WEB-MKT-01" "$ROOT/golden/marketing/WEB-MKT-01-vwork-homepage-desktop.webp"
decode_asset "WEB-GOV-01" "$ROOT/golden/marketing/WEB-GOV-01-trolycongchuc-homepage-desktop.webp"
decode_asset "VWORK-LOGO" "$ROOT/brand/vwork/logo-primary.webp"
decode_asset "TCC-LOGO" "$ROOT/brand/trolycongchuc/logo-primary.webp"
