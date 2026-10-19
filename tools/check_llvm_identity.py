"""Compare clean and annotated C compilation; this is not a general C equivalence prover."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('plain', type=Path)
parser.add_argument('annotated', type=Path)
parser.add_argument('--clang', default='clang-14')
parser.add_argument('--llvm-diff', default='llvm-diff-14')
parser.add_argument('--output-directory', type=Path, required=True)
args = parser.parse_args()
out = args.output_directory.resolve()
out.mkdir(parents=True, exist_ok=True)
records = {}
for name, unit in [('plain', args.plain.resolve()), ('annotated', args.annotated.resolve())]:
    command = [args.clang, '-std=c11', '-O0', '-g0', '-S', '-emit-llvm',
               '-x', 'c', '-', '-o', '-']
    process = subprocess.run(command, input=unit.read_text(), cwd=unit.parent,
                             capture_output=True, text=True, timeout=30)
    records[name] = {'command': command, 'exit': process.returncode,
                     'stderr': process.stderr,
                     'unit_sha256': hashlib.sha256(unit.read_bytes()).hexdigest()}
    (out / f'{name}.ll').write_text(process.stdout)
    if process.returncode:
        (out / 'result.json').write_text(json.dumps(records, indent=2) + '\n')
        raise SystemExit(name + ' failed to compile: ' + process.stderr)
command = [args.llvm_diff, str(out / 'plain.ll'), str(out / 'annotated.ll')]
diff = subprocess.run(command, capture_output=True, text=True, timeout=30)
plain = (out / 'plain.ll').read_bytes()
annotated = (out / 'annotated.ll').read_bytes()
records.update(llvm_diff={'command': command, 'exit': diff.returncode,
                         'stdout': diff.stdout, 'stderr': diff.stderr},
               llvm_ir_byte_identical=plain == annotated,
               plain_ir_sha256=hashlib.sha256(plain).hexdigest(),
               annotated_ir_sha256=hashlib.sha256(annotated).hexdigest(),
               clang_version=subprocess.check_output([args.clang, '--version'], text=True).splitlines()[0],
               scope='Same host compiler and flags, assertions enabled; no general C/ISA equivalence or ghost noninterference theorem.')
records['passed'] = diff.returncode == 0 and records['llvm_ir_byte_identical']
(out / 'result.json').write_text(json.dumps(records, indent=2) + '\n')
print(json.dumps(records, indent=2))
raise SystemExit(0 if records['passed'] else 1)
