#!/usr/bin/env python3
"""Record an unmodified Isla CLI probe; exit 0 alone is not semantic success."""
import argparse
import hashlib
import json
import subprocess
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent

def main():
    p = argparse.ArgumentParser()
    p.add_argument('name')
    p.add_argument('--timeout', type=int, default=60)
    p.add_argument('args', nargs=argparse.REMAINDER)
    a = p.parse_args()
    args = a.args[1:] if a.args[:1] == ['--'] else a.args
    cmd = [str(ROOT / 'vendor/isla-master/target/release/isla-footprint'), *args]
    start = time.monotonic()
    out = ROOT / 'logs' / (a.name + '.trace')
    err = ROOT / 'logs' / (a.name + '.err')
    status = 'finished'
    with out.open('w') as stdout, err.open('w') as stderr:
        try:
            r = subprocess.run(cmd, cwd=ROOT, stdout=stdout, stderr=stderr, timeout=a.timeout)
            code = r.returncode
        except subprocess.TimeoutExpired:
            code = None
            status = 'timeout'
    trace, errors = out.read_text(), err.read_text()
    result = dict(name=a.name, command=cmd, cwd=str(ROOT), status=status,
                  exit_code=code, seconds=round(time.monotonic()-start,3),
                  timeout_seconds=a.timeout, trace_bytes=out.stat().st_size,
                  traces=trace.count('(trace'), register_writes=trace.count('(write-reg'),
                  memory_reads=trace.count('(read-mem'), memory_writes=trace.count('(write-mem'),
                  trace_sha256=hashlib.sha256(out.read_bytes()).hexdigest(),
                  errors_tail=errors[-3000:], equivalence_proved=False)
    (ROOT/'results'/(a.name+'.json')).write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k not in ['command','errors_tail','cwd']},indent=2))
    if errors: print(errors[-1200:])

if __name__ == '__main__':
    main()
