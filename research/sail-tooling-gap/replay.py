#!/usr/bin/env python3
"""Replay recorded commands. Default: existing traces -> SMT + negative control.

--extract regenerates the three core instruction traces with the local Isla build.
--all-probes also repeats coverage and failed probes (including two 60s timeouts).
Requires the dependencies documented in README.md; never downloads anything.
"""
import argparse
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--extract', action='store_true')
p.add_argument('--all-probes', action='store_true')
a = p.parse_args()
names = ['neon-smax', 'rv-vmax-reset', 'rv-vmin-negative'] if a.extract else []
if a.all_probes:
    names = [f.stem for f in sorted((ROOT/'results').glob('*.json'))
             if 'command' in json.loads(f.read_text())]
for name in names:
    result = json.loads((ROOT/'results'/f'{name}.json').read_text())
    subprocess.run([sys.executable, str(ROOT/'probe.py'), '--timeout',
                    str(result['timeout_seconds']), name, '--', *result['command'][1:]], check=True)
    if name in {'neon-smax', 'rv-vmax-reset', 'rv-vmin-negative'}:
        new = json.loads((ROOT/'results'/f'{name}.json').read_text())
        if new['status'] != 'finished' or new['exit_code'] != 0 or not new['register_writes']:
            raise SystemExit('Core trace extraction failed: '+name)
subprocess.run([sys.executable, str(ROOT/'compare_traces.py')], check=True)
