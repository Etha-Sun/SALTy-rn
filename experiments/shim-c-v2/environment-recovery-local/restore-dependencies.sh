#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
export OPAMROOT="$PWD/.build/opam"
export OPAMSWITCH=shim-local
export OPAMJOBS=8
export CPATH="$PWD/.build/gmp/usr/include/x86_64-linux-gnu:$PWD/.build/gmp/usr/include"
export LIBRARY_PATH="$PWD/.build/gmp/usr/lib/x86_64-linux-gnu"
export PKG_CONFIG_PATH="$PWD/.build/gmp/usr/lib/x86_64-linux-gnu/pkgconfig"
.build/downloads/opam switch import ../toolchain-build/installed-switch.export --jobs=8 --assume-depexts -y
