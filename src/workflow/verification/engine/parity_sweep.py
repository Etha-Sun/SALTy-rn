"""Verdict-parity / regression sweep for the verification engine.

Runs every supported kernel through the orchestrator's verify_kernel and checks the
verdict against the expected/known-good one. Each entry carries the per-kernel config
(input-range for FP families, params mode, vlen, timeout).
Run:  .venv/bin/python -m src.workflow.verification.engine.parity_sweep
"""
from __future__ import annotations

import logging
import time

from ..orchestrator import verify_kernel, verify_kernels_parallel

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
    import os
    logging.getLogger("pipeline").setLevel(logging.WARNING)  # quiet the per-batch logs
    backend = os.environ.get("SALT_PARITY_BACKEND", "auto")  # product default; set =cvc5 for cvc5-only
    jobs = int(os.environ.get("SALT_PARITY_JOBS", "1"))      # 1=sequential; 0=auto-parallel; N>1=N workers
    root = "kernels"
    print(f"(backend={backend}, jobs={'auto' if jobs == 0 else jobs})")

    def spec(k):
        return dict(neon_path=f"{root}/source/{k['name']}.c",
                    rvv_path=f"{root}/target/{k['name']}.c",
                    kernel_name=k["name"], vlen=k["vlen"], time_budget=k["to"],
                    max_batch=k["mb"], min_batch=1, backend=backend, input_range=k["ir"])

    def verified_count(res):
        return len([b for b in res.verified_batches if b.status == "VERIFIED"])

    t_all = time.perf_counter()
    rows = []
    if jobs != 1:
        # Embarrassingly parallel across kernels (§9c.F) — isolated build dirs.
        res_map = verify_kernels_parallel([spec(k) for k in KERNELS],
                                          max_workers=None if jobs == 0 else jobs)
        for k in KERNELS:
            res = res_map.get(k["name"])
            verdict = res.verdict if res else "MISSING"
            n = verified_count(res) if res else 0
            ok = verdict in k["expected"].split("|")
            rows.append((k["name"], verdict, n, ok))
            print(f"  {'PASS' if ok else 'FAIL':4}  {k['name']:18} {verdict:14} "
                  f"verified={n:<3} expected={k['expected']}", flush=True)
    else:
        for k in KERNELS:
            t0 = time.perf_counter()
            try:
                res = verify_kernel(**spec(k))
                verdict, n = res.verdict, verified_count(res)
            except Exception as e:
                verdict, n = f"EXC:{type(e).__name__}", 0
            dt = time.perf_counter() - t0
            ok = verdict in k["expected"].split("|")
            rows.append((k["name"], verdict, n, ok))
            print(f"  {'PASS' if ok else 'FAIL':4}  {k['name']:18} {verdict:14} "
                  f"verified={n:<3} ({dt:.1f}s)  expected={k['expected']}", flush=True)

    npass = sum(1 for *_, ok in rows if ok)
    print(f"\n=== parity: {npass}/{len(rows)} match expected  ({time.perf_counter() - t_all:.1f}s wall) ===")
    fails = [r for r in rows if not r[3]]
    if fails:
        print("FAILURES:")
        for name, verdict, n, _ in fails:
            print(f"  {name}: got {verdict} (verified={n})")
    return rows


if __name__ == "__main__":
    run()
