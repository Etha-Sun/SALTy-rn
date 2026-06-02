"""Verdict-parity / regression sweep for the verification engine.

Runs every supported kernel through the orchestrator's verify_kernel and checks the
verdict against the expected/known-good one. Each entry carries the per-kernel config
(input-range for FP families, params mode, vlen, timeout).
Run:  .venv/bin/python -m src.workflow.verification.engine.parity_sweep
"""
from __future__ import annotations

import logging
import time

from ..orchestrator import verify_kernel

# name → config. input_range=None means full domain. mb = max_batch (elementwise
# sweeps 1..mb; multidim ignores it and sweeps its own dim grid). to = per-batch
# timeout (s). expected = the verdict v2 should produce (parity target).
KERNELS = [
    # --- elementwise / params (concrete edge configs) ---
    dict(name="f32-vmul",       ir=None,      mb=3,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="f32-vbinary",    ir=None,      mb=3,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="f32-vlrelu",     ir=None,      mb=3,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="qs8-vlrelu",     ir=None,      mb=3,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="qs8-vadd",       ir=None,      mb=3,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="qs8-vaddc",      ir=None,      mb=3,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="qs8-vmulc",      ir=None,      mb=3,  vlen=256, to=20, expected="ALL_PASSED"),
    # --- multidim, full domain (no arithmetic / order-identical max) ---
    dict(name="x8-transposec",  ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="x16-transposec", ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="x32-transposec", ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="x64-transposec", ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="f32-maxpool",    ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="s8-maxpool",     ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="u8-maxpool",     ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="f32-strided-slice", ir=None,   mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="f32-concat2",    ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    dict(name="f32-split2",     ir=None,      mb=1,  vlen=256, to=20, expected="ALL_PASSED"),
    # --- multidim FP families (finite input-range; config:finite verdict) ---
    dict(name="f32-igemm",      ir=(-1, 1),   mb=1,  vlen=256, to=60, expected="ALL_PASSED"),
    dict(name="f32-igemm-ks3",  ir=(-1, 1),   mb=1,  vlen=256, to=60, expected="ALL_PASSED"),
    dict(name="f32-dwconv",     ir=(-1, 1),   mb=1,  vlen=256, to=60, expected="ALL_PASSED"),
    dict(name="f32-dwconv-9p",  ir=(-1, 1),   mb=1,  vlen=256, to=60, expected="ALL_PASSED"),
    dict(name="f32-vmulcaddc",  ir=(-1, 1),   mb=1,  vlen=256, to=60, expected="ALL_PASSED"),
    dict(name="f32-ibilinear",  ir=(-1, 1),   mb=1,  vlen=256, to=60, expected="ALL_PASSED"),
    # gemm's heaviest configs (mr=6,kc=8) are solver-hard → PARTIAL is acceptable parity.
    dict(name="f32-gemm",       ir=(-1, 1),   mb=1,  vlen=64,  to=60, expected="PARTIAL|ALL_PASSED"),
]


def run():
    logging.getLogger("pipeline").setLevel(logging.WARNING)  # quiet the per-batch logs
    root = "kernels"
    rows = []
    for k in KERNELS:
        neon = f"{root}/source/{k['name']}.c"
        rvv = f"{root}/target/{k['name']}.c"
        t0 = time.perf_counter()
        try:
            res = verify_kernel(neon, rvv, kernel_name=k["name"],
                                vlen=k["vlen"], per_batch_timeout=k["to"],
                                max_batch=k["mb"], min_batch=1,
                                input_range=k["ir"])
            verdict = res.verdict
            n = len([b for b in res.verified_batches if b.status == "VERIFIED"])
        except Exception as e:
            verdict, n = f"EXC:{type(e).__name__}", 0
        dt = time.perf_counter() - t0
        ok = verdict in k["expected"].split("|")
        rows.append((k["name"], verdict, n, dt, ok))
        print(f"  {'PASS' if ok else 'FAIL':4}  {k['name']:18} {verdict:14} "
              f"verified={n:<3} ({dt:.1f}s)  expected={k['expected']}", flush=True)

    npass = sum(1 for *_, ok in rows if ok)
    print(f"\n=== parity: {npass}/{len(rows)} match expected ===")
    fails = [r for r in rows if not r[4]]
    if fails:
        print("FAILURES:")
        for name, verdict, n, dt, _ in fails:
            print(f"  {name}: got {verdict} (verified={n})")
    return rows


if __name__ == "__main__":
    run()
