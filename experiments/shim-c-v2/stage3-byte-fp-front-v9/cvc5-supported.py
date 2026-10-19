#!/usr/bin/env python3
"""Exact-input CVC5 adapter; unsupported native FP encodings remain unknown."""
from pathlib import Path
import sys,os
here=Path(__file__).resolve().parent
source=Path(sys.argv[-1])
if 'fp.to_ieee_bv' in source.read_text():
    print('unknown')
    print('; native fp.to_ieee_bv unsupported by pinned CVC5; no encoding substitution')
    raise SystemExit(0)
solver=str(here.parent/'handoff-solvers/.build/bin/cvc5')
os.execv(solver,[solver,*sys.argv[1:]])
