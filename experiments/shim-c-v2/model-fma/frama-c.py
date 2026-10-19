#!/usr/bin/env python3
"""Pinned standard-library FMA model; ordinary kernel C is unchanged."""
from pathlib import Path
import hashlib
import json
import os
import sys

here = Path(__file__).resolve().parent
root = here.parents[2]
lock = json.loads((here / 'float_model_lock.json').read_text())
for name, expected in lock['files'].items():
    path = Path(name) if Path(name).is_absolute() else root / name
    if hashlib.sha256(path.read_bytes()).hexdigest() != expected:
        raise SystemExit('FMA model input changed: ' + name)
argv, drivers = [], list(lock['extra_drivers'])
i = 0
while i < len(sys.argv[1:]):
    if sys.argv[i + 1] == '-wp-driver':
        drivers.extend(sys.argv[i + 2].split(',')); i += 2
    else:
        argv.append(sys.argv[i + 1]); i += 1
command = ['/zp_vegeta/scratch_sb/ycsun/verus/research/frama-c-qs8-rsum/toolchain/bundle/bin/frama-c',
           *argv, '-cpp-command', lock['cpp_command'], '-cpp-frama-c-compliant']
command += ['-wp-driver', ','.join(str(root / driver) if not Path(driver).is_absolute() else driver for driver in drivers)]
print('# FMA underlying invocation: ' + json.dumps(command), flush=True)
os.execv(command[0], command)
