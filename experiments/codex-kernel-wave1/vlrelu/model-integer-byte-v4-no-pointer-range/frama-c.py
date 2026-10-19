#!/usr/bin/env python3
"""Isolated pure-integer Bytes frontend. Floating byte codecs are fatal."""
from pathlib import Path
import hashlib
import json
import os
import sys

here = Path(__file__).resolve().parent
root = here.parents[3]
lock = here / 'model_lock.json'
if lock.exists():
    for name, digest in json.loads(lock.read_text())['files'].items():
        path = Path(name) if Path(name).is_absolute() else root / name
        if hashlib.sha256(path.read_bytes()).hexdigest() != digest:
            raise SystemExit('Model input changed: ' + name)

args = sys.argv[1:]
if args.count('-wp-model') > 1:
    raise SystemExit('Exactly one Bytes model may be selected')
if '-wp-model' in args:
    if args[args.index('-wp-model') + 1] != 'Bytes':
        raise SystemExit('Only pure-integer Bytes is qualified; floating codecs are forbidden')
else:
    args += ['-wp-model', 'Bytes']
if '-wp-share' in args:
    if Path(args[args.index('-wp-share') + 1]).resolve() != here / 'wp-share':
        raise SystemExit('Only this pinned integer Bytes share is qualified')
else:
    args += ['-wp-share', str(here / 'wp-share')]
if '-wp-driver' in args or '-wp-library' in args:
    raise SystemExit('Additional semantic drivers and libraries are not qualified')

install = here / '.build/install'
command = [str(install / 'bin/frama-c'), *args, '-cpp-command',
           'gcc -E -C -I' + str(here / 'libc') + ' -I.',
           '-cpp-frama-c-compliant']
env = dict(os.environ, OCAMLPATH=str(install / 'lib'))
print('# Pure-integer Bytes invocation: ' + json.dumps(command), flush=True)
os.execve(command[0], command, env)
