#!/usr/bin/env python3
"""Supervisor watcher: exits (waking the supervisor) as soon as any worker run needs attention.

Reasons:
  FINISHED  meta.json got an exit_code that was not seen before
  LINGER    last event is a `result` and events.jsonl has been idle >= LINGER_MIN (worker done, process kept alive
            by orphaned background jobs; see W03 2026-11-07)
  HUNG      run still open, no `result` at the end, events.jsonl idle >= HUNG_MIN
Already-reported (run, reason) pairs are kept in .watch-state.json so a reason fires only once.
"""
import json, sys, time
from pathlib import Path

ROOT = Path(__file__).resolve().parent
STATE = ROOT / '.watch-state.json'
LINGER_MIN, HUNG_MIN, POLL, MEM_GIB = 15, 120, 60, 100


def last_event_type(ev):
    try:
        with open(ev, 'rb') as f:
            f.seek(0, 2)
            size = f.tell()
            f.seek(max(0, size - 200000))
            lines = f.read().decode('utf-8', 'replace').splitlines()
    except OSError:
        return None
    for line in reversed(lines):
        try:
            return json.loads(line).get('type')
        except ValueError:
            continue
    return None


def scan(seen):
    hits = []
    for meta in sorted(ROOT.glob('w*/runs/run*/meta.json')):
        run = meta.parent
        key = str(run.relative_to(ROOT))
        try:
            m = json.loads(meta.read_text())
        except ValueError:
            continue
        if 'exit_code' in m:
            # a later run of the same worker exists -> supervisor already handled (stopped and resumed) it
            later = any(p.name > run.name for p in run.parent.glob('run*'))
            if (key, 'FINISHED') not in seen and not later:
                hits.append((key, 'FINISHED', f"exit_code={m['exit_code']}"))
            continue
        ev = run / 'events.jsonl'
        if not ev.exists():
            continue
        idle = (time.time() - ev.stat().st_mtime) / 60
        t = last_event_type(ev)
        if t == 'result' and idle >= LINGER_MIN and (key, 'LINGER') not in seen:
            hits.append((key, 'LINGER', f'idle {idle:.0f} min after result'))
        elif t != 'result' and idle >= HUNG_MIN and (key, 'HUNG') not in seen:
            hits.append((key, 'HUNG', f'idle {idle:.0f} min, last event {t}'))
    # MEM: a worker scope close to its 128 GiB cap (orphaned coqc piles up; see W02 2026-11-07)
    import subprocess
    try:
        units = subprocess.run(['systemctl', '--user', 'list-units', 'vekto-*', '--no-legend', '--plain'],
                               capture_output=True, text=True).stdout.split()
        for u in [x for x in units if x.endswith('.scope')]:
            cur = subprocess.run(['systemctl', '--user', 'show', u, '-p', 'MemoryCurrent', '--value'],
                                 capture_output=True, text=True).stdout.strip()
            if cur.isdigit() and int(cur) > MEM_GIB * 2**30 and (u, 'MEM') not in seen:
                hits.append((u, 'MEM', f'{int(cur) / 2**30:.0f} GiB'))
    except OSError:
        pass
    return hits


def main():
    seen = set(map(tuple, json.loads(STATE.read_text()))) if STATE.exists() else set()
    if '--init' in sys.argv:  # mark everything currently finished as already seen
        for key, reason, _ in scan(set()):
            if reason == 'FINISHED':
                seen.add((key, reason))
        STATE.write_text(json.dumps(sorted(seen)))
    while True:
        hits = scan(seen)
        if hits:
            for key, reason, info in hits:
                print(f'{reason}: {key} ({info})')
                seen.add((key, reason))
            STATE.write_text(json.dumps(sorted(seen)))
            return
        time.sleep(POLL)


if __name__ == '__main__':
    main()
