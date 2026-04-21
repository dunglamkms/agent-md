#!/bin/bash
# encrypt.sh — Owner-only. Encrypts _engine.md → _engine.md.enc
# Run this after editing _engine.md, before committing.
#
# Usage:  ./encrypt.sh
#         ./encrypt.sh --passfile /path/to/secret

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ENGINE="$SCRIPT_DIR/_engine.md"
ENGINE_ENC="$SCRIPT_DIR/_engine.md.enc"

if [[ ! -f "$ENGINE" ]]; then
  echo "ERROR: $ENGINE not found. Nothing to encrypt."
  exit 1
fi

# Accept passphrase from file or prompt
if [[ "${1:-}" == "--passfile" && -n "${2:-}" ]]; then
  PASS_ARGS=(-pass "file:$2")
else
  PASS_ARGS=()
fi

openssl enc -aes-256-cbc -pbkdf2 -iter 100000 \
  -salt -in "$ENGINE" -out "$ENGINE_ENC" "${PASS_ARGS[@]}"

echo "Encrypted: $ENGINE_ENC"
echo ""
echo "Next steps:"
echo "  1. Verify:    ./run.sh  (test decryption)"
echo "  2. Commit:    git add _engine.md.enc && git commit"
echo "  3. NEVER commit _engine.md (plaintext) — .gitignore blocks it"
