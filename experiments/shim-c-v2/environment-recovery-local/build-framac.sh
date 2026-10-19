#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
SHIM_RECOVERY_ROOT="$PWD"
export OPAMROOT="$PWD/.build/opam"
export OPAMSWITCH=shim-local
export OPAMJOBS=8
export CPATH="$PWD/.build/gmp/usr/include/x86_64-linux-gnu:$PWD/.build/gmp/usr/include"
export LIBRARY_PATH="$PWD/.build/gmp/usr/lib/x86_64-linux-gnu"
export PKG_CONFIG_PATH="$PWD/.build/gmp/usr/lib/x86_64-linux-gnu/pkgconfig"
cd .build/source/frama-c-33.0-Arsenic
"$SHIM_RECOVERY_ROOT/.build/downloads/opam" exec -- dune build -j 8 --release --promote-install-files=false @install
"$SHIM_RECOVERY_ROOT/.build/downloads/opam" exec -- dune install --release --prefix="$SHIM_RECOVERY_ROOT/.build/install"
