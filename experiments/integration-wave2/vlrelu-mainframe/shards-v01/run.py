#!/usr/bin/env python3
"""Exact v02 diagnostic shards, never kernel admission. enum precedes solve."""
import concurrent.futures
import collections
import hashlib
import json
import os
from pathlib import Path
import re
import signal
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[3]
W2 = REPO / 'experiments/integration-wave2'
BASE = W2 / 'vlrelu-final-merge/v02'
INV = BASE / 'root-full-enumeration'
MODE = sys.argv[1]
assert MODE in ('enum', 'solve')
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
write = lambda p, x: p.write_text(json.dumps(x, indent=2) + '\n')
command = json.loads((INV / 'command.json').read_text())
provenance = json.loads((INV / 'provenance.json').read_text())
source = BASE / 'attempts/0001/.build/verify01/annotated'
expected = json.loads((INV / 'goal-ids.json').read_text())['goal_ids']
assert len(expected) == len(set(expected)) == 749

def gate():
    q = json.loads((W2 / 'quota-status.json').read_text())
    assert not (W2 / 'QUOTA-STOP.json').exists(), 'quota STOP'
    assert q['query_ok'] and not q['closing']
    assert q['remaining_percent'] >= 55 and time.time() - q['checked_at'] < 1800, 'quota low or stale'

def identity():
    actual = {n: sha(source / n) for n in provenance['annotated_before_sha256']}
    assert actual == provenance['annotated_before_sha256'], 'source identity changed'
    assert sha(BASE / 'attempts/0001/proof.patch') == provenance['proof_sha256']
    return actual

gate()
hashes = identity()
if MODE == 'solve':
    audit = json.loads((HERE / 'coverage.json').read_text())
    assert audit['exact_749_once'] and audit['source_sha256'] == hashes
classes = ['@requires', '@assigns', '@ensures', 'rte', '@assert', '@invariant', '@variant']
filters = [','.join([c] + ['-' + x for x in classes[:i]] + ['-@lemma'])
           for i, c in enumerate(classes)]
filters.append(','.join(['-' + x for x in classes] + ['-@lemma']))
deadline = time.monotonic() + 1200
env = os.environ.copy()
env['PATH'] = '/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:' + env['PATH']

def run(item):
    i, prop = item
    gate()
    out = HERE / MODE / f'{i + 1:02d}'
    out.mkdir(parents=True, exist_ok=False)
    cmd = list(command)
    for flag, value in [('-wp-prover', 'none' if MODE == 'enum' else 'tip,z3,cvc5'),
                        ('-wp-par', '16'), ('-wp-report-json', str(out / 'report.json')),
                        ('-wp-session', str(out / 'session')), ('-wp-out', str(out / 'output'))]:
        cmd[cmd.index(flag) + 1] = value
    cmd += ['-wp-prop', prop]
    write(out / 'command.json', cmd)
    write(out / 'source.json', {'proof_sha256': provenance['proof_sha256'], 'source_sha256': hashes})
    start = time.time()
    timeout = max(1, deadline - time.monotonic())
    with (out / 'run.log').open('w') as log:
        proc = subprocess.Popen(cmd, cwd=REPO, env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        expired = False
        try:
            code = proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            expired = True
            os.killpg(proc.pid, signal.SIGTERM)
            try:
                code = proc.wait(timeout=5)
            except subprocess.TimeoutExpired:
                os.killpg(proc.pid, signal.SIGKILL)
                code = proc.wait()
    text = (out / 'run.log').read_text()
    ids = re.findall(r'^\[wp\] Goal (\S+) :', text, flags=re.M)
    scheduled = [int(x) for x in re.findall(r'(\d+) goals scheduled', text)]
    status = {'exit_code': code, 'timed_out': expired, 'seconds': time.time() - start,
              'filter': prop, 'scheduled': scheduled, 'goal_ids': ids}
    write(out / 'status.json', status)
    if MODE == 'enum':
        assert code == 0 and not expired and scheduled == [len(ids)], status
    return status

with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
    results = list(pool.map(run, enumerate(filters)))
assert identity() == hashes
if MODE == 'enum':
    counts = collections.Counter(g for r in results for g in r['goal_ids'])
    missing = sorted(set(expected) - counts.keys())
    extra = sorted(counts.keys() - set(expected))
    duplicates = {g: n for g, n in counts.items() if n != 1}
    audit = {'scope': 'Diagnostic selection coverage only; no proofs or admission',
             'source_sha256': hashes, 'proof_sha256': provenance['proof_sha256'],
             'shard_counts': [len(r['goal_ids']) for r in results],
             'missing': missing, 'unexpected': extra, 'duplicates': duplicates,
             'exact_749_once': len(counts) == 749 and not (missing or extra or duplicates)}
    write(HERE / 'coverage.json', audit)
    assert audit['exact_749_once'], audit
else:
    rows = []
    for i in range(8):
        path = HERE / 'solve' / f'{i + 1:02d}' / 'report.json'
        if path.exists():
            rows += json.loads(path.read_text())
    counts = collections.Counter(r['goal'] for r in rows)
    write(HERE / 'diagnostic.json', {'scope': 'Diagnostic only; full plus canonical admission still required',
          'source_sha256': hashes, 'shard_status': results, 'raw_rows': len(rows),
          'missing': sorted(set(expected) - counts.keys()), 'unexpected': sorted(counts.keys() - set(expected)),
          'duplicates': {g: n for g, n in counts.items() if n != 1},
          'unproved': [r for r in rows if not r.get('passed')], 'admitted': False})
