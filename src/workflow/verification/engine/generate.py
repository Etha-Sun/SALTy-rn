"""CLI: generate a uniform verification harness from a NEON + RVV kernel pair.

  python -m src.workflow.verification.engine.generate \
      --neon kernels/source/f32-vmul.c --rvv kernels/target/f32-vmul.c --name f32-vmul

Writes build/verification_cvc5/harnesses/verify_<name>_gen.cpp (override with --out).
"""
from __future__ import annotations

import argparse
import pathlib

from .emit import generate_harness


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--neon", required=True)
    ap.add_argument("--rvv", required=True)
    ap.add_argument("--name", required=True)
    ap.add_argument("--params", choices=["symbolic", "concrete"], default="symbolic",
                    help="param mode (default symbolic; concrete tests edge values)")
    ap.add_argument("--input-range", default=None,
                    help="constrain F32 inputs to finite LO,HI (e.g. '-1,1') — excludes "
                         "NaN/inf; weakens the claim to finite inputs (recorded in verdict)")
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    irange = None
    if args.input_range:
        lo, hi = (s.strip() for s in args.input_range.split(","))
        irange = (lo, hi)
    src = generate_harness(args.neon, args.rvv, args.name,
                           params_mode=args.params, input_range=irange)
    out = pathlib.Path(args.out or
                       f"build/verification_cvc5/harnesses/verify_{args.name}_gen.cpp")
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(src)
    print(out)


if __name__ == "__main__":
    main()
