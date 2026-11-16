#!/usr/bin/env bash
# Disable XFCE compositing when GL is software-only (llvmpipe / VNC).
set -euo pipefail
export DISPLAY="${DISPLAY:-:1}"
if ! command -v xfconf-query >/dev/null 2>&1; then
  echo "xfconf-query not found" >&2
  exit 1
fi
xfconf-query -c xfwm4 -p /general/use_compositing -s false
echo "xfwm4 compositing: $(xfconf-query -c xfwm4 -p /general/use_compositing)"
