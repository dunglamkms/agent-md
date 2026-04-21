#!/bin/bash
# run.sh — Decrypt engine, open workspace, clean up on exit.
#
# Usage:  ./run.sh
#         ./run.sh --passfile /path/to/secret
#
# Flow:
#   1. Decrypt _engine.md.enc → _engine.md (plaintext)
#   2. Open the Deliver folder in VS Code
#   3. Wait for user to finish (press Enter)
#   4. Delete _engine.md (plaintext never lingers)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ENGINE="$SCRIPT_DIR/_engine.md"
ENGINE_ENC="$SCRIPT_DIR/_engine.md.enc"

# --- Cleanup: always delete plaintext on exit ---
cleanup() {
  if [[ -f "$ENGINE" ]]; then
    rm -f "$ENGINE"
    echo ""
    echo "[cleanup] _engine.md deleted."
  fi
}
trap cleanup EXIT INT TERM

# --- Pre-checks ---
if [[ ! -f "$ENGINE_ENC" ]]; then
  echo "ERROR: $ENGINE_ENC not found."
  echo "Run encrypt.sh first to create the encrypted engine file."
  exit 1
fi

if [[ -f "$ENGINE" ]]; then
  echo "WARNING: _engine.md already exists (plaintext on disk)."
  echo "It will be overwritten by decryption and deleted on exit."
  echo ""
fi

# --- Decrypt ---
if [[ "${1:-}" == "--passfile" && -n "${2:-}" ]]; then
  PASS_ARGS=(-pass "file:$2")
else
  PASS_ARGS=()
fi

echo "Decrypting engine..."
openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -d \
  -in "$ENGINE_ENC" -out "$ENGINE" "${PASS_ARGS[@]}"

echo "Engine decrypted. Agents are ready."
echo ""

# --- Open VS Code ---
echo "Opening workspace in VS Code..."
code "$SCRIPT_DIR"
echo ""

# --- Wait for user ---
echo "╔══════════════════════════════════════════════════╗"
echo "║  Agents are LIVE. Use Copilot normally.         ║"
echo "║  Press ENTER when done to wipe _engine.md.      ║"
echo "╚══════════════════════════════════════════════════╝"
read -r

echo "Session ended."
# cleanup runs automatically via trap
