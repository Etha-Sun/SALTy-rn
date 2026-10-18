"""Compile and execute the actual symbolic NEON wrappers using a cvc5 prefix."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import time

parser = argparse.ArgumentParser()
parser.add_argument('--cvc5-prefix', type=Path, required=True)
parser.add_argument('--cxx', default='g++')
parser.add_argument('--reference-header', type=Path)
args = parser.parse_args()
here = Path(__file__).resolve().parent
repo = here.parents[2]
out = here / 'evidence'
out.mkdir(exist_ok=True)
records = {}
headers = {'fixed': repo / 'src/verification_cvc5/neon/ops/core.hpp'}
if args.reference_header:
    headers['before'] = args.reference_header.resolve()
for name, header in headers.items():
    binary = out / name
    command = [args.cxx, '-std=c++17', '-O1', '-fno-operator-names',
               '-I' + str(args.cvc5_prefix / 'include'),
               '-DSALT_NEON_CORE_HEADER="' + str(header) + '"',
               str(here / 'regression.cpp'), '-L' + str(args.cvc5_prefix / 'lib'),
               '-Wl,-rpath,' + str(args.cvc5_prefix / 'lib'), '-lcvc5', '-o', str(binary)]
    start = time.monotonic()
    build = subprocess.run(command, capture_output=True, text=True, timeout=120)
    run = subprocess.run([str(binary)], capture_output=True, text=True, timeout=30) if build.returncode == 0 else None
    records[name] = {'command': command, 'build_exit': build.returncode,
                     'build_output': build.stdout + build.stderr,
                     'run_exit': run.returncode if run else None,
                     'run_output': run.stdout + run.stderr if run else '',
                     'header_sha256': hashlib.sha256(header.read_bytes()).hexdigest(),
                     'seconds': round(time.monotonic() - start, 3)}
(out / 'results.json').write_text(json.dumps(records, indent=2) + '\n')
print(json.dumps(records, indent=2))
assert records['fixed']['build_exit'] == 0 and records['fixed']['run_exit'] == 0
if 'before' in records:
    assert records['before']['build_exit'] == 0 and records['before']['run_exit'] == 1
