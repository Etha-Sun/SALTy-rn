#!/usr/bin/env python3
"""Record narrow, reproducible source observations and input hashes."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
def digest(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()

markers = ['zVV_VMAX', 'zVX_VMAX', 'register zvr0', 'register zvtype', 'let (zvlen:']
snapshots = {}
for n in ['islaris-pinned-riscv64.ir', 'rv64d.ir', 'armv9p4.ir']:
    p = ROOT/'vendor'/n
    t = p.read_text()
    snapshots[n] = dict(bytes=p.stat().st_size, sha256=digest(p),
                        vector_marker_counts={s:t.count(s) for s in markers})
commits = {}
for n in ['isla', 'islaris', 'riscv-lean', 'snapshots']:
    d = json.loads((ROOT/'sources'/f'{n}-head.json').read_text())
    commits[n] = dict(sha=d['sha'], date=d['commit']['committer']['date'])
inputs = [ROOT/'probe.py', ROOT/'compare_traces.py', ROOT/'replay.py',
          ROOT/'vendor/isla-master/target/release/isla-footprint',
          ROOT.parent.parent/'examples/s8-vmax-to-lean/neon.c',
          ROOT.parent.parent/'examples/s8-vmax-to-lean/rvv.c',
          ROOT.parent/'sail-binary-reduction/artifacts/rvv-disasm.log',
          ROOT/'vendor/lean-kernel/Rv64Kernel/Defs.lean']
inputs += sorted((ROOT/'experiments').glob('*.toml'))
inputs += [ROOT/'experiments/s8-neon.o',ROOT/'experiments/s8-neon.disasm']
records = {str(p.relative_to(ROOT)) if p.is_relative_to(ROOT) else str(p):digest(p) for p in inputs}
lean_errors = {}
for n in ['lean-build.log','lean-build-4.29.0.log']:
    p = ROOT/'logs'/n
    lean_errors[n] = dict(sha256=digest(p),errors=[s for s in p.read_text().splitlines() if s.startswith('error:')])
result = dict(date='2026-09-23',commits=commits,snapshots=snapshots,
              input_sha256=records,lean_build_errors=lean_errors,
              islaris_frontend_executed=False,full_kernel_equivalence_proved=False)
(ROOT/'results/source-audit.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(commits=commits,snapshots=snapshots),indent=2))
