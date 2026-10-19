#!/usr/bin/env python3
"""Rebuild a fresh sibling candidate; never overwrite a frozen model."""
from pathlib import Path
import argparse
import hashlib
import json
import os
import shutil
import subprocess

here = Path(__file__).resolve().parent
base = here.parent
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--output', type=Path, default=base / 'model-integer-byte-rebuilt')
args = p.parse_args()
out = args.output.resolve()
if out.parent != base or out.exists():
    raise SystemExit('Choose a new sibling directory under experiments/shim-c-v2')
source = base / 'toolchain-build/.build/source/frama-c-33.0-Arsenic'
share = base / 'model-plus/wp-share'
if not source.is_dir() or not share.is_dir():
    raise SystemExit('First restore the audited toolchain-build and model-plus dependencies; see README.zh-CN.md')
expected = json.loads((here / 'candidate-source.json').read_text())['original_MemBytes_sha256']
if hashlib.sha256((source / 'src/plugins/wp/MemBytes.ml').read_bytes()).hexdigest() != expected:
    raise SystemExit('The parent frontend source differs from the audited version')
out.mkdir()
(out / '.build').mkdir()
subprocess.run(['cp', '-a', '--reflink=auto', str(source), str(out / '.build/source')], check=True)
for name in ['libc', 'wp-share']:
    shutil.copytree(base / 'model-plus' / name, out / name)
for suffix in ['le', 'be']:
    name = 'membytes_' + suffix + '.mlw'
    shutil.copyfile(here / 'why3/frama_c_wp' / name,
                    out / 'wp-share/why3/frama_c_wp' / name)
shutil.copyfile(base / 'model-plus/cint.mlw', out / 'wp-share/why3/frama_c_wp/cint.mlw')
shutil.copyfile(here / 'frama-c.py', out / 'frama-c.py')
os.chmod(out / 'frama-c.py', 0o755)
subprocess.run(['patch', '--batch', '--fuzz=0', '-p1', '-i',
                str(here / 'mem-bytes-disable-float-codec.patch')],
               cwd=out / '.build/source', check=True)
opam = base / 'toolchain-build/.build/bin/opam'
env = dict(os.environ, OPAMROOT=str(base / 'toolchain-build/.build/opam'))
prefix = [str(opam), 'exec', '--switch=shim-wp-fix', '--', 'dune']
commands = [prefix + ['build', '-j', '8', '--release',
                       '--promote-install-files=false', '@install'],
            prefix + ['install', '--prefix=' + str(out / '.build/install'), '--release']]
with (out / 'build.log').open('w') as log:
    for command in commands:
        subprocess.run(command, cwd=out / '.build/source', env=env,
                       stdout=log, stderr=subprocess.STDOUT, check=True)
(out / 'rebuild-result.json').write_text(json.dumps({
    'status': 'compiled candidate, not frozen or fully qualified',
    'commands': commands,
    'source': str(source),
    'parent_share': str(share),
    'controls_required': ['integer positive/negative', 'memcpy and packing posts',
                          'wrapper and direct-binary floating codec rejection'],
}, indent=2) + '\n')
print(out)
