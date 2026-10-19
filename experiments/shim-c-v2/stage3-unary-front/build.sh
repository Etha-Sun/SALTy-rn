#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
SHIM_UNARY_ROOT="$PWD"
SHIM_RECOVERY_ROOT="$(cd ../environment-recovery-local && pwd)"
export OPAMROOT="$SHIM_RECOVERY_ROOT/.build/opam"
export OPAMSWITCH=shim-local
export OPAMJOBS=8
export CPATH="$SHIM_RECOVERY_ROOT/.build/gmp/usr/include/x86_64-linux-gnu:$SHIM_RECOVERY_ROOT/.build/gmp/usr/include"
export LIBRARY_PATH="$SHIM_RECOVERY_ROOT/.build/gmp/usr/lib/x86_64-linux-gnu"
export PKG_CONFIG_PATH="$SHIM_RECOVERY_ROOT/.build/gmp/usr/lib/x86_64-linux-gnu/pkgconfig"
cd .build/source
"$SHIM_RECOVERY_ROOT/.build/downloads/opam" exec -- dune build -j 8 --release --promote-install-files=false @install
"$SHIM_RECOVERY_ROOT/.build/downloads/opam" exec -- dune install --release --prefix="$SHIM_UNARY_ROOT/.build/install"
